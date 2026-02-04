from io import BytesIO

import pandas as pd
from django.contrib import messages
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt

from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo, MOTIVOS_CONCLUSION_ANTICIPADA
from apps.reportes.views.cabecera_reportes import CabeceraReporte
from apps.util.anios import ANIOS
from apps.util.get_type_admin import get_type_admin
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS, Entidad


def generar_informacion_reporte(request, anio, mes, ris, ipress):
    # Parametros return
    list_ipress_return = []
    list_final_total_return = []
    list_final_total_porcentaje_return = []
    count_mayor_return = []

    count_mayor = 0

    list_final_resultado = ['MOTIVO'] + [0] * len(MOTIVOS_CONCLUSION_ANTICIPADA)
    list_final_total_reclamo = ['TOTAL'] + [0] * len(MOTIVOS_CONCLUSION_ANTICIPADA)

    if ris == 0 and ipress == 0:
        list_final = [['RIS'] + [a[1] for a in MOTIVOS_CONCLUSION_ANTICIPADA]]
    elif ipress == 0:
        list_final = [['IPRESS'] + [a[1] for a in MOTIVOS_CONCLUSION_ANTICIPADA]]
    else:
        list_final = [['ESTADO RECLAMO', 'CANTIDAD']]

    if ris == 0 and ipress == 0:
        for r in RIS:
            list_ris = [r[1]]
            for rnr in MOTIVOS_CONCLUSION_ANTICIPADA:
                reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                               fecha_reclamo__month=mes,
                                                               entidad__ris=r[0]).count()

                reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                         fecha_reclamo__month=mes,
                                                                         entidad__ris=r[0],
                                                                         motivo_conclusion_anticipada=rnr[0]).count()
                if reclamos_count_resultado > count_mayor:
                    count_mayor = reclamos_count_resultado
                list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                list_final_resultado[rnr[0]] += reclamos_count_resultado
                list_final_total_reclamo[rnr[0]] += reclamos_count

            list_final.append(list_ris)

    elif ipress == 0:
        list_ipress = Entidad.objects.filter(ris=ris)
        list_ipress_return = list_ipress

        for r in list_ipress:
            list_ris = [r.nombre]
            for rnr in MOTIVOS_CONCLUSION_ANTICIPADA:
                reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                               fecha_reclamo__month=mes,
                                                               entidad=r).count()

                reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                         fecha_reclamo__month=mes,
                                                                         entidad=r,
                                                                         motivo_conclusion_anticipada=rnr[0]).count()
                if reclamos_count_resultado > count_mayor:
                    count_mayor = reclamos_count_resultado
                list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

                list_final_resultado[rnr[0]] += reclamos_count_resultado
                list_final_total_reclamo[rnr[0]] += reclamos_count

            list_final.append(list_ris)

    else:
        """
            Proceso cuando se selecciona una RIS y una IPRESS
            No contempla totales
        """

        list_ipress = Entidad.objects.filter(ris=ris)
        list_ipress_return = list_ipress

        reclamos_count = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                       fecha_reclamo__month=mes,
                                                       entidad_id=ipress).count()

        for er in MOTIVOS_CONCLUSION_ANTICIPADA:
            list_ris = [er[1]]

            reclamos_count_resultado = EntidadReclamo.objects.filter(fecha_reclamo__year=int(anio),
                                                                     fecha_reclamo__month=mes,
                                                                     entidad_id=ipress,
                                                                     motivo_conclusion_anticipada=er[0]).count()
            list_ris.append(str(reclamos_count_resultado) + " / " + str(reclamos_count))

            list_final_resultado[er[0]] += reclamos_count_resultado
            list_final_total_reclamo[er[0]] += reclamos_count

            list_final.append(list_ris)

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


def reporte_motivo_conclusion_anticipada(request):
    update_menu(request)
    template = loader.get_template('reportes/ris_motivo_conclusion_anticipada.html')

    context = {
        'title': 'N° DE MOTIVOS DE CONCLUSIÓN ANTICIPADA',
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
def reporte_motivo_conclusion_anticipada_excel(request):
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
            filename = 'Conclusion_anticipada_de_reclamos-' + str(mes) + '_' + str(anio)
            content_type = 'application/vnd.ms-excel'
            response = HttpResponse(b.getvalue(), content_type=content_type)
            response['Content-Disposition'] = 'attachment; filename="' + filename + '.xlsx"'
            return response
    else:
        return HttpResponse("Operación no soportada")
