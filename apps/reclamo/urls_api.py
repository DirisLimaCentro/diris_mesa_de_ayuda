from rest_framework import routers

from apps.reclamo.views_api.clasificacion_causa import ClasificacionCausaRestViewSet
from apps.reclamo.views_api.entidad_reclamo import EntidadReclamoRestViewSet

router = routers.DefaultRouter()
router.register(r'reclamo', EntidadReclamoRestViewSet)
router.register(r'clasificacion-causa', ClasificacionCausaRestViewSet)
