from rest_framework import routers

from setup.views_api.entidad import EntidadRestViewSet

router = routers.DefaultRouter()
router.register(r'entidad', EntidadRestViewSet)
