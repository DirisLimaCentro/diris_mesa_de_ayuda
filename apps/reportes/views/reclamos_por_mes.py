from django.contrib import messages
from django.http import HttpResponse
from django.template import loader

from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo
from apps.util.anios import ANIOS
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS


def reporte_reclamos_por_mes(request):
    update_menu(request)
    template = loader.get_template('reportes/reclamos_por_mes.html')

    context = {
        'title': 'N° DE RECLAMOS POR MES SEGÚN RIS *',
        'anios': ANIOS
    }

    count_mayor = 0

    if request.method == 'GET':
        context['s'] = 'sd'
    elif request.method == 'POST':
        anio = request.POST.get('anio', '2020')
        context['anio'] = int(anio)
        list_final = [['RIS'] + [a[1] for a in MESES]]
        list_final_total = ['TOTAL'] + [0] * 12

        for r in RIS:
            list_ris = [r[1]]
            for mes in MESES:
                reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                               fecha_reclamo__month=mes[0],
                                                               entidad__ris=r[0]).count()
                if reclamos_count > count_mayor:
                    count_mayor = reclamos_count
                list_ris.append(reclamos_count)
                list_final_total[mes[0]] = list_final_total[mes[0]] + reclamos_count

            list_final.append(list_ris)

        context['list_final'] = list_final
        context['list_final_total'] = list_final_total
        context['count_mayor'] = count_mayor + 5

        msg = "Reporte generado del año: " + str(anio)
        messages.add_message(request, messages.SUCCESS, msg)

    return HttpResponse(template.render(context, request))
