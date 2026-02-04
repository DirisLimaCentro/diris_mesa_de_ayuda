from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets

from setup.models.entidad import Entidad
from setup.serializer.entidad import EntidadSerializer


class EntidadRestViewSet(viewsets.ModelViewSet):
    queryset = Entidad.objects.all()
    serializer_class = EntidadSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['codigo', ]
