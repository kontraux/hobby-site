
return [[

<body>
    <div class="wrapper">
            <h1>Do an art (by accident).</h1>
                <div class="warning_box sub_container">
                    <h2 class="warning_text"><b>Photosensitivity warning:</b> Images and videos on this page may trigger
                        seizures in photosensitive individuals. Viewer discretion is advised.
                    </h2>
                    <a class="alinks" href="index">Return to homepage.</a>
                </div>

                <div>
                    <p>
                        A lot of algorithms used for procedural generation need to start with noise, as represented by numbers
                        in a random or semi-random pattern on a grid. Starting out making maps for the game I'm making, I didn't need anything special, 
                        random noise was good enough, so I wrote my noise function like this:
                    </p>
                </div>

            <pre>
                <code>
    local noise = {}

    function noise.new()
        local self = {}

        self.create_noise = function (grid)
        for x = 1, #grid do
            for y = 1, #grid do
                if math.random() < 0.5 then
                    grid[x][y] = 0
                else
                    grid[x][y] = 1
                end
            end
        end
        return grid
    end
        return self
    end

    return noise
                </code>
            </pre>

                <p>Run of the mill, (pseudo)random noise.</p>
                    <img src="./assets/images/random_noise.png"></img>

                <p>Using this as a base can get decent results. Here's what it looks like after applying cellular automata,
                    which I got from
                    <a class="plinks" href="https://gamedevelopment.tutsplus.com/tutorials/generate-random-cave-levels-using-cellular-automata--gamedev-9664">here</a>
                    and transcribed into Lua from (Java? C++? It occurs to me I don't know what language it is.)
                </p>

                <img src="./assets/images/cellular_automata.png"></img>

                <p>It looks really pretty good to me. It could definitely be islands, forests, or caverns, and depending on how you use it, there are of course
                    many ways to refine it from here. Here's my <a class="plinks" href="https://github.com/kontraux/Cellular-Automata">code</a> in case you want to see it. But there is a
                    problem using this to generate a lot of content, and it's that it is very <em>uniform.</em> Unless I'm
                    changing other inputs on my algorithms, I'll always get something very similar. I'll never get a large forest clearing, or a single winding trail,
                    or sparse trees dotting the landscape. It will always just be this blobby structure, more or less.
                </p>

                <p>Generating "good" noise is apparently a huge topic unto itself, as it's used for more than procedural
                    generation. It's used for shaders, movie CGI, scientific
                    simulations, and other stuff. And while there's lots of algorithms already out there- Guassian noise, Perlin
                    noise, Brownian noise, Worley noise... I didn't really want to use them. Partly because I don't understand them (recursive filters? hardcoded
                    permutation tables?) and partly because I get sick of people telling me "don't reinvent the wheel." Look, if I didn't enjoy writing
                    my own code, I'd download Unity.
                </p>
                <h2>Make some noise in the hizzy!</h2>

                <p>So I set out to make some noise. Since I'm such a smart guy- <em>a wise man; a shaman,</em> I decided the
                    best way to do this would be to start punching numbers in randomly. And of course, what I got was... unexpected?</p>

                <table>
                    <tr>
                        <td>
                            <img class="table_img" src="./assets/images/noise_4.png"></img>
                        </td>
                        <td>
                            <img class="table_img" src="./assets/images/noise_3.png"></img>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img class="table_img" src="./assets/images/noise_2.png"></img>
                        </td>
                        <td>
                            <img class="table_img" src="./assets/images/noise_1.png"></img>
                        </td>
                    </tr>
                </table>

            <p style="float:left;">Okay, so I'll admit, it's not exactly what I was going for. But I like it! But what is
                going on here? Well, I was already taking a float and rounding it as my input.
                And since I knew that the <a class="plinks" href="https://jackschaedler.github.io/circles-sines-signals/sincos.html">sine
                    function makes circles</a>, I thought I'd use <em>math.sin</em> to make my noise, I dunno, circlier, or swirlier, something.
            </p>

            <p>So, I took my table indexes, multiplied them by time, and calculated the sine, like so:
                <em style="background-color: gray;">math.sin(os.clock() * i * j)</em>
                and immediately started getting some interesting stuff.
            </p>

            <video class="art_video" loop autoplay muted>
                <source src="./assets/videos/art_1.mp4" type="video/mp4">
            </video>

            <p>After that, I just started experimenting with different numbers, adding colors, changing draw shapes, etc.</p>

            <hr>
            <table>
                <tr>
                    <td>
                        <video class="art_video" loop autoplay muted>
                            <source src="./assets/videos/art_2.mp4" type="video/mp4">
                        </video>
                    </td>
                    <td>
                        <video class="art_video" loop autoplay muted>
                            <source src="./assets/videos/art_3.mp4" type="video/mp4">
                        </video>
                    </td>
                </tr>

                <tr>
                    <td>
                        <video class="art_video" loop autoplay muted>
                            <source src="./assets/videos/art_4.mp4" type="video/mp4">
                        </video>
                    </td>

                    <td>
                        <video class="art_video" loop autoplay muted>
                            <source src="./assets/videos/art_5.mp4" type="video/mp4">
                        </video>
                    </td>
                </tr>
            </table>
            <hr>
            <p>Okay, so I haven't gotten a call from the fine folks at the Guggenheim yet. But that's okay. Remember, you're
                not
                failing <em>to</em> learn if you're
                failing <strong>to</strong> learn! Oh wait, without inflection, that's kind of ambiguous. I mean, failing in
                order to learn - not learning to fail, er,
                learn to... fool me... you can't get fooled again. Writing fail :P</p>

            <p style="padding-bottom: 5%">Hope you've enjoyed reading this article as much as I enjoyed writing it, see you
                next
                time!</p>

            </div>
            </body>
 ]]
