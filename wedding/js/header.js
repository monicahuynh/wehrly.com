function buildNavItems() {
    const links = [
        { href: 'index.html', text: 'Ceremony' },
        { href: 'our-story.htm', text: 'Our Story', rel: 'nofollow' },
        { href: 'https://photos.app.goo.gl/k1E5k78yRY16YtNL7', text: 'Photos', rel: 'nofollow', target: '_blank' },
        { href: 'wedding-party.htm', text: 'Wedding Party', rel: 'nofollow' },
        { href: 'lodging.htm', text: 'Lodging', rel: 'nofollow' },
        { href: 'https://www.dahlonega.org/things-to-do/', text: 'Things to Do', rel: 'nofollow', target: '_blank' },
        { href: 'https://thegivingkitchen.org/give-now', text: 'Registry', target: '_blank' },
        { href: 'mailto:wehrly.huynh.romance@gmail.com', text: 'Contact', target: '_blank' },
    ];

    const navs = document.querySelectorAll('nav ul');

    navs.forEach((nav) => {
        links.forEach((link) => {
            const li = document.createElement('li');
            li.classList.add('css-haue6f');

            const a = document.createElement('a');
            a.className = 'css-1w7ng4y';
            a.setAttribute('href', link.href);
            a.textContent = link.text;

            if (link.rel) {
                a.setAttribute('rel', link.rel);
            }

            if (link.target) {
                a.setAttribute('target', link.target);
            }

            li.appendChild(a);
            nav.appendChild(li);
        });
    });
}

function destroyAllNavItems() {
    const navs = document.querySelectorAll('nav');

    navs.forEach((nav) => {
        const navItems = nav.querySelectorAll('li');

        navItems.forEach((item) => {
            // item.remove();
            item.style.display = 'none';
        });
    });
}

(() => {
    destroyAllNavItems();
    buildNavItems();
})();
