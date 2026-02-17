from django import forms
from apps.reclamo.models.programacion import Programacion
from setup.models.auto import Auto
from setup.models.ris import Ris
from setup.models.chofer import Chofer
from setup.models.entidad import Entidad
from django_select2.forms import Select2Widget
import requests





class EntidadReclamoForm_programacion(forms.ModelForm):

    dependencia_service = forms.ChoiceField(
        choices=[],
        label="Dependencia",
        widget=Select2Widget(attrs={
            "style": "width: 100%;",
            "id": "id_dependencia_service"
        }),
        required=False
    )

    ris = forms.ModelChoiceField(
        queryset=Ris.objects.filter(estado__in=[1, 2]),
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="RIS",
        empty_label="Seleccione un RIS",
        required=False
    )

    entidad2 = forms.IntegerField(
        label="Establecimiento",
        widget=forms.Select(attrs={
            'class': 'form-control',
            'id': 'id_entidad'
        }),
        required=False
    )

    class Meta:
        model = Programacion
        fields = [
            'dependencia_service',
            'entidad_id',
            'fecha_programada',
            'descripcion_general',
            'detalle_programacion',
            'cantidad_personal',
            'evidencia',
            'documento',
            'comentario_atencion',
            'fecha_atencion',
            'estado_programacion',
            
        ]

        widgets = {
            'entidad_id': forms.NumberInput(attrs={'class': 'form-control'}),
            'cantidad_personal': forms.NumberInput(attrs={'class': 'form-control'}),
            'detalle_programacion': forms.Textarea(attrs={
                'rows': 3,
                'class': 'form-control'
            }),
            'evidencia': forms.TextInput(attrs={'class': 'form-control'}),
            'documento': forms.TextInput(attrs={'class': 'form-control'}),
            'comentario_atencion': forms.Textarea(attrs={
                'rows': 3,
                'class': 'form-control'
            }),
            'fecha_programada': forms.DateTimeInput(
                format='%Y-%m-%dT%H:%M',
                attrs={
                    'type': 'datetime-local',
                    'class': 'form-control'
                }
            ),
            'fecha_atencion': forms.DateTimeInput(
                format='%Y-%m-%dT%H:%M',
                attrs={
                    'type': 'datetime-local',
                    'class': 'form-control'
                }
            ),
            'estado_programacion': forms.NumberInput(attrs={'class': 'form-control'}),
            'entidad2': forms.NumberInput(attrs={'class': 'form-control'}),
        }

        labels = {
            'detalle_programacion': 'Detalle de las actividades a realizar',
            'fecha_programada': 'Fecha y hora programada',
            'descripcion_general': 'Descripción General de las actividades a realizar'
        }

    # ==============================
    # CARGA DE DEPENDENCIAS DESDE API
    # ==============================
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.dependencias_api = []  # guardamos data para usarla en save()

        try:
            response = requests.get(
                "http://10.0.5.64/HelpdeskApi/Helpdesk/listarDependencia",
                timeout=5
            )

            if response.status_code == 200:
                data = response.json()
                self.dependencias_api = data

                choices = [
                    (item["id_dependencia"], item["dependencia"])
                    for item in data
                ]

                self.fields["dependencia_service"].choices = [
                    ("", "Seleccione una dependencia")
                ] + choices

            else:
                self.fields["dependencia_service"].choices = [
                    ("", "No se pudo cargar dependencias")
                ]

        except Exception:
            self.fields["dependencia_service"].choices = [
                ("", "Error al conectar con API")
            ]

    # ==============================
    # GUARDAR TAMBIÉN EL NOMBRE
    # ==============================
    def save(self, commit=True):
        instance = super().save(commit=False)

        dependencia_id = self.cleaned_data.get("dependencia_service")

        if dependencia_id and self.dependencias_api:
            for item in self.dependencias_api:
                if str(item["id_dependencia"]) == str(dependencia_id):

                    # Dependencia seleccionada
                    instance.dependencia_service = item["id_dependencia"]
                    instance.dependencia_service_nombre = item["dependencia"]

                    # 👇 NUEVO: Dependencia padre
                    instance.dependencia_padre = item.get("id_dependencia_padre")
                    instance.dependencia_padre_nombre = item.get("dependencia_padre")

                    instance.direccion = item.get("direccion")




                    break

        if commit:
            instance.save()

        return instance