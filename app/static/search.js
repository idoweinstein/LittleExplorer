let map, infobox;
let kindergartens;

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
        let {lat, long} = getLatLong(kindergarten.fields.geolocation);
        lat = +lat;
        long = +long;

        const loc = new Microsoft.Maps.Location(lat, long);
        const pin = new Microsoft.Maps.Pushpin(loc, {text: ''});
        pin.metadata = {'id': kindergarten.pk};
        pin.setOptions({title: kindergarten.fields.name});
        pins.push(pin);
    }

    return pins;
}

function createCustomClusterPushpins(cluster) {
    // Create a title for the cluster.
    cluster.setOptions({
        title: cluster.containedPushpins.length + ' גנים'
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

    //Check to see if the pushpin is a cluster.
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
    kindergartens = JSON.parse(document.getElementById("kindergartens-data").dataset.kindergartens);
    if (!kindergartens) return;

    // Get API key
    const key = document.getElementById("key").dataset.key;

    // Load map
    const script = document.createElement("script");
    script.setAttribute("src", `https://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=${key}`);
    document.body.appendChild(script);
});