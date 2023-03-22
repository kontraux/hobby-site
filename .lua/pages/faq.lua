local language = {}



local text = [[
    <body>
    <div id = "wrapper" class = "wrapper">
    <h1>FAQ</h1>
    </div>

        <script>
        var questions = [
            "FAQ? How can you have frequently asked questions when no one visits your site?",
            "Is the site a resume/portfolio site? It doesn't look like other portfolio sites.",
            "Why doesn't the background display for me?",
            "What is the background?",
            "What's Lua?",
            "How do I make a website with Lua?",
            "Why self-host?",
        ];

        var answers = [
            `Don't worry about it.`,

            `No, not really, but kind of. I started making a little Lua tutorial site called "Do-A-Lua" (I don't care what you think, that name\
            makes me smile) but I started just doing other things with it. It's not really a portfolio site, it's just for fun, but I'll probably \
            show it to people I want to work with.`,

            `If you can't see purple, swirling clouds in the background, you're probably on mobile. It has to do with the difference in how RGB and\
            SRGB values are calculated. The background is actually there, it's just displaying so dark that it appears black. Or, you have\
            disabled JavaScript in your web browser, or some other setting or browser that isn't compatible with WebGL.`,

            `It's a shader program. A shader program is actually two shaders (one fragment and one vertex) that can be sent to a WebGL context.\
            They're written in GLSL, which is pretty similar to C, it's pretty low level and runs on the GPU. You can set up the context with\
            JavaScript. My shader uses fractional Brownian motion for the fragment effect, the vertex shader doesn't do anything.`,

            `Lua is a great language. If you aren't familiar, I recommend stopping by <a class="plinks" href="https://lua.org">Lua.org </a> to get\
            and overview. The quick and dirty is that it's an extension/embedded language for C. Besides that, it's also popular for microcontrollers\
            because it's lightweight, and for videogames, particularly for modding because it's easy to sandbox. But, as most languages, you can do\
            pretty much whatever you want with it. It's genuinely fun to write.`,

            `Very carefully. Just kidding! Lua scripts aren't run natively in most browsers to interact with the\
            DOM. You can make your backend, like routers, databases, and access control with Lua, and manipulate HTML and CSS as strings and send them\
            to the client. You still need JavaScript to initiate client requests or do things in the page like animations. There's a lot of servers that let you use\
            Lua or other languages, I'm using <a class="plinks" href="https://redbean.dev">redbean.</a> It's a really clever
            and unique server, I highly recommend checking it out!`,

            `I wanted the DIY experience, feel like I'm coding and not just using a bunch of services. Also, just for learning's sake. In case\
            of global catastrophe and we're back in the stone age, I'll be able to rebuild the internet the Old Way. Assuming somebody else figures \
            out how make computers out of rocks.`,
            ];


        for (i = 0; i < questions.length; i ++) {
            let p = document.createElement('p');
            p.innerText = questions[i];
            p.style.cursor = 'pointer';
            p.id = i;
            p.style.color = 'red';
            p.style.fontWeight = '300';
            p.onclick = function () {
                let a = document.getElementById("a" + this.id);
                let q = document.getElementById(this.id);
                if (a != null) {
                    q.removeChild(a);
                } else {
                    let a = document.createElement('p');
                    a.id = "a" + this.id;
                    a.style.fontSize = "1em";
                    a.style.color = 'white';
                    a.innerHTML = answers[this.id];
                    q.appendChild(a);
                };
            };
            let wrapper = document.getElementById('wrapper');
            wrapper.appendChild(p);
        };
    </script>
    </body>
]]



return text