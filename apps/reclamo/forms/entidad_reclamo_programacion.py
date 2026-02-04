from django import forms
from apps.reclamo.models.programacion import Programacion
from setup.models.auto import Auto
from setup.models.ris import Ris
from setup.models.chofer import Chofer
from setup.models.entidad import Entidad




class EntidadReclamoForm_programacion(forms.ModelForm):
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

    chofer = forms.ModelChoiceField(   # 👈 nuevo campo
        queryset=Chofer.objects.filter(estado=1).order_by('nombre'),
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="Chofer",
        empty_label="Seleccione un chofer",
        required=False 
    )

    auto = forms.ModelChoiceField(   # 👈 nuevo campo
        queryset=Auto.objects.filter(estado_auto=1).order_by('placa'),
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="Auto",
        empty_label="Seleccione un auto",
        required=False   
    )

   
     
    class Meta:
        model = Programacion
        fields = [
            'ris',
            'entidad2',
            'entidad_id',
            'distrito',
            'fecha_programada',
            'chofer',    
            'auto',
            'descripcion_general',
            'detalle_programacion',
            'cantidad_personal',
            'evidencia',
            'documento',
            'comentario_atencion',
            'fecha_atencion',
            'estado_programacion'
            
        ]
        widgets = {
            'entidad_id': forms.NumberInput(attrs={'class': 'form-control'}),
            'distrito': forms.TextInput(attrs={'class': 'form-control', 'readonly': 'readonly'}),
            'cantidad_personal': forms.NumberInput(attrs={'class': 'form-control'}),
            'detalle_programacion': forms.Textarea(attrs={'rows': 3, 'class': 'form-control'}),
            'evidencia': forms.TextInput(attrs={'class': 'form-control'}),
            'documento': forms.TextInput(attrs={'class': 'form-control'}),
            'comentario_atencion': forms.Textarea(attrs={'rows': 3, 'class': 'form-control'}),
            'fecha_programada': forms.DateTimeInput(
                format='%Y-%m-%dT%H:%M',
                attrs={'type': 'datetime-local', 'class': 'form-control'}
            ),
            'fecha_atencion': forms.DateTimeInput(attrs={'type': 'datetime-local', 'class': 'form-control'}),
            'estado_programacion': forms.NumberInput(attrs={'class': 'form-control'}),
            'entidad2': forms.NumberInput(attrs={'class': 'form-control'}),
        }
        labels = {
            'detalle_programacion': 'Detalle de las actividades a realizar', 
            'fecha_programada': 'Fecha y hora programada',  
            'descripcion_general': 'Descripción General de las actividades a realizar' 
         }
        
    
