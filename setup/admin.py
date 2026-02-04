from django.contrib import admin
from django.contrib.auth.hashers import make_password

from setup.models.entidad import Entidad
from setup.models.menu import Menu, GroupMenu
from setup.models.periodo import Periodo
from setup.models.rubro_calificacion import RubroCalificacion
from setup.models.usuario import Usuario


class UserModelAdmin(admin.ModelAdmin):
    """
        User for overriding the normal user admin panel, and add the extra fields added to the user
        """

    def save_model(self, request, obj, form, change):
        obj.password = make_password(obj.password)
        super().save_model(request, obj, form, change)


admin.site.register(Periodo)
# admin.site.register(Usuario)
admin.site.register(Menu)
admin.site.register(GroupMenu)
# admin.site.register(Entidad)
admin.site.register(RubroCalificacion)


@admin.register(Entidad)
class EntidadAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'codigo', 'categoria', 'numero_reclamos', 'numero_medidas_adoptados']
    search_fields = ['nombre']
