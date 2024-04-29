function toggleClass(element, className) {
    if(element.classList.contains(className)) {
        element.classList.remove(className);
    } else {
        element.classList.add(className);
    }
}

function stupidMobileMenu() {

    const button = document.querySelector('.css-bcsx0a');
    const mobileMenu = document.querySelector('.menu.mobile');
    button.addEventListener("click", (event) => {
        toggleClass(mobileMenu, 'open');
    });
}

function stickyHeader() {    
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
}

(function () {
    // stupidMobileMenu();
    // stickyHeader();
})();

setTimeout(stupidMobileMenu, 500);
