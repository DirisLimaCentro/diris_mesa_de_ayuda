from django.db import models

class Sede(models.Model):
    id = models.AutoField(primary_key=True)  # campo entero autoincremental
    nombre_sede = models.CharField(max_length=50)

    class Meta:
        db_table = 'setup_sede'  # nombre de la tabla en la BD
        verbose_name = 'Sede'
        verbose_name_plural = 'Sedes'

    def __str__(self):
        return self.nombre_sede