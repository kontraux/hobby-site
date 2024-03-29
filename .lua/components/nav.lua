return [[
<ul class="nav">
        <li><a class="navLinks"  href="/index">HOME</a></li>
        <li><a class="navLinks" href="/contact">CONTACT</a></li>
        <li><button id="theme" onclick="theme()">THEME</button></li>
</ul>
<script>

var mode = sessionStorage.getItem("theme", mode) || "dark_mode";
sessionStorage.setItem("theme", mode);
window.onload = getTheme();

function getTheme() {
    document.body.classList.remove("theme", mode);
    var mode = sessionStorage.getItem("theme", mode);
    document.body.classList.add("theme", mode);
    return mode;
}

theme = function () {
    document.body.classList.remove("theme", mode);
    if (mode == "light_mode") {
        mode = "dark_mode";
    } else { mode = "light_mode" }
    toggleBtn();
    document.body.classList.add("theme", mode);
    sessionStorage.setItem("theme", mode);
    return mode;
}

function toggleBtn() {
    var toggleBtn = document.getElementById('theme');
    if (toggleBtn.innerHTML === "LIGHT") {
        toggleBtn.innerHTML = "DARK";}
    else {
        toggleBtn.innerHTML="LIGHT";
        }
    }
</script>
]]
