from django import forms
from django.forms import Textarea, DateInput

from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.reclamo.models.medida_adoptada import MedidaAdoptada
from apps.util.generic_filters import forms as gf
from setup.models.usuario import Usuario

class MedidaAdoptadaForm(forms.ModelForm):
    usuario_soporte = forms.ChoiceField(
        label="Personal de Soporte",
        widget=forms.Select(attrs={"class": "form-control"})
    )

    def __init__(self, *args, **kwargs):
        self.entidad_reclamo = kwargs.pop('entidad_reclamo', None)
        super().__init__(*args, **kwargs)

        # Solo usuarios con rol=2
        usuarios = Usuario.objects.filter(rol=2)

        # 👇 Insertamos opción nula al inicio
        self.fields['usuario_soporte'].choices = [("", "--- Seleccione un usuario ---")] + [
            (u.id, f"{u.first_name} {u.last_name}".strip()) for u in usuarios
        ]

        if self.entidad_reclamo:
            self.instance.entidad_reclamo = self.entidad_reclamo

    def save(self, commit=True):
        usuario_id = self.cleaned_data.get('usuario_soporte')
        if usuario_id:
            self.instance.usuario_soporte = int(usuario_id)
        return super().save(commit=commit)

    class Meta:
        model = MedidaAdoptada
        fields = ['usuario_soporte']


class MedidaAdoptadaListFilter(gf.FilteredForm):

    def get_order_by_choices(self):
        return []
