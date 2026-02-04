from io import BytesIO

import pandas as pd
from django.contrib import messages
from django.db.models import Case, IntegerField, When, Count
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt

from apps.reclamo.models.entidad_reclamo import MESES
from apps.reclamo.models.sin_reclamo import SinReclamo
from apps.reportes.views.cabecera_reportes import CabeceraReporte
from apps.util.anios import ANIOS
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS, Entidad


def generar_informacion_reporte(request, anio, mes, ris, ipress):
    # Parametros return
    list_ipress_return = []
    list_final_total_return = []
    list_final_total_porcentaje_return = []
    count_mayor_return = []

    count_mayor = 0

    list_final_resultado = ['TIPO', 0, 0, 0]
    list_final_total_reclamo = ['TOTAL', 0, 0, 0]

    if ris == 0 and ipress == 0:
        list_final = [['RIS', 'REPORTADO SIN RECLAMO', 'REPORTADO CON RECLAMO', 'SIN REPORTAR', 'TOTAL']]
    elif ipress == 0:
        list_final = [
            ['IPRESS', 'REPORTADO SIN RECLAMO', 'REPORTADO CON RECLAMO', 'SIN REPORTAR', 'TOTAL']]
    else:
        list_final = [['ESTADO RECLAMO']]

    filters = {}

    if ris == 0 and ipress == 0:

        for r in RIS:
            list_ris = [r[1]]
            count_ipress = Entidad.objects.filter(ris=r[0]).count()

            sin_reclamo = SinReclamo.objects.filter(entidad__ris=r[0], periodo=mes, anio=anio).count()
            list_ris.append(str(sin_reclamo) + "/" + str(count_ipress))

            # Calcular IPRESS sin reportar y sin reclamos
            contadors_ipress_sin_reclamos_sin_reportar = 0
            ipress_sin_reclamos_sin_reportar = Entidad.objects.filter(ris=r[0]).annotate(
                num_reclamos=Count(Case(When(reclamos__fecha_reclamo__year=anio,
                                             reclamos__fecha_reclamo__month=mes, then=1),
                                        output_field=IntegerField()))).filter(num_reclamos=0, **filters)
            for i in ipress_sin_reclamos_sin_reportar:
                count_sin_archivo = SinReclamo.objects.filter(entidad=i.id, periodo=mes, anio=anio).count()
                if count_sin_archivo == 0:
                    contadors_ipress_sin_reclamos_sin_reportar += 1



            # Calcular IPRESS con reportar y sin reclamos
            contadors_ipress_con_reclamos_sin_reportar = 0
            ipress_con_reclamos_sin_reportar = Entidad.objects.filter(ris=r[0]).annotate(
                num_reclamos=Count(Case(When(reclamos__fecha_reclamo__year=anio,
                                             reclamos__fecha_reclamo__month=mes, then=1),
                                        output_field=IntegerField()))).filter(num_reclamos__gt=0, **filters)
            for i in ipress_con_reclamos_sin_reportar:
                count_sin_archivo = SinReclamo.objects.filter(entidad=i.id, periodo=mes, anio=anio).count()
                if count_sin_archivo == 0:
                    contadors_ipress_con_reclamos_sin_reportar += 1

            list_ris.append(str(contadors_ipress_con_reclamos_sin_reportar) + "/" + str(count_ipress))
            list_ris.append(str(contadors_ipress_sin_reclamos_sin_reportar) + "/" + str(count_ipress))
            list_ris.append(count_ipress)

            list_final.append(list_ris)

    elif ipress == 0:

        list_ipress = Entidad.objects.filter(ris=ris)
        list_ipress_return = list_ipress

        for r in list_ipress:
            list_ris = [r.nombre]

            sin_reclamo = SinReclamo.objects.filter(entidad=r.id, periodo=mes, anio=anio).count()
            list_ris.append(str(sin_reclamo) + "/" + str(1))

            entidad_con_numero_reclamos = Entidad.objects.filter(pk=r.id).annotate(
                num_reclamos=Count(Case(When(reclamos__fecha_reclamo__year=anio,
                                             reclamos__fecha_reclamo__month=mes, then=1),
                                        output_field=IntegerField())))


            if sin_reclamo == 0 and entidad_con_numero_reclamos[0].num_reclamos > 0:
                list_ris.append("1/1")
            else:
                list_ris.append("0/1")

            if sin_reclamo == 0 and entidad_con_numero_reclamos[0].num_reclamos == 0:
                list_ris.append("1/1")
            else:
                list_ris.append("0/1")


            list_ris.append("1")
            list_final.append(list_ris)

    else:
        list_ipress = Entidad.objects.filter(ris=ris)
        list_ipress_return = list_ipress

        sin_reclamo = SinReclamo.objects.filter(entidad=ipress, periodo=mes, anio=anio).count()

        if sin_reclamo == 0:
            entidad_con_numero_reclamos = Entidad.objects.filter(pk=ipress).annotate(
                num_reclamos=Count(Case(When(reclamos__fecha_reclamo__year=anio,
                                             reclamos__fecha_reclamo__month=mes, then=1),
                                        output_field=IntegerField())))

            if entidad_con_numero_reclamos[0].num_reclamos == 0:
                list_final.append(["SIN REPORTAR"])
            else:
                list_final.append(["REPORTADO CON RECLAMO"])
        else:
            list_final.append(["REPORTADO SIN RECLAMO"])

    return {"list_ipress": list_ipress_return, "list_final": list_final,
            "list_final_total": list_final_total_return,
            "list_final_total_porcentaje": list_final_total_porcentaje_return,
            "count_mayor": count_mayor_return}


def reporte_sin_reclamo(request):
    update_menu(request)
    template = loader.get_template('reportes/ris_sin_reclamo.html')

    context = {
        'title': 'N° DE EESS POR RIS SIN RECLAMOS SEGÚN CATEGORIA',
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
def reporte_sin_reclamo_excel(request):
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
            worksheet.set_column(1, 61, 25, format1)
            worksheet.set_column(0, 0, 45, format1)
            worksheet.set_row(0, 50)

            format = workbook.add_format({})
            # format.set_rotation(90)

            for i in range(0, len(header_list)):
                writer.sheets['Página1'].write(0, i, header_list[i], format)

            writer.save()
            filename = 'Sin_de_reclamos-' + str(mes) + '_' + str(anio)
            content_type = 'application/vnd.ms-excel'
            response = HttpResponse(b.getvalue(), content_type=content_type)
            response['Content-Disposition'] = 'attachment; filename="' + filename + '.xlsx"'
            return response
    else:
        return HttpResponse("Operación no soportada")
