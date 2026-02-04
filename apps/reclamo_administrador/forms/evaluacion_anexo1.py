from django import forms
from django.forms import DateInput, Textarea

from apps.reclamo_administrador.models.evaluacion_anexo1 import EvaluacionAnexo1, DetalleEvaluacionAnexo1
from apps.util.generic_filters import forms as gf
from setup.models.entidad import Entidad


class EvaluacionAnexo1Form(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        self.entidad_id = kwargs.pop('entidad_id')
        super().__init__(*args, **kwargs)
        # self.fields['entidad_reclamo'].choices = self.entidad_reclamo
        self.fields['entidad'].choices = Entidad.objects.filter(id=self.entidad_id).values_list(
            'id', 'id')[0:1]

    class Meta:
        model = EvaluacionAnexo1
        fields = '__all__'
        # fields = '__all__'
        widgets = {
            'fecha': DateInput(format='%Y-%m-%d')
        }


class EvaluacionAnexo1ListFilter(gf.FilteredForm):

    def get_order_by_choices(self):
        return []


class DetalleEvaluacionAnexo1Form(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        # self.evaluacion_id = kwargs.pop('evaluacion_id')
        super().__init__(*args, **kwargs)
        # self.fields['evaluacion'].choices = EvaluacionAnexo1.objects.filter(id=self.evaluacion_id).values_list(
        #     'id', 'id')[0:1]

        self.fields['evaluacion'].choices = EvaluacionAnexo1.objects.all().values_list('id', 'id')[:1]

    class Meta:
        model = DetalleEvaluacionAnexo1
        fields = '__all__'
        widgets = {
            'observacion': Textarea(attrs={'rows': '3'}),
        }
