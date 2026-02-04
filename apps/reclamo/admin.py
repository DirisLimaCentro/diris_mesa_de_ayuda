from django.contrib import admin

from apps.reclamo.models.clasificacion_causa import ClasificacionCausa
from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.reclamo.models.medida_adoptada import MedidaAdoptada
from apps.reclamo.models.sin_reclamo import SinReclamo

# admin.site.register(EntidadReclamo)
admin.site.register(MedidaAdoptada)
admin.site.register(ClasificacionCausa)


# admin.site.register(SinReclamo)

@admin.register(SinReclamo)
class SinReclamoAdmin(admin.ModelAdmin):
    search_fields = ('entidad__nombre',)
    list_filter = ('entidad',)
    list_display = ('entidad', 'anio', 'periodo', 'created_at', 'created_ip', 'created_by')


@admin.register(EntidadReclamo)
class EntidadReclamoAdmin(admin.ModelAdmin):
    search_fields = ('entidad__nombre', 'numero_documento_usuario')
    list_filter = ('entidad',)
    list_display = ('fecha_reclamo', 'entidad',)
