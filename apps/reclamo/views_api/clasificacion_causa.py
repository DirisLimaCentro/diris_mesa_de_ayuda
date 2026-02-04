from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets

from apps.reclamo.models.clasificacion_causa import ClasificacionCausa
from apps.reclamo.serializer.clasificacion_causa import ClasificacionCausaSerializer


class ClasificacionCausaRestViewSet(viewsets.ModelViewSet):
    queryset = ClasificacionCausa.objects.all()
    serializer_class = ClasificacionCausaSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['codigo', ]
