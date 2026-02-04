from django.db import models
from django.db.models import Max
from setup.models.auto import Auto
from setup.models.chofer import Chofer
from setup.models.ris import Ris
from django.utils.translation import gettext_lazy as _


class Programacion(models.Model):
    id = models.AutoField(primary_key=True)
    ris  = models.ForeignKey(Ris, on_delete=models.CASCADE)
    entidad_id = models.IntegerField( null=True, blank=True)
    entidad2 = models.IntegerField()
    distrito = models.CharField(_('Dirección'),max_length=500,null=True, blank=True)
    cantidad_personal = models.IntegerField(null=True, blank=True)
    detalle_programacion = models.TextField(max_length=2000)
    evidencia =  models.FileField(
        _('Evidencia'),
        upload_to='programacion/',   # carpeta dentro de MEDIA_ROOT
        null=True,
        blank=True
    )
    documento = models.FileField(
        _('Documento'),
        upload_to='programacion/',   # carpeta dentro de MEDIA_ROOT
        null=True,
        blank=True
    )
    comentario_atencion = models.TextField(max_length=2000, null=True, blank=True)
    fecha_programada = models.DateTimeField()
    fecha_atencion = models.DateTimeField(null=True, blank=True)
    estado_programacion = models.IntegerField(null=True, blank=True)
    codigo_programacion = models.CharField(max_length=20, unique=True, null=True, blank=True)
    chofer = models.ForeignKey(Chofer, on_delete=models.SET_NULL, null=True, blank=True)

    auto = models.ForeignKey(Auto, on_delete=models.SET_NULL, null=True, blank=True)
    descripcion_general = models.CharField(max_length=500)
    trabajo_realizado = models.TextField(max_length=4000, null=True, blank=True)
    recomendaciones = models.TextField(max_length=4000, null=True, blank=True)
    observaciones = models.TextField(max_length=4000, null=True, blank=True)
     

    class Meta:
        db_table = 'reclamo_programacion'  # nombre real de la tabla en MySQL
        managed = False   


    def save(self, *args, **kwargs):
        if not self.codigo_programacion:
            # Obtener el último código
            ultimo = Programacion.objects.aggregate(max_codigo=Max('codigo_programacion'))['max_codigo']

            if ultimo:
                # extraer el número
                ultimo_numero = int(ultimo.split('-')[1])
                nuevo_numero = ultimo_numero + 1
            else:
                nuevo_numero = 1

            self.codigo_programacion = f"PG-{nuevo_numero:05d}"

        super().save(*args, **kwargs)

        