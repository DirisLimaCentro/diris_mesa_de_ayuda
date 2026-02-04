from datetime import timezone
from django import forms
from setup.models.ris import Ris
from django.utils import timezone

from apps.reclamo.models.monitoreo_internet import Monitoreo_internet

class EntidadReclamoForm_monitoreo_general(forms.ModelForm):


    ris = forms.ModelChoiceField(
        queryset = Ris.objects.filter(estado__in=[1, 3]),
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="RIS",
        empty_label="Seleccione un RIS"
    )

    entidad2 = forms.IntegerField(   # 👈 acepta cualquier número
        label="Establecimiento",
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'id_entidad'}),
        required=False
    )

    # 👉 Hacer obligatorio el campo correo
    correo = forms.EmailField(
        required=True,
        widget=forms.EmailInput(attrs={'class': 'form-control'})
    )
    class Meta:
        model = Monitoreo_internet
        fields =['ris','entidad2','distrito','velocidad_inter' ,'anexos', 'tipo_incidencia','fecha_hora_perdida' ,    'observacion' , 'correo','evidencia' ]  # Incluye todos los campos del modelo
        widgets = {
            'entidad2': forms.NumberInput(attrs={'class': 'form-control'}),
            'distrito': forms.TextInput(attrs={'class': 'form-control', 'readonly': 'readonly'}),
           'velocidad_inter': forms.NumberInput(attrs={'class': 'form-control', 'readonly': 'readonly'}),
            'anexos': forms.TextInput(attrs={'class': 'form-control', 'readonly': 'readonly'}),

            'fecha_hora_perdida': forms.DateTimeInput(
                format='%Y-%m-%dT%H:%M',
                attrs={'type': 'datetime-local', 'class': 'form-control'}
            ),
            'fecha_hora_reestablecido': forms.DateTimeInput(
                format='%Y-%m-%dT%H:%M',
                attrs={'type': 'datetime-local', 'class': 'form-control'}
            ),
            'evidencia': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),
          }
        labels = {
            'entidad2': 'Establecimiento', 
            'distrito': 'Dirección',
            'velocidad_inter': 'Velocidad mbps',  
            'anexos': 'N° de anexos',
            'tiempo_sin_serv': 'Tiempo sin servicio',
            'fecha_hora_perdida': 'Fecha y Hora que se perdió la conectividad',
            'fecha_hora_reestablecido' : 'Fecha y Hora que se reestableció la conectividad',
            'evidencia': 'Evidencia del fallo',
            'evidencia_2': 'Evidencia del reestablecimiento',
         }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

            # Solo para formularios nuevos
        if not self.instance.pk:
            self.fields['fecha_hora_perdida'].initial = timezone.now()
        
        # ⚠️ Hacer obligatorio el campo evidencia
        self.fields['evidencia'].required = True


    def clean(self):
        cleaned_data = super().clean()
        fecha_perdida = cleaned_data.get('fecha_hora_perdida')
        fecha_reestablecido = cleaned_data.get('fecha_hora_reestablecido')

        if fecha_perdida and fecha_reestablecido:
            if fecha_perdida > fecha_reestablecido:
                raise forms.ValidationError({
                    'fecha_hora_reestablecido': '⚠️ La fecha de restablecimiento no puede ser menor que la de pérdida.'
                })
        return cleaned_data
