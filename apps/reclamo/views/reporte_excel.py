import datetime
from io import BytesIO

import pandas as pd
from django.db.models import Case, When, BooleanField, Q
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt

from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo
from apps.util.anios import ANIOS
from apps.util.get_type_admin import get_type_admin
from apps.util.update_menu import update_menu
from setup.models.entidad import RIS, Entidad


def format_text_vertical(texto):
    new_string = ""
    temp = ""
    temp_final = ""
    for i in texto.split(" "):
        temp = temp + (" " if temp else "") + i
        if len(temp) >= 10:
            new_string += "\n" + temp
            temp = ""
            temp_final = ""
        else:
            temp_final = temp
    if temp_final:
        new_string += "\n" + temp_final
    return new_string


@csrf_exempt
def generate_excel_get_form(request):
    update_menu(request)

    list_ipress = []
    list_ris = RIS

    tipo_admin = get_type_admin(request)

    if tipo_admin == "UGIPRESS":
        pass
    if tipo_admin == "RIS":
        list_ris = [item for item in RIS if item[0] == request.user.ris]
        list_ipress = Entidad.objects.filter(ris=request.user.ris)

    if tipo_admin == "IPRESS":
        list_ipress = Entidad.objects.filter(pk=request.user.entidad.id)
        list_ris = [item for item in RIS if item[0] == request.user.entidad.ris]

    context = {
        'title': 'GENERAR EXCEL',
        'anios': ANIOS,
        'meses': MESES,
        'list_ris': list_ris,
        'list_ipress': list_ipress,
        'tipo_admin': tipo_admin
    }

    if request.method == 'GET':
        if request.path.split("/")[-1] == "pendientes":
            template = loader.get_template('reclamo/reporte_excel_pendientes.html')
        else:
            template = loader.get_template('reclamo/reporte_excel.html')
    elif request.method == 'POST':
        template = loader.get_template('reclamo/reporte_excel_detalle.html')
        tipo = request.POST.get('tipo', 'todo')
        request.session['tipo'] = tipo

        try:
            anio = int(request.POST.get('anio', '2021'))
        except ValueError:
            anio = 2021

        fecha_inicio = request.POST.get('fecha_inicio', None)
        fecha_fin = request.POST.get('fecha_fin', None)

        ris = int(request.POST.get('ris', '0'))
        ipress = int(request.POST.get('ipress', '0'))
        user_id = request.user.id
        context['anio'] = anio
        context['fecha_inicio'] = fecha_inicio
        context['fecha_fin'] = fecha_fin
        context['ris'] = ris
        context['ipress'] = ipress

        filters = {}
        # if mes and tipo == "todo":
        #     filters['fecha_reclamo__month'] = mes

        # if anio:
        #     filters['fecha_reclamo__year'] = anio

        filters['id_user'] = user_id
        

 
        if fecha_inicio and fecha_fin:
            filters['fecha_reclamo__range'] = [fecha_inicio, fecha_fin]
        elif anio:
            filters['fecha_reclamo__year'] = anio

        if tipo == "pendiente":
            object_list = EntidadReclamo.objects.annotate(
                estado_pendiente=Case(
                    When(Q(competencia_reclamo=1) and Q(estado_reclamo=1) | Q(estado_reclamo=2), then=True),
                    When(Q(competencia_reclamo=2) and Q(estado_reclamo=3), then=True),
                    When(fecha_notificacion__isnull=True, then=True),
                    output_field=BooleanField())
            ).filter(estado_pendiente=True, **filters)

        else:
            object_list = EntidadReclamo.objects.filter(**filters)

        context['object_list'] = object_list

    return HttpResponse(template.render(context, request))


@csrf_exempt
def generate_excel_reclamos(request):
    if request.method == 'GET':
        tipo = request.session['tipo']

        LIST_INPUTS_HIDEN = ['id', 'created_at', 'updated_at', 'created_ip', 'updated_ip', 'fecha_notificacion',
                             'fecha_resultado_reclamo', 'fecha_reclamo', 'es_mismo_usuario_afectado', 'entidad',
                             'expediente']

        anio = int(request.GET.get('anio', '2021'))
        # mes = int(request.GET.get('mes', '1'))
        #ris = int(request.GET.get('ris', '0'))
        #ipress = int(request.GET.get('ipress', '0'))
         

        fecha_inicio = request.GET.get('fecha_inicio', None)
        fecha_fin = request.GET.get('fecha_fin', None)

        columnas_excel = {}
        columnas_title_excel = []

        # Armando filtros para la lista de objectos (Reclamos)
        filters = {}
        # if mes and tipo == "todo":
        #     filters['fecha_reclamo__month'] = mes
        # if anio:
        #     filters['fecha_reclamo__year'] = anio
        #if ris > 0:
          #  filters['entidad__ris'] = ris
        #if ipress > 0:
         #   filters['entidad_id'] = ipress
        filters['user_id'] = request.user.id

        if fecha_inicio != 'None' and fecha_fin != 'None':
            filters['fecha_reclamo__range'] = [fecha_inicio, fecha_fin]
        elif anio:
            filters['fecha_reclamo__year'] = anio

        # Generando la Lista de Reclamos
        if tipo == "pendiente":
            object_list = EntidadReclamo.objects.annotate(
                estado_pendiente=Case(
                    When(Q(competencia_reclamo=1) and Q(estado_reclamo=1) | Q(estado_reclamo=2), then=True),
                    When(Q(competencia_reclamo=2) and Q(estado_reclamo=3), then=True),
                    When(fecha_notificacion__isnull=True, then=True),
                    output_field=BooleanField())
            ).filter(estado_pendiente=True, **filters)

        if tipo == "todo":
            object_list = EntidadReclamo.objects.filter(**filters)

        # Obteniendo nombres de atributos de la clase Reclamos
        all_fields_reclamo = EntidadReclamo._meta.get_fields()
        columnas_title_excel.append('#')

        columnas_excel['#'] = [i + 1 for i in range(0, len(object_list))]

        columnas_title_excel.append('Fecha de registro')
        columnas_excel['Fecha de registro del reclamo'] = [
            (i['created_at'] - datetime.timedelta(hours=5)).strftime("%d/%m/%Y, %H:%M:%S") for i in
            object_list.values('created_at')]
        
        # Columna de Código de Ticket en la posición D (índice 3)
        columnas_title_excel.append('Código de Ticket')
        columnas_excel['Código de Ticket'] = [i['codigo_ticket'] if i['codigo_ticket'] else '' for i in object_list.values('codigo_ticket')]




        for i in all_fields_reclamo:
            try:
                columna_verbose_name = str(i.verbose_name)
                columna_name = str(i.name)

                # Personalizar valores de las columnas

                if columna_name == 'fecha_reclamo':
                    columnas_title_excel.append('Fecha de presentacion del reclamo')
                    columnas_excel['Fecha de presentacion del reclamo'] = [
                        i['fecha_reclamo'].strftime('%d/%m/%Y') if i['fecha_reclamo'] else "" for i
                        in object_list.values('fecha_reclamo')]
                if columna_name == 'fecha_notificacion':
                    columnas_title_excel.append('Fecha de notificacion del resultado al usuario o tercero legitimado')
                    columnas_excel['Fecha de notificacion del resultado al usuario o tercero legitimado'] = [
                        i['fecha_notificacion'].strftime('%d/%m/%Y') if i['fecha_notificacion'] else "" for i in
                        object_list.values('fecha_notificacion')]

                if columna_name == 'fecha_resultado_reclamo':
                    columnas_title_excel.append('Fecha de resultado del reclamo')
                    columnas_excel['Fecha de resultado del reclamo'] = [
                        i['fecha_resultado_reclamo'].strftime('%d/%m/%Y')
                        if i['fecha_resultado_reclamo'] else ""
                        for i in
                        object_list.values('fecha_resultado_reclamo')]

                if columna_name == 'entidad':
                    columnas_title_excel.append('Tipo de administrado declarante')
                    columnas_excel['Tipo de administrado declarante'] = ['1' for i in
                                                                         object_list.values('entidad__codigo')]
                    columnas_title_excel.append('Codigo del administrado declarante')
                    columnas_excel['Codigo del administrado declarante'] = [i['entidad__codigo'].strip().zfill(8) for i
                                                                            in
                                                                            object_list.values('entidad__codigo')]
                    columnas_title_excel.append('Codigo de la UGIPRESS')
                    columnas_excel['Codigo de la UGIPRESS'] = ['10000122' for i in
                                                               object_list.values('entidad__codigo')]

                if columna_name == 'expediente':
                    columnas_title_excel.append('Expediente')
                    columnas_excel['Expediente'] = [i['expediente'] if i['expediente'] else "—" for i in
                                                    object_list.values('expediente')]

                if columna_name not in LIST_INPUTS_HIDEN:
                    # Agregar los valores (columnas por nombre de atributos) - General
                    columnas_title_excel.append(columna_verbose_name)
                    columnas_excel[columna_verbose_name] = [i[columna_name] for i in
                                                            object_list.values(columna_name)]

            except AttributeError as e:
                print(e)

        # DATOS DE LAS MEDIDAS ADOPTADAS
 

        pd.set_option('display.max_colwidth', 0)
        df = pd.DataFrame(columnas_excel, columns=columnas_title_excel)
        # df.index = df.index + 1

        with BytesIO() as b:
            # Use the StringIO object as the filehandle.
            writer = pd.ExcelWriter(b, engine='xlsxwriter')

            #  Obteniedo cabecera
            header_list = list(df.columns.values)
            df.to_excel(writer, sheet_name='Página1', index=False)

            workbook = writer.book
            worksheet = writer.sheets['Página1']
            format1 = workbook.add_format({'num_format': ''})
            worksheet.set_column(1, 61, 20, format1)
            worksheet.set_row(0, 130)

            # 1111111111111111111111111111

            format = workbook.add_format({})
            format.set_rotation(90)

            for i in range(0, len(header_list)):
                writer.sheets['Página1'].write(0, i, format_text_vertical(header_list[i]), format)

            # 22222222222222222222222222222
            # final de styles

            writer.close()
            filename = 'tickets_gestionados'
            content_type = 'application/vnd.ms-excel'
            response = HttpResponse(b.getvalue(), content_type=content_type)
            response['Content-Disposition'] = 'attachment; filename="' + filename + '.xlsx"'
            return response


    else:
        return HttpResponse("Operación no soportada")
