return [[ 

<body>

<div class = "wrapper">

      <hr>
        <center>
            <div>
                <canvas style="width: 100%; height: 75%" id="canvas" oncontextmenu="event.preventDefault()"></canvas>
                <canvas id="loadingCanvas" oncontextmenu="event.preventDefault()" width="0" height="0"></canvas>
            </div>
        </center>
        <br>
      <hr>

    <p>Edit: just don't play on mobile. It's a typing game, ffs.</p>
    <s>Fixed random number seeding, so the phrase order should actually change now. Title screen will be messed up on mobile, but virtual
    keyboard should work, but I haven't tested yet.
    </s>

    <s>Don't try to play on mobile, it will look really janky and probably won't even trigger the virtual keyboard. Should work on most PCs.
    I'll see if I can get mobile working later.</s>
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
          <script type="text/javascript" src="assets/games/typing/game.js"></script>
          <script async type="text/javascript" src="assets/games/typing/love.js" onload="applicationLoad(this)"></script>
        </body>
      </html>
      
</body>
]]