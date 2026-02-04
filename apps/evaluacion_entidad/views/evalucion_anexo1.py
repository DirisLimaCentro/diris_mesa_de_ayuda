from django.contrib import messages
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import CreateView, UpdateView, DeleteView

from apps.reclamo_administrador.forms.evaluacion_anexo1 import EvaluacionAnexo1ListFilter, EvaluacionAnexo1Form, \
    DetalleEvaluacionAnexo1Form
from apps.reclamo_administrador.models.evaluacion_anexo1 import EvaluacionAnexo1, DetalleEvaluacionAnexo1
from apps.util.generic_filters.views import FilteredListView
from apps.util.valid_user_access_views import valid_access_view, permission_and_entidad, \
    valid_ipress_entidad_add, valid_ipress_anexo1_edit
from setup.models.entidad import Entidad
from setup.models.rubro_calificacion import RubroCalificacion


class EvaluacionEntidadAnexo1List(FilteredListView):
    model = EvaluacionAnexo1
    paginate_by = 20
    form_class = EvaluacionAnexo1ListFilter
    filter_fields = []
    search_fields = ['periodo', 'anio']
    default_order = '-id'
    template_name = 'evaluacion_entidad/evaluacionanexo1_list.html'

    @method_decorator(valid_access_view(permission_and_entidad, login_url='/validate'))
    def dispatch(self, *args, **kwargs):
        return super(EvaluacionEntidadAnexo1List, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        entidad_id = self.request.session['entidad_id']
        title = "Evaluaciones"

        entidad = None

        if entidad_id:
            entidad = Entidad.objects.get(pk=entidad_id)
            title = "Todas las evaluaciones de la entidad: " + entidad.nombre

        return dict(
            super(EvaluacionEntidadAnexo1List, self).get_context_data(**kwargs), title=title, entidad=entidad)

    def get_queryset(self):
        queryset = super().get_queryset()

        entidad_id = self.request.session['entidad_id']

        if entidad_id:
            return queryset.filter(entidad_id=entidad_id).order_by('-id')
        else:
            return queryset.order_by('-id')


class EvaluacionEntidadAnexo1Create(CreateView):
    form_class = EvaluacionAnexo1Form
    model = EvaluacionAnexo1
    template_name = 'evaluacion_entidad/evaluacionanexo1_form.html'

    # success_url = reverse_lazy('reclamo:entidad-reclamo-list')

    @method_decorator(valid_access_view(valid_ipress_entidad_add, login_url='/validate'))
    def dispatch(self, *args, **kwargs):
        return super(EvaluacionEntidadAnexo1Create, self).dispatch(*args, **kwargs)

    def get_success_url(self):
        entidad_id = self.request.session['entidad_id']
        # return reverse_lazy('evaluacion-entidad:evaluacion-list', kwargs={'entidad_id': entidad_id})
        return reverse_lazy('evaluacion-entidad:list')

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(EvaluacionEntidadAnexo1Create, self).get_form_kwargs(*args, **kwargs)
        entidad_id = self.request.session['entidad_id']
        kwargs['entidad_id'] = entidad_id
        return kwargs

    def form_valid(self, form):

        msg = "Evaluación agregada correctamente"
        messages.add_message(self.request, messages.SUCCESS, msg)

        self.object = form.save()

        entidad_id = self.request.session['entidad_id']
        self.object.entidad_id = entidad_id

        detalles = RubroCalificacion.objects.all()
        for index, detalle in enumerate(detalles):
            updated_data = self.request.POST.copy()
            updated_data.update({str(index) + '-evaluacion': self.object.id})
            detalle_form = DetalleEvaluacionAnexo1Form(updated_data, self.request.POST, prefix=str(index))
            if detalle_form.is_valid():
                detalle_form.save()
            else:
                print("Error al guardar el detalle")

        return super().form_valid(form)

    def get_context_data(self, **kwargs):

        entidad_id = self.request.session['entidad_id']
        entidad = Entidad.objects.get(pk=entidad_id)
        detalles = RubroCalificacion.objects.all()

        title = "Nueva Evaluación de la Entidad: " + entidad.nombre.upper()

        detalles_form = []

        for index, detalle in enumerate(detalles):
            detalle_form = DetalleEvaluacionAnexo1Form(initial={'rubro': detalle.id}, prefix=str(index))
            detalles_form.append(detalle_form)

        list_zip = zip(detalles, detalles_form)

        return dict(
            super(EvaluacionEntidadAnexo1Create, self).get_context_data(**kwargs), title=title, entidad=entidad,
            detalles_form=detalles_form, list_zip=list_zip)


class EvaluacionEntidadAnexo1Update(UpdateView):
    form_class = EvaluacionAnexo1Form
    model = EvaluacionAnexo1
    template_name = 'evaluacion_entidad/evaluacionanexo1_form.html'

    # success_url = reverse_lazy('reclamo:entidad-reclamo-list')

    @method_decorator(valid_access_view(valid_ipress_anexo1_edit, login_url='/validate'))
    def dispatch(self, *args, **kwargs):
        return super(EvaluacionEntidadAnexo1Update, self).dispatch(*args, **kwargs)

    def get_success_url(self):
        entidad_id = self.request.session['entidad_id']
        # return reverse_lazy('evaluacion-entidad:list', kwargs={'entidad_id': entidad_id})
        return reverse_lazy('evaluacion-entidad:list')

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(EvaluacionEntidadAnexo1Update, self).get_form_kwargs(*args, **kwargs)
        entidad_id = self.request.session['entidad_id']
        kwargs['entidad_id'] = entidad_id
        return kwargs

    def form_valid(self, form):

        msg = "Evaluación editada correctamente"
        messages.add_message(self.request, messages.SUCCESS, msg)

        self.object = form.save()

        entidad_id = self.request.session['entidad_id']
        self.object.entidad_id = entidad_id

        detalles = RubroCalificacion.objects.all()
        evaluacion_id = self.kwargs['pk']

        for index, detalle in enumerate(detalles):

            updated_data = self.request.POST.copy()
            updated_data.update({str(index) + '-evaluacion': self.object.id})

            try:
                detalle_saved = DetalleEvaluacionAnexo1.objects.get(evaluacion_id=evaluacion_id, rubro_id=detalle.id)
                detalle_form = DetalleEvaluacionAnexo1Form(updated_data, self.request.POST, prefix=str(index),
                                                           instance=detalle_saved)
            except DetalleEvaluacionAnexo1.DoesNotExist:
                detalle_form = DetalleEvaluacionAnexo1Form(updated_data, self.request.POST, prefix=str(index))
            if detalle_form.is_valid():
                detalle_form.save()
            else:
                print("Error al guardar el detalle")

        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        entidad_id = self.request.session['entidad_id']
        entidad = Entidad.objects.get(pk=entidad_id)
        detalles = RubroCalificacion.objects.all()
        evaluacion_id = self.kwargs['pk']
        title = "Nueva Evaluación de la Entidad: " + entidad.nombre.upper()

        detalles_form = []

        for index, detalle in enumerate(detalles):
            try:
                detalle_saved = DetalleEvaluacionAnexo1.objects.get(evaluacion_id=evaluacion_id, rubro_id=detalle.id)
                detalle_form = DetalleEvaluacionAnexo1Form(instance=detalle_saved, prefix=str(index))
            except DetalleEvaluacionAnexo1.DoesNotExist:
                detalle_form = DetalleEvaluacionAnexo1Form(initial={'rubro': detalle.id}, prefix=str(index))
            detalles_form.append(detalle_form)

        list_zip = zip(detalles, detalles_form)

        return dict(
            super(EvaluacionEntidadAnexo1Update, self).get_context_data(**kwargs), title=title, entidad=entidad,
            detalles_form=detalles_form, list_zip=list_zip)


class EvaluacionEntidadAnexo1Delete(DeleteView):
    success_url = reverse_lazy('evaluacion-entidad:list')
    template_name = 'evaluacion_entidad/evaluacionanexo1_confirm_delete.html'
    model = EvaluacionAnexo1

    def delete(self, request, *args, **kwargs):
        msg = "Evaluación eliminada correctamente"
        messages.add_message(self.request, messages.ERROR, msg, extra_tags='danger')
        return super(EvaluacionEntidadAnexo1Delete, self).delete(request, *args, **kwargs)
