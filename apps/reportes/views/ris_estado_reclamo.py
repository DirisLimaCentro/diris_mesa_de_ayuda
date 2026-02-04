from django.contrib import messages
from django.http import HttpResponse
from django.template import loader

from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo, ESTADOS_RECLAMO
from apps.reportes.views.cabecera_reportes import CabeceraReporte
from apps.util.anios import ANIOS
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS, Entidad


def reporte_estado_reclamo(request):
    update_menu(request)
    template = loader.get_template('reportes/ris_estado_reclamo.html')

    context = {
        'title': 'REPORTE POR ESTADO DEL RECLAMO',
        'anios': ANIOS,
        'meses': MESES
    }

    cabecera = CabeceraReporte()
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

        list_final_resultado = ['ETAPA'] + [0] * len(ESTADOS_RECLAMO)
        list_final_total_reclamo = ['TOTAL'] + [0] * len(ESTADOS_RECLAMO)

        if ris == 0 and ipress == 0:
            list_final = [['RIS'] + [a[1] for a in ESTADOS_RECLAMO]]
        elif ipress == 0:
            list_final = [['IPRESS'] + [a[1] for a in ESTADOS_RECLAMO]]
        else:
            list_final = [['ESTADO RECLAMO', 'CANTIDAD']]

        if ris == 0 and ipress == 0:

            for r in RIS:
                list_ris = [r[1]]
                reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                               fecha_reclamo__month=mes,
                                                               entidad__ris=r[0]).count()

                for er in ESTADOS_RECLAMO:

                    reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                             fecha_reclamo__month=mes,
                                                                             entidad__ris=r[0],
                                                                             estado_reclamo=er[0]).count()
                    if reclamos_count_resultado > count_mayor:
                        count_mayor = reclamos_count_resultado
                    list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))


                    if int(er[0]) == 77:
                        list_final_resultado[7] += reclamos_count_resultado
                        list_final_total_reclamo[7] += reclamos_count
                    else:
                        list_final_resultado[er[0]] += reclamos_count_resultado
                        list_final_total_reclamo[er[0]] += reclamos_count

                list_final.append(list_ris)

        elif ipress == 0:
            list_ipress = Entidad.objects.filter(ris=ris)
            context['list_ipress'] = list_ipress

            for r in list_ipress:
                list_ris = [r.nombre]
                reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                               fecha_reclamo__month=mes,
                                                               entidad=r).count()
                for er in ESTADOS_RECLAMO:


                    reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                             fecha_reclamo__month=mes,
                                                                             entidad=r,
                                                                             estado_reclamo=er[0]).count()
                    if reclamos_count_resultado > count_mayor:
                        count_mayor = reclamos_count_resultado
                    list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                    if int(er[0]) == 77:
                        list_final_resultado[7] += reclamos_count_resultado
                        list_final_total_reclamo[7] += reclamos_count
                    else:
                        list_final_resultado[er[0]] += reclamos_count_resultado
                        list_final_total_reclamo[er[0]] += reclamos_count

                list_final.append(list_ris)

        else:

            """
                Proceso cuando se selecciona una RIS y una IPRESS
                No contempla totales
            """

            list_ipress = Entidad.objects.filter(ris=ris)
            context['list_ipress'] = list_ipress

            reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                           fecha_reclamo__month=mes,
                                                           entidad_id=ipress).count()

            for er in ESTADOS_RECLAMO:
                list_ris = [er[1]]

                reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                         fecha_reclamo__month=mes,
                                                                         entidad_id=ipress,
                                                                         estado_reclamo=er[0]).count()
                list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                if int(er[0]) == 77:
                    list_final_resultado[7] += reclamos_count_resultado
                    list_final_total_reclamo[7] += reclamos_count
                else:
                    list_final_resultado[er[0]] += reclamos_count_resultado
                    list_final_total_reclamo[er[0]] += reclamos_count

                list_final.append(list_ris)

        context['list_final'] = list_final


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

    return HttpResponse(template.render(context, request))
