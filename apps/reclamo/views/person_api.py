import os
import sys

if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
    import django


import json
from django.http import HttpResponse
from apps.util.get_person_api import get_person_api, get_person_api_reniec


def get_persona_by_dni(request, dni):
    """
    Vista para obtener la persona por DNI

    :param request:
    :param dni:
    :return: Persona en formato JSON
    """
    persona = get_person_api_reniec(str(dni), request)
    estado = True

    if persona['dni'] == 'xxxxx':
        estado = False

    respuesta = {
        'estado': estado,
        'persona': persona
    }
    return HttpResponse(json.dumps(respuesta), content_type='application/json')
