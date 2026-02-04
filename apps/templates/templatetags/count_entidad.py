# coding=utf-8
from django import template

from apps.reclamo.models.sin_reclamo import SinReclamo

register = template.Library()


@register.simple_tag
def get_sin_reclamo(entidad, anio, mes):
    try:
        cantidad_reclamos = SinReclamo.objects.get(entidad_id=entidad, anio=anio, periodo=mes)
        url_archivo = [cantidad_reclamos.archivo.url, cantidad_reclamos.created_at]
    except SinReclamo.DoesNotExist:
        url_archivo = None

    return url_archivo
