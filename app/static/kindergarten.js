
window.onload = () => {
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
