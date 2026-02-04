# import os
# import sys

from django.db import models
from django.utils.translation import gettext_lazy as _

# if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
#     pass

CATEGORIAS = (
    (1, 'I-1'),
    (2, 'I-2'),
    (3, 'I-3'),
    (4, 'I-4'),
)

RIS = (
    (1, 'RIS BCO-CHO-SCO'),
    (2, 'RIS LURIN Y BALNERARIOS'),
    (3, 'RIS PACHACAMAC'),
    (4, 'RIS SJM'),
    (5, 'RIS VES'),
    (6, 'RIS VMT'),
    (7, 'DIRIS SEDE ADMINISTRATIVA'),
)

TIPOS = (
    (1, 'IPRESS'),
    (2, 'UGIPRESS'),
    (3, 'IAFAS'),
)


class Entidad(models.Model):
    nombre = models.CharField(_('nombre'), max_length=250)
    codigo = models.CharField(_('código'), max_length=150)
    categoria = models.PositiveIntegerField(_('Categoría'), choices=CATEGORIAS, default=1)
    ris = models.PositiveIntegerField(_('RIS'), choices=RIS, default=1)
    numero_reclamos = models.IntegerField("Número de reclamos", default=0)
    numero_medidas_adoptados = models.IntegerField("Número de medidas adoptadas", default=0)
    sede = models.CharField(_('sede'), max_length=250)
    codigo_sede = models.IntegerField("Codigo de sede", default=0)


    # numero_expedientes_enviados = models.IntegerField("Número de expedientes enviados", default=0)
    # tipo = models.PositiveIntegerField(_('Tipo'), choices=TIPOS, default=1)

    def __str__(self):
        return " %s  %s | %s - %s" % (self.nombre, self.codigo, self.get_ris_display(), self.get_categoria_display())

    class Meta:
        verbose_name = _('Entidad')
        verbose_name_plural = _('Entidades')

    # @property
    # def numero_expedientes_enviados(self):
    #
    #
    #
    #     numero_expedientes = self.reclamos.all().exclude(expediente=None).count()
    #     return numero_expedientes
