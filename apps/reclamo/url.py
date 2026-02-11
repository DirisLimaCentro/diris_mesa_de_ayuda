from django import views
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.urls import path, include 

from apps.reclamo.views.clasificacion_causa import get_clasificacion_autocomplete
from apps.reclamo.views.entidad_reclamo import  EntidadReclamoCreate_general, EntidadReclamoCreate_monitoreo, EntidadReclamoCreate_monitoreo_general, EntidadReclamoCreate_programacion, EntidadReclamoCreate_prueba, EntidadReclamoCreate_secretaria, EntidadReclamoDelete_monitoreo, EntidadReclamoDelete_programacion, EntidadReclamoList, EntidadReclamoCreate, EntidadReclamoList1, EntidadReclamoList2, EntidadReclamoList3, EntidadReclamoList_cerrados, EntidadReclamoList_encurso, EntidadReclamoList_general, EntidadReclamoList_monitoreo, EntidadReclamoList_monitoreo_general, EntidadReclamoList_programacion, EntidadReclamoList_programacion_atendidas, EntidadReclamoList_programacion_soporte, EntidadReclamoList_programacion_soporte_atendidas, EntidadReclamoList_secretaria, EntidadReclamoList_secretaria_cerrados, EntidadReclamoList_secretaria_encurso, EntidadReclamoList_sihce, EntidadReclamoList_sihce_cerrados, EntidadReclamoList_sihce_encurso, EntidadReclamoList_soporte, EntidadReclamoList_soporte_cerrados, EntidadReclamoList_soporte_encurso, EntidadReclamoUpdate
 
from apps.reclamo.views.entidad_reclamo import EntidadReclamoDelete, EntidadReclamoUpdate1, EntidadReclamoUpdate2, EntidadReclamoUpdate3, EntidadReclamoUpdate_general, EntidadReclamoUpdate_monitoreo, EntidadReclamoUpdate_programacion, EntidadReclamoUpdate_programacion_atendidas, EntidadReclamoUpdate_programacion_atendidas_soporte, EntidadReclamoUpdate_programacion_soporte, EntidadReclamoUpdate_secretaria, EntidadReclamoUpdate_secretaria_cerrados, EntidadReclamoUpdate_secretaria_encurso, EntidadReclamoUpdate_soporte, EntidadReclamoUpdate_soporte_cerrados, EntidadReclamoUpdate_soporte_encurso, EntidadReclamoUpdate_soporte_sihce, ReporteTicketPDFView, atender_reclamo, atender_reclamo_sihce,dar_por_atendido, dar_por_atendido_programacion, exportar_programacion_pdf, guardar_comentario,  guardar_expediente, guardar_expediente2, guardar_expediente_programacion, guardar_expediente_programacion2, guardar_expediente_programacion2_soporte, guardar_expediente_programacion_soporte, guardar_trabajo, guardar_trabajo_programacion, liberar_caso, reporte_monitoreo, reporte_monitoreo_internet_excel, reporte_programaciones, reporte_programaciones_atendidas_excel, valoracion_atencion,reporte_tickets_excel,EntidadReclamoList_redes,EntidadReclamoList_redes_encurso,EntidadReclamoList_redes_cerrados,listar_personas_por_dependencia
from apps.reclamo.views.medida_adoptada import MedidaAdoptadaCreate,MedidaAdoptadaCreate2, MedidaAdoptadaCreate_soporte,MedidaAdoptadaUpdate, MedidaAdoptadaDelete
from apps.reclamo.views.person_api import get_persona_by_dni
from apps.reclamo.views.reporte_excel import generate_excel_get_form, generate_excel_reclamos
from apps.reclamo.views.sin_reclamos import guardar_sin_reclamo
from django.conf.urls.static import static



app_name = 'reclamo'

urlpatterns = [

    path('validar-persona/<dni>', get_persona_by_dni, name='validar-persona'),
    path('entidad-reclamo/list', login_required(EntidadReclamoList.as_view()),
         name='entidad-reclamo-list'),

    path('list-encurso', login_required(EntidadReclamoList_encurso.as_view()),
         name='list-encurso'), 

     path('list-cerrados', login_required(EntidadReclamoList_cerrados.as_view()),
         name='list-cerrados'), 

    path('soporte-list-nuevos', login_required(EntidadReclamoList_soporte.as_view()),
         name='soporte-list-nuevos'),

     path('soporte-list-encurso', login_required(EntidadReclamoList_soporte_encurso.as_view()),
         name='soporte-list-encurso'),    

     path('soporte-list-cerrados', login_required(EntidadReclamoList_soporte_cerrados.as_view()),
         name='soporte-list-cerrados'),


    path('soporte-list-sihce', login_required(EntidadReclamoList_sihce.as_view()),
         name='soporte-list-sihce'),

     path('soporte-list-sihce-encurso', login_required(EntidadReclamoList_sihce_encurso.as_view()),
         name='soporte-list-sihce-encurso'),    

     path('soporte-list-sihce-cerrados', login_required(EntidadReclamoList_sihce_cerrados.as_view()),
         name='soporte-list-sihce-encurso'),


 
    path('soporte-list-sgd', login_required(EntidadReclamoList_redes.as_view()),
         name='soporte-list-sgd'),

    path('soporte-list-sgd-encurso', login_required(EntidadReclamoList_redes_encurso.as_view()),
         name='soporte-list-sgd-encurso'),    

     path('soporte-list-sgd-cerrados', login_required(EntidadReclamoList_redes_cerrados.as_view()),
         name='soporte-list-sgd-encurso'),

 
     path('secretaria-list-nuevos', login_required(EntidadReclamoList_secretaria.as_view()),
         name='secretaria-list-nuevos'),

     path('secretaria-list-encurso', login_required(EntidadReclamoList_secretaria_encurso.as_view()),
         name='secretaria-list-encurso'),

     path('secretaria-list-cerrados', login_required(EntidadReclamoList_secretaria_cerrados.as_view()),
         name='secretaria-list-cerrados'),

     path('general-list', login_required(EntidadReclamoList_general.as_view()),
         name='general-list'),    
     
     path('programacion-list-nuevos', login_required(EntidadReclamoList_programacion.as_view()),
         name='programacion-list-nuevos'),

    path('programacion-list-atendidas', login_required(EntidadReclamoList_programacion_atendidas.as_view()),
         name='programacion-list-atendidas'),


        path('programacion-list-nuevos-soporte', login_required(EntidadReclamoList_programacion_soporte.as_view()),
         name='programacion-list-nuevos-soporte'),

    path('programacion-list-soporte-atendidas', login_required(EntidadReclamoList_programacion_soporte_atendidas.as_view()),
         name='programacion-list-soporte-atendidas'),


    path('entidad-reclamo-registro/list', login_required(EntidadReclamoList1.as_view()),
         name='entidad-reclamo-registro/list'),

 
     path('entidad-reclamo-gestion/list', login_required(EntidadReclamoList2.as_view()),
         name='entidad-reclamo-gestion/list'),

    path('entidad-reclamo-concluidos/list', login_required(EntidadReclamoList3.as_view()),
 
         name='entidad-reclamo-concluidos/list'), 

 
 
    path('entidad-reclamo-new', login_required(EntidadReclamoCreate.as_view()),
         name='entidad-reclamo-new'),

path('entidad-reclamo-new-general', login_required(EntidadReclamoCreate_general.as_view()),
         name='entidad-reclamo-new-general'),

     path('entidad-reclamo-new-secretaria', login_required(EntidadReclamoCreate_secretaria.as_view()),
         name='entidad-reclamo-new-secretaria'),

path('monitoreo-list-nuevos', login_required(EntidadReclamoList_monitoreo.as_view()),
         name='monitoreo-list-nuevos'),

path('monitoreo-list-general', login_required(EntidadReclamoList_monitoreo_general.as_view()),
         name='monitoreo-list-general'),
      
    path('monitoreo-edit-nuevos/<pk>', login_required(EntidadReclamoUpdate_monitoreo.as_view()),
     name='monitoreo-edit-nuevos'),
      

     path('entidad-reclamo-new-programacion', login_required(EntidadReclamoCreate_programacion.as_view()),
         name='entidad-reclamo-new-programacion'),

        path('entidad-reclamo-new-monitoreo', login_required(EntidadReclamoCreate_monitoreo.as_view()),
         name='entidad-reclamo-new-monitoreo'),

         path('entidad-reclamo-new-monitoreo-general', login_required(EntidadReclamoCreate_monitoreo_general.as_view()),
         name='entidad-reclamo-new-monitoreo-general'),

          path('entidad-reclamo-new-prueba', login_required(EntidadReclamoCreate_prueba.as_view()),
         name='entidad-reclamo-new-prueba'),
      
    path('entidad-reclamo-edit/<pk>',
         login_required(EntidadReclamoUpdate.as_view()), name='entidad-reclamo-edit'),
    path('entidad-reclamo-edit-programacion/<pk>',
         login_required(EntidadReclamoUpdate_programacion.as_view()), name='entidad-reclamo-edit-programacion'),
    path('entidad-reclamo-edit-programacion-atendidas/<pk>',
         login_required(EntidadReclamoUpdate_programacion_atendidas.as_view()), name='entidad-reclamo-edit-programacion-atendidas'),

    path('entidad-reclamo-edit-programacion-soporte/<pk>',
         login_required(EntidadReclamoUpdate_programacion_soporte.as_view()), name='entidad-reclamo-edit-programacion-soporte'),
   
path('entidad-reclamo-edit-programacion-soporte-atendidas/<pk>',
         login_required(EntidadReclamoUpdate_programacion_atendidas_soporte.as_view()), name='entidad-reclamo-edit-programacion-soporte-atendidas'),
   

    path('entidad-reclamo-edit-soporte/<pk>',
         login_required(EntidadReclamoUpdate_soporte.as_view()), name='entidad-reclamo-edit-soporte'),
    path('entidad-reclamo-edit-soporte-sihce/<pk>',
         login_required(EntidadReclamoUpdate_soporte_sihce.as_view()), name='entidad-reclamo-edit-soporte-sihce'),
    path('entidad-reclamo-edit-soporte-encurso/<pk>',
         login_required(EntidadReclamoUpdate_soporte_encurso.as_view()), name='entidad-reclamo-edit-soporte-encurso'),
     path('entidad-reclamo-edit-soporte-cerrados/<pk>',
         login_required(EntidadReclamoUpdate_soporte_cerrados.as_view()), name='entidad-reclamo-edit-soporte-cerrados'),
     path('entidad-reclamo-edit-secretaria/<pk>',
         login_required(EntidadReclamoUpdate_secretaria.as_view()), name='entidad-reclamo-edit-secretaria'),
     path('entidad-reclamo-edit-secretaria-encurso/<pk>',
         login_required(EntidadReclamoUpdate_secretaria_encurso.as_view()), name='entidad-reclamo-edit-secretaria-encurso'),
     path('entidad-reclamo-edit-secretaria-cerrados/<pk>',
         login_required(EntidadReclamoUpdate_secretaria_cerrados.as_view()), name='entidad-reclamo-edit-secretaria-cerrados'),
     path('entidad-reclamo-edit-general/<pk>',
         login_required(EntidadReclamoUpdate_general.as_view()), name='entidad-reclamo-edit-general'),
    path('entidad-reclamo-edit1/<pk>',
         login_required(EntidadReclamoUpdate1.as_view()), name='entidad-reclamo-edit1'),
    path('entidad-reclamo-edit2/<pk>',
         login_required(EntidadReclamoUpdate2.as_view()), name='entidad-reclamo-edit2'),
    path('entidad-reclamo-edit3/<pk>',
         login_required(EntidadReclamoUpdate3.as_view()), name='entidad-reclamo-edit3'),
    path('entidad-reclamo-delete/<pk>',
         login_required(EntidadReclamoDelete.as_view()), name='entidad-reclamo-delete'),
     path('entidad-reclamo-delete-programacion/<pk>',
         login_required(EntidadReclamoDelete_programacion.as_view()), name='entidad-reclamo-delete-programacion'),
    path('entidad-reclamo-delete-monitoreo/<pk>',
         login_required(EntidadReclamoDelete_monitoreo.as_view()), name='entidad-reclamo-delete-monitoreo'),

    path('<reclamo_id>/medida-adoptada-new', login_required(MedidaAdoptadaCreate.as_view()),
         name='medida-adoptada-new'),

         path('<reclamo_id>/medida-adoptada-new-soporte', login_required(MedidaAdoptadaCreate_soporte.as_view()),
         name='medida-adoptada-new-soporte'),

path('<reclamo_id>/medida-adoptada-new2', login_required(MedidaAdoptadaCreate2.as_view()),
        name='medida-adoptada-new2'),

    path('<reclamo_id>/medida-adoptada-edit/<pk>', login_required(MedidaAdoptadaUpdate.as_view()),
         name='medida-adoptada-edit'),
 

    path('<reclamo_id>/medida-adoptada-delete/<pk>', login_required(MedidaAdoptadaDelete.as_view()),
         name='medida-adoptada-delete'),

    path('clasificacion/json', get_clasificacion_autocomplete,
         name='clasificacion-json'),

    path('reporte-excel', generate_excel_get_form, name='reporte-excel'),
    path('generar-excel', generate_excel_reclamos, name='generar-excel'),

    path('entidad-reclamo/guardar-expediente',
         guardar_expediente, name='guardar-expediente'),
     path('entidad-reclamo/guardar-expediente2',
         guardar_expediente2, name='guardar-expediente2'),
    path('entidad-reclamo/guardar-expediente3',
         dar_por_atendido, name='guardar-expediente3'),
     path('entidad-reclamo/guardar-expediente4',
         valoracion_atencion, name='guardar-expediente4'),
     path('entidad-reclamo/guardar-expediente5',
         liberar_caso, name='guardar-expediente5'),
     path('entidad-reclamo/guardar-expediente6',
         guardar_comentario, name='guardar-expediente6'),
     path('entidad-reclamo/guardar-trabajo',
         guardar_trabajo, name='guardar-trabajo'),

    path('entidad-reclamo/guardar-trabajo-soporte',
         guardar_trabajo_programacion, name='guardar-trabajo-soporte'),
    path('entidad-reclamo/guardar-sin-reclamo',
         guardar_sin_reclamo, name='guardar-sin-reclamo'),

     path('entidad-reclamo/guardar-expediente-programacion',
         guardar_expediente_programacion, name='guardar-expediente-programacion'),

     path('entidad-reclamo/guardar-expediente-programacion2',
         guardar_expediente_programacion2, name='guardar-expediente-programacion2'),

    path('entidad-reclamo/guardar-expediente-programacion-soporte',
         guardar_expediente_programacion_soporte, name='guardar-expediente-programacion-soporte'),

     path('entidad-reclamo/guardar-expediente-programacion2-soporte',
         guardar_expediente_programacion2_soporte, name='guardar-expediente-programacion2-soporte'),


     path('entidad-reclamo/atender-programacion',
         dar_por_atendido_programacion, name='atender-programacion'),

    path('entidad-reclamo/<int:id>/exportar-programacion-pdf/', 
        exportar_programacion_pdf , name='exportar-programacion-pdf'),

    path('entidad-reclamo/reporte-programaciones-pdf/', 
        reporte_programaciones , name='reporte-programaciones-pdf'),

    path('entidad-reclamo/reporte-monitoreo-pdf/', 
        reporte_monitoreo , name='reporte-monitoreo-pdf'),

    path(
    'entidad-reclamo/reporte-tickets-pdf/',
    ReporteTicketPDFView.as_view(),
    name='reporte-tickets-pdf'
),

path('entidad-reclamo/reporte-tickets-nuevos-excel/', 
        reporte_tickets_excel , name='reporte-tickets-nuevos-excel'),

 path('entidad-reclamo/reporte-programaciones-atendidas-excel/', 
        reporte_programaciones_atendidas_excel , name='reporte-programaciones-atendidas-excel'),

 path('entidad-reclamo/reporte-monitoreo-internet-excel/', 
        reporte_monitoreo_internet_excel , name='reporte-monitoreo-internet-excel'),


path('reporte-excel/pendientes', generate_excel_get_form,
         name='reporte-excel-pendientes'),

path('entidad-reclamo/atender/<int:pk>/', atender_reclamo, name='atender-reclamo') ,

path('entidad-reclamo/atender-sihce/<int:pk>/', atender_reclamo_sihce, name='atender-reclamo-sihce'),

    path("select2/", include("django_select2.urls")),

    path("ajax/personas-por-dependencia/", listar_personas_por_dependencia, name="personas-por-dependencia"),



]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
