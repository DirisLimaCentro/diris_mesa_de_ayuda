import os
import sys

from apps.reclamo.models.programacion import Programacion

if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
    pass

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.middlewares.request import AppRequestMiddleware
from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.util.network import get_client_ip
from setup.models.usuario import Usuario

NATURALEZAS = (
    (1, 'ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IAFAS'),
    (2, 'ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IPRESS'),
    (3, 'ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA UGIPRESS'),
    (4, 'ASISTENCIA (PRESTACIONAL)'),
    (5, 'ADMINISTRATIVA Y ASISTENCIAL'),
)

PROCESOS = (
    (1, 'AFILIACIÓN'),
    (2, 'ACREDITACIÓN'),
    (3, 'PRESTACIÓN DE SERVICIOS SALUD'),
    (4, 'LIQUIDACIÓN, COBRO O PAGO A USUARIO POR LOS SERVICIOS'),
    (5, 'CONTRALLACIÓN DE SERVICIOS DE SALUD DE UNA IAFAS A UNA IPRESS PARA ATENCIÓN DE SUS ASEGURADOS)'),
    (6, 'OTRO PROCESO'),
)


class MedidaAdoptada(models.Model):
    # Entidad
    entidad_reclamo = models.ForeignKey(EntidadReclamo, on_delete=models.CASCADE, related_name="medidas_adoptadas")
    codigo = models.CharField(_('Código de medida adoptada o por adoptar'), max_length=2, null=True, blank=True)
    descripcion = models.TextField(_('Breve Descripción de la medida adoptada o por adoptar'), max_length=500, null=True, blank=True)
    naturaleza = models.PositiveIntegerField(_('Naturaleza de la Medida adoptada'), choices=NATURALEZAS, null=True, blank=True)
    procesos = models.PositiveIntegerField(_('Proceso sobre el cual recae la Medida adoptada'), choices=PROCESOS, null=True, blank=True)
    fecha_inicio = models.DateField(_('Fecha de inicio de implementación'), null=True, blank=True)
    fecha_culminacion = models.DateField(_('Fecha de culminación provista'), null=True, blank=True)
    usuario_soporte = models.PositiveIntegerField(_('Personal de soporte'),  null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_ip = models.CharField(max_length=20, null=True, blank=True)
    updated_ip = models.CharField(max_length=20, null=True, blank=True)
     
    class Meta:
        verbose_name = _('Medida adoptada')
        verbose_name_plural = _('Medidas adoptadas')

    def get_usuario_soporte_nombre(self):
        if self.usuario_soporte:
            try:
                usuario = Usuario.objects.get(id=self.usuario_soporte)
                return f"{usuario.first_name} {usuario.last_name}".strip()
            except Usuario.DoesNotExist:
                return ""
        return ""
    

    def get_usuario_soporte_celular(self):
        if self.usuario_soporte:
            try:
                usuario = Usuario.objects.get(id=self.usuario_soporte)
                return usuario.celular or ""
            except Usuario.DoesNotExist:
                return ""
        return ""

    def get_usuario_soporte_email(self):
        if self.usuario_soporte:
            try:
                usuario = Usuario.objects.get(id=self.usuario_soporte)
                return usuario.email or ""
            except Usuario.DoesNotExist:
                return ""
        return ""
    

    def get_usuario_soporte_document(self):
        if self.usuario_soporte:
            try:
                usuario = Usuario.objects.get(id=self.usuario_soporte)
                return usuario.document or ""
            except Usuario.DoesNotExist:
                return ""
        return ""

    def __str__(self):
        return "%s - %s " % (self.codigo, self.get_naturaleza_display())

    def save(self, *args, **kwargs):
        current_request = AppRequestMiddleware.get_request()

        try:
            if self._state.adding:
                self.created_ip = get_client_ip(current_request)
                self.updated_ip = get_client_ip(current_request)
                from django.db.models import F
                from setup.models.entidad import Entidad
                Entidad.objects.filter(pk=self.entidad_reclamo.entidad_id).update(
                    numero_medidas_adoptados=F('numero_medidas_adoptados') + 1)
            else:
                self.updated_ip = get_client_ip(current_request)
        except KeyError:
            self.updated_ip = get_client_ip(current_request)
        super(MedidaAdoptada, self).save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        from django.db.models import F
        from setup.models.entidad import Entidad
        Entidad.objects.filter(pk=self.entidad_reclamo.entidad_id).update(
            numero_medidas_adoptados=F('numero_medidas_adoptados') - 1)
        super(MedidaAdoptada, self).delete()
