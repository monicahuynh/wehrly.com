
(function () {
    const headers = document.getElementsByClassName("edub-header");

    if (headers && headers.length > 0) {
        const header = headers[0];
        const sticky = header.offsetTop;
        window.onscroll = function onWindowScroll() {
            if (window.pageYOffset > sticky) {
                header.classList.add("sticky");
            } else {
                header.classList.remove("sticky");
            }
        };
    } else {
        console.warn(headers)
    }
})();
