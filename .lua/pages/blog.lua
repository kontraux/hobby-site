return [[

    <body>
        <div class="wrapper">
            <h2>Blog like nobody's reading (they aren't).</h2>

            <h3>Ever less bad</h3>
            <p>To state the obvious, I'm not a designer. But I am a total tryhard, and I can do a great deal of things at a "not embarrassing" level through sheer
                force of stubbonness. This is great for writing scripts, where the outcome is binary, and other considerations, like resource usage, is measurable.
                Design is a lot trickier. Persistence has diminishing returns here, you can't just clench your jaw and grind until it's correct. This is fine,
                I don't need to win any awards, and I'm still managing to slowly developing a minimal skill floor. Jen's been giving some helpful input, the things 
                that she notices right away are definitely not the things I expect- the big design decisions about the overall composition aren't even on her radar, 
                she sees the details- something doesn't line up by a hair, or a color is almost imperceptibly different where it should match. But she's right, these things
                <em>must</em> be fixed, they make an outsized difference, the difference between a design looking sleek and professional, and a design that your mom 
                might hesitate hanging on the fridge.
            </p>

            <p>So I will probably continue to make changes, and some I revert because I decide it's not better after all. Hopefully I'll at least be able to recognize 
                when there's actually a big problem with the composition and not just some small oversight, some keystone detail that just got away from me. And if
                I can stay on the path of just making things very slightly "less bad" then, one day, I may just end up on the path of "more good" without even realizing it.
            </p>

            <h3>Feeling a little Linuxy</h3>
            <p>Well, Windows 11 <em>really</em> doeesn't like running a webserver. Not really in the mood to pay for Windows Server or experiencing the fresh
                hell of setting it up, I guess Linux it is. Going to leave Windows on Chernobyl and run my server on ThreeMile, my little Thinkpad.
                You know, it is interesting that Windows thinks my programs are malware, but it sees no issue serving me unwanted Bing Rebates popups on Edge.
                Oh well. Next up, I think I will write an article either on raycasting, or on resource loading and threads. I also have a ton of stuff on
                PowerShell that I wrote years ago that I could put up here. It's pretty boring but maybe I can figure out something fun to do with it.
            </p>

            <h3>Luafying the site</h3>
            <p>Well, that wasn't easy but it also wasn't as bad as I thought it might be. All the important stuff has been redone in Lua, there 
                are still some JavaScript pieces floating around for things like sending requests and doing page animations; because Lua can't run
                in the browser, it makes it a little complicated. I'm sure more can be done, but this is plenty
                good enough for right now. redbean is actually a lot more fully-featured than I thought it would be, with encoding libraries and
                listeners and all the stuff that was nightmarish trying to write on my own. Not sure what's next, will probably be doing cleanup
                stuff for a while and just tinkering around until I come up with something else.
            </p>
    
            <h3>Stand up Chernobyl</h3>
            <p>Mama's got a brand new drive. Chernobyl, aka 'the big computer,' has been sitting idle for a few weeks since the main SSD pooped the bed.
                Now I can actually stand her up and migrate my site to my domain from Github Pages. For this, I originally had written an HTTP server in 
                PowerShell, I was going to call it the HoboServer, but I actually found this really rad project called <a class="plinks" href="https://redbean.dev/">redbean</a>
                 Besides the stunningly cool fact that it runs <em>from a freaking zip file that's compatible with 6 different OSes,</em> it also (unsurprisingly) 
                 uses Lua scripting, since the Lua interpreter is downright minute. JavaScript works, of course, but it just didn't really sit right that a site 
                 about Lua would use anything else.
            </p>
    
            <p>So I've got plenty to do. Gotta get Chernobyl running, set up Google Dynamic IP, rewrite my scripts with LSP, and then, y'know, server stuff I guess.
                Set up SSH, event logs, etc. Then I can focus on <em>Lithic</em> and the camper registration app I'm working on with Jen. Will also embed
                some of my projects on here with emscripten, add a main page, and Do-A-Lua can be just a section, and write a bunch more articles. Hmm. Blogging
                about planning to do stuff is a lot easier than actually doing it. I understand why people blog now.</p>
    
            <h3>Router Update</h3>
            <p>I think it's pretty clear that I have no idea what I'm doing. <a class="plinks" href="https://github.com/DesignerJennifer">Jen</a>
                said I should write a router, so now I've got that done. But then when she looked at it, she said I shouldn't have all of the pages as
                document fragments getting routed to a single page, and that they should actually land on the HTML files. I don't know, I guess it doesn't
                matter for now. All in all, I'm really pleased with how things are looking!
            </p>
    
            <h3>Plans for the site.</h3>
    
            <p>Well, my site is pretty bare at the moment, and it's in a pretty rough state. But I've been having a blast so
                far, and so I plan to update it regularly. And now that I feel pretty comfortable with Lua, I'm going to start spending
                some time learning Javascript and website-y stuff, and hopefully get some interactive elements going. But first I definitely
                need to get the static site cleaned up and make it mobile friendly. I feel pretty decent about how it's turned out so far, but it's
                definitely a learning process.
            </p>
    
            <p>I have some ideas churning around in the old noggin (explains the burning smell), so definitely check back later, hopefully it'll
                end up being pretty slick. Thanks for visiting!
            </p>
            </div>
        </body>

    ]]