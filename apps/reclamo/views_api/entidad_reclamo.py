from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets

from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.reclamo.serializer.entidad_reclamo import EntidadReclamoSerializer


class EntidadReclamoRestViewSet(viewsets.ModelViewSet):
    queryset = EntidadReclamo.objects.all()
    serializer_class = EntidadReclamoSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['entidad', 'numero_documento_usuario']
