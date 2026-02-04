import os
import sys

if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
    import django

    django.setup()

import json

from django.db.models import Q
from django.http.response import HttpResponse

from apps.reclamo.models.clasificacion_causa import ClasificacionCausa


def clasificacion_serializer_autocomplete(object):
    return {'id': object.id,
            'codigo': object.codigo,
            'value': "Código (" + object.codigo + ")   |  "
                                                  " Derecho (" + object.get_categoria_display() + ")   |   "
                                                                                                  " Causa (" + object.causa + ")   |   "
                                                                                                                              " Definición (" + object.definicion + ")   |   "
                                                                                                                                                                    " Definición corta (" + object.definicion_corta + ")"}


def get_clasificacion_autocomplete(request):
    query = request.GET.get('term', '0')
    clasificacion_list = ClasificacionCausa.objects.filter(
        Q(codigo__icontains=query) | Q(categoria__icontains=query) | Q(definicion__icontains=query)).order_by('codigo')[
                         :8]
    list_json = [clasificacion_serializer_autocomplete(item) for item in clasificacion_list]
    return HttpResponse(json.dumps(list_json),
                        content_type='application/json')
