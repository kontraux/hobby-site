return [[
    <body>
        <div class = "wrapper">
        <h4>Welcome to</h4> 
        <h3>Curmudgeon's Complaint Corner</h3>
        <h4>It's not libel if no one reads it!</h4><br><br>

        <h2>All StackOverflow answers are bad and useless.</h2>

        <p>To illustrate, try out my StackOverflow Answer Simulator. Ask how to do something, or try the default query.
        </p>

        <div style="border:solid 2px white; padding: 2%; text-align:center;">
        <h4>StackOverfart Answer Crapper™</h4><br>
        <label for="fartquery">How do I </label><input id="fartquery" value="center a div"><button id="send">ask</button><label>?</label><br>
        <p id="result">Answer will appear here.</p>
        </div>
        <script>
          function OnSend() {
            var r = new XMLHttpRequest();
            r.onload = function() {
              document.getElementById("result").innerText = this.getResponseHeader('X-Custom-Header');
            };
            r.open('POST', 'complaints_xhr.lua');
            r.setRequestHeader('X-Custom-Header', document.getElementById('fartquery').value);
            r.send();
          }
          document.getElementById('send').onclick = OnSend;
        </script>

        <h2 style="margin-top: 2.5em">The metaverse is going to suck.</h2>

        <p>What is the metaverse? Is it a amalgam of digital worlds, where virtual experience and digital assets are just an extension of your
        life in the physical world? Nope. It's the stupid idea that you can get people addicted to work the same way as they get addicted to playing
        World of Warcraft, or arguing on Twitter. It doesn't sound bad, playing WoW and getting paid for it. But it won't work. They think they can just 
        do this by slapping an unergonomic VR helmet on you and track your eye movements to ding your pay if you take your eyes off of those TPS reports. 
        The best we can hope for is that mounting workman's comp premiums for mangled necks and eyes strained to the point of blindness are a greater expense 
        than any additional revenue generated, and they give up on the idea. It's stupid and bad! Everything is bad! Idiots!
        </p>

        <h2 style="margin-top: 2.5em">Artificial Intelligence is stupid.</h2>

        <p>It's actually worse than stupid, it's just some fake made-up placeholder the Gartner guys invented to make their stupid graphic. Sure, Copilot can occasionally
        poop out coherent code if you tell it really super specifically what to do, but a computer already does exactly what you tell it to if you can code! And it
        doesn't screw up 90% of the time! 
        </p>

        <p>I was actually excited for AI, until I started learning about it. The disappointing truth is, it's just adding weights to variables. That's it. They try to
        make it sound fancy with the obviously fake word "perceptron," but it's nothing new. You program in what the inputs to take from a dataset, add a weight to it,
        and a method to adjust the weight every time a new set is read. Everything else is just kajiggering and algorithms. I'm never going to be able to make my own 
        Lovebot and/or Terminator with this garbage! The most advanced AI has only been able to acheive being named a defendant in a class-action lawsuit for software piracy 
        (Github Copilot) and getting banned from Twitter for telling kids to kill their parents (Microsoft Tay). 
        On second thought, maybe it simulates human intelligence perfectly, because everyone is a moron!
        </p>

        <p>Thanks for reading, and good riddance!</p>

    </body>
    ]]
