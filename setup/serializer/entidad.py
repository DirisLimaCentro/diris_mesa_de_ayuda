from rest_framework import serializers

from apps.util.view_custom import CustomSerializer
from setup.models.entidad import Entidad


class EntidadSerializer(CustomSerializer):
    id = serializers.IntegerField(read_only=True)

    class Meta:
        model = Entidad
        fields = "__all__"
