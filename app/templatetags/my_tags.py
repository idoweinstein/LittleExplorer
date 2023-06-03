from django import template

register = template.Library()

@register.filter
def custommod(num, val):
    return ((num - 1) % val) + 1