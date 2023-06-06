import operator
from datetime import time
from functools import reduce

from django.contrib.gis.db.models.functions import Distance
from django.contrib.gis.geos import Point
from django.db.models import Min, Max, Q

from .geolocation import get_coordinates
from .models import Kindergarten


class Value:
    def __init__(self, value):
        self.value = value


class RangedValue(Value):
    def __init__(self, value, min, max):
        super().__init__(value)
        self.min = min
        self.max = max


def get_boundaries_of_fields(parameters):

    # retrieve the min and max value of the filter fields
    l = Kindergarten.objects.all().aggregate(
        Min('min_age'), Max('min_age'),
        Min('max_age'), Max('max_age'),
        Min('capacity'), Max('capacity'),
        Min('open_time'), Max('open_time'),
        Min('close_time'), Max('close_time'))

    (min_age_min, min_age_max, max_age_min, max_age_max, min_capacity, max_capacity, min_open, max_open, min_close,
     max_close) = (
        int(l['min_age__min']), int(l['min_age__max']), int(l['max_age__min']), int(l['max_age__max']),
        int(l['capacity__min']), int(l['capacity__max']),
        l['open_time__min'], l['open_time__max'], l['close_time__min'], l['close_time__max']
    )

    # set the boundaries based on default and the user parameters
    min_age_value = int(parameters.get("min_age")) if parameters.get("min_age") else min_age_min
    max_age_value = int(parameters.get("max_age")) if parameters.get("max_age") else max_age_max
    if min_age_value > max_age_value:
        min_age_value = max_age_value
    capacity_value = int(parameters.get("capacity")) if parameters.get("capacity") else max_capacity
    open_value = parameters.get("open_time") if parameters.get("open_time") else max_open
    close_value = parameters.get("close_time") if parameters.get("close_time") else min_close

    # put all values in a dictionary
    boundaries = {'min_age_value': min_age_value,
                  'min_age_min': min_age_min,
                  'min_age_max': min_age_max,
                  'max_age_value': max_age_value,
                  'max_age_min': max_age_min,
                  'max_age_max': max_age_max,
                  'capacity_value': capacity_value,
                  'min_capacity': min_capacity,
                  'max_capacity': max_capacity,
                  'open_value': open_value,
                  'min_open': min_open,
                  'max_open': max_open,
                  'close_value': close_value,
                  'min_close': min_close,
                  'max_close': max_close, }

    # format dates
    for key in ['min_open', 'max_open', 'open_value',
                'min_close', 'max_close', 'close_value']:
        if isinstance(boundaries[key], str):
            boundaries[key] = time.fromisoformat(boundaries[key])

    return boundaries


def get_filtered_kindergartens(parameters, method, value):
    # builds the filters list
    filters = list()
    point = None
    if method == "name":
        filters.append(Q(name__contains=value))
    elif method == "location":
        regional_search = value in Kindergarten.objects.order_by('region').values_list('region', flat=True).distinct()
        if regional_search:
            filters.append(Q(region=value))
        else:
            coords = get_coordinates(value)
            point = Point(coords[1], coords[0], srid=4326)  # 4326 stands for (lat, long) coordinates system
    else:
        # algo
        pass

    # filters the kindergartens
    if filters:
        kindergartens = Kindergarten.objects.filter(reduce(operator.and_, filters))
    else:
        kindergartens = Kindergarten.objects.all()

    # sort by distance
    if method == "location" and not regional_search:
        kindergartens = kindergartens.annotate(distance=Distance('geolocation', point)).order_by("distance")

    return kindergartens
