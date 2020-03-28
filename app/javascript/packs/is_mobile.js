function myScript() {
    if(window.innerWidth >= 991) {
        document.getElementById("mob").className = "d-flex flex-row justify-content-between"
    } else {
        document.getElementById("mob").className = "d-flex flex-column justify-content-between"
    }

    function isMobile() {
        if(window.innerWidth >= 991) {
            document.getElementById("mob").className = "d-flex flex-row justify-content-between"
        } else {
            document.getElementById("mob").className = "d-flex flex-column justify-content-between"
        }
    }

    window.addEventListener("resize", isMobile);
}

window.addEventListener("DOMContentLoaded", myScript, false);






