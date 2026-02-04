from django.db import models

class Auto(models.Model):
    id = models.AutoField(primary_key=True)
    cod_patrimonial = models.CharField(max_length=50, null=True, blank=True)
    placa = models.CharField(max_length=10, null=True, blank=True)
    clase = models.CharField(max_length=30, null=True, blank=True)
    marca = models.CharField(max_length=30, null=True, blank=True)
    modelo = models.CharField(max_length=50, null=True, blank=True)
    anio = models.CharField(max_length=4, null=True, blank=True)
    combustible = models.CharField(max_length=20, null=True, blank=True)
    estado_auto = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'setup_auto'   

    def __str__(self):
        # 👇 puedes personalizar lo que quieras mostrar
        return f"{self.placa} - {self.marca} {self.modelo}"