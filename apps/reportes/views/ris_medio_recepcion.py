from django.contrib import messages
from django.http import HttpResponse
from django.template import loader

from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo, MEDIOS_RECLAMO
from apps.util.anios import ANIOS
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS


def reporte_medio_recepcion(request):
    update_menu(request)
    template = loader.get_template('reportes/ris_medio_recepcion.html')

    context = {
        'title': 'MEDIO DE RECIPCIÓN DEL RECLAMO',
        'anios': ANIOS,
        'meses': MESES
    }

    count_mayor = 0

    if request.method == 'GET':
        context['s'] = 'sd'
    elif request.method == 'POST':
        anio = request.POST.get('anio', '2020')
        mes = int(request.POST.get('mes', '1'))
        context['anio'] = int(anio)
        context['mes'] = int(mes)
        list_final = [['RIS'] + [a[1] for a in MEDIOS_RECLAMO]]

        list_final_resultado = ['MEDIO'] + [0] * len(MEDIOS_RECLAMO)
        list_final_total_reclamo = ['TOTAL'] + [0] * len(MEDIOS_RECLAMO)

        for r in RIS:
            list_ris = [r[1]]

            for rnr in MEDIOS_RECLAMO:
                reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                               fecha_reclamo__month=mes,
                                                               entidad__ris=r[0]).count()

                reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                         fecha_reclamo__month=mes,
                                                                         entidad__ris=r[0],
                                                                         medio_recepcion_reclamo=rnr[0]).count()
                if reclamos_count_resultado > count_mayor:
                    count_mayor = reclamos_count_resultado
                list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                list_final_resultado[rnr[0]] += reclamos_count_resultado
                list_final_total_reclamo[rnr[0]] += reclamos_count

            list_final.append(list_ris)

        context['list_final'] = list_final
        context['list_final_total'] = [str(x) + " / " + str(y) for x, y in
                                       zip(list_final_resultado, list_final_total_reclamo)]

        context['list_final_total_porcentaje'] = ["% TOTAL"]
        for x, y in zip(list_final_resultado[1:], list_final_total_reclamo[1:]):
            if x == 0:
                context['list_final_total_porcentaje'] += ["0"]
            else:
                context['list_final_total_porcentaje'] += [str(round((x * 100) / y))]

        context['count_mayor'] = count_mayor + 5

        msg = "Reporte generado del año: " + str(anio)
        messages.add_message(request, messages.SUCCESS, msg)

    return HttpResponse(template.render(context, request))
