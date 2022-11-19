return [[
    <body>
        <div class = "wrapper">
        <h2>Get drunk and take a walk.</h2>

        <center>
            <div>
                <canvas style="max-width: 100%; max-height: 75%" id="canvas" oncontextmenu="event.preventDefault()"></canvas>
                <canvas id="loadingCanvas" oncontextmenu="event.preventDefault()" width="0" height="0"></canvas>
            </div>
        </center>

        <h3>It's five o'clock somewhere!</h3>
        <p>
            A 'walker' is an algorithm that keeps track of its own location as it iterates over a table. In my roguelike game, I've used walkers
            to do all kinds of nifty things. I can drop one on the player's location and clear a path to the exit, or drop one at the edge of the map and
            have it carve a river through it. It's been really versatile, and it's good practice for traversing tables. Probably the simplest walker is the
            drunk walker. I've used this one extensively as a 'seeder' to drop values that are used by later algorithms, for example his path may become
            the tops of ridges in the terrain. In each iteration, he chooses a random direction to step, and if he hasn't stepped off of the map, then he
            flips the grid to 1, indicating that it has been walked.
        </p>
    
    <pre>
        <code>
    local walker = {}

    function walker:create_grid(x, y)
        self.grid = {}
        for i = 1, x do
            self.grid[i] = {}
            for j = 1, y do
                self.grid[i][j] = {}
            end
        end
        return self
    end
    
    function walker:drunk_walk(step)
        local self = {}
        self.x = #walker.grid / 2;
        self.y = math.floor(#walker.grid[self.x] / 2);
        for x = 1, #walker.grid do
            for y = 1, #walker.grid[x] do
            self.x = self.x + math.random(-step, step)
            self.y = self.y + math.random(-step, step)
                if self.x > 1 and self.x < #walker.grid and self.y > 1 and self.y < #walker.grid[x] then
                    walker.grid[self.x][self.y] = 1
                end
            end
        end
        return walker.grid
    end

    return walker
        </code>
    </pre>
    
        <p>This is a pretty basic example. In the example at the top, my code does a little more, the function is actually a coroutine that's called
            within a timer function. There's also a second grid that holds the number for how dark the tile should be. Hopefully, though, this gives
            you a good idea of how it works, so you and your friend, George Dickel, can code up your own walkers!
        </p>
    
        <h3>Pro tips for drinking pros... <em>hic!</em></h3>
    
        <p>If you want to give your walker 'vision' to be able to act upon the tiles around him, you can add two more for loops under x and y.
            The range that it iterates can be -1, 1. This will iterate over 9 tiles - your drunkard's tile and the 8 adjacent ones. That way, he can
            hang a hard right if he sees an open bar, for example.
        </p>
    
    <pre>
        <code>
    for x = 1, #walker.grid do
        for y = 1, #walker.grid[x] do
            for i = -1, 1 do
                for j = -1, 1 do
                    local neighbor = walker.grid[x + i][y + j]
                    if neighbor.bar.open then
                        walker:hard_right()
                    end
                end
            end
        end
    end
        </code>
    </pre>
    
        <p>Okay, so while I was writing this just now, it occurred to me that you probably don't even the first two loops. Since the walker already 
            knows his own position, so he could just start at <em style = "background-color: gray;">walker.grid[self.x - step][self.y - step]</em> 
            and go to <em style = "background-color: gray">walker.grid[self.y +step][self.y + step]</em>.
            Hmm. I don't know why I didn't think of that before. Well, I guess I'll have to test it and update this article later. Right now I need to
            go drink some coffee and sober up... woo... ugh.
        </p>
    
        <p style = "padding-bottom: 5%">Hope you've enjoyed reading this article as much as I enjoyed writing it, see you next time!</p>
    </div>
    
    <script type='text/javascript'>
    function goFullScreen(){
          var canvas = document.getElementById("canvas");
          if(canvas.requestFullScreen)
              canvas.requestFullScreen();
          else if(canvas.webkitRequestFullScreen)
              canvas.webkitRequestFullScreen();
          else if(canvas.mozRequestFullScreen)
              canvas.mozRequestFullScreen();
    }
    function FullScreenHook(){
      var canvas = document.getElementById("canvas");
      canvas.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
      canvas.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    }
    var loadingContext = document.getElementById('loadingCanvas').getContext('2d');
    function drawLoadingText(text) {
      var canvas = loadingContext.canvas;
    }

    window.onload = function () { window.focus(); };
    window.onclick = function () { window.focus(); };

    window.addEventListener("keydown", function(e) {
      // space and arrow keys
      if([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
        e.preventDefault();
      }
    }, false);

    var Module = {
      arguments: ["./game.love"],
      INITIAL_MEMORY: 16777216,
      printErr: console.error.bind(console),
      canvas: (function() {
        var canvas = document.getElementById('canvas');

        // As a default initial behavior, pop up an alert when webgl context is lost. To make your
        // application robust, you may want to override this behavior before shipping!
        // See http://www.khronos.org/registry/webgl/specs/latest/1.0/#5.15.2
        canvas.addEventListener("webglcontextlost", function(e) { alert('WebGL context lost. You will need to reload the page.'); e.preventDefault(); }, false);

        return canvas;
      })(),
      setStatus: function(text) {
        if (text) {
          drawLoadingText(text);
        } else if (Module.remainingDependencies === 0) {
          document.getElementById('loadingCanvas').style.display = 'none';
          document.getElementById('canvas').style.visibility = 'visible';
        }
      },
      totalDependencies: 0,
      remainingDependencies: 0,
      monitorRunDependencies: function(left) {
        this.remainingDependencies = left;
        this.totalDependencies = Math.max(this.totalDependencies, left);
        Module.setStatus(left ? 'Preparing... (' + (this.totalDependencies-left) + '/' + this.totalDependencies + ')' : 'All downloads complete.');
      }
    };
    Module.setStatus('Downloading...');
    window.onerror = function(event) {
      // TODO: do not warn on ok events like simulating an infinite loop or exitStatus
      Module.setStatus('Exception thrown, see JavaScript console');
      Module.setStatus = function(text) {
        if (text) Module.printErr('[post-exception status] ' + text);
      };
    };

    var applicationLoad = function(e) {
      Love(Module);
    }
  </script>
  <script type="text/javascript" src="assets/games/walker/game.js"></script>
  <script async type="text/javascript" src="assets/games/walker/love.js" onload="applicationLoad(this)"></script>
    </body>
]]