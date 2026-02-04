import datetime

from django import forms
from django.core.exceptions import ValidationError
from django.forms import DateInput, Textarea

from apps.reclamo.models.clasificacion_causa import DERECHOS
from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.util.convert_choice_to_filter import convert_choice_to_filter
from apps.util.generic_filters import forms as gf
from setup.models.entidad import Entidad
from setup.models.sede import Sede
from setup.models.ris import Ris



class EntidadReclamoForm_secretaria(forms.ModelForm):

    ris = forms.ModelChoiceField(
        queryset = Ris.objects.filter(estado__in=[1, 2]),
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="Sede",
        empty_label="Seleccione un RIS"
    )

    entidad2 = forms.IntegerField(   # 👈 acepta cualquier número
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
        fields = ["periodo"]

    def __init__(self, *args, **kwargs):
        entidad_id = kwargs.pop('entidad_id', None)
        self.user = kwargs.pop('user', None)
        super().__init__(*args, **kwargs)

        if 'nombre' in self.fields:
            self.fields['nombre'].queryset = Entidad.objects.all().order_by("nombre")
            self.fields['nombre'].empty_label = "--- Seleccione Dependencia ---"
            # 👇 aquí le dices que solo use el campo nombre como label
            self.fields['nombre'].label_from_instance = lambda obj: obj.nombre  

        self.fields['unidad_organica'] = forms.ChoiceField(
            choices=[], required=False, label='Subunidad Funcional o Estrategia'
        )

        # Determinar la entidad seleccionada durante POST o GET
        selected_entidad_id = None

        # Si viene desde una petición POST (formulario enviado)
        if 'nombre' in self.data:
            try:
                selected_entidad_id = int(self.data.get('nombre'))
            except (ValueError, TypeError):
                selected_entidad_id = None
        # Si viene como argumento desde la vista
        elif entidad_id:
            selected_entidad_id = entidad_id

        # Si la entidad es 148, agregar opciones a unidad_organica
        if selected_entidad_id == 148:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL GESTION DEL EMPLEO", "SUB UNIDAD FUNCIONAL GESTION DEL EMPLEO"),
                ("SUB UNIDAD FUNCIONAL GESTION DEL DESARROLLO Y CAPACITACION/RENDIMIENTO", "SUB UNIDAD FUNCIONAL GESTION DEL DESARROLLO Y CAPACITACION/RENDIMIENTO"),
                ("SUB UNIDAD FUNCIONAL GESTION DE COMPENSACIONES", "SUB UNIDAD FUNCIONAL GESTION DE COMPENSACIONES"),
                ("SUB UNIDAD FUNCIONAL PLANIFICACIÓN Y POLITICA DE RECURSOS HUMANOS", "SUB UNIDAD FUNCIONAL PLANIFICACIÓN Y POLITICA DE RECURSOS HUMANOS"),
                ("SUB UNIDAD FUNCIONAL GESTION DE RELACIONES HUMANAS Y SOCIALES", "SUB UNIDAD FUNCIONAL GESTION DE RELACIONES HUMANAS Y SOCIALES"),
                ("SUB UNIDAD FUNCIONAL ORGANIZACIÓN DEL TRABAJO Y DISTRIBUCION", "SUB UNIDAD FUNCIONAL ORGANIZACIÓN DEL TRABAJO Y DISTRIBUCION"),
            ]

        elif selected_entidad_id == 146:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL INTEGRIDAD INSTITUCIONAL", "SUB UNIDAD FUNCIONAL INTEGRIDAD INSTITUCIONAL"),
                ("SUB UNIDAD FUNCIONAL TRANSPARENCIA", "SUB UNIDAD FUNCIONAL TRANSPARENCIA"),
            ]

        elif selected_entidad_id == 149:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL PROGRAMACION", "SUB UNIDAD FUNCIONAL PROGRAMACION"),
                ("SUB UNIDAD FUNCIONAL ALMACEN", "SUB UNIDAD FUNCIONAL ALMACEN"),
                ("SUB UNIDAD FUNCIONAL ADQUISICIONES", "SUB UNIDAD FUNCIONAL ADQUISICIONES"),
                ("SUB UNIDAD FUNCIONAL PATRIMONIO", "SUB UNIDAD FUNCIONAL PATRIMONIO"),
                ("SUB UNIDAD FUNCIONAL SERVICIOS GENERALES Y TRANSPORTE", "SUB UNIDAD FUNCIONAL SERVICIOS GENERALES Y TRANSPORTE"),
            ]
        elif selected_entidad_id == 150:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL INFRAESTRUCTURA", "SUB UNIDAD FUNCIONAL INFRAESTRUCTURA"),
                ("SUB UNIDAD FUNCIONAL EQUIPAMIENTO", "SUB UNIDAD FUNCIONAL EQUIPAMIENTO"),
            ]
        elif selected_entidad_id == 151:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL CUENTAS CORRIENTES", "SUB UNIDAD FUNCIONAL CUENTAS CORRIENTES"),
                ("SUB UNIDAD FUNCIONAL CONTROL DE GASTOS", "SUB UNIDAD FUNCIONAL CONTROL DE GASTOS"),
                ("SUB UNIDAD FUNCIONAL COBRANZA PRE COACTIVA", "SUB UNIDAD FUNCIONAL COBRANZA PRE COACTIVA"),
                ("SUB UNIDAD FUNCIONAL TRIBUTACION", "SUB UNIDAD FUNCIONAL TRIBUTACION"),
                ("SUB UNIDAD FUNCIONAL CAJA CHICA", "SUB UNIDAD FUNCIONAL CAJA CHICA"),
            ]
        elif selected_entidad_id == 152:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL CONTROL PREVIO", "SUB UNIDAD FUNCIONAL CONTROL PREVIO"),
                ("SUB UNIDAD FUNCIONAL INTEGRACION CONTABLE Y PRESUPUESTAL", "SUB UNIDAD FUNCIONAL INTEGRACION CONTABLE Y PRESUPUESTAL"),
                ("SUB UNIDAD FUNCIONAL CONTROL DE INGRESOS Y SALIDAS DE ACTIVOS Y BIENES CORRIENTES", "SUB UNIDAD FUNCIONAL CONTROL DE INGRESOS Y SALIDAS DE ACTIVOS Y BIENES CORRIENTES"),
            ]
        elif selected_entidad_id == 153:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL ARCHIVO", "SUB UNIDAD FUNCIONAL ARCHIVO"),
            ]
        elif selected_entidad_id == 154:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL COSTOS", "SUB UNIDAD FUNCIONAL COSTOS"),
                ("SUB UNIDAD FUNCIONAL ORGANIZACION Y MODERNIZACION DE LA GESTION PUBLICA", "SUB UNIDAD FUNCIONAL ORGANIZACION Y MODERNIZACION DE LA GESTION PUBLICA"),
                ("SUB UNIDAD FUNCIONAL PLANEAMIENTO", "SUB UNIDAD FUNCIONAL PLANEAMIENTO"),
            ]
        elif selected_entidad_id == 155:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL EVALUACION Y SEGUIMIENTO DE LA EJECUCION PRESUPUESTAL", "SUB UNIDAD FUNCIONAL EVALUACION Y SEGUIMIENTO DE LA EJECUCION PRESUPUESTAL"),
                ("SUB UNIDAD FUNCIONAL PROGRAMACION, FORMULACION Y EVALUACION PRESUPUESTAL", "SUB UNIDAD FUNCIONAL PROGRAMACION, FORMULACION Y EVALUACION PRESUPUESTAL"),
            ]
        elif selected_entidad_id == 156:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL FORMULACIÓN DE PROYECTOS", "SUB UNIDAD FUNCIONAL FORMULACIÓN DE PROYECTOS"),
            ]
        elif selected_entidad_id == 157:
            self.fields['unidad_organica'].choices = [
                ("FISCALIZACION Y SANCION", "FISCALIZACION Y SANCION"),
                ("VIGILANCIA Y CONTROL", "VIGILANCIA Y CONTROL"),
                ("AUTORIZACIONES Y CERTIFICACIONES", "AUTORIZACIONES Y CERTIFICACIONES"),
            ]
        elif selected_entidad_id == 158:
            self.fields['unidad_organica'].choices = [
                ("ACCESO Y USO RACIONAL FARMACOlOGICO", "ACCESO Y USO RACIONAL FARMACOlOGICO"),
                ("FISCALIZACION, CONTROL Y VIGILANCIA SANITARIA", "FISCALIZACION, CONTROL Y VIGILANCIA SANITARIA"),
                ("AUTORIZACION Y CERTIFICACION DE ESTABLECIMIENTOS FARMACEUTICOS", "AUTORIZACION Y CERTIFICACION DE ESTABLECIMIENTOS FARMACEUTICOS"),
            ]
        elif selected_entidad_id == 167:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL ESTADISTICA", "SUB UNIDAD FUNCIONAL ESTADISTICA"),
                ("SUB UNIDAD FUNCIONAL DOCENCIA E INVESTIGACION", "SUB UNIDAD FUNCIONAL DOCENCIA E INVESTIGACION"),
            ]
        elif selected_entidad_id == 166:
            self.fields['unidad_organica'].choices = [
                ("ESTRATEGIA DE PUEBLOS INDIGENAS U ORIGINARIOS", "ESTRATEGIA DE PUEBLOS INDIGENAS U ORIGINARIOS"),
                ("ESTRATEGIA SANITARIA DE ALIMENTACION Y NUTRICION SALUDABLE", "ESTRATEGIA SANITARIA DE ALIMENTACION Y NUTRICION SALUDABLE"),
                ("ESTRATEGIA SANITARIA DE ETAPA DE VIDA ADULTO MAYOR", "ESTRATEGIA SANITARIA DE ETAPA DE VIDA ADULTO MAYOR"),
                ("ESTRATEGIA SANITARIA DE ETAPA DE VIDA JOVEN", "ESTRATEGIA SANITARIA DE ETAPA DE VIDA JOVEN"),
                ("ESTRATEGIA SANITARIA DE ETAPA DE VIDA NIÑO", "ESTRATEGIA SANITARIA DE ETAPA DE VIDA NIÑO"),
                ("ESTRATEGIA SANITARIA DE INMUNIZACIONES", "ESTRATEGIA SANITARIA DE INMUNIZACIONES"),
                ("ESTRATEGIA SANITARIA DE METAXENICAS Y ZOONOSIS", "ESTRATEGIA SANITARIA DE METAXENICAS Y ZOONOSIS"),
                ("ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE CANCER", "ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE CANCER"),
                ("ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE DAÑOS NO TRANSMISIBLES", "ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE DAÑOS NO TRANSMISIBLES"),
                ("ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE LA DISCAPACIDAD", "ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE LA DISCAPACIDAD"),
                ("ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE LA TUBERCULOSIS", "ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE LA TUBERCULOSIS"),
                ("ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE LAS ITS VIH SIDA Y HEPATITIS", "ESTRATEGIA SANITARIA DE PREVENCION Y CONTROL DE LAS ITS VIH SIDA Y HEPATITIS"),
                ("ESTRATEGIA SANITARIA DE SALUD BUCAL", "ESTRATEGIA SANITARIA DE SALUD BUCAL"),
                ("ESTRATEGIA SANITARIA DE SALUD FAMILIAR", "ESTRATEGIA SANITARIA DE SALUD FAMILIAR"),
                ("ESTRATEGIA SANITARIA DE SALUD MENTAL Y CULTURA DE PAZ", "ESTRATEGIA SANITARIA DE SALUD MENTAL Y CULTURA DE PAZ"),
                ("ESTRATEGIA SANITARIA DE SALUD OCULAR Y PREVENCION DE LA CEGUERA", "ESTRATEGIA SANITARIA DE SALUD OCULAR Y PREVENCION DE LA CEGUERA"),
                ("ESTRATEGIA SANITARIA DE SALUD SEXUAL Y REPRODUCTIVA", "ESTRATEGIA SANITARIA DE SALUD SEXUAL Y REPRODUCTIVA"),
                ("ESTRATEGIA SANITARIA DE VIDA ADULTO MUJER Y VARON", "ESTRATEGIA SANITARIA DE VIDA ADULTO MUJER Y VARON"),
                ("ESTRATEGIA SANITARIA DE VIGILANCIA DE RIESGO CON METALES PESADOS", "ESTRATEGIA SANITARIA DE VIGILANCIA DE RIESGO CON METALES PESADOS"),
                ("ESTRATEGIA SANITARIA ETAPA DE VIDA ADOLESCENTE", "ESTRATEGIA SANITARIA ETAPA DE VIDA ADOLESCENTE"),
            ]
        elif selected_entidad_id == 140:
            self.fields['unidad_organica'].choices = [
                ("SUB UNIDAD FUNCIONAL SOPORTE INFORMATICO", "SUB UNIDAD FUNCIONAL SOPORTE INFORMATICO"),
                ("SUB UNIDAD FUNCIONAL REDES Y COMUNICACIONES", "SUB UNIDAD FUNCIONAL REDES Y COMUNICACIONES"),
            ]

        # Filtrar queryset de 'nombre' si se pasó 'entidad_id'
        if entidad_id:
            qs = Entidad.objects.filter(id=entidad_id)
            self.fields['nombre'].queryset = qs
            if qs.exists():
                self.fields['nombre'].initial = qs.first()

            

        # Reordenar campos
        orden = ['nombres', 'apellidos', 'cargo','celular','tipo_incidencia', 'anydesk',
                'detalle_solicitud','ris','entidad2','piso','correo_usuario']
        
        self.fields = {campo: self.fields[campo] for campo in orden if campo in self.fields or campo == "nombre"}


        if entidad_id:
            qs = Entidad.objects.filter(id=entidad_id)
            self.fields['nombre'].queryset = qs
            if qs.exists():
                self.fields['nombre'].initial = qs.first()

            
            
            

    def save(self, commit=True):
        instance = super().save(commit=False)

        # asignar la entidad seleccionada
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

        # Agregar valores del usuario si está presente
        #if self.user:
         #   self.fields['nombres'].initial = self.user.first_name
          #  self.fields['apellidos'].initial = self.user.last_name
        

        
        # self.fields['periodo'] = "000000"

        # self.fields['periodo_declaracion'].choices = Periodo.objects.filter(estado=True).values_list('id', 'periodo')[
        #                                              0:1]

        # if self.instance:
        #     if self.instance.tipo_documento_usuario == 8:
        #         self.fields['razon_social_usuario'].required = True
        #     else:
        #         self.fields['nombres_usuario'].required = True
        #         self.fields['apellido_paterno_usuario'].required = True
        #         self.fields['apellido_materno_usuario'].required = True
        #
        #     if self.instance.tipo_documento_presenta == 8:
        #         self.fields['razon_social_presenta'].required = True
        #     else:
        #         self.fields['nombres_presenta'].required = True
        #         self.fields['apellido_paterno_presenta'].required = True
        #         self.fields['apellido_materno_presenta'].required = True

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

    def clean(self):
        cleaned_data = super().clean()
        state_error = False

        # Asignar fecha_reclamo a la fecha de hoy siempre
        today = datetime.date.today()
        cleaned_data["fecha_reclamo"] = today

         

        if state_error:
            raise ValidationError(" Error al guardar la información: ")

        return cleaned_data

class EntidadReclamoListFilter(gf.FilteredForm):
    # causas = []
    # for i in ClasificacionCausa.objects.all():
    #     causas.append((str(i.id), str(i.codigo + " - " + i.get_categoria_display())))

    clasificacion_reclamo_1__categoria = gf.ChoiceField(label='Categoría',
                                                        choices=convert_choice_to_filter(DERECHOS))

    def get_order_by_choices(self):
        return [('clasificacion_reclamo_1__categoria', '1')]
