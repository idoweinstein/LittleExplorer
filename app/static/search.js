let map, infobox;
const kindergartens = [];

function hideElement(element) {
    element.setAttribute('hidden', '');
}

function showElement(element) {
    element.removeAttribute('hidden');
}

function GetMap() {
    let clusterLayer;
    map = new Microsoft.Maps.Map('#myMap', {});

    //Add an infobox to the map.
    infobox = new Microsoft.Maps.Infobox(map.getCenter(), { visible: false });
    infobox.setMap(map);

    Microsoft.Maps.loadModule("Microsoft.Maps.Clustering", function () {
        //Create a clustering layer
        clusterLayer = new Microsoft.Maps.ClusterLayer(createCustomPushpins(kindergartens), {
            clusteredPinCallback: createCustomClusterPushpins,
        });

        //Add a click event to the clustering layer.
        Microsoft.Maps.Events.addHandler(clusterLayer, 'click', pushpinClicked);

        map.layers.insert(clusterLayer);
    });
}

function getLatLong(geolocation) {
    return /\((?:(?<long>\d+(:?\.\d+)) (?<lat>\d+(:?\.\d+)))\)/.exec(geolocation).groups;
}

function createCustomPushpins(kindergartens) {
    // Create pins for the kindergartens.
    const pins = [];

    for (const kindergarten of kindergartens) {
        // Get necessary data
        const data = kindergarten.data;
        let {lat, long} = getLatLong(data.fields.geolocation);
        lat = +lat;
        long = +long;

        // Build the pin
        const loc = new Microsoft.Maps.Location(lat, long);
        const pin = new Microsoft.Maps.Pushpin(loc, {text: ''});
        pin.metadata = {'id': data.pk};
        pin.setOptions({title: data.fields.name});
        pins.push(pin);

        // Assign it to the proper kindergarten object
        kindergarten.map = pin;
    }

    return pins;
}

function createCustomClusterPushpins(cluster) {
    // Create a title for the cluster.
    cluster.setOptions({
        title: cluster.containedPushpins.length + ' kindergartens'
    });
}

function pushpinClicked(e) {
    // Show an infobox when a pushpin is clicked.
    if (!e.target.containedPushpins) {
        // Redirect to the proper page
        window.location.href = `/kindergarten/${e.target.metadata.id}`;
    } else {
        showInfobox(e.target);
    }
}

function showInfobox(pin) {
    const description = [];

    // Check to see if the pushpin is a cluster.
    if (pin.containedPushpins) {
        // Create a list of all pushpins that are in the cluster.
        for (const subpin of pin.containedPushpins) {
            description.push(
                `<a style="font-family: arial; color:blue; text-decoration: underline" href="/kindergarten/`+
                `${subpin.metadata.id}">${subpin.getTitle()}</a><br>`);
        }
    } else {
        description.push('');
    }

    // Display an infobox for the pushpin.
    infobox.setOptions({
        title: pin.getTitle(),
        location: pin.getLocation(),
        description: description.join(''),
        visible: true
    });
}

function stringToTime(dateString) {
    const [ h, m ] = dateString.split(":");
    return new Date(0).setHours(h,m);
}

function isMatching(kindergartenData, min_age, max_age, capacity, open_time, close_time, is_free) {
    const fields = kindergartenData.fields;
    const currentMinAge = fields.min_age;
    const currentMaxAge = fields.max_age;
    const currentCapacity = fields.capacity;
    const currentOpenTime = stringToTime(fields.open_time);
    const currentCloseTime = stringToTime(fields.close_time);
    const currentIsFree = (fields.capacity > fields.kids_count);

    return min_age <= currentMinAge && max_age >= currentMaxAge && capacity >= currentCapacity 
            && open_time >= currentOpenTime && close_time <= currentCloseTime && is_free <= currentIsFree;
}

function filterKindergartens() {
    const form = document.forms['filters'];

    // Get filter values
    const min_age = +form.min_age.value;
    const max_age = +form.max_age.value;
    const capacity = +form.capacity.value;
    const open_time = stringToTime(form.open_time.value);
    const close_time = stringToTime(form.close_time.value);
    const is_free = form.is_free.checked;

    let item_count = 0;

    // Decide whether to show them or not based on the filters
    for (const kindergarten of kindergartens) {
        const data = kindergarten.data;
        if (isMatching(data, min_age, max_age, capacity, open_time, close_time, is_free)) {
            kindergarten.show();
            item_count++;
        } else {
            kindergarten.hide();
        }
    }

    // Show results or error message based on item count
    if (item_count > 0) {
        showElement(document.getElementById("search-results"));
        hideElement(document.getElementById("empty-results"));
    } else {
        showElement(document.getElementById("empty-results"));
        hideElement(document.getElementById("search-results"));
    }
}

function updateFiltersShadowItems(form) {
    const shadowForm = document.forms['search'];
    for (const attribute of ['min_age', 'max_age', 'capacity', 'open_time', 'close_time']) {
        shadowForm[attribute].value = form[attribute].value;
    }
    shadowForm['is_free'].value = form['is_free'].checked ? 'on' : '';
}

/*
 * The filtering logic is implemented in the front-end to optimize performance.
 * This decision is driven by the fact that back-end requests can be computationally intensive
 * and time-consuming, especially considering our utilization of NLP algorithms for data processing.
 * Hence, we employ a two-step approach: ranking the data in the back-end,
 * and enabling the user to filter the results on the front-end.
 *
 * By allowing the user to filter the results multiple times on the front-end,
 * we provide a flexible and interactive experience. Users can refine their searches
 * and explore different combinations of filters without the need for repeated back-end requests.
 * This not only improves the responsiveness of the application but also reduces the overall load
 * on the server, leading to a more scalable system.
*/
function applyFilters(event) {
    event.preventDefault();
    updateFiltersShadowItems(this);
    filterKindergartens();
}

function updateKindergartens() {
    const kindergartensData = JSON.parse(document.getElementById("kindergartens-data").dataset.kindergartens);
    for (const kindergartenData of kindergartensData) {
        const item = { data: kindergartenData };
        
        const listElement = document.getElementById(`kindergarten_${kindergartenData.pk}`);
        if (listElement)
            item.list = listElement;

        item.show = () => {
            if (item.list) {
                showElement(item.list);
            }
            if (item.map) {
                item.map.setOptions({visible: true});
            }
        }

        item.hide = () => {
            if (item.list) {
                hideElement(item.list);
            }
            if (item.map) {
                item.map.setOptions({visible: false});
            }
        }

        kindergartens.push(item);
    }
    return !!kindergartensData;
}

window.addEventListener("load", () => {
    // Define filters behavior
    for (const catergory of ["min_age", "max_age", "capacity"]) {
        const value = document.querySelector(`#${catergory}_value`);
        const input = document.querySelector(`#${catergory}`);
        value.textContent = input.value;
        input.addEventListener("input", (event) => {
          if (document.querySelector("#min_age").value > document.querySelector("#max_age").value) {
            /* Enfore min <= max */
            document.querySelector("#min_age").value = document.querySelector("#max_age").value = input.value;
            document.querySelector("#min_age_value").textContent = document.querySelector("#max_age_value").textContent = input.value;
          }
          /* Update value label */
          value.textContent = event.target.value;
        });
    }

    // Update kindergartens variable
    if (updateKindergartens()) filterKindergartens();
    else return;  // No entries found

    // Register filter form behavior
    document.forms['filters'].addEventListener('submit', applyFilters);

    // Get API key
    const key = document.getElementById("key").dataset.key;

    // Load map
    const script = document.createElement("script");
    script.setAttribute("src", `https://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=${key}`);
    document.body.appendChild(script);
});