return [[

    <body>
        <div class = "wrapper">

        <h1 style = "height:1.2em" id = "typed" ></h1>

        <script>
        let txt = 'Do a custom type.';
        let i = 0;
        function typewriter() {
            let item = document.getElementById('typed') 
            if(!item) {window.setTimeout(typewriter, 150)}
            else
            if (i < txt.length) {
                item.innerHTML += txt.charAt(i);
                i++;
                setTimeout(typewriter, 100);
            }
        }
        typewriter() </script>

        <p id = "here">Lua has 8 types: table, function, number, string, boolean, nil, userdata, and thread. This means that any structured data is going to be contained
            in a table, there are no arrays, dictionaries, lists, etc. and really, you don't need them. But I did notice that LÖVE has its own custom types, 
            like Image, Canvas, Transform, etc., and I thought it would be pretty fun to make my own for things like Maps and NPCs. Maybe its usefulness is
            questionable, but so is mine, so whatever.
        </p>

        <h2>Create an object.</h2>
            <p>Our object is going to start as... well, a table of course. So we'll make a <em>new</em> function, so that we can define <em>self.</em> In Lua,
                there aren't true classes, so you just use a function like this if you want to emulate one.
            </p>

    <pre>
        <code>
    local object = {}

    function object.new()
        local self = {}
        self.type = 'custom'

        return self
    end

    local o = object.new()

    print(type(o))

    return object
        </code>
    </pre>

                    <p>Output:</p> 
    <pre>
        <code>
    table
        </code>
    </pre>

        <p>I've heard it said that defining 'self' feels awkward if you're coming from an OOP language. But if you're coming from another language,
            that means you're already a coder, so you should be used to feeling awkward. You can always just pass 'self' in as an argument instead, if you
            like how it looks, or use the colon operator.</em> 
        </p>

        <h2>Return to monkey.</h2>
        <p>Now we can write our monkey patch, which will be a closure. They call it a monkey patch if you're overriding some default behavior, 
            usually by modifying the standard library. <em>Programming in Lua</em> has an example of overloading the addition (+) operator to add sets together, 
            by changing the __add metamethod. Here, we don't need to do that, there isn't a __type metatable field, so we're just going to redefine the global 
            'type' standard library function.
        </p>

    <pre>
        <code>
    local lua_type = type
    type = function(o)
        local lua_result = lua_type(o)
        if o == self then
            return self.type
                else
            return lua_result
        end
    end
        </code>
    </pre>

        <p>So, what exactly is this doing? We're storing the standard 'type' function as 'lua_type'. Then we call it with our object as the argument, and store the 
            result in the 'lua_result' variable. Then we can compare our custom type's identity to self. If self is a custom type, we return that result (the self.custom field),
            or else we return the standard type result. Pretty nifty, eh? Here it is all together.
        </p>

    <pre>
        <code>
    local object = {}

    function object.new()
        local self = {}
        self.type = 'custom'
    
        local lua_type = type
        type = function(o)
            local lua_result = lua_type(o)
            if o == self then
                return self.type
                    else
                return lua_result
            end
        end
        return self
    end
    
    local t = {}
    local test = object:new()
    
    print(type(t))
    print(type(test))
    
    return object
        </code>
    </pre>

        
        <p>Output:</p> 
    <pre>
        <code>
    table
    custom
        </code>
    </pre>

        <P>So, there you have it. It works, it's returning our custom type, and our standard type still works! Couldn't have a better result, right? 
            Well, it doesn't work with LÖVE. I suppose I'm getting frontrun by however they have rerouted the type function. I'm sure one could dig into 
            LÖVE's code and change it, but it seems like a bit much for just a fun little coding side quest. Or, to put it lyrically, <em>I would do 
            anything for LÖVE, but I won't do that.</em>
        </P>

        <p style="padding-bottom: 5%;">Hope you've enjoyed reading this article as much as I enjoyed writing it, see you next time!</p>
    </body>

]]