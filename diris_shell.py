# python manage.py shell --settings=main.settings_main.dev
# exec(open('diris_shell.py').read())

# Actualizando cantidad de reclamos y medidas adoptadas

# from apps.reclamo.models.medida_adoptada import MedidaAdoptada
# from setup.models.entidad import Entidad
#
# entidades = Entidad.objects.all()
#
# for e in entidades:
#     reclamos = e.entidadreclamo_set.count()
#     medidas_adoptadas = MedidaAdoptada.objects.filter(entidad_reclamo__entidad=e).count()
#     e.numero_reclamos = reclamos
#     e.numero_medidas_adoptados = medidas_adoptadas
#     e.save()
