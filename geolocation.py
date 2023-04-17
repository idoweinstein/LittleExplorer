### http://dev.virtualearth.net/REST/v1/Locations?query={locationQuery}&includeNeighborhood={includeNeighborhood}&include={includeValue}&maxResults={maxResults}&key={BingMapsKey}
import requests  # TODO: document `pip3 install requests`` is necessary


BING_KEY = "Ao8tSGMxgBHd33tp113veePtzRiaEDhNsNLcDPyKnFzjw1_2AjogMbkwANCcK_dE"
def get_coordinates(location):
    """
    returns (latitude, longitude) tuple
    """
    base_url = "http://dev.virtualearth.net/REST/v1/Locations"
    query_parameters = {
        "query": location,
        "maxResults": 1,
        "o": "json",
        "key": BING_KEY
    }
    r = requests.get(url=base_url, params=query_parameters).json()
    return tuple(r["resourceSets"][0]["resources"][0]["geocodePoints"][0]["coordinates"])
