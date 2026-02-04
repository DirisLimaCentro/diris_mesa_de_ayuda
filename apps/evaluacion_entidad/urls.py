from django.contrib.auth.decorators import login_required, user_passes_test
from django.urls import path

from apps.evaluacion_entidad.views.evalucion_anexo1 import EvaluacionEntidadAnexo1List, EvaluacionEntidadAnexo1Create, \
    EvaluacionEntidadAnexo1Update, EvaluacionEntidadAnexo1Delete

app_name = 'evaluacion-entidad'

urlpatterns = [
    path('list', login_required(EvaluacionEntidadAnexo1List.as_view()), name='list'),
    path('new', login_required(EvaluacionEntidadAnexo1Create.as_view()), name='new'),
    path('edit/<pk>', login_required(EvaluacionEntidadAnexo1Update.as_view()), name='edit'),
    path('delete/<pk>', login_required(EvaluacionEntidadAnexo1Delete.as_view()), name='delete'),
]
