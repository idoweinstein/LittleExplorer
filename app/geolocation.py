import requests

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

    if r["resourceSets"][0]["estimatedTotal"] == 0:
        # No results
        return None

    return tuple(r["resourceSets"][0]["resources"][0]["geocodePoints"][0]["coordinates"])
