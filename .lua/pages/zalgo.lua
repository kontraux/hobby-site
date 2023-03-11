return [[

<head>
<script type="text/javascript">
var txt = "... Too corny? Not too corny enough, I say! But seriously, and I really mean it this time, DO NOT press CTRL + U (Windows only, command + option + U on Mac).";
let i = 0;
typewriter = function () {
let item = document.getElementById('typed');
        if (i < txt.length) {
            item.innerHTML += txt.charAt(i);
            i++;
            setTimeout(typewriter, 60);
        }
    }  

hide = function () {
    let anim = document.getElementById("fallButton");
    anim.style.display = "none";
    typewriter();
}

fall = function () {
    let anim = document.getElementById("fallButton");
    let height = visualViewport.height;

    anim.animate( [{ transform: 'rotate(360deg)' }], { duration: 2500 } );
    anim.animate( [{ transform: `translateY(${(height)}px)` }], { duration: 2500 } );
    anim.value = "Oh no!";
    setTimeout(hide, 800);
}
</script>

    <div class = "wrapper">
    <h1>Zalgo Text</h1>
    <h2 style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">s̴̘̈́p̴̯̎o̴̺͝o̶̧̍k̵̛̼y̸̮͝ !</h2>
        <h2>Wow, you're a brave one.</h2>
        <p>Okay, so you're not good at following instructions, or you 
        already know about Zalgo text. Zalgo text is that creepy or glitched out looking text. It is possible due to how Unicode characters work, 
        you can add diacritics (accent marks) to a character without limits. So don't worry, clicking that didn't do anything bad.
        </p>

        <p>However, clicking this one <em>really will</em> do something bad.</p>
            <p id="typed"></p>
            <input id="fallButton" type="submit" value="Please Don't!" onclick="fall();">

    </div>
    </head>
]]