from django.db import models

class Ris(models.Model):
    id = models.AutoField(primary_key=True)  # campo entero autoincremental
    denominacion = models.CharField(max_length=50)
    estado = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'setup_ris'  # nombre de la tabla en la BD
        verbose_name = 'Rises'
        verbose_name_plural = 'Rises'

    def __str__(self):
        return self.denominacion