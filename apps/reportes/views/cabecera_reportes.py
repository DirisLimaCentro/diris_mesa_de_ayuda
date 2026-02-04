from apps.util.get_type_admin import get_type_admin
from setup.models.entidad import Entidad, RIS


class CabeceraReporte():
    count_mayor = 0
    tipo_admin = ''
    list_ris = []
    list_ipress = []

    def definir_cabecera(self, context, request):

        self.tipo_admin = get_type_admin(request)
        ris_post = int(request.POST.get('ris', '0'))

        if self.tipo_admin == "UGIPRESS":
            self.list_ris = RIS
            if ris_post > 0:
                self.list_ipress = Entidad.objects.filter(ris=ris_post)
        if self.tipo_admin == "RIS":
            self.list_ris = [item for item in RIS if item[0] == request.user.ris]
            if ris_post > 0:
                self.list_ipress = Entidad.objects.filter(ris=ris_post)
            else:
                self.list_ipress = Entidad.objects.filter(ris=request.user.ris)

        if self.tipo_admin == "IPRESS":
            self.list_ipress = Entidad.objects.filter(pk=request.user.entidad.id)
            self.list_ris = [item for item in RIS if item[0] == request.user.entidad.ris]

        context['list_ris'] = self.list_ris
        context['list_ipress'] = self.list_ipress
