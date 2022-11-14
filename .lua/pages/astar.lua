return [[

<body>

<div class = "wrapper">
        <h2>A* is born</h2>
        <h3 style="padding-bottom: 2%">This pathfinding algorithm is gonna make ya famous, baby!</h3>

        <center>
            <div>
                <canvas style="width: 90%; height: autoheight;" id="canvas" oncontextmenu="event.preventDefault()"></canvas>
                <canvas id="loadingCanvas" oncontextmenu="event.preventDefault()" width="0" height="0"></canvas>
            </div>
        </center>

        <p>
            Okay so the reason it's called A* (A star) isn't because of Tinseltown aspirations, but because the researchers who created it had given the very
            boring name of "A1" to the first algorithm, "A2" to the second, and then decided that "A3" wasn't really appropriate, since they had discovered
            the truly best A, it would be * for wildcard, emcompassing all other versions. It is similar to Djikstra's algorithm, which finds the shortest
            path between two nodes in a graph, but it's optimized- while Djikstra's evaluates all nodes, A* is greedy as it tests the most likely paths first,
            and then stops when it discovers one.
        </p>

        <p>
            First things first, we need a grid. I am using the value 0 to signify that the path is accessible, and 1 for inaccessible. We will be taking the
            grid, and a starting and ending node as arguments. The node is simply the location's x and y values, I am using a table for readability, but
            you can use an array if you want better performance. We're going to need 3 more variables- g, h, and f for the nodes, we'll leave them at 0 for 
            the first node and come back to that later. We're also going to have two arrays to store our paths, one will be 'open,' for nodes that still need 
            to be checked, and 'closed'. We haven't checked the first node yet, so we'll immediately insert it into the 'open' list.
        </p>

        <pre>
            <code>
    local astar = {}

    function astar.route(start_node, end_node, map)
        local open = {}
        local closed = {}

        local first_node = {
            x = start_node.x,
            y = start_node.y,
            h = 0,
            g = 0,
            f = 0,
        }
    end

    table.insert(open, first_node)

    return astar
            </code>
        </pre>

        <p>
            So far so good. So what do g, h, and f stand for? First, g is going to be the number of steps we've taken so far. So simple enough, we will
            just add 1 every time we move to a new node. h is the distance between nodes- h stands for 'heuristic,' so it's just a guess, but we will calculate
            it by subtracting the value of the current node's x from the end node's x and the current node's y from the end node's y. And finally, f is the
            sum of g and h. Here's how I have it written:
        </p>

        <pre>
            <code>
    local function new_node(x, y)
        local node = {
            x = x,
            y = y,
        }
        node.h = math.abs(node.x - end_node.x) + math.abs(node.y - end_node.y)
        node.g = current_node.g + 1
        node.f = node.g + node.h
        return node
    end
            </code>
        </pre>

        <p>
            That's it. I struggled a lot at this point because most resources out there tended to <em>overexplain</em> what these variables were and tried
            to calculate them in fancy ways. But really the calculations are not complicated, the only caveat here is that by setting "g" to 1, it means
            that every accessible node is equal to its accessible neighbors, each step only takes exactly one step. If you are representing a map with your
            grid, then you may have obstacles, for example, a river or a hill, which may be more difficult to access. "g" is where you would add this difficulty 
            variable, a hill may be 1.2 and a river may be 4, etc.
        </p>

        <p>
            So, f being the sum of distance and the heuristic, you may have guessed that it is the value that we'll be using to sort our open nodes. You can use
            whatever sorting method you'd like- I've seen a lot of implementations with binary heaps, bubble sort lists, recursive searches, priority queues, and 
            other things. I'm a pretty basic coder though, and a simple value comparison is good enough for me.
        </p>

        <pre>
            <code>
    local function lowestf(t)
        local key = 1
        local v = t[key].f
        for i = 1, #t do
            if t[i].f < v then
                key = i
            end
        end
        return table.remove(t, key)
    end
            </code>
        </pre>

        <p>Now we have to grab our neighbors and stick them in a list to pass back to the main loop. I go over how to check neighboring cells
            in the <a class="plinks" href="/drunk">drunk walk</a> article.
        </p>

        <pre>
            <code>
    local function get_neighbors(node)
        local neighbors = {}
        for x = node.x - 1, node.x + 1 do
            for y = node.y - 1, node.y + 1 do
                if x ~= node.x or y ~= node.y then
                    if x > 0 and y > 0 and x < #map and y < #map[x] then
                        if map[x][y] == true then
                            local neighbor_node = new_node(x, y)
                            table.insert(neighbors, neighbor_node)
                        end
                    end
                end
            end
        end
        return neighbors
    end
            </code>
        </pre>

        <p>
            For the main loop, we have to:
        </p>
        <p>
            1. Check that there's an open node, and if so, take it<br>
            2. Compare the node to the destination, and if it is, then record the path<br>
            3. If it isn't, then put it in the closed list and find its neighbors<br>
        </p>

            <p>
                You'll notice that I use a goto statement here instead of while/break, you can use while here if you want, either one works fine.
            </p>

        <pre>
            <code>
    local path = {}
    local function begin()
        ::continue::
        local message = "No path found!"
        assert(open[1], message)

        current_node = lowestf(open)

        if current_node.x == end_node.x and current_node.y == end_node.y then
            path = reconstruct_path(current_node)
            return path
        end

        if in_table(current_node, closed) then
            goto continue
        end
        table.insert(closed, current_node)

        local neighbors = get_neighbors(current_node)
        for _, node in pairs(neighbors) do
            node.parent = {
                x = current_node.x,
                y = current_node.y,
            }
            if not in_table(node, closed) and not in_table(node, open) then
                table.insert(open, node)
            end
        end
        goto continue
        return path
    end
    begin()
            </code>
        </pre>

        <p>
            Here's the really interesting part. Right after we get our neighbors, we put that parent field onto the node. That part is really important,
            now that we've finished our path. Remember, our closed list doesn't only have the <em>correct</em> path, but <em>all</em> of the paths that
            we've tried. Now that we're at the destination, we just make a list and add our nodes into it as we follow where we came from back to the origin!
        </p>

        <code>
            <pre>

    local function reconstruct_path(node)
        local path = {}
        table.insert(path, { x = end_node.x, y = end_node.y })
        while node.parent.x ~= start_node.x and node.parent.y ~= start_node.y do
            table.insert( path, { x = node.parent.x, y = node.parent.y } )
            for i,v in pairs(closed) do
                if node.parent.x == v.x and node.parent.y == v.y then
                    node = v
                end
            end
        end
        return path
    end
            </code>
        </pre>

        <p>Just remember that when you get the path back, it's going to be shifted- that is, the destination is the first entry, and the starting
            point is the last, so just keep that in mind.
        </p>

        <p>And that's it! You'll never get lost again! Thanks for reading!</p>

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
          <script type="text/javascript" src="assets/games/astar/game.js"></script>
          <script async type="text/javascript" src="assets/games/astar/love.js" onload="applicationLoad(this)"></script>
        </body>
      </html>
      
</body>
]]