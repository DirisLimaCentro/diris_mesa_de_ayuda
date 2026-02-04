from django.contrib import messages
from django.shortcuts import redirect
from django.urls import reverse
from django.views.decorators.http import require_http_methods

from apps.reclamo.models.entidad_reclamo import EntidadReclamo, MESES
from apps.reclamo.models.sin_reclamo import SinReclamo


@require_http_methods(["POST", ])
def guardar_sin_reclamo(request):

    id = request.session['entidad_id']
    # reclamo_anio = request.session['reclamo_anio']
    # reclamo_mes = request.session['reclamo_mes']
    archivo = request.FILES['archivo']
    reclamo_anio = request.POST.get('anio', None)
    reclamo_mes = request.POST.get('mes', None)

    entidad_reclamo_list = EntidadReclamo.objects.filter(entidad_id=id, fecha_reclamo__year=reclamo_anio,
                                                         fecha_reclamo__month=reclamo_mes)

    if len(entidad_reclamo_list) > 0:
        msg = "ERROR, no se puede agregar SIN RECLAMO en un periodo con reclamos registrados " + " [ año: " + reclamo_anio + " - mes: " + \
              MESES[int(reclamo_mes) - 1][1] + " ]"
        messages.add_message(request, messages.ERROR, msg, extra_tags="danger")
        return redirect(
            reverse('reclamo:entidad-reclamo-list') + "?anio=" + str(reclamo_anio) + "&mes=" + str(reclamo_mes))

    obj, created = SinReclamo.objects.update_or_create(entidad_id=id, anio=reclamo_anio, periodo=reclamo_mes,
                                                       defaults={'archivo': archivo})
    msg = "Archivo guardado correctamente"
    messages.add_message(request, messages.SUCCESS, msg)
    return redirect(reverse('reclamo:entidad-reclamo-list') + "?anio=" + str(reclamo_anio) + "&mes=" + str(reclamo_mes))
