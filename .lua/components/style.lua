return [[
html {
    width: 100%;
    height: 100%;
}

body {
    margin: 0;
    background-image: url("/assets/images/tarantula_nebula.webp");
    background-position: 50% 50%;
    background-attachment: fixed;
    background-repeat:no-repeat;
    background-size: 100% 100%;
}

.plist li {
    text-align: left;
    display: list-item;
    line-height: 2;
    white-space: none;
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-size: 1.1em;
}

.img_with_text {
    width: 50%;
    float:left;
    margin-right: 2%;
    display:block;
    text-align: center;
    margin-bottom: 0.5%;
    padding-bottom: 0;
}

.dark_mode #theme {
    background-color: red;
    border: none;
    background-color: inherit;
    padding: 3px 3px;
    font-size: 1em;
    cursor: pointer;
    display: inline;
}

.light_mode #theme {
    background-color: inherit;
    border: none;
}

#theme:hover {
    cursor: pointer;
}

.dark_mode {
    background-color: black;
    color: white;
}

.title_frames {
    display: none;
    position: fixed;
    height: 40%;
    border: none;
}

.title_frames:hover {
    display: fixed;
}

.subheadContainer {
    padding: 20px;
    text-align: center;
}

h1 {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 700;
    font-size: 6em;
    text-align: center;
    margin: 5px 5px 0px;
}

@media only screen and (max-width: 400px) {
    h1 {
        font-size: 3.5em;
        margin-top: 30px;
    } 
}

h2 {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 100;
    font-size: 2em;
    text-align: center;
    margin: 0px 5px 10px;
}

@media only screen and (max-width: 400px) {
    h2 {
        font-size: 1.5em;
    } 
}

h3 {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 500;
    font-size: 3em;
    text-align: center;
    margin: 0px 5px 0px;
}

@media only screen and (max-width: 400px) {
    h3 {
        font-size: 2em;
    } 
}

h4 {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 100;
    font-size: 1.5em;
    text-align: center;
    margin: 0px 5px 0px;
}

@media only screen and (max-width: 400px) {
    h4 {
        font-size: 1em;
    } 
}

p, label {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 100;
    font-size: 1.25em;
}


.plinks {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 300;
    font-size: 1em;
    color: red; 
    text-decoration: none;
}

.plinks:hover {
    text-decoration: underline;
}

.articleLinks {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 300;
    font-size: 1.25em;
    text-decoration: none;
    color: red;
}

.articleLinks:hover {
    text-decoration: underline;
}

.navLinks {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 700;
    font-size: 1.25em;
    text-decoration: none;
}

.navLinks:hover {
    text-decoration: underline;
}

hr {
    border: 1px solid red;
    margin-top: 10px;
}

.light_mode hr {
    border: 1px solid blue;
}

img {
    max-width: 100%;
    margin: auto;
    padding-top: 1em;
    padding-bottom: 1em;
}

.light_mode pre code {
    background-color: whitesmoke;
    box-shadow: -3px 5px 10px 5px lightgray, 3px 5px 10px 5px lightgray;
}

pre code {
    margin: auto;
    background-color: gray;
    display: block;
    overflow-x: auto;
  }

code {
    opacity: inherit;
    opacity: 100%;
}

li {
    display: inline-block;
    padding-left: 3%;
    padding-right: 3%;
    text-align: center;
}

li a {
    font-size: 1.2em;
    color: black;
}

.nav {
    position: fixed;
    z-index: 1;
    top: 0;
    left: 15%;
    right: 15%;
    margin-top: 0;
    padding: 1%;
    list-style-type: none;
    text-align: center;
    background: linear-gradient(0deg, darkred, red);
    border: 2px outset rgb(35, 35, 35);
    font-weight: 900;
}

.light_mode .nav {
    background: black;
    box-shadow: none;
    border-bottom: none;
}

.light_mode li a {
    color: white;
}

.light_mode #theme {
    color: white;
}

table {
    margin: auto;
    border-spacing: 0;
}

.warning_box {
    display:block; 
    border: 3px solid red;
    align-content: center;
}

.warning_text {
    font-family: 'Rokkitt','Courier New', Courier, monospace;
    font-weight: 100;
    font-size: 1.25em;
    font-style: italic; 
    text-align: center;
}

video {
    border: 2px solid white;
    margin: 0;
    width: 100%;
}

td {
    margin: 0;
    padding-left: 0.7%;
    padding-right: 0.7%;
}

.table_img {
    margin: 0;
    width: 100%;
    box-shadow: 0 0;
}

.container {
    width: 250px;
    height:300px;
    margin: auto;
    box-shadow: 0, 0;
}

.wrapper {
    min-height: 100%;
    background-color: black;
    opacity: 100%;
    padding: 2%;
    padding-top: 5%;
    margin-left: 15%;
    margin-right: 15%;
}

.light_mode .wrapper {
    background-color: white;
}

.small_img {
    display: block;
    margin: auto;
    width: 50%;
}

.boids {
    position: fixed;
    background-color: white;
    height: 5px;
    width: 5px;
    top: 0;
    left: 0;
    border-radius: 50%;
    display: inline-block;
}


.light_mode {
    color: black;
    background-image: url("/assets/images/corina_nebula.webp");
}

.light_mode a {
    color: blue;
}

.light_mode p {
    font-weight: 300;
}

.light_mode .boids {
    background-color: black;
}

@media only screen and (max-width: 800px) {
    .wrapper {
        margin: 5%;
    }
    .nav {
        left: 5%;
        right: 5%;
    }
}

]]