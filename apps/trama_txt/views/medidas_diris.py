from django.http import HttpResponse
from django.template import loader

from apps.reclamo.models.entidad_reclamo import MESES, EntidadReclamo
from apps.reclamo.models.medida_adoptada import MedidaAdoptada
from apps.util.anios import ANIOS
from apps.util.update_menu import update_menu

 
def safe_str(value):
    return str(value) if value is not None else ''

def reporte_trama_medidas_adoptadas_diris(request):
    update_menu(request)
    template = loader.get_template('trama_txt/medidas_diris.html')

    context = {
        'title': 'GENERAR TRAMA DE MEDIDAS ADOPTADAS',
        'anios': ANIOS,
        'meses': MESES
    }

    if request.method == 'GET':
        context['s'] = 'sd'
    elif request.method == 'POST':
        anio = request.POST.get('anio', '2020')
        mes = request.POST.get('mes', '1')
        context['anio'] = int(anio)
        context['mes'] = int(mes)

        filename = "10000122_" + "_" + anio + "_" + mes.zfill(2) + "_MEDIDAS.TXT"

        medidas_adoptadas_list = MedidaAdoptada.objects.filter(fecha_inicio__year=anio,
                                                               fecha_inicio__month=mes)

        content = ''

        for r in medidas_adoptadas_list:
            # Manejo de la entidad_reclamo
            try:
                entidad_reclamo = r.entidad_reclamo
            except EntidadReclamo.DoesNotExist:
                entidad_reclamo = None  # O maneja el error como prefieras

            # ENTIDAD QUE REPORTA EL RECLAMO A LA SUPRERINTENDENCIA
            c1 = safe_str(entidad_reclamo.medio_presentacion) if entidad_reclamo else ''
            c2 = safe_str(entidad_reclamo.codigo_registro).strip() if entidad_reclamo else ''
            c3 = safe_str(r.codigo).strip()
            c4 = safe_str(r.descripcion).strip()
            c5 = safe_str(r.naturaleza)
            c6 = safe_str(r.procesos)
            c7 = r.fecha_inicio.strftime('%Y%m%d') if r.fecha_inicio else ''
            c8 = r.fecha_culminacion.strftime('%Y%m%d') if r.fecha_culminacion else ''

            content += c1 + '|' + c2 + '|' + c3 + '|' + c4 + '|' + c5 + '|' + c6 + '|' + c7 + '|' + c8 + '\n'

        response = HttpResponse(content, content_type='text/plain')
        response['Content-Disposition'] = 'attachment; filename={0}'.format(filename)
        return response

    return HttpResponse(template.render(context, request))
