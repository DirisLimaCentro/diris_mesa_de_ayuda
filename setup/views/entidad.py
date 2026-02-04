import datetime

from django.contrib import messages
from django.db.models import Count, Q
from django.shortcuts import render
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views.generic import CreateView, UpdateView, ListView

from apps.reclamo.models.entidad_reclamo import MESES
from apps.util.anios import ANIOS
from apps.util.update_menu import update_menu
from apps.util.valid_user_access_views import valid_access_view, permission_and_entidad, \
    valid_entidad, valid_entidad_add
from setup.forms.entidad import EntidadForm
from setup.models.entidad import Entidad


class EntidadList(ListView):
    model = Entidad
    paginate_by = 30

    # form_class = EntidadListFilter
    # filter_fields = []
    # search_fields = ['nombre']
    # default_order = '-numero_reclamos'

    @method_decorator(valid_access_view(permission_and_entidad, login_url='/validate'))
    def dispatch(self, *args, **kwargs):
        return super(EntidadList, self).dispatch(*args, **kwargs)

    def get_queryset(self):
        msg = "Lista actualizada."
        messages.add_message(self.request, messages.SUCCESS, msg)

        queryset = super().get_queryset()

        if len(self.request.user.groups.filter(name="Administrador IPRESS")) > 0:
            queryset = queryset.filter(entidad_id=self.request.user.entidad.id)

        if len(self.request.user.groups.filter(name="Administrador RIS")) > 0:
            queryset = queryset.filter(ris=self.request.user.ris)

        anio = int(self.request.GET.get('anio', datetime.datetime.now().year))
        mes = int(self.request.GET.get('mes', datetime.datetime.now().month))
        query = self.request.GET.get('query', "")

        self.request.session['entidad_anio'] = anio
        self.request.session['entidad_mes'] = mes

        if query:
            queryset = queryset.filter(nombre__icontains=query)

        # return queryset.annotate(
        #     reclamos_count=Count('reclamos',
        #                          filter=Q(reclamos__fecha_reclamo__year=anio) & Q(reclamos__fecha_reclamo__month=mes),
        #                          distinct=True)
        # ).annotate(
        #     medidas_adoptadas_count=Count(
        #         'reclamos',
        #         filter=Q(reclamos__medidas_adoptadas__fecha_inicio__year=anio) &
        #                Q(reclamos__medidas_adoptadas__fecha_inicio__month=mes), distinct=True)
        # ).annotate(
        #     q q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   q   s_count=Count(
        #         'reclamos',
        #         filter=Q(reclamos__fecha_reclamo__year=anio) & Q(reclamos__fecha_reclamo__month=mes) &
        #                ~Q(reclamos__expediente=''), distinct=True))
        #
        #

        return queryset.annotate(
            reclamos_count=Count('reclamos',
                                 filter=Q(reclamos__fecha_reclamo__year=anio) & Q(reclamos__fecha_reclamo__month=mes),
                                 distinct=True)
        ).annotate(
            medidas_adoptadas_count=Count(
                'reclamos__medidas_adoptadas',
                filter=Q(reclamos__fecha_reclamo__year=anio) &
                       Q(reclamos__fecha_reclamo__month=mes), distinct=True)
        ).annotate(
            expedientes_count=Count(
                'reclamos',
                filter=Q(reclamos__fecha_reclamo__year=anio) & Q(reclamos__fecha_reclamo__month=mes) &
                       ~Q(reclamos__expediente=''), distinct=True)
        ).annotate(
            reclamos_virtuales_count=Count(
                'reclamos',
                filter=Q(reclamos__fecha_reclamo__year=anio) & Q(reclamos__fecha_reclamo__month=mes)
                       & Q(reclamos__medio_presentacion=1) & ~Q(reclamos__servicio_hecho_reclamo=77), distinct=True)
        ).annotate(
            reclamos_virtuales_proceso_count=Count(
                'reclamos',
                filter=Q(reclamos__fecha_reclamo__year=anio) & Q(reclamos__fecha_reclamo__month=mes)
                       & Q(reclamos__medio_presentacion=1) & Q(reclamos__servicio_hecho_reclamo=77), distinct=True))

    def get_context_data(self, **kwargs):
        title = "Todas las IPRESS"
        update_menu(self.request)

        anio = int(self.request.GET.get('anio', datetime.datetime.now().year))
        mes = int(self.request.GET.get('mes', datetime.datetime.now().month))
        query = self.request.GET.get('query', "")

        return dict(
            super(EntidadList, self).get_context_data(**kwargs), title=title, anios=ANIOS, meses=MESES, anio=anio,
            mes=mes, query=query)


class EntidadCreate(CreateView):
    model = Entidad
    form_class = EntidadForm

    @method_decorator(valid_access_view(valid_entidad_add, login_url='/validate'))
    def dispatch(self, *args, **kwargs):
        return super(EntidadCreate, self).dispatch(*args, **kwargs)

    def form_valid(self, form):
        msg = "IPRESS agregada correctamente."
        messages.add_message(self.request, messages.SUCCESS, msg)
        return super().form_valid(form)

    def get_success_url(self):
        return reverse('entidad:list', kwargs={}) + "?anio=" + \
               str(self.request.session['entidad_anio']) + "&mes=" + str(self.request.session['entidad_mes'])


class EntidadUpdate(UpdateView):
    model = Entidad
    form_class = EntidadForm

    # success_url = reverse_lazy('entidad:list')

    @method_decorator(valid_access_view(valid_entidad, login_url='/validate'))
    def dispatch(self, *args, **kwargs):
        return super(EntidadUpdate, self).dispatch(*args, **kwargs)

    def form_valid(self, form):
        msg = "IPRESS editada correctamente."
        messages.add_message(self.request, messages.SUCCESS, msg)
        return super().form_valid(form)

    def get_success_url(self):
        return reverse('entidad:list', kwargs={}) + "?anio=" + \
               str(self.request.session['entidad_anio']) + "&mes=" + str(self.request.session['entidad_mes'])


def get_select_list_ipress(request):
    list = []
    if request.GET.get('ris_id'):
        list = Entidad.objects.filter(ris=int(request.GET.get('ris_id')))

    return render(request, 'setup/ipress_select_list.html', {'objects_list': list})
