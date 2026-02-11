import datetime

from django import forms
from django.core.exceptions import ValidationError
from django.forms import DateInput, Textarea
import requests

from apps.reclamo.models.clasificacion_causa import DERECHOS
from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.util.convert_choice_to_filter import convert_choice_to_filter
from apps.util.generic_filters import forms as gf
from setup.models.entidad import Entidad
from setup.models.sede import Sede
from setup.models.ris import Ris
from django_select2.forms import Select2Widget




class EntidadReclamoForm_secretaria(forms.ModelForm):

    dependencia_service = forms.ChoiceField(
        choices=[],
        label="Dependencia",
        widget=Select2Widget(attrs={"style": "width: 100%;", "id": "id_dependencia_service"})
    )

    usuario_service = forms.ChoiceField(
    choices=[],
    label="Usuario",
    required=False,
    widget=Select2Widget(attrs={
        "style": "width: 100%;",
        "id": "id_usuario_service"
    })
)
 
    

    ris = forms.ModelChoiceField(
        queryset=Ris.objects.filter(estado__in=[1, 2]),
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="Sede",
        empty_label="Seleccione un RIS"
    )

    entidad2 = forms.IntegerField(
        label="Unidad orgánica",
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'id_entidad'}),
    )

    nombre = forms.ModelChoiceField(
        queryset=Entidad.objects.all().order_by("nombre"),
        empty_label="--- Seleccione Dependencia ---",
        label="Dependencia",
        required=False
    )

    sede = forms.ModelChoiceField(
        queryset=Sede.objects.all().order_by("id"),
        empty_label="--- Seleccione Sede ---",
        label="Sede",
        required=False
    )

    class Meta:
        model = EntidadReclamo
        fields = '__all__'
        widgets = {
            'fecha_reclamo': DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
            'fecha_resultado_reclamo': DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
            'fecha_notificacion': DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
            'created_at': DateInput(format='%Y-%m-%d'),
            'updated_at': DateInput(format='%Y-%m-%d'),
            'detalle_reclamo': Textarea(attrs={'rows': '12'}),
        }

    def __init__(self, *args, **kwargs):
        entidad_id = kwargs.pop("entidad_id", None)
        super().__init__(*args, **kwargs)
        self.fields["cargo_service"].disabled = True

        # --------- CARGAR USUARIOS SOLO SI EL FORM VIENE EN POST ---------
        if self.is_bound and "dependencia_service" in self.data:
            id_dependencia = self.data.get("dependencia_service")

            if id_dependencia:
                try:
                    url = f"http://10.0.5.64/HelpdeskApi/Helpdesk/listarPersona/{id_dependencia}"
                    r = requests.get(url, timeout=5)
                    data = r.json()

                    usuario_choices = []
                    self.usuarios_map = {}  # ← MUY IMPORTANTE para el save()

                    for p in data:
                        id_persona = str(p.get("id_persona"))

                        nombre_completo = (
                            f"{p.get('nombre','')} "
                            f"{p.get('apellido_paterno','')} "
                            f"{p.get('apellido_materno','')}"
                        ).strip()

                        usuario_choices.append((id_persona, nombre_completo))

                        # Guardamos TODO el objeto para usarlo en save()
                        self.usuarios_map[id_persona] = p

                    self.fields["usuario_service"].choices = usuario_choices

                except Exception as e:
                    print("❌ Error cargando usuarios en POST:", e)
                    self.fields["usuario_service"].choices = []



                
        # -------------------------------
        # 1️⃣ REORDENAR CAMPOS (PRIMERO)
        # -------------------------------
        orden = [
            'dependencia_service', 'usuario_service', 'cargo_service','apellidos',  
            'celular', 'correo_usuario', 'tipo_incidencia', 'anydesk', 'tipo_incidencia2' ,  
             'piso',  'n_atenciones', 'detalle_solicitud'
        ]

        self.fields = {
            campo: self.fields[campo]
            for campo in orden
            if campo in self.fields or campo == "nombre"
        }

        # --------------------------------------------
        # 2️⃣ CARGAR DEPENDENCIAS DESDE LA API (DESPUÉS)
        # --------------------------------------------
        url = "http://10.0.5.64/HelpdeskApi/Helpdesk/listarDependencia"

        try:
            response = requests.get(url, timeout=5)    
            print("STATUS API:", response.status_code)
            print("RESPUESTA API:", response.text)

            data = response.json()

            if isinstance(data, list):
                dependencias_ordenadas = sorted(
                    data,
                    key=lambda x: x["dependencia"].lower()
                )

                choices = [
                    (str(dep["id_dependencia"]), dep["dependencia"])  # ← IMPORTANTE: todo como string
                    for dep in dependencias_ordenadas
                ]

                self.fields["dependencia_service"].choices = choices

                # ✅ Mapa completo (CLAVE para que funcione el save)
                self.dependencias_map = {
                    str(dep["id_dependencia"]): dep for dep in dependencias_ordenadas
                }

            else:
                print("⚠️ La API NO devolvió una lista:", data)
                self.fields["dependencia_service"].choices = []
                self.dependencias_map = {}


        except Exception as e:
            print("❌ ERROR CARGANDO API:", e)
            self.fields["dependencia_service"].choices = []

        # --------------------------------------------
        #     LÓGICA ORIGINAL  
        # --------------------------------------------
        self.fields['n_atenciones'].initial = 1

        if entidad_id:
            qs = Entidad.objects.filter(id=entidad_id)
            self.fields['nombre'].queryset = qs
            if qs.exists():
                self.fields['nombre'].initial = qs.first()

    def save(self, commit=True):
        instance = super().save(commit=False)

        # -------- DEPENDENCIA  --------
        id_dependencia = self.cleaned_data.get("dependencia_service")

        if hasattr(self, "dependencias_map") and id_dependencia:
            dep_data = self.dependencias_map.get(str(id_dependencia))

            if dep_data:
                instance.dependencia_service = id_dependencia
                instance.dependencia_service_nombre = dep_data.get("dependencia")
                instance.dependencia_padre = dep_data.get("id_dependencia_padre")
                instance.dependencia_padre_nombre = dep_data.get("dependencia_padre")

        # -------- USUARIO SERVICE + CARGO + TELEFONO + CORREO --------
        id_persona = self.cleaned_data.get("usuario_service")

        if id_persona and hasattr(self, "usuarios_map"):
            persona_data = self.usuarios_map.get(str(id_persona))

            if persona_data:
                # Nombre completo (ya concatenado)
                nombre_completo = f"{persona_data.get('nombre','')} {persona_data.get('apellido_paterno','')} {persona_data.get('apellido_materno','')}".strip()

                # Asignaciones a tu modelo
                instance.usuario_service = id_persona
                instance.usuario_service_nombre = nombre_completo

                # ✅ NUEVO: CARGO
                instance.cargo_service = persona_data.get("id_cargo")
                instance.cargo_service_nombre = persona_data.get("cargo")

                # ✅ TELÉFONO → solo setear si el usuario NO lo cambió
                if not self.cleaned_data.get("celular"):
                    instance.celular = persona_data.get("telefono")
                else:
                    instance.celular = self.cleaned_data.get("celular")

                # ✅ CORREO → solo setear si el usuario NO lo cambió
                if not self.cleaned_data.get("correo_usuario"):
                    instance.correo_usuario = persona_data.get("correo")
                else:
                    instance.correo_usuario = self.cleaned_data.get("correo_usuario")






        # --------   lógica original --------
        entidad = self.cleaned_data.get("nombre")
        if entidad:
            instance.entidad = entidad

        if commit:
            instance.save()
            try:
                self.save_m2m()
            except Exception:
                pass

        return instance



    def clean(self):
        cleaned_data = super().clean()
        today = datetime.date.today()
        cleaned_data["fecha_reclamo"] = today
        return cleaned_data


class EntidadReclamoListFilter(gf.FilteredForm):

    clasificacion_reclamo_1__categoria = gf.ChoiceField(
        label='Categoría',
        choices=convert_choice_to_filter(DERECHOS)
    )

    def get_order_by_choices(self):
        return [('clasificacion_reclamo_1__categoria', '1')]