from io import BytesIO

import pandas as pd
from django.contrib import messages
from django.db.models import Q
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt

from apps.reclamo.models.clasificacion_causa import ClasificacionCausa
from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo
from apps.reportes.views.cabecera_reportes import CabeceraReporte
from apps.util.anios import ANIOS
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS, Entidad


def generar_informacion_reporte(request, anio, mes, ris, ipress):
    list_final_total_return = []
    list_final_total_porcentaje_return = []
    count_mayor_return = []

    count_mayor = 0

    list_final_resultado = ['ETAPA'] + [0] * ClasificacionCausa.objects.all().count()
    list_final_total_reclamo = ['TOTAL'] + [0] * ClasificacionCausa.objects.all().count()

    if ris == 0 and ipress == 0:
        list_final = [['RIS'] + [r.codigo for r in ClasificacionCausa.objects.all()]]
    elif ipress == 0:
        list_final = [['RIS'] + [r.codigo for r in ClasificacionCausa.objects.all()]]
    else:
        list_final = [['Clafificación', 'CANTIDAD']]

    if ris == 0 and ipress == 0:
        for r in RIS:
            list_clasificacion = [r[1]]
            reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                           fecha_reclamo__month=mes,
                                                           entidad__ris=r[0]).count()
            for index, cl in enumerate(ClasificacionCausa.objects.all()):
                reclamos_count_resultado = EntidadReclamo.objects.filter(Q(fecha_reclamo__year=int(anio)),
                                                                         Q(fecha_reclamo__month=mes),
                                                                         Q(entidad__ris=r[0])).filter(
                    Q(clasificacion_reclamo_1=cl) |
                    Q(clasificacion_reclamo_2=cl) |
                    Q(clasificacion_reclamo_3=cl)).count()

                list_clasificacion.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                list_final_resultado[index + 1] += reclamos_count_resultado
                list_final_total_reclamo[index + 1] += reclamos_count
            list_final.append(list_clasificacion)
    elif ipress == 0:
        list_ipress = Entidad.objects.filter(ris=ris)
        list_ipress_return = list_ipress

        for r in list_ipress:
            list_clasificacion = [r.nombre]
            reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                           fecha_reclamo__month=mes,
                                                           entidad=r).count()
            for index, cl in enumerate(ClasificacionCausa.objects.all()):
                reclamos_count_resultado = EntidadReclamo.objects.filter(Q(fecha_reclamo__year=int(anio)),
                                                                         Q(fecha_reclamo__month=mes),
                                                                         Q(entidad=r)).filter(
                    Q(clasificacion_reclamo_1=cl) |
                    Q(clasificacion_reclamo_2=cl) |
                    Q(clasificacion_reclamo_3=cl)).count()

                list_clasificacion.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                list_final_resultado[index + 1] += reclamos_count_resultado
                list_final_total_reclamo[index + 1] += reclamos_count
            list_final.append(list_clasificacion)

    else:

        list_ipress = Entidad.objects.filter(ris=ris)
        list_ipress_return = list_ipress

        reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                       fecha_reclamo__month=mes,
                                                       entidad_id=ipress).count()

        for index, cl in enumerate(ClasificacionCausa.objects.all()):
            list_clasificacion = [cl.codigo]
            reclamos_count_resultado = EntidadReclamo.objects.filter(Q(fecha_reclamo__year=int(anio)),
                                                                     Q(fecha_reclamo__month=mes),
                                                                     Q(entidad__id=ipress)).filter(
                Q(clasificacion_reclamo_1=cl) |
                Q(clasificacion_reclamo_2=cl) |
                Q(clasificacion_reclamo_3=cl)).count()

            list_clasificacion.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

            list_final_resultado[index + 1] += reclamos_count_resultado
            list_final_total_reclamo[index + 1] += reclamos_count
            list_final.append(list_clasificacion)

    list_final_return = list_final

    if ris == 0 or ipress == 0:
        list_final_total_return = [str(x) + " / " + str(y) for x, y in
                                   zip(list_final_resultado, list_final_total_reclamo)]

        list_final_total_porcentaje_return = ["% TOTAL"]
        for x, y in zip(list_final_resultado[1:], list_final_total_reclamo[1:]):
            if x == 0:
                list_final_total_porcentaje_return += ["0"]
            else:
                list_final_total_porcentaje_return += [str(round((x * 100) / y))]

        count_mayor_return = count_mayor + 5

    return {"list_final": list_final_return,
            "list_final_total": list_final_total_return,
            "list_final_total_porcentaje": list_final_total_porcentaje_return,
            "count_mayor": count_mayor_return}


def reporte_clasificacion_reclamo(request):
    update_menu(request)
    template = loader.get_template('reportes/ris_clasificacion_reclamo.html')

    context = {
        'title': 'REPORTE POR CLASIFICACIÓN DEL RECLAMO',
        'anios': ANIOS,
        'meses': MESES
    }

    cabecera = CabeceraReporte()

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

        preparando_informacion = generar_informacion_reporte(request, anio, mes, ris, ipress)

        for i in preparando_informacion:
            context[i] = preparando_informacion[i]

        msg = "Reporte generado del año: " + str(anio)
        messages.add_message(request, messages.SUCCESS, msg)

    return HttpResponse(template.render(context, request))


@csrf_exempt
def reporte_clasificacion_reclamo_excel(request):
    if request.method == 'GET':

        anio = int(request.GET.get('anio', '2020'))
        mes = int(request.GET.get('mes', '1'))
        ris = int(request.GET.get('ris', '0'))
        ipress = int(request.GET.get('ipress', '0'))

        pd.set_option('display.max_colwidth', 0)

        columnas_excel = {}

        preparando_informacion = generar_informacion_reporte(request, anio, mes, ris, ipress)

        columnas_title_excel = preparando_informacion["list_final"][0]

        for l in preparando_informacion["list_final"][1:]:
            for index, c in enumerate(columnas_title_excel):
                try:
                    columnas_excel[c] = columnas_excel[c] + [l[index]]
                except KeyError:
                    columnas_excel[c] = [l[index]]

        for c, p in zip(columnas_title_excel, preparando_informacion["list_final_total"]):
            try:
                columnas_excel[c] = columnas_excel[c] + [p]
            except KeyError:
                columnas_excel[c] = [p]

        for c, p in zip(columnas_title_excel, preparando_informacion["list_final_total_porcentaje"]):
            try:
                columnas_excel[c] = columnas_excel[c] + [p]
            except KeyError:
                columnas_excel[c] = [p]

        df = pd.DataFrame(columnas_excel, columns=columnas_title_excel)
        # df.index = df.index + 1

        with BytesIO() as b:

            writer = pd.ExcelWriter(b, engine='xlsxwriter')

            #  Obteniedo cabecera
            header_list = list(df.columns.values)
            df.to_excel(writer, sheet_name='Página1', index=False)

            workbook = writer.book
            worksheet = writer.sheets['Página1']
            format1 = workbook.add_format({'num_format': ''})
            worksheet.set_column(1, 61, 18, format1)
            worksheet.set_column(0, 0, 45, format1)
            worksheet.set_row(0, 50)

            format = workbook.add_format({})
            # format.set_rotation(90)

            for i in range(0, len(header_list)):
                writer.sheets['Página1'].write(0, i, header_list[i], format)

            writer.save()
            filename = 'Clasificación_de_reclamos-' + str(mes) + '_' + str(anio)
            content_type = 'application/vnd.ms-excel'
            response = HttpResponse(b.getvalue(), content_type=content_type)
            response['Content-Disposition'] = 'attachment; filename="' + filename + '.xlsx"'
            return response
    else:
        return HttpResponse("Operación no soportada")
