import os
import sys

from apps.reclamo.models.entidad_reclamo import MESES
from apps.util.anios import ANIOS
from setup.models.periodo import Periodo

if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
    pass

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.middlewares.request import AppRequestMiddleware
from apps.util.network import get_client_ip
from setup.models.entidad import Entidad
from setup.models.rubro_calificacion import RubroCalificacion
from setup.models.usuario import Usuario


class EvaluacionAnexo1(models.Model):
    entidad = models.ForeignKey(Entidad, on_delete=models.CASCADE)
    anio = models.PositiveIntegerField(_('Año'), choices=ANIOS)
    periodo = models.PositiveIntegerField(_('Periodo'), choices=MESES)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_ip = models.CharField(max_length=20, null=True, blank=True)
    updated_ip = models.CharField(max_length=20, null=True, blank=True)
    created_by = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='created_by', null=True, blank=True)
    updated_by = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='updated_by', null=True, blank=True)

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
        super(EvaluacionAnexo1, self).save(*args, **kwargs)

    class Meta:
        unique_together = (("entidad", "anio", "periodo"),)
        verbose_name = _('Evaluación Anexo 1')
        verbose_name_plural = _('Evaluaciones Anexo 1')


class DetalleEvaluacionAnexo1(models.Model):
    evaluacion = models.ForeignKey(EvaluacionAnexo1, on_delete=models.CASCADE, null=True, blank=True)
    rubro = models.ForeignKey(RubroCalificacion, on_delete=models.CASCADE)
    calificacion = models.BooleanField(_('Calificación'), default=False)
    observacion = models.TextField(_('Observaciones'), max_length=700, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_ip = models.CharField(max_length=20, null=True, blank=True)
    updated_ip = models.CharField(max_length=20, null=True, blank=True)
    created_by = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='detalle_created_by', null=True,
                                   blank=True)
    updated_by = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='detalle_updated_by', null=True,
                                   blank=True)

    def __str__(self):
        return "%s -%s " % (self.calificacion, self.evaluacion_id)

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
        super(DetalleEvaluacionAnexo1, self).save(*args, **kwargs)

    class Meta:
        ordering = ['evaluacion', 'rubro__orden']
        verbose_name = _('Detalle evaluación Anexo 1')
        verbose_name_plural = _('Detalles Evaluacion Anexo 1')
