local background = [[

<script type="text/javascript">
    var canvas = document.createElement('canvas');
    canvas.id = 'glcanvas';
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    canvas.style.position = 'fixed';
    canvas.style.overflow = 'hidden';
    canvas.style.top = 0;
    canvas.style.bottom = 0;
    canvas.style.zIndex = -1;
    canvas.style.opacity = '100%'
    var gl = canvas.getContext('webgl2', { 
        alpha: true,
        premultiplied: false,
        depth: true,
     });

    document.body.appendChild(canvas);

    var vertexShaderSource = `
    attribute vec3 position;
    void main() {
        gl_Position = vec4(position, 1.0);
    }
    `;
    var fragmentShaderSource = `
    precision mediump float;
    uniform vec2 resolution;
    uniform vec3 color;
    uniform float time;
    #define OCTAVES 6

    float random (in vec2 st) {
        return fract(sin(dot(st.xy, vec2(1.32423, 1.93242))) * 4301.22456);
    }

    float noise(vec2 st) {
        vec2 i = floor(st);
        vec2 f = fract(st);
        float a = random(i);
        float b = random(i + vec2(1.0, 0.0));
        float c = random(i + vec2(0.0, 1.0));
        float d = random(i + vec2(1.0, 1.0));
        vec2 cubic = f * f * (3.0 - 2.0 * f) * f;
        return mix(a, b, cubic.x) + (c-a) * cubic.y * (1.0 - cubic.x) + (d - b) * cubic.x * cubic.y;
    }

    float fbm(vec2 st) {
        float value = 0.0;
        float scale = 0.5;
        for (int i = 0; i < OCTAVES; i++) {
            value += noise(st) * scale;
            st *= 2.0;
            scale *= 0.6;
        }
        return value;
    }

    void main() {
        vec2 st = gl_FragCoord.xy/resolution * 4.0;
        
        vec2 q = vec2(0.);
        q.x = fbm(st + 0.001*time);
        q.y = fbm(st + vec2(90));

        vec2 r = vec2(0.);
        r.x = fbm(st + 1.0*q + vec2(1.7, 9.2) + 0.15*time);
        r.y = fbm(st + 1.0*q + vec2(8.2, 2.8) + 0.15*time);

        float f = fbm(st + r);
        vec3 newcolor = color;
        newcolor = mix(     vec3(0.101961, 0.419608, 0.767653),
                            vec3(0.266667, 0.366667, 0.898039),
                            clamp((f*f)*4.0, 0.0, 1.0));

        newcolor = mix(     newcolor,
                            vec3(0.0, 0.0, 0.0),
                            clamp(length(q), 0.0, 0.0));

        newcolor = mix(     newcolor,
                            vec3(0.6, 0.0, 0.4),
                            clamp(length(r.x), 0.6, 1.0));

        vec3 final = vec3((f * f * f + 0.6 * f * f + 0.5* f ) * newcolor * f);
        gl_FragColor = vec4(final, 1.0);
    }`;

    var vertexShader = gl.createShader(gl.VERTEX_SHADER);
    gl.shaderSource(vertexShader, vertexShaderSource);
    gl.compileShader(vertexShader);

    var fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
    gl.shaderSource(fragmentShader, fragmentShaderSource);
    gl.compileShader(fragmentShader);

    var shaderProgram = gl.createProgram();
    gl.attachShader(shaderProgram, vertexShader);
    gl.attachShader(shaderProgram, fragmentShader);
    gl.linkProgram(shaderProgram);
    gl.useProgram(shaderProgram);

    var positionAttributeLocation = gl.getAttribLocation(shaderProgram, 'position');
    var colorUniformLocation = gl.getUniformLocation(shaderProgram, 'color');

    var positionBuffer = gl.createBuffer();
    gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);
    var positions = [
        -1.0, -1.0,
        -1.0, 1.0,
        1.0, -1.0,
        1.0, 1.0
    ];

    gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(positions), gl.STATIC_DRAW);
    gl.enableVertexAttribArray(positionAttributeLocation);
    gl.vertexAttribPointer(positionAttributeLocation, 2, gl.FLOAT, false, 0, 0);
    var timeLocation = gl.getUniformLocation(shaderProgram, 'time');
    var resolution = gl.getUniformLocation(shaderProgram, 'resolution');
    gl.uniform3fv(colorUniformLocation, [0.0, 0.0, 0.0]);
    gl.uniform2fv(resolution, [screen.width * 0.5, screen.height * 0.5] );

    function render(time) {
        gl.uniform1f(timeLocation, time * 0.001);
        gl.clearColor(0.0, 0.0, 0.0, 1.0);
        gl.clear(gl.COLOR_BUFFER_BIT);
        gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);
        requestAnimationFrame(render)
    }

    requestAnimationFrame(render)

    var frag_compiled = gl.getShaderParameter(fragmentShader, gl.COMPILE_STATUS);
    console.log('Fragment shader compiled? ', frag_compiled);
    var vert_compiled = gl.getShaderParameter(vertexShader, gl.COMPILE_STATUS);
    console.log('Vertex shader compiled?', vert_compiled);

    var fragment_error = gl.getShaderInfoLog(fragmentShader);
    var vertex_error = gl.getShaderInfoLog(vertexShader);
    console.log(fragment_error);
    console.log(vertex_error);

    function resize() {
        setTimeout(() =>{
            canvas.style.width = window.innerWidth;
            canvas.style.height = window.innerHeight;
        }, '1000')
    }

    window.addEventListener('resize', resize, false);

  </script>
]]

return background