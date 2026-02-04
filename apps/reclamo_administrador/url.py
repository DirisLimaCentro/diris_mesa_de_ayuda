from django.contrib.auth.decorators import login_required
from django.urls import path

from apps.reclamo_administrador.views.evaluacion_anexo1 import EvaluacionAnexo1List, EvaluacionAnexo1Create, \
    EvaluacionAnexo1Update
from apps.reclamo_administrador.views.reclamo import AdministradorEntidadReclamoList, ReclamoDetailView

app_name = 'administrador'

urlpatterns = [
    path('reclamo-list', login_required(AdministradorEntidadReclamoList.as_view()), name='reclamo-list'),
    path('reclamo-detail/<pk>', login_required(ReclamoDetailView.as_view()), name='reclamo-detail'),

    path('evaluacion-list/<entidad_id>', login_required(EvaluacionAnexo1List.as_view()), name='evaluacion-list'),
    path('evaluacion-new/<entidad_id>', login_required(EvaluacionAnexo1Create.as_view()), name='evaluacion-new'),
    path('evaluacion-edit/<pk>/<entidad_id>', login_required(EvaluacionAnexo1Update.as_view()), name='evaluacion-edit'),
]
