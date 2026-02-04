from django.db import models
from django.db.models import Max
from setup.models.auto import Auto
from setup.models.chofer import Chofer
from setup.models.ris import Ris
from django.utils.translation import gettext_lazy as _


ESTADO_SERVICIO = (
    (0, 'SIN SERVICIO'),
    (1, 'REESTABLECIDO'),
    (2, 'INESTABLE')
)


TIPO_INCIDENCIA = (
    (1, 'CAIDA DE RED'),
    (2, 'INTERMITENCIA'),
    (3, 'LENTITUD')
)




class Monitoreo_internet(models.Model):
    id = models.AutoField(primary_key=True)
    entidad2 = models.IntegerField()
    ris  = models.ForeignKey(Ris, on_delete=models.CASCADE)
    distrito = models.CharField(max_length=500,null=True, blank=True)
    velocidad_inter = models.FloatField(null=True, blank=True)
    anexos = models.IntegerField(null=True, blank=True)
    fecha_hora_perdida = models.DateTimeField()
    fecha_hora_reestablecido = models.DateTimeField(null=True, blank=True)
    tiempo_sin_serv = models.FloatField(null=True, blank=True)  
    estado = models.IntegerField(null=True, blank=True,choices=ESTADO_SERVICIO)
    observacion = models.TextField(blank=True, null=True)
    tipo_incidencia = models.IntegerField(choices=TIPO_INCIDENCIA)
    cod_ticket_monitoreo = models.CharField(max_length=20, unique=True, blank=True, null=True)
    correo= models.EmailField(_('Correo electrónico para ser notificado:'), max_length=120,blank=True, null=True)
    evidencia = models.ImageField(
        upload_to='evidencias_monitoreo/',  # Carpeta dentro de MEDIA_ROOT
          blank=True, null=True,
        verbose_name='Evidencia (imagen)'
    )
    evidencia_2 = models.ImageField(
        upload_to='evidencias_monitoreo/',  # Carpeta dentro de MEDIA_ROOT
          blank=True, null=True,
        verbose_name='Evidencia reestablecimiento (imagen)'
    )
    cod_ticket_gtd=models.CharField(max_length=30, blank=True, null=True)


    class Meta:
        db_table = 'reclamo_monitoreo_internet'  # Aquí especificamos el nombre exacto de la tabla
        managed = False

    def __str__(self):
        return f"Reclamo {self.id} - Entidad {self.entidad}"
    
    def save(self, *args, **kwargs):
        # Generar cod_ticket_monitoreo solo si no existe
        if not self.cod_ticket_monitoreo:
            ultimo = Monitoreo_internet.objects.aggregate(
                max_cod=models.Max('cod_ticket_monitoreo')
            )['max_cod']

            if ultimo:
                # Extraer número del código anterior (ej. TKMR-0000007 → 7)
                try:
                    ultimo_num = int(ultimo.split('-')[1])
                except (IndexError, ValueError):
                    ultimo_num = 0
            else:
                ultimo_num = 0

            nuevo_num = ultimo_num + 1
            self.cod_ticket_monitoreo = f"TKMR-{nuevo_num:07d}"

        # Calcular tiempo sin servicio
        if self.fecha_hora_perdida and self.fecha_hora_reestablecido:
            diferencia = self.fecha_hora_reestablecido - self.fecha_hora_perdida
            self.tiempo_sin_serv = round(diferencia.total_seconds() / 3600, 2)
        else:
            self.tiempo_sin_serv = None

        super().save(*args, **kwargs)

