
import os
import sys

if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
    import django


from django.db import models
from django.utils.translation import gettext_lazy as _

DERECHOS = (
    (1, 'ACCESO A LOS SERVICIOS DE SALUD'),
    (2, 'ACCESO A LA INFORMACIÓN'),
    (3, 'ATENCIÓN Y RECUPERACIÓN DE LA SALUD'),
    (4, 'CONSENTIMIENTO INFORMADO'),
    (5, 'PROTECCIÓN DE DERECHOS'),
    (6, 'OTROS')
)


class ClasificacionCausa(models.Model):
    """

    """
    codigo = models.CharField(_('Código'), max_length=4, unique=True)
    # derecho = models.CharField(_('Derecho'), max_length=100)
    categoria = models.PositiveIntegerField(_('Derecho'), choices=DERECHOS, default=1)
    causa = models.TextField(_('Causa'), max_length=150)
    definicion = models.TextField(_('Definición'), max_length=1000)
    definicion_corta = models.TextField(_('Definición corta'), max_length=500)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = _('Clasificación de causas')
        verbose_name_plural = _('Clasificaciones de causas')

    def __str__(self):
        return self.codigo
