from django.http import HttpResponse
from django.template import loader

from apps.util.update_menu import update_menu


def reporte_ris_anexos(request):
    update_menu(request)
    template = loader.get_template('reportes/ris_anexos.html')

    context = {
        'title': 'RIS ANEXOS'
    }

    return HttpResponse(template.render(context, request))
