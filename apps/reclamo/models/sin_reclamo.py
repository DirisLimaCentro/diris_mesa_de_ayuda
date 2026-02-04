from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.middlewares.request import AppRequestMiddleware
from apps.reclamo.models.entidad_reclamo import MESES
from apps.util.anios import ANIOS
from apps.util.network import get_client_ip
from setup.models.entidad import Entidad
from setup.models.usuario import Usuario


class SinReclamo(models.Model):
    entidad = models.ForeignKey(Entidad, on_delete=models.CASCADE, related_name="sin_reclamos")
    anio = models.PositiveIntegerField(_('Año'), choices=ANIOS)
    periodo = models.PositiveIntegerField(_('Periodo'), choices=MESES)
    archivo = models.FileField(_('Archivo'))
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_ip = models.CharField(max_length=20, null=True, blank=True)
    updated_ip = models.CharField(max_length=20, null=True, blank=True)
    created_by = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='reclamo_created_by', null=True,
                                   blank=True)
    updated_by = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='reclamo_updated_by', null=True,
                                   blank=True)

    def __str__(self):
        return self.entidad.nombre

    def save(self, *args, **kwargs):
        current_request = AppRequestMiddleware.get_request()
        u = current_request.user

        try:
            if self._state.adding:
                self.created_by = u
                self.updated_by = u
                self.created_ip = get_client_ip(current_request)
                self.updated_ip = get_client_ip(current_request)
            else:
                self.updated_ip = get_client_ip(current_request)
                self.updated_by = u
        except KeyError:
            self.updated_ip = get_client_ip(current_request)
            self.updated_by = u
        super(SinReclamo, self).save(*args, **kwargs)

    class Meta:
        unique_together = ("entidad", "anio", "periodo")
        verbose_name = _('Sin reclamo')
        verbose_name_plural = _('Sin reclamo')
