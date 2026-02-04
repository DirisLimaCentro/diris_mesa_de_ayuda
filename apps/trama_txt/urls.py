from django.urls import path

from apps.trama_txt.views.medidas_adoptadas import reporte_trama_medidas_adoptadas
from apps.trama_txt.views.medidas_diris import reporte_trama_medidas_adoptadas_diris
from apps.trama_txt.views.reclamos import reporte_trama_reclamos
from apps.trama_txt.views.reclamos_diris import reporte_trama_reclamos_diris

app_name = 'trama-txt'

urlpatterns = [
    path('reclamos', reporte_trama_reclamos, name='reclamos'),
    path('medidas-adoptadas', reporte_trama_medidas_adoptadas, name='medidas-adoptadas'),
    path('reclamos-diris', reporte_trama_reclamos_diris, name='reclamos-diris'),
    path('medidas-diris', reporte_trama_medidas_adoptadas_diris, name='medidas-diris')
]
