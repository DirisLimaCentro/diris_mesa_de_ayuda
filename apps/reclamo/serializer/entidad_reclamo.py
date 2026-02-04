from rest_framework import serializers

from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.util.view_custom import CustomSerializer


class EntidadReclamoSerializer(CustomSerializer):
    id = serializers.IntegerField(read_only=True)

    class Meta:
        model = EntidadReclamo
        fields = "__all__"
