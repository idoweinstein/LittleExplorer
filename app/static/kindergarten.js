function setBottlesEvents() {
    for (let i = 1; i <= 5; ++i) {
        document.getElementById("bottle" + i).onmouseover = (event) => {
            const value = +(event.target.getAttribute("value"));
            for (let j = 1; j <= 5; ++j) {
                const element = document.getElementById("bottle" + j);
                element.classList.remove('deactivated');
                element.classList.remove('pending');
                element.classList.remove('chosen');
                element.classList.add(j <= value ? 'pending' : 'deactivated');
            }
        }

        document.getElementById("bottle" + i).onmouseleave = (event) => {
            const value = +(document.getElementsByName('grade')[0].value);
            for (let j = 1; j <= 5; ++j) {
                const element = document.getElementById("bottle" + j);
                element.classList.remove('deactivated');
                element.classList.remove('pending');
                element.classList.remove('chosen');
                element.classList.add(j <= value ? 'chosen' : 'deactivated');
            }
        }

        document.getElementById("bottle" + i).onclick = (event) => {
            const value = +(event.target.getAttribute("value"));
            document.getElementsByName('grade')[0].value = value;
            for (let j = 1; j <= 5; ++j) {
                const element = document.getElementById("bottle" + j);
                element.classList.remove('deactivated');
                element.classList.remove('pending');
                element.classList.remove('chosen');
                element.classList.add(j <= value ? 'chosen' : 'deactivated');
            }
        }
    }
}

// Scroll to an element with a given id
function scrollTo(elementId) {
    if ($('.nav-tabs').length <= 0) return; // .nav-tabs doesn't exists

    const element = $(`.tab-pane #${elementId}`);
    if (!element) return; // element cannot be found inside a tab

    const tab = $("#"+element.parents('.tab-pane').attr('aria-labelledby'));
    if (tab) tab.tab('show'); // element is inside a tab, show it

    element[0].scrollIntoView(); // scroll to the element
}

// Replace hash if back-end requests so
function setHash() {
    const value = $("#hash").val();
    if (value) {
        window.location.hash = value;
    }
}

// Scroll to the correct element inside when window.location.hash is passed
function scrollToHash() {
    let hashtag = window.location.hash;
    if (!hashtag) return; // hash was not passed

    scrollTo(hashtag.replace('#', ''));
}

window.onload = () => {
    setBottlesEvents();
    setHash();
    scrollToHash();
}
