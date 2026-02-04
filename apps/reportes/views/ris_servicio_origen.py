from django.contrib import messages
from django.http import HttpResponse
from django.template import loader

from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo, SERVICIOS
from apps.reportes.views.cabecera_reportes import CabeceraReporte
from apps.util.anios import ANIOS
from apps.util.get_type_admin import get_type_admin
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS, Entidad


def reporte_servicio_origen(request):
    update_menu(request)
    template = loader.get_template('reportes/ris_servicio_origen.html')

    context = {
        'title': 'SERVICIOS DONDE SE EFECTUÓ EL HECHO QUE ORIGINÓ EL RECLAMO',
        'anios': ANIOS,
        'meses': MESES
    }

    cabecera = CabeceraReporte()

    list_ipress = cabecera.list_ipress
    count_mayor = cabecera.count_mayor
    cabecera.definir_cabecera(context, request)

    if request.method == 'GET':
        context['s'] = 'sd'
    elif request.method == 'POST':
        anio = int(request.POST.get('anio', '2020'))
        mes = int(request.POST.get('mes', '1'))
        ris = int(request.POST.get('ris', '0'))
        ipress = int(request.POST.get('ipress', '0'))

        context['anio'] = anio
        context['mes'] = mes
        context['ris'] = ris
        context['ipress'] = ipress

        list_final_resultado = ['MOTIVO'] + [0] * len(SERVICIOS)
        list_final_total_reclamo = ['TOTAL'] + [0] * len(SERVICIOS)

        if ris == 0 and ipress == 0:
            list_final = [['RIS'] + [a[1] for a in SERVICIOS]]
        elif ipress == 0:
            list_final = [['IPRESS'] + [a[1] for a in SERVICIOS]]

        else:
            list_final = [['SERVICIO DE ORIGEN', 'CANTIDAD']]

        if ris == 0 and ipress == 0:
            for r in RIS:
                list_ris = [r[1]]

                for rnr in SERVICIOS:
                    reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                   fecha_reclamo__month=mes,
                                                                   entidad__ris=r[0]).count()

                    reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                             fecha_reclamo__month=mes,
                                                                             entidad__ris=r[0],
                                                                             servicio_hecho_reclamo=rnr[0]).count()
                    if reclamos_count_resultado > count_mayor:
                        count_mayor = reclamos_count_resultado
                    list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                    if int(rnr[0]) == 77:
                        list_final_resultado[14] += reclamos_count_resultado
                        list_final_total_reclamo[14] += reclamos_count
                    else:
                        list_final_resultado[int(rnr[0])] += reclamos_count_resultado
                        list_final_total_reclamo[int(rnr[0])] += reclamos_count
                list_final.append(list_ris)

        elif ipress == 0:

            for r in list_ipress:

                list_ris = [r.nombre]
                for rnr in SERVICIOS:
                    reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                   fecha_reclamo__month=mes,
                                                                   entidad=r).count()

                    reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                             fecha_reclamo__month=mes,
                                                                             entidad=r,
                                                                             servicio_hecho_reclamo=rnr[0]).count()
                    if reclamos_count_resultado > count_mayor:
                        count_mayor = reclamos_count_resultado
                    list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))


                    if int(rnr[0]) == 77:
                        list_final_resultado[7] += reclamos_count_resultado
                        list_final_total_reclamo[7] += reclamos_count
                    else:
                        list_final_resultado[int(rnr[0])] += reclamos_count_resultado
                        list_final_total_reclamo[int(rnr[0])] += reclamos_count

                list_final.append(list_ris)


        else:

            """
                Proceso cuando se selecciona una RIS y una IPRESS
                No contempla totales
            """

            reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                           fecha_reclamo__month=mes,
                                                           entidad_id=ipress).count()

            for rnr in SERVICIOS:
                list_ris = [rnr[1]]

                reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                         fecha_reclamo__month=mes,
                                                                         entidad_id=ipress,
                                                                         servicio_hecho_reclamo=rnr[0]).count()
                list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                list_final.append(list_ris)

        if ris == 0 or ipress == 0:
            """
                Los totales solo se mostrarán cuando NO se seleccione una RIS o una IPRESS
            """
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

        context['list_final'] = list_final
    return HttpResponse(template.render(context, request))
