import os
import sys

if os.path.splitext(os.path.basename(sys.argv[0]))[0] == 'pydoc-script':
    pass

from django.contrib.auth.models import User
from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.middlewares.request import AppRequestMiddleware
from setup.models.usuario import Usuario
from apps.reclamo.models.clasificacion_causa import ClasificacionCausa
from apps.util.network import get_client_ip
from setup.models.entidad import Entidad
from setup.models.ris import Ris


MESES = (
    (1, 'ENERO'),
    (2, 'FEBRERO'),
    (3, 'MARZO'),
    (4, 'ABRIL'),
    (5, 'MAYO'),
    (6, 'JUNIO'),
    (7, 'JULIO'),
    (8, 'AGOSTO'),
    (9, 'SETIEMBRE'),
    (10, 'OCTUBRE'),
    (11, 'NOVIEMBRE'),
    (12, 'DICIEMBRE'),
)

TIPOS_ADMINISTRADOR = (
    (1, 'IPRESS'),
    (2, 'UGIPRESS'),
    (3, 'IAFAS'),
)

MEDIOS = (
    (1, 'VIRTUAL'),
    (2, 'FÍSICO'),
    (3, 'TELEFÓNICO'),
)

TIPOS_DOCUMENTO = (
    (1, 'DNI'),
    (2, 'CARNÉ DE EXTRANJERÍA'),
    (3, 'PASAPORTE'),
    (4, 'DOCUMENTO DE IDENTIDAD EXTRANJERO'),
    (5, 'CÓDIGO ÚNICO DE IDENTIFICACIÓN (CUI)'),
    (6, 'CERTIFICADO DE NACIDO VIVO'),
    (7, 'PERMISO TEMPORAL DE PERMANENCIA'),
    (8, 'RUC'),
    (9, 'OTROS'),
)

AUTORIZACION = (
    (0, 'SI'),
    (1, 'NO'),
)

MEDIOS_RECLAMO = (
    (1, 'LIBRO DE RECLAMACIONES VIRTUAL'),
    (2, 'LIBRO DE RECLAMACIONES FÍSICO'),
    (3, 'LLAMADA TELEFÓNICA'),
    (4, 'RECLAMO PRESENCIAL'),
    (5, 'DOCUMENTO ESCRITO'),
    (6, 'RECLAMO TRASLADO DE OTRA ADMINISTRADA'),
    (7, 'RECLAMO COPARTICIPADO CON OTRA ADMINISTRADA'),
)

SERVICIOS = (
    ('01', 'CONSULTA EXTERNA'),
    ('02', 'HOSPITALIZACIÓN'),
    ('03', 'EMERGENCIA'),
    ('04', 'CENTRO QUIRÚRGICO'),
    ('05', 'CENTRO OBSTÉTRICO'),
    ('06', 'UCI O UCIN'),
    ('07', 'FARMACIA'),
    ('08', 'SERVICIOS MÉDICOS DE APOYO'),
    ('09', 'ATENCIÓN A DOMICILIO CONSULTA AMBULATORIA'),
    ('10', 'ATENCIÓN A DOMICILIO URGENCIA A EMERGENCIA'),
    ('11', 'OFICINAS O ÁREAS ADMINISTRATIVAS DE IAFAS A 1 PRESS A UGIPRESS '),
    ('12', 'INFRAESTRUCTURA'),
    ('13', 'REFERENCIA Y CONTRAREFERENCIA'),
    ('77', 'Elija el servicio donde se originó el reclamo'),
)

COMPETENCIAS = (
    (1, 'SI'),
    (2, 'NO'),
    (3, 'COMPARTIDA'),
    (77, 'Elija la competencia para la atención del reclamo'),
)

ESTADOS_RECLAMO = (
    (1, 'RESUELTO'),
    (2, 'EN TRAMITE'),
    (3, 'TRASLADADO'),
    (4, 'ARCHIVADO POR DUPLICIDAD'),
    (5, 'ACUMULADO'),
    # (6, 'CONCLUIDO (CUANDO EL RESULTADO ES COMUNICADO AL RECLAMANTE O TERCERO LEGITIMADO)')
    (6, 'CONCLUIDO'),
    (77, 'Elija de estado del reclamo'),
    # Nuevos estados:
    (0, 'REGISTRADO'),

)

ETAPAS_RECLAMO = (
    (1, 'ADMISIÓN Y REGISTRO'),
    (2, 'EVALUACIÓN E INVESTIGACIÓN'),
    (3, 'RESULTADO Y NOTIFICACIÓN'),
    (4, 'ARCHIVO Y CUSTODIA DEL EXPEDIENTE'),
    (77, 'Eleija la etapa de reclamoo'),
)

RESULTADO_RECLAMO = (
    (1, 'FUNDADO'),
    (2, 'EVALUACIÓN E INVESTIGACIÓN'),
    (3, 'RESULTADO Y NOTIFICACIÓN'),
    (4, 'ARCHIVO Y CUSTODIA DEL EXPEDIENTE'),
)

RESULTADO_NOTIFICACION_RECLAMO = (
    (0, 'PENDIENTE'),
    (1, 'FUNDADO'),
    (2, 'FUNDADO PARCIAL'),
    (3, 'INFUNDADO'),
    (4, 'IMPROCEDENTE'),
    (5, 'CONCLUIDO ANTICIPADAMENTE')
)

MOTIVOS_CONCLUSION_ANTICIPADA = (
    (1, 'DESISTIMIENTO POR ESCRITO'),
    (2, 'TRATO DIRECTO'),
    (3, 'CONCILIACIÓN'),
    (4, 'TRANSACCIÓN EXTRAJUDICIAL'),
    (5, 'LAUDO ARBITRAL')
)

COMUNICACIONES_RESULTADO_RECLAMOS = (
    (1, 'DOMICILIO CONSIGNADO EN EL LIBRO DE RECLAMACIONES EN SALUD'),
    (2, 'CORREO ELECTRÓNICO'),
    (3, 'OTRA DIRECCIÓN PROPORCIONADA POR EL USUARIO O TERCERO LEGITIMADO A EFECTOS DE SER NOTIFICADO'),
    (4, 'NOTIFICACIÓN EXPRESADA POR EL USUARIO EN EL LIBRO DE RECLAMACIONES'),
    (5, 'AL TELÉFONO ACREDITADO POR EL USUARIO'),
    (6, 'NO SE LOGRA NOTIFICAR DEBIDO A IMPRECISIONES EN DIRECCIÓN-CORREO ATRIBUIBLES AL USUARIO')
)


PRIORIDADES=((1, '1'),
             (2, '2'),
              (3, '3') )


CARGO=((1, 'JEFE (A)'),
             (2, 'SECRETARIA(O)'),
             (3, 'COORDINADOR(A)'),
              (4, 'OTROS') )
              



TIPO_INCIDENCIA=((1, 'Problemas con computadoras'),
 
             (2, 'Problemas con Sistemas Institucionales (SIAF, SIGA, SGD, etc) '),
              (3, 'Conectividad y Redes'),
               (4, 'Impresoras y escáner'),
                (5, 'Software de Ofimática (Word, Excel, etc)'),
                (6, 'Problemas con SIHCE'),
                  (7, 'Otros'))

 

SEDES=(('Local Pinillos', 'Local Pinillos'),
             ('Local FAP', 'Local FAP'),
             ('Chorrillos', 'Chorrillos'),
              ('Surco', 'Surco'),
               ('Barranco', 'Barranco'),
                ('Villa Maria del Triunfo', 'Villa Maria del Triunfo'),
                 ('Villa El Salvador', 'Villa El Salvador'),
                  ('San Juan de Miraflores', 'San Juan de Miraflores'),
                   ('Lurín', 'Lurín'),
                    ('Pachacamac', 'Pachacamac'),
                     ('Almacén Central Chorrillos', 'Almacén Central Chorrillos'),
                      ('Almacén Citadela Lurín', 'Almacén Citadela Lurín'),
                       ('Almacén Archivo VES', 'Almacén Archivo VES') )



class EntidadReclamo(models.Model):
    # Usuario
    # usuario = models.ForeignKey(Usuario, verbose_name=_('Usuario'), null=True, blank=True,
    #                             on_delete=models.CASCADE)

    periodo = models.CharField(
        "Periodo de declaración", default="000000", max_length=6)
    entidad = models.ForeignKey(Entidad, verbose_name=_('Entidad'), related_name="reclamos",
                                null=True, blank=True, on_delete=models.CASCADE)

    # Entidad
    # periodo_declaracion = models.ForeignKey(Periodo, on_delete=models.CASCADE)
    # tipo_administrador = models.PositiveIntegerField(_('Tipo de administrado declarante'), choices=TIPOS_ADMINISTRADOR)
    # codigo_administrador = models.CharField(_('Código del administrado declarante'), max_length=8, null=True,
    #                                         blank=True)
    #  Código de entidad
    # codigo_ugipress = models.CharField(_('Código de la UGIPRESS regístrado en SUSALUD'), max_length=8, null=True,
    #                                    blank=True)


    dependencia_service = models.CharField(_('Dependencia:'), max_length=500,null=True, blank=True)

    dependencia_service_nombre = models.CharField(_(':'), max_length=500,null=True, blank=True)




    usuario_service = models.CharField(_('Usuario:'), max_length=60)
    usuario_service_nombre = models.CharField(_('Usuario:'), max_length=30,null=True, blank=True)

    dependencia_padre = models.CharField(_('Dependencia padre:'), max_length=30,null=True, blank=True)
    dependencia_padre_nombre =  models.CharField(_('Dependencia padre:'), max_length=30,null=True, blank=True)


    cargo_service =models.CharField(_('Cargo:'), max_length=30,null=True, blank=True)
    cargo_service_nombre=models.CharField(_('Cargo:'), max_length=100,null=True, blank=True)

 

    
    ############################

    nombres= models.CharField(_('Nombres y Apellidos del usuario que presenta el problema:'), max_length=80,null=True, blank=True
                                    )

    apellidos= models.CharField(_('Apellidos del usuario que presenta el problema:'), max_length=80,null=True, blank=True
                                           )


    dni= models.CharField(_('DNI'), max_length=8,null=True, blank=True)

    cargo = models.PositiveIntegerField(
        _('Cargo de quien presenta el problema:'), choices=CARGO,null=True, blank=True)
    
    tipo_incidencia = models.PositiveIntegerField(
        _('Tipo de incidencia:'), choices=TIPO_INCIDENCIA)

    unidad_organica= models.CharField(_('Subunidad Funcional o Estrategia:'), max_length=80,
                                           null=True, blank=True)

    detalle_solicitud = models.TextField(
        _('Detalle de la solicitud'), max_length=1500)
    

    codigo_ticket= models.CharField(_('Codigo de ticket:'), max_length=30,null=True, blank=True
                                    )
    
    celular= models.CharField(_('Celular:'), max_length=9 , null=True, blank=True)

    anydesk= models.CharField(_('Código de anydesk:'), max_length=15,null=True, blank=True)

    piso = models.PositiveIntegerField(('Piso:'))

    prioridad = models.PositiveIntegerField(('Prioridad:'))



    nombre= models.CharField(_(':'), max_length=120,
                                           null=True, blank=True)
    
    sede= models.CharField(_('Sede:'), max_length=80, null=True, blank=True)
    
    id_user = models.PositiveIntegerField(_('id_del_usuario'),
                                                   null=True, blank=True)
    


    valoracion_atencion = models.IntegerField(null=True, blank=True)
    observaciones_atencion = models.TextField(null=True, blank=True)
    fecha_atencion = models.DateTimeField(_('Fecha de Atencion'), null=True, blank=True)

    nombre_soporte= models.CharField(_(':'), max_length=80,
                                           null=True, blank=True)


    correo_usuario= models.EmailField(_('Correo electrónico para ser notificado:'), max_length=120 , null=True, blank=True)
 
    detalle_atencion = models.CharField(_('Detalle de la atención:'), max_length=800,
                                           null=True, blank=True)
    
    ris  = models.ForeignKey(Ris, on_delete=models.CASCADE,null=True, blank=True)

    entidad2 = models.IntegerField(null=True, blank=True)

    n_atenciones = models.PositiveIntegerField(('Número de atenciones:'))

    ##################################
    tipo_institucion = models.PositiveIntegerField(_('Tipo de institución donde se presentó el reclamo'),
                                                   choices=TIPOS_ADMINISTRADOR,null=True, blank=True)
    codigo_administrado = models.CharField(_('Código del administrado donde se presentó el reclamo'), max_length=30,
                                           null=True, blank=True)
    medio_presentacion = models.PositiveIntegerField(
        _('Medio presentación'), choices=MEDIOS,null=True, blank=True)
    codigo_registro = models.CharField(_('Código Único de Registro del Reclamo asignado por el administrado'),
                                       max_length=15,null=True, blank=True)

    # Usuario

    tipo_documento_usuario = models.PositiveIntegerField(
        _('Tipo de administrado declarante'), choices=TIPOS_DOCUMENTO, null=True, blank=True)
    numero_documento_usuario = models.CharField(_('Número del documento de identidad del usuario afectado'),
                                                max_length=15, null=True, blank=True)
    razon_social_usuario = models.CharField(
        _('Razón Social'), max_length=150, null=True, blank=True)
    nombres_usuario = models.CharField(
        _('Nombres'), max_length=150, null=True, blank=True)
    apellido_paterno_usuario = models.CharField(
        _('Apellido Paterno'), max_length=150, null=True, blank=True)
    apellido_materno_usuario = models.CharField(
        _('Apellido Materno'), max_length=150, null=True, blank=True)

    # Presenta el reclamo

    tipo_documento_presenta = models.PositiveIntegerField(
        _('Tipo de administrado declarante'), choices=TIPOS_DOCUMENTO, null=True, blank=True)
    numero_documento_presenta = models.CharField(_('Número del documento de identidad de quien presenta el reclamo'),
                                                 max_length=15, null=True, blank=True)
    razon_social_presenta = models.CharField(
        _('Razón Social'), max_length=150, null=True, blank=True)
    nombres_presenta = models.CharField(
        _('Nombres'), max_length=150, null=True, blank=True)
    apellido_paterno_presenta = models.CharField(
        _('Apellido Paterno'), max_length=150, null=True, blank=True)
    apellido_materno_presenta = models.CharField(
        _('Apellido Materno'), max_length=150, null=True, blank=True)

    autorizacion_notificacion_correo = models.IntegerField(
        _('Autorización de notificación del resultado al correo electrónico'), choices=AUTORIZACION, null=True, blank=True)
    correo_presenta = models.EmailField(
        _('Correo electrónico'), max_length=50, null=True, blank=True)
    domicilio_presenta = models.CharField(
        _('Domicilio'), max_length=100, null=True, blank=True)
    celular_presenta = models.CharField(
        _('Teléfono fijo o Celular'), max_length=30, null=True, blank=True)

    # Detalle del reclamo

    medio_recepcion_reclamo = models.PositiveIntegerField(
        _('Medio de recepción del reclamo'), choices=MEDIOS_RECLAMO,null=True, blank=True)
    fecha_reclamo = models.DateField(_('Fecha de presentación de Reclamo'), null=True, blank=True)
    detalle_reclamo = models.TextField(
        _('Detalle del reclamo'), max_length=1500,null=True, blank=True)

    # Gestión del reclamo
    servicio_hecho_reclamo = models.CharField(_('Servicio donde se efectuo el hecho que origino el reclamo'),
                                              choices=SERVICIOS, max_length=2, null=True, blank=True)

    competencia_reclamo = models.PositiveIntegerField(_('Competencia para la atencion del reclamo'),
                                                      choices=COMPETENCIAS, null=True, blank=True)
    clasificacion_reclamo_1 = models.ForeignKey(ClasificacionCausa, verbose_name=_('Clasificación del reclamo 1'),
                                                related_name="clasificacion_reclamo_1",
                                                on_delete=models.CASCADE, null=True, blank=True)
    clasificacion_reclamo_2 = models.ForeignKey(ClasificacionCausa, verbose_name=_('Clasificación del reclamo 2'),
                                                related_name="clasificacion_reclamo_2",
                                                on_delete=models.CASCADE, null=True, blank=True)
    clasificacion_reclamo_3 = models.ForeignKey(ClasificacionCausa, verbose_name=_('Clasificación del reclamo 3'),
                                                related_name="clasificacion_reclamo_3",
                                                on_delete=models.CASCADE, null=True, blank=True)
    estado_reclamo = models.PositiveIntegerField(
        _('Estado del reclamo'), choices=ESTADOS_RECLAMO, null=True, blank=True)
    codigo_reclamo_primigenio = models.CharField(_('Código de Reclamo Primigenio'), max_length=15, null=True,
                                                 blank=True)
    etapa_reclamo = models.PositiveIntegerField(
        _('Etapa del reclamo'), choices=ETAPAS_RECLAMO, null=True, blank=True)
    tipo_administrado_traslado = models.PositiveIntegerField(
        _('Tipo de Administrado a la que se deriva o  traslada el reclamo'), choices=TIPOS_ADMINISTRADOR, null=True,
        blank=True)
    codigo_administrado_deriva = models.CharField(_('Código del administrado a la que se deriva o traslada el reclamo'),
                                                  max_length=8, null=True, blank=True)

    # Resultado el reclamo
    resultado_reclamo = models.IntegerField(_('Resultado del Reclamo'), choices=RESULTADO_NOTIFICACION_RECLAMO,
                                            null=True, blank=True)
    motivo_conclusion_anticipada = models.PositiveIntegerField(_('Motivo de Conclusión anticipada'),
                                                               choices=MOTIVOS_CONCLUSION_ANTICIPADA,
                                                               null=True, blank=True)
    fecha_resultado_reclamo = models.DateField(
        _('Fecha de resultado del reclamo'), null=True, blank=True)
    '''comunicacion_resultado_reclamo = models.PositiveIntegerField(_('Comunicación de resultado del reclamo'),
                                                                 choices=COMUNICACIONES_RESULTADO_RECLAMOS,
                                                                 null=True, blank=True)
    fecha_notificacion = models.DateField(_('Fecha de notificación del resultado al usuario o tercero legitimado'),
                                          null=True, blank=True)'''
    es_mismo_usuario_afectado = models.BooleanField(
        _('Es el mismo usuario afectado ?'),   null=True, blank=True)
    expediente = models.FileField(_('Expediente'), null=True, blank=True)
    expediente2 = models.FileField(_('Documento'), null=True, blank=True)


    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_ip = models.CharField(max_length=20, null=True, blank=True)
    updated_ip = models.CharField(max_length=20, null=True, blank=True)

    # NOTIFICACION

    comunicacion_resultado_reclamo = models.PositiveIntegerField(_('Comunicación de resultado del reclamo'),
                                                                 choices=COMUNICACIONES_RESULTADO_RECLAMOS,
                                                                 null=True, blank=True)
    fecha_notificacion = models.DateField(_('Fecha de notificación del resultado al usuario o tercero legitimado'),
                                          null=True, blank=True)
    
    #TIENE MEDIDA ADOPTADA SI O NO

    tiene_medida =  models.BooleanField( default=False)

    #prioridades de clasificadores

    prioridad_clasificador_1 =  models.IntegerField( _('Prioridad clasificador 1'),choices=PRIORIDADES,null=True, blank=True)
    prioridad_clasificador_2 =  models.IntegerField( _('Prioridad clasificador 2'),choices=PRIORIDADES,null=True, blank=True)
    prioridad_clasificador_3 =  models.IntegerField( _('Prioridad clasificador 3'),choices=PRIORIDADES,null=True, blank=True)




    class Meta:
        verbose_name = _('Reclamo')
        verbose_name_plural = _('Reclamos')
        unique_together = ('entidad', 'codigo_registro',)
        ordering = ['-id']

    def __str__(self):
        return '%s - %s - %s | %s ' % (str(self.fecha_reclamo), self.codigo_registro, self.periodo, self.entidad.nombre)

    def save(self, *args, **kwargs):
        current_request = AppRequestMiddleware.get_request()

        if self.fecha_reclamo.month < 10:
            periodo = "0" + str(self.fecha_reclamo.month) + \
                str(self.fecha_reclamo.year)
        else:
            periodo = str(self.fecha_reclamo.month) + \
                str(self.fecha_reclamo.year)

        self.periodo = periodo

        try:
            if self._state.adding:
                
            # Generar código_ticket solo si no está asignado aún
                if not self.codigo_ticket:
                    last_ticket = EntidadReclamo.objects.order_by('-id').first()
                    next_number = 1 if not last_ticket else last_ticket.id + 1
                    self.codigo_ticket = f"TK-{next_number:05d}"

                from django.db.models import F
                Entidad.objects.filter(pk=self.entidad_id).update(
                    numero_reclamos=F('numero_reclamos') + 1)
                # self.created_by = u
                # self.updated_by = u
                self.created_ip = get_client_ip(current_request)
                self.updated_ip = get_client_ip(current_request)
            else:
                self.updated_ip = get_client_ip(current_request)
                # self.updated_by = u
        except KeyError:
            self.updated_ip = get_client_ip(current_request)
            # self.updated_by = u
        super(EntidadReclamo, self).save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        from django.db.models import F
        Entidad.objects.filter(pk=self.entidad_id).update(
            numero_reclamos=F('numero_reclamos') - 1)
        super(EntidadReclamo, self).delete()

    def get_usuario(self):
        if self.razon_social_usuario:
            return self.razon_social_usuario
        else:

            usuario_nombre = self.nombres_usuario if self.nombres_usuario else " - "
            usuario_apellido_uno = self.apellido_paterno_usuario if self.apellido_paterno_usuario else " - "
            usuario_apellido_dos = self.apellido_materno_usuario if self.apellido_materno_usuario else " - "

            return usuario_nombre + usuario_apellido_uno + usuario_apellido_dos

    def get_estado(self):
        from apps.reclamo.models.medida_adoptada import MedidaAdoptada
        list_medidas = MedidaAdoptada.objects.filter(entidad_reclamo=self.id)

        if len(list_medidas) == 0:
            return False
        else:
            return True

    def get_rowspan(self):
        from apps.reclamo.models.medida_adoptada import MedidaAdoptada
        count = MedidaAdoptada.objects.filter(entidad_reclamo=self.id).count()

        if count == 0:
            count = 2
        else:
            count += 1
        return count

    class Meta:
        db_table = 'reclamo_entidadreclamo'


class ApiRequestLog(models.Model):
    dni_consultado = models.CharField(max_length=8)
    nombre_consultado = models.CharField(max_length=255, blank=True, null=True)  # Nuevo campo para el nombre completo
    status_code = models.IntegerField()
    response_data = models.JSONField()  # para guardar el JSON de la respuesta
    ip_local = models.GenericIPAddressField()  # IP del PC local
    ip_publica = models.GenericIPAddressField()  # IP pública
    origen = models.CharField(max_length=100, default='sistema de reclamaciones')  # Origen con valor por defecto
    fecha_y_hora = models.DateTimeField(auto_now_add=True)
    fecha = models.DateField(auto_now_add=True)
    user_id = models.IntegerField(null=True, blank=True)  # Campo para el ID del usuario
    username = models.CharField(max_length=150, blank=True, null=True)
    nombre_pc = models.CharField(max_length=100, default='Desconocido')  # Nuevo campo para el nombre de la PC
    class Meta:
        db_table = 'reclamo_log_consulta'
