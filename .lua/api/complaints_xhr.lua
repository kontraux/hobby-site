local complaints_xhr = {}

local function get_answer(hdr)
    local answers =  {
        "As someone who has never heard of " .. hdr .. " I can safely say you should never " .. hdr .. ".",
        "I don't understand the question.",
        "Don't reinvent the wheel, use a library to " .. hdr .. ".",
        "Closing as a duplicate of another question that never got an answer.",
        "To answer your question of how to " .. hdr .. ", I need more information. Where do you live? How tall are you? What's in the box? WHAT'S IN THE BOOOX?!",
        "There's a library to " .. hdr .. ", you know. Don't neglect to use libraries. It... infuriates me.",
        "I don't understand the question. I don't understand any question.",
        "What for? Why " .. hdr .. "? That makes me suspicious.",
        "Don't " .. hdr .. ". No one needs to know how to " .. hdr .. ".",
        "It depends on what framework you are using to " .. hdr .. ". What? You aren't using a framework? That is utterly absurd.",
        "You aren't using a " .. hdr .. " framework? THOUGHT CRIME! SOMEONE CALL THE POLICE!",
        "I don't know, but still wanted to answer for some reason.",
        "Did you try typing npm intall " .. string.gsub(hdr, " ", "") .. "?"
        }
    local answer = answers[math.random(1, #answers)]
    return answer
end

function complaints_xhr.test()
        local hdr = VisualizeControlCodes(GetHeader('x-custom-header'))
    if hdr then
        local answer = get_answer(hdr)
        SetHeader('Vary', 'X-Custom-Header')
        SetHeader('X-Custom-Header', answer)
    else
        ServeError(400)
    end
end

return complaints_xhr