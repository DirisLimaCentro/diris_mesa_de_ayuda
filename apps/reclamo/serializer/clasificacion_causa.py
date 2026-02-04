from rest_framework import serializers

from apps.reclamo.models.clasificacion_causa import ClasificacionCausa
from apps.util.view_custom import CustomSerializer


class ClasificacionCausaSerializer(CustomSerializer):
    id = serializers.IntegerField(read_only=True)

    class Meta:
        model = ClasificacionCausa
        fields = "__all__"
