import operator
from datetime import time
from functools import reduce

from django.contrib.gis.db.models.functions import Distance
from django.contrib.gis.geos import Point
from django.db.models import Min, Max, Q

from .geolocation import get_coordinates
from .models import Kindergarten
from app.algorithm import main_algo


class Value:
    def __init__(self, value):
        self.value = value


class RangedValue(Value):
    def __init__(self, value, min, max):
        super().__init__(value)
        self.min = min
        self.max = max


def get_boundaries_of_fields(parameters):
    # retrieves the min and max value of the filter fields
    l = Kindergarten.objects.all().aggregate(
        Min('min_age'), Max('min_age'),
        Min('max_age'), Max('max_age'),
        Min('capacity'), Max('capacity'),
        Min('open_time'), Max('open_time'),
        Min('close_time'), Max('close_time'))
    # default_boundaries = {'min_age_min':  int(l['min_age__min']),
    #         'min_age_max': int(l['min_age__max']),
    #         'max_age_min': int(l['max_age__min']),
    #         'max_age_max': int(l['capacity__min']),
    #         'min_capacity': int(l['capacity__max']),
    #         'max_capacity': int(l['max_age__max']),
    #         'min_open': l['open_time__min'],
    #         'max_open': l['open_time__max'],
    #         'min_close': l['close_time__min'],
    #         'max_close': l['close_time__max']}
    (min_age_min, min_age_max, max_age_min, max_age_max, min_capacity, max_capacity, min_open, max_open, min_close,
     max_close) = (
        int(l['min_age__min']), int(l['min_age__max']), int(l['max_age__min']), int(l['max_age__max']),
        int(l['capacity__min']), int(l['capacity__max']),
        l['open_time__min'], l['open_time__max'], l['close_time__min'], l['close_time__max']
    )

    # set the boundaries based on default and the user parameters
    # min_age_value = int(parameters.get("min_age")) if parameters.get("min_age") else default_boundaries['min_age_min']
    # max_age_value = int(parameters.get("max_age")) if parameters.get("max_age") else default_boundaries['max_age_max']
    # if min_age_value > max_age_value:
    #     min_age_value = max_age_value
    # capacity_value = int(parameters.get("capacity")) if parameters.get("capacity") else default_boundaries['max_capacity']
    # open_value = parameters.get("open_time") if parameters.get("open_time") else default_boundaries['max_open']
    # close_value = parameters.get("close_time") if parameters.get("close_time") else default_boundaries['min_close']

    min_age_value = int(parameters.get("min_age")) if parameters.get("min_age") else min_age_min
    max_age_value = int(parameters.get("max_age")) if parameters.get("max_age") else max_age_max
    if min_age_value > max_age_value:
        min_age_value = max_age_value
    capacity_value = int(parameters.get("capacity")) if parameters.get("capacity") else max_capacity
    open_value = parameters.get("open_time") if parameters.get("open_time") else max_open
    close_value = parameters.get("close_time") if parameters.get("close_time") else min_close

    if isinstance(min_open, str):
        min_open = time.fromisoformat(min_open)
    if isinstance(max_open, str):
        max_open = time.fromisoformat(max_open)
    if isinstance(open_value, str):
        open_value = time.fromisoformat(open_value)

    if isinstance(min_close, str):
        min_close = time.fromisoformat(min_close)
    if isinstance(max_close, str):
        max_close = time.fromisoformat(max_close)
    if isinstance(close_value, str):
        close_value = time.fromisoformat(close_value)

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

    return boundaries


def get_filtered_kindergartens(boundaries, parameters, method, value):
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
        # algo does not contain any filters
        pass

    for key, (attr_key, attr_value) in {"min_age": ("min_age__gte", boundaries['min_age_value']),
                                        "max_age": ("max_age__lte", boundaries['max_age_value']),
                                        "capacity": ("capacity__lte", boundaries['capacity_value']),
                                        "open_time": ("open_time__lte", boundaries['open_value']),
                                        "close_time": ("close_time__gte", boundaries['close_value'])
                                        }.items():
        if parameters.get(key):
            filters.append(Q(**{attr_key: attr_value}))

    # filters the kindergartens
    if filters:
        kindergartens = Kindergarten.objects.filter(reduce(operator.and_, filters))
    else:
        kindergartens = Kindergarten.objects.all()

    # show only kindergartens with left slots
    if parameters.get('is_free') == 'on':
        kindergartens = [k for k in kindergartens.iterator() if k.is_free()]

    # sort by distance
    if method == "location" and not regional_search:
        kindergartens = kindergartens.annotate(distance=Distance('geolocation', point)).order_by("distance")

    # search by algorithm
    if method == "advanced":
        kindergartens = main_algo(kindergartens)

    return kindergartens
