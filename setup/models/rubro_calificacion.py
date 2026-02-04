import os
import sys

if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
    import django

from django.db import models
from django.utils.translation import gettext_lazy as _


class RubroCalificacion(models.Model):
    orden = models.PositiveIntegerField(_('Orden'), unique=True)
    rubro = models.TextField(_('Rubro'), max_length=600)

    def __str__(self):
        return " %s - %s " % (self.orden, self.rubro)

    class Meta:
        ordering = ['orden']
        verbose_name = _('Rubros calificación')
        verbose_name_plural = _('Rubros calificación')
