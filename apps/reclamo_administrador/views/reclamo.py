from django.utils.decorators import method_decorator
from django.views.generic import DetailView

from apps.reclamo.forms.entidad_reclamo import EntidadReclamoListFilter, EntidadReclamoForm
from apps.reclamo.forms.medida_adoptada import MedidaAdoptadaForm
from apps.reclamo.models.entidad_reclamo import EntidadReclamo, MESES
from apps.reclamo.views.entidad_reclamo import paso_uno, paso_dos, paso_tres, paso_cuatro, paso_cinco, paso_seis
from apps.util.anios import ANIOS
from apps.util.generic_filters.views import FilteredListView
from apps.util.valid_user_access_views import valid_access_view, valid_entidad
from setup.models.entidad import Entidad


class AdministradorEntidadReclamoList(FilteredListView):
    model = EntidadReclamo
    paginate_by = 20
    form_class = EntidadReclamoListFilter
    filter_fields = ['clasificacion_reclamo_1__categoria']
    search_fields = ['codigo_administrado', 'razon_social_usuario', 'nombres_usuario', 'apellido_paterno_usuario',
                     'apellido_materno_usuario']
    default_order = '-id'

    # template_name = "reclamo_administrador/reclamo_list.html"
    def get_template_names(self):

        entidad_id = self.request.GET.get("entidad_id", None)

        if entidad_id:
            return ['reclamo_administrador/reclamo_list.html']
        else:
            return ['reclamo_administrador/reclamo_list_ris.html']

    @method_decorator(valid_access_view(valid_entidad, login_url='/validate'))
    def dispatch(self, *args, **kwargs):
        return super(AdministradorEntidadReclamoList, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):

        entidad_id = self.request.GET.get("entidad_id", None)

        if entidad_id:
            entidad = Entidad.objects.get(pk=entidad_id)
            title = "Todos los reclamos de la entidad: " + entidad.nombre
        else:
            title = "Lista de reclamos"

        # entidad_id = self.request.user.ris
        # entidad_id = self.kwargs['entidad_id']
        # entidad = Entidad.objects.get(pk=entidad_id)
        # title = "Todos los reclamos de la entidad: " + entidad.nombre

        try:
            anio = self.request.session['entidad_anio']
            mes = self.request.session['entidad_mes']
            mes_nombre = MESES[mes - 1][1]
        except KeyError:
            anio = None
            mes = None
            mes_nombre = ""

        ipress = int(self.request.GET.get("ipress", 0))
        anio_ = self.request.GET.get("anio", None)
        mes_ = self.request.GET.get("mes", None)

        if anio_ and mes_:
            anio = int(anio_)
            mes = int(mes_)

        list_ipress = Entidad.objects.filter(ris=self.request.user.ris)

        return dict(
            super(AdministradorEntidadReclamoList, self).get_context_data(**kwargs), title=title, anio=anio, mes=mes,
            mes_nombre=mes_nombre, list_ipress=list_ipress, anios=ANIOS, meses=MESES, ipress=ipress)

    def get_queryset(self):
        queryset = super().get_queryset()

        # ------------------->>>> RIS
        # ris_id = self.request.session['ris_id']
        ipress = int(self.request.GET.get("ipress", 0))
        anio_ = self.request.GET.get("anio", None)
        mes_ = self.request.GET.get("mes", None)

        if anio_ and mes_:
            queryset = queryset.filter(fecha_reclamo__year=anio_, fecha_reclamo__month=mes_)

        if ipress > 0:
            queryset = queryset.filter(entidad_id=ipress)

        entidad_id = self.request.GET.get("entidad_id", None)

        try:
            anio = self.request.session['entidad_anio']
            mes = self.request.session['entidad_mes']
        except KeyError:
            anio = None
            mes = None

        if anio and mes:
            queryset = queryset.filter(fecha_reclamo__year=anio, fecha_reclamo__month=mes)

        if entidad_id:
            queryset = queryset.filter(entidad_id=entidad_id)

        if self.request.user.ris > 0:
            queryset = queryset.filter(entidad__ris=self.request.user.ris)

        return queryset.order_by('-id')


class ReclamoDetailView(DetailView):
    model = EntidadReclamo
    template_name = "reclamo_administrador/reclamo_detail.html"

    def get_template_names(self):

        entidad_id = self.request.GET.get("entidad_id", None)

        if entidad_id:
            return ['reclamo_administrador/reclamo_detail.html']
        else:
            return ['reclamo_administrador/reclamo_detail_ris.html']

    def get_context_data(self, **kwargs):
        reclamo_id = self.kwargs['pk']
        reclamo = EntidadReclamo.objects.get(pk=reclamo_id)
        title = "Reclamo de la entidad: " + reclamo.entidad.nombre
        reclamo_form = EntidadReclamoForm(instance=reclamo, entidad_id=str(reclamo.entidad.id))

        inputs_show = paso_uno + paso_dos + paso_tres + paso_cuatro + paso_cinco + paso_seis

        inputs_show_medida_adoptada = ['codigo', 'descripcion', 'naturaleza', 'procesos',
                                       'fecha_inicio', 'fecha_culminacion']

        list_medidas_adoptadas_form = []

        for i in reclamo.medidas_adoptadas.all():
            entidad_reclamo = EntidadReclamo.objects.filter(pk=i.entidad_reclamo.id).values_list('id',
                                                                                                 'codigo_registro')[
                              0:1]
            form = MedidaAdoptadaForm(instance=i, entidad_reclamo=entidad_reclamo)
            list_medidas_adoptadas_form.append(form)

        list_zip = zip(list_medidas_adoptadas_form, reclamo.medidas_adoptadas.all())

        referer = ""
        if self.request.META.get('HTTP_REFERER'):
            if len(self.request.META.get('HTTP_REFERER').split("?")) > 1:
                referer = "?" + self.request.META.get('HTTP_REFERER').split("?")[-1]

        if len(self.request.get_full_path().split("?")) > 1:
            referer = "?" + self.request.get_full_path().split("?")[-1]

        return dict(super(ReclamoDetailView, self).get_context_data(**kwargs), title=title, reclamo_form=reclamo_form,
                    inputs_show=inputs_show, list_medidas_adoptadas_form=list_medidas_adoptadas_form,
                    inputs_show_medida_adoptada=inputs_show_medida_adoptada, list_zip=list_zip, referer=referer)

    # TODO - Actualizar estado del reclamo !!! Pendiente.
