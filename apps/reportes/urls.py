from django.urls import path

from apps.reportes.views.reclamos_por_mes import reporte_reclamos_por_mes
from apps.reportes.views.ris_anexos import reporte_ris_anexos
from apps.reportes.views.ris_atendidos_pendientes import reporte_atendidos_pendientes
from apps.reportes.views.ris_autorizacion_correo import reporte_autorizacion_correo
from apps.reportes.views.ris_clasificacion_reclamo import reporte_clasificacion_reclamo, \
    reporte_clasificacion_reclamo_excel
from apps.reportes.views.ris_estado_reclamo import reporte_estado_reclamo
from apps.reportes.views.ris_etapa_reclamo import reporte_etapa_reclamo
from apps.reportes.views.ris_medio_recepcion import reporte_medio_recepcion
from apps.reportes.views.ris_motivo_conclusion_anticipada import reporte_motivo_conclusion_anticipada, \
    reporte_motivo_conclusion_anticipada_excel
from apps.reportes.views.ris_resultado_reclamo import reporte_resultado_reclamo
from apps.reportes.views.ris_servicio_origen import reporte_servicio_origen
from apps.reportes.views.ris_sin_reclamo import reporte_sin_reclamo, reporte_sin_reclamo_excel
from apps.reportes.views.ris_tipo_reclamo import reporte_tipo_reclamo, reporte_tipo_reclamo_excel
from apps.reportes.views.reportes_prueba import reporte_prueba


app_name = 'reportes'

urlpatterns = [
    path('ris-anexos', reporte_ris_anexos, name='ris-anexos'),
    # path('ris-sin-reclamo', reporte_ris_sin_relclamo, name='ris-sin-reclamo'),
    path('reclamos-por-mes', reporte_reclamos_por_mes, name='reclamos-por-mes'),
    path('ris-sin-reclamo', reporte_sin_reclamo, name='ris-sin-reclamo'),
    path('ris-sin-reclamo-excel', reporte_sin_reclamo_excel, name='ris-sin-reclamo-excel'),
    path('ris-resultado', reporte_resultado_reclamo, name='ris-resultado'),
    path('ris-motivo-conclusion-anticipada', reporte_motivo_conclusion_anticipada,
         name='ris-motivo-conclusion-anticipada'),
    path('ris-atendidos-pendientes', reporte_atendidos_pendientes, name='ris-atendidos-pendientes'),
    path('ris-tipo-reclamo', reporte_tipo_reclamo, name='ris-tipo-reclamo'),
    path('ris-servicio-origen', reporte_servicio_origen, name='ris-servicio-origen'),
    path('ris-etapa-reclamo', reporte_etapa_reclamo, name='ris-etapa-reclamo'),
    path('ris-medio-recepcion', reporte_medio_recepcion, name='ris-medio-recepcion'),
    path('ris-autorizacion-correo', reporte_autorizacion_correo, name='ris-autorizacion-correo'),
    path('ris-estado-reclamo', reporte_estado_reclamo, name='ris-estado-reclamo'),
    path('ris-clasificacion-reclamo', reporte_clasificacion_reclamo, name='ris-clasificacion-reclamo'),
    path('ris-clasificacion-reclamo-excel', reporte_clasificacion_reclamo_excel,
         name='ris-clasificacion-reclamo-excel'),
    path('ris-estado-reclamo-excel', reporte_tipo_reclamo_excel, name='ris-estado-reclamo-excel'),
    path('ris-motivo-conclusion-anticipada-excel', reporte_motivo_conclusion_anticipada_excel,
         name='ris-motivo-conclusion-anticipada-excel'),
             
             
             
             
    path('ver-reportes', reporte_prueba, name='ver-reportes'),


]
