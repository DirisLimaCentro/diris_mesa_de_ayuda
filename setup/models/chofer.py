from django.db import models

class Chofer(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, null=True, blank=True)
    condicion = models.CharField(max_length=50, null=True, blank=True)
    dni_chofer = models.CharField(max_length=15, null=True, blank=True)
    celular = models.CharField(max_length=9, null=True, blank=True)
    estado = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'setup_chofer'  

    def __str__(self):
        return self.nombre   