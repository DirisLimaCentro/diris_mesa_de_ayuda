-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: db_reclamos
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Administrador'),(2,'Encargado Sede');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Menu',1,'add_menu'),(2,'Can change Menu',1,'change_menu'),(3,'Can delete Menu',1,'delete_menu'),(4,'Can view Menu',1,'view_menu'),(5,'Can add Grupo Menu',2,'add_groupmenu'),(6,'Can change Grupo Menu',2,'change_groupmenu'),(7,'Can delete Grupo Menu',2,'delete_groupmenu'),(8,'Can view Grupo Menu',2,'view_groupmenu'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add País',6,'add_country'),(22,'Can change País',6,'change_country'),(23,'Can delete País',6,'delete_country'),(24,'Can view País',6,'view_country'),(25,'Can add department',7,'add_department'),(26,'Can change department',7,'change_department'),(27,'Can delete department',7,'delete_department'),(28,'Can view department',7,'view_department'),(29,'Can add province',8,'add_province'),(30,'Can change province',8,'change_province'),(31,'Can delete province',8,'delete_province'),(32,'Can view province',8,'view_province'),(33,'Can add district',9,'add_district'),(34,'Can change district',9,'change_district'),(35,'Can delete district',9,'delete_district'),(36,'Can view district',9,'view_district'),(37,'Can add Usuario',10,'add_usuario'),(38,'Can change Usuario',10,'change_usuario'),(39,'Can delete Usuario',10,'delete_usuario'),(40,'Can view Usuario',10,'view_usuario'),(41,'Can add Entidad',11,'add_entidad'),(42,'Can change Entidad',11,'change_entidad'),(43,'Can delete Entidad',11,'delete_entidad'),(44,'Can view Entidad',11,'view_entidad'),(45,'Can add log entry',12,'add_logentry'),(46,'Can change log entry',12,'change_logentry'),(47,'Can delete log entry',12,'delete_logentry'),(48,'Can view log entry',12,'view_logentry'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session'),(53,'Can add Entidad Reclamo',14,'add_entidadreclamo'),(54,'Can change Entidad Reclamo',14,'change_entidadreclamo'),(55,'Can delete Entidad Reclamo',14,'delete_entidadreclamo'),(56,'Can view Entidad Reclamo',14,'view_entidadreclamo'),(57,'Can add Entidad Reclamo',15,'add_medidaadoptada'),(58,'Can change Entidad Reclamo',15,'change_medidaadoptada'),(59,'Can delete Entidad Reclamo',15,'delete_medidaadoptada'),(60,'Can view Entidad Reclamo',15,'view_medidaadoptada'),(61,'Can add Clasificación de causas',16,'add_clasificacioncausa'),(62,'Can change Clasificación de causas',16,'change_clasificacioncausa'),(63,'Can delete Clasificación de causas',16,'delete_clasificacioncausa'),(64,'Can view Clasificación de causas',16,'view_clasificacioncausa'),(65,'Can add Periodo',17,'add_periodo'),(66,'Can change Periodo',17,'change_periodo'),(67,'Can delete Periodo',17,'delete_periodo'),(68,'Can view Periodo',17,'view_periodo'),(69,'Can add Rubros calificación',18,'add_rubrocalificacion'),(70,'Can change Rubros calificación',18,'change_rubrocalificacion'),(71,'Can delete Rubros calificación',18,'delete_rubrocalificacion'),(72,'Can view Rubros calificación',18,'view_rubrocalificacion'),(73,'Can add Evaluación Anexo 1',19,'add_evaluacionanexo1'),(74,'Can change Evaluación Anexo 1',19,'change_evaluacionanexo1'),(75,'Can delete Evaluación Anexo 1',19,'delete_evaluacionanexo1'),(76,'Can view Evaluación Anexo 1',19,'view_evaluacionanexo1'),(77,'Can add Detalle evaluación Anexo 1',20,'add_detalleevaluacionanexo1'),(78,'Can change Detalle evaluación Anexo 1',20,'change_detalleevaluacionanexo1'),(79,'Can delete Detalle evaluación Anexo 1',20,'delete_detalleevaluacionanexo1'),(80,'Can view Detalle evaluación Anexo 1',20,'view_detalleevaluacionanexo1');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_setup_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_setup_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `setup_usuario` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-05 21:01:08.486377','1','1101 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(2,'2021-02-05 21:05:14.263409','2','1102 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(3,'2021-02-05 21:07:43.021056','3','1103 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(4,'2021-02-05 21:09:40.605400','4','1104 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(5,'2021-02-08 13:33:25.619849','5','1105 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(6,'2021-02-08 13:35:31.903728','6','1106 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(7,'2021-02-08 13:36:50.365639','7','1107 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(8,'2021-02-08 13:37:34.750076','8','1108 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(9,'2021-02-08 13:39:38.336221','9','1109 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(10,'2021-02-08 13:41:49.195838','10','1110 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(11,'2021-02-08 13:43:03.136959','11','1111 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(12,'2021-02-08 13:45:00.070875','12','1112 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(13,'2021-02-08 13:46:24.210601','13','1113 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(14,'2021-02-08 13:47:13.976167','14','1114 - ACCESO A LOS SERVICIOS DE SALUD ',1,'[{\"added\": {}}]',16,1),(15,'2021-02-08 13:52:42.996047','15','1115 : ACCESO A LOS SERVICIOS DE SALUD - - DEFICIENTE\r\n- INFRAESTRUCTURA\r\n- FALTA DE  ASEO\r\n- FALTA DE MANTENIMIENTO ',1,'[{\"added\": {}}]',16,1),(16,'2021-02-08 13:54:01.928775','16','1116 : ACCESO A LOS SERVICIOS DE SALUD - - REFERENCIA Y CONTRA REFERENCIA\r\n- DEMORA\r\n- NEGATIVA\r\n- ERROR ',1,'[{\"added\": {}}]',16,1),(17,'2021-02-08 13:54:54.701661','17','1117 : ACCESO A LOS SERVICIOS DE SALUD - DEMORA ENLA TOMA OENTREGA DE RESSULTADO. ',1,'[{\"added\": {}}]',16,1),(18,'2021-02-08 13:55:35.257545','17','1117 : ACCESO A LOS SERVICIOS DE SALUD - DEMORA ENLA TOMA OENTREGA DE RESULTADO. ',2,'[{\"changed\": {\"fields\": [\"Definici\\u00f3n corta\"]}}]',16,1),(19,'2021-02-08 13:56:17.933594','13','1113 : ACCESO A LOS SERVICIOS DE SALUD - IPRESS CERRADA O AUSENCIA DEL PERSONAL DE SALUD RESPONSABLE DE LA ATENCIÓN. ',2,'[{\"changed\": {\"fields\": [\"Definici\\u00f3n corta\"]}}]',16,1),(20,'2021-02-08 13:57:46.341665','18','1118 : ACCESO A LOS SERVICIOS DE SALUD - ME COBRARON O HICIERON PAGAR DINERO QUE NO CORRESPONDE. ',1,'[{\"added\": {}}]',16,1),(21,'2021-02-08 13:58:43.680954','19','1119 : ACCESO A LOS SERVICIOS DE SALUD - NO CUENTAN CON VENTANILLA PREFERENCIAL. ',1,'[{\"added\": {}}]',16,1),(22,'2021-02-08 13:59:31.290721','20','1120 : ACCESO A LOS SERVICIOS DE SALUD - REPROGRAMACIÓN DE CITA SIN COMUNICACIÓN PREVIA AL PACIENTE. ',1,'[{\"added\": {}}]',16,1),(23,'2021-02-08 14:00:26.893882','21','1121 : ACCESO A LOS SERVICIOS DE SALUD - REPROGRAMACIÓN DE INERVENCIÓN QUIRÚRGICA. ',1,'[{\"added\": {}}]',16,1),(24,'2021-02-08 14:03:20.749992','22','1201 : ACCESO A LA INFORMACIÓN - NO ME DIERON INFORMACIÓN CLARA SOBRE:\r\n- ASUNTOS ADMINISTRATIVOS\r\n- TRATAMIENTO\r\n- GASTOS NO CUBIERTOS\r\n- EL MÉDICO TRATANTE\r\n- MIS DERECHOS ',1,'[{\"added\": {}}]',16,1),(25,'2021-02-08 14:04:44.159762','23','1203 : ACCESO A LA INFORMACIÓN - PERSONAL MÉDICO.\r\nINFORMACIÓN INSATISFACTORIA.\r\nNO BRINDA INFORMACIÓN. ',1,'[{\"added\": {}}]',16,1),(26,'2021-02-08 14:08:27.989099','24','1302 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - NO RECIBÍ UN TRATO AMABLE ',1,'[{\"added\": {}}]',16,1),(27,'2021-02-08 14:20:03.775552','25','1303 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - NO RECIBÍ UN TRATO AMABLE. ',1,'[{\"added\": {}}]',16,1),(28,'2021-02-08 14:21:06.632809','26','1304 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - MALA ATENCIÓN MÉDICA. ',1,'[{\"added\": {}}]',16,1),(29,'2021-02-08 14:22:22.633057','27','1305 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - TRATO DISCRIMINATORIO. ',1,'[{\"added\": {}}]',16,1),(30,'2021-02-08 14:23:30.959525','28','1306 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - NO ESTOY SATISFECHO CON MIS RESULTADOS. ',1,'[{\"added\": {}}]',16,1),(31,'2021-02-08 14:24:33.061791','29','1307 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - PRIVACIDAD DE LA ATENCIÓN. ',1,'[{\"added\": {}}]',16,1),(32,'2021-02-08 14:26:30.714046','30','1309 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - DEMORA EN EL ALTA DEL PACIENTE Y LA RETENCIÓN DEL CADÁVER. ',1,'[{\"added\": {}}]',16,1),(33,'2021-02-08 14:27:21.207677','31','1310 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - TRATO IMPROPIO. ',1,'[{\"added\": {}}]',16,1),(34,'2021-02-08 14:28:02.044261','32','1401 : CONSENTIMIENTO INFORMADO - NO ME EXPLICARON SOBRE PROCEDIMIENTO QUE ME IBAN A REALIZAR NI PIDIERON MI AUTORIZACIÓN. ',1,'[{\"added\": {}}]',16,1),(35,'2021-02-08 14:33:00.696691','33','1501 : PROTECCIÓN DE DERECHOS - ACCESO A LA HC Y LOS OTROS REGISTROS CLÍNICOS. ',1,'[{\"added\": {}}]',16,1),(36,'2021-02-08 14:34:22.343946','34','1502 : PROTECCIÓN DE DERECHOS - GESTIÓN DEL RECLAMO:\r\n- NO ME DAN INFORMACIÓN.\r\n- OBSTACULIZAR.\r\n- DEMORA EN ELPLAZO ESTABLECIDO. ',1,'[{\"added\": {}}]',16,1),(37,'2021-02-08 14:35:27.785857','35','1504 : PROTECCIÓN DE DERECHOS - NO TIENE PAUS ',1,'[{\"added\": {}}]',16,1),(38,'2021-02-08 14:36:20.566882','36','2001 : OTROS - OTROS RECLAMOS NO IDENTIFICADOS. ',1,'[{\"added\": {}}]',16,1),(39,'2021-02-08 14:56:54.003873','16','1116 : ACCESO A LOS SERVICIOS DE SALUD - REFERENCIA Y CONTRA REFERENCIA\r\n- DEMORA\r\n- NEGATIVA\r\n- ERROR ',2,'[{\"changed\": {\"fields\": [\"Definici\\u00f3n corta\"]}}]',16,1),(40,'2021-02-10 16:36:37.712141','1',' Usuario ',1,'[{\"added\": {}}]',1,1),(41,'2021-02-10 16:36:57.810817','2',' Reclamos ',1,'[{\"added\": {}}]',1,1),(42,'2021-02-10 16:37:12.766626','1','Administrador',1,'[{\"added\": {}}]',4,1),(43,'2021-02-10 16:37:15.854281','1','Administrador',1,'[{\"added\": {}}]',2,1),(44,'2021-02-10 16:37:23.608677','2','Encargado Sede',1,'[{\"added\": {}}]',4,1),(45,'2021-02-10 16:37:27.883035','2','Encargado Sede',1,'[{\"added\": {}}]',2,1),(46,'2021-02-10 17:04:18.109615','3',' Entidad ',1,'[{\"added\": {}}]',1,1),(47,'2021-02-10 19:30:06.570046','1',' DIRIS  000 ',1,'[{\"added\": {}}]',11,1),(48,'2021-02-10 19:35:17.445315','1','admin',2,'[{\"changed\": {\"fields\": [\"Entidad\", \"N\\u00famero de DNI\"]}}]',10,1),(49,'2021-02-11 21:05:49.100510','1',' 1 - Cuenta con Libro de Reclamaciones ',1,'[{\"added\": {}}]',18,1),(50,'2021-02-11 21:06:17.657246','2',' 2 - Libro de Reclamaciones (Físico o Virtual) ',1,'[{\"added\": {}}]',18,1),(51,'2021-02-11 21:07:12.667657','3',' 3 - Se ha designado mediante resolución del Titular de la entidad al responsable del Libro de Reclamaciones ',1,'[{\"added\": {}}]',18,1),(52,'2021-02-11 21:08:04.841212','4',' 4 - El Libro de Reclamaciones se encuentra en lugar visible y de fácil acceso ',1,'[{\"added\": {}}]',18,1),(53,'2021-02-11 21:08:44.933458','1',' Periodo 2021 - 1 ',1,'[{\"added\": {}}]',17,1),(54,'2021-02-11 21:11:01.715640','5',' 5 - Existen avisos en los que se indique la existencia de libro de reclamaciones y el derecho que poseen los usuarios para solicitarlo cuando los consideren conveniente ',1,'[{\"added\": {}}]',18,1),(55,'2021-02-11 21:11:46.257774','6',' 6 - N° total de reclamaciones en el periodo (enero-junio) o (julio-diciembre) ',1,'[{\"added\": {}}]',18,1),(56,'2021-02-11 21:12:16.260606','7',' 7 - N° de usuarios a los que se les proporcionó copia o constancia de su reclamo. ',1,'[{\"added\": {}}]',18,1),(57,'2021-02-11 21:12:55.355871','8',' 8 - N° de reclamaciones atendidas fuera del plazo de 30 días hábiles o no atendidas ',1,'[{\"added\": {}}]',18,1),(58,'2021-02-22 14:38:46.482452','6','02 - ADMINISTRATIVA Y ASISTENCIAL ',3,'',15,1),(59,'2021-02-22 14:38:46.492089','5','01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IAFAS ',3,'',15,1),(60,'2021-02-22 14:38:46.500813','4','01 - ADMINISTRATIVA Y ASISTENCIAL ',3,'',15,1),(61,'2021-02-22 14:38:46.507598','3','01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IPRESS ',3,'',15,1),(62,'2021-02-22 14:38:46.514133','2','01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IPRESS ',3,'',15,1),(63,'2021-02-22 14:38:46.521882','1','01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IAFAS ',3,'',15,1),(64,'2021-02-22 14:38:56.190278','7','EntidadReclamo object (7)',3,'',14,1),(65,'2021-02-22 14:38:56.199203','6','EntidadReclamo object (6)',3,'',14,1),(66,'2021-02-22 14:38:56.209141','5','EntidadReclamo object (5)',3,'',14,1),(67,'2021-02-22 14:38:56.219413','4','EntidadReclamo object (4)',3,'',14,1),(68,'2021-02-22 14:38:56.228076','3','EntidadReclamo object (3)',3,'',14,1),(69,'2021-02-22 14:38:56.235920','2','EntidadReclamo object (2)',3,'',14,1),(70,'2021-02-22 14:38:56.243903','1','EntidadReclamo object (1)',3,'',14,1),(71,'2021-02-22 16:00:58.549752','8','EntidadReclamo object (8)',3,'',14,1),(72,'2021-02-24 01:18:35.700791','10','EntidadReclamo object (10)',3,'',14,1),(73,'2021-02-24 01:18:35.714650','9','EntidadReclamo object (9)',3,'',14,1),(74,'2021-02-24 14:38:34.403032','4',' Evaluación ',1,'[{\"added\": {}}]',1,1),(75,'2021-02-24 14:38:48.162885','2','Encargado Sede',2,'[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]',2,1),(76,'2021-02-24 14:38:59.008587','1','Administrador',2,'[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'contenttypes','contenttype'),(6,'localizations','country'),(7,'localizations','department'),(9,'localizations','district'),(8,'localizations','province'),(16,'reclamo','clasificacioncausa'),(14,'reclamo','entidadreclamo'),(15,'reclamo','medidaadoptada'),(20,'reclamo_administrador','detalleevaluacionanexo1'),(19,'reclamo_administrador','evaluacionanexo1'),(13,'sessions','session'),(11,'setup','entidad'),(2,'setup','groupmenu'),(1,'setup','menu'),(17,'setup','periodo'),(18,'setup','rubrocalificacion'),(10,'setup','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-05 20:40:15.626015'),(2,'contenttypes','0002_remove_content_type_name','2021-02-05 20:40:15.775884'),(3,'auth','0001_initial','2021-02-05 20:40:15.911886'),(4,'auth','0002_alter_permission_name_max_length','2021-02-05 20:40:16.375691'),(5,'auth','0003_alter_user_email_max_length','2021-02-05 20:40:16.390659'),(6,'auth','0004_alter_user_username_opts','2021-02-05 20:40:16.406660'),(7,'auth','0005_alter_user_last_login_null','2021-02-05 20:40:16.422707'),(8,'auth','0006_require_contenttypes_0002','2021-02-05 20:40:16.426660'),(9,'auth','0007_alter_validators_add_error_messages','2021-02-05 20:40:16.442662'),(10,'auth','0008_alter_user_username_max_length','2021-02-05 20:40:16.478660'),(11,'auth','0009_alter_user_last_name_max_length','2021-02-05 20:40:16.494660'),(12,'auth','0010_alter_group_name_max_length','2021-02-05 20:40:16.659700'),(13,'auth','0011_update_proxy_permissions','2021-02-05 20:40:16.680659'),(14,'auth','0012_alter_user_first_name_max_length','2021-02-05 20:40:16.698662'),(15,'setup','0001_initial','2021-02-05 20:40:16.818954'),(16,'setup','0002_entidad_usuario','2021-02-05 20:40:36.186097'),(17,'admin','0001_initial','2021-02-05 20:40:45.113127'),(18,'admin','0002_logentry_remove_auto_add','2021-02-05 20:40:45.404075'),(19,'admin','0003_logentry_add_action_flag_choices','2021-02-05 20:40:45.428075'),(20,'reclamo','0001_initial','2021-02-05 20:40:45.599103'),(21,'sessions','0001_initial','2021-02-05 20:40:45.707220'),(22,'reclamo','0002_clasificacioncausa','2021-02-05 20:50:08.527434'),(23,'reclamo','0003_auto_20210205_1559','2021-02-05 20:59:32.819435'),(24,'reclamo','0004_clasificacioncausa_categoria','2021-02-08 13:48:04.462507'),(25,'reclamo','0005_remove_clasificacioncausa_derecho','2021-02-08 13:52:53.429303'),(26,'reclamo','0006_auto_20210208_1430','2021-02-08 19:30:10.773887'),(27,'setup','0003_auto_20210210_1123','2021-02-10 16:34:25.303036'),(28,'reclamo','0007_auto_20210210_1123','2021-02-10 16:34:25.939873'),(29,'setup','0004_entidad_ris','2021-02-10 19:27:43.199480'),(30,'reclamo','0008_auto_20210210_1427','2021-02-10 19:27:43.985306'),(31,'setup','0005_auto_20210210_1434','2021-02-10 19:34:59.979568'),(32,'setup','0006_auto_20210210_1437','2021-02-10 19:37:31.679727'),(33,'reclamo','0009_auto_20210210_1516','2021-02-10 20:16:24.304041'),(34,'reclamo','0010_auto_20210210_1532','2021-02-10 20:32:44.554074'),(35,'setup','0007_periodo','2021-02-10 20:54:10.156169'),(36,'setup','0008_auto_20210211_1555','2021-02-11 20:55:39.035752'),(37,'reclamo_administrador','0001_initial','2021-02-11 20:57:50.205254'),(38,'reclamo','0011_auto_20210212_1132','2021-02-12 16:32:36.606024'),(39,'reclamo','0012_auto_20210222_0928','2021-02-22 14:28:21.988543'),(40,'setup','0009_entidad_tipo','2021-02-22 14:28:22.203427'),(41,'reclamo','0013_auto_20210222_0939','2021-02-22 14:39:24.875891'),(42,'reclamo','0014_auto_20210222_0950','2021-02-22 14:50:42.154273'),(43,'reclamo','0015_auto_20210222_1059','2021-02-22 16:06:55.700905'),(44,'reclamo','0016_auto_20210222_1117','2021-02-22 16:17:27.372830'),(45,'reclamo','0017_auto_20210222_1201','2021-02-22 17:01:58.576311'),(46,'reclamo','0018_auto_20210222_1244','2021-02-22 17:44:36.159061'),(47,'reclamo','0019_auto_20210223_2009','2021-02-24 01:09:35.393800'),(48,'reclamo','0020_entidadreclamo_es_mismo_usuario_afectado','2021-02-24 16:24:02.097289');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('11lrv2dp8u7syqn4o2l2is8zg9g0u6z3','.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEITX:L5LQDsziMHQr8ipbr7cA4jCflkeK3NrnWNJwy4As_v8','2021-03-08 21:10:39.423456'),('3o14uj08zo3mdzo094xbwetexm3ylx4k','.eJxdkctugzAQRf_F6xTMU9Bl1SyyqFQl6qqt0GA7wSnYyNiRqij_3iG4gYQVPtc-vgxnUoGzTeUGYSrJyTOJyGrJamA_Qo0BP4I66IBpZY2sg3FL4NMheNNctC9-752ggaHB03mGT8wjSCMWQwoZY2kWFwnESU1jmkMGZbLPiiKHKBcFpVBGZUKjNI1LxmqK0qtu79q2UtAJdALvpMJAKCs58ErprjZj8LrZbnaLwMpeI968b9e7JWeay8OYUEoXeJxDtCKdUI48f56JX_tbPwYHRuqxkGlxHQ7Cuj50Ew5bOVjMJM4Jw7EzuawmR3xzbAVrodPDLDETCX2Hp__1vU78ipstudnW05nHRl71oGh0NzvS2XGC1gGTX47SfaJml_CBVo9duLTk8j3NqepAwQG_Ff8Ks_IkiOc9WIlFkM_EXAFOozf6KBi-08sf8f7SmA:1lEyPq:op2EuoKxO1e3mEki77FPBkNYNeCWSYgYnV8lo3_Ec_0','2021-03-10 17:57:38.224077'),('6475y3jie3z5a2mj80mvvgsrhdna8izz','.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3MucucORNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63yfwkia5P3qxU_XN8ewfowHfYXRZ4uGSQM8Ehh0KIvOBVBjxrKaclFFBnu6KqSmClqiiFmtUZZXnOayFaitAzbjf1fWNgUMgEOWiDhjJBS5CNsUPrZuNls9283xjzYmxFBmUmsv48klhHzIefwGk7T3A91qlXYRrTaZHTXvuAnsbF0ZxDkNNqYfALY6tED4P1V4hblDRmePqv73HqV11o2YX2uvQ8JoqoB0Rnsef0tazXDGBgjxHxd0TQP4pEfYSgsR_1q-LOAo4dnT0ogXd6-gM2jaxj:1lAJ3C:nzj2jP0GyBBSjMF2mKv21ilZAXJmdqz9fs-9knvEoLg','2021-02-25 20:58:58.553261'),('6gs5m1u3bwwxryom91b14iim14xeg5af','.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1l9w1r:n2gCW5vQstKnOuKNlEd-ASkqb51ix_fqzL369yjVbpo','2021-02-24 20:24:03.270180'),('7dla9lyyqs0u6y33iph6tpkopmutif1w','.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lCQXp:gNMXjCJBviDqv2JeM6vPgeUzPayJ_4W4j8RqmVzhP4M','2021-03-03 17:23:21.603509'),('8gb5gq84nbu6cm4hda115tg1rbze3nn4','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9D9D:ys_DvM6hTH1kpEWnGVv9iB-ud7hk16siA0T-EKnKSrg','2021-02-22 20:28:39.762624'),('8km8kn39cm7r00dwa16jhy1apnyjkkfh','.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEim6:5TFcyQi08R_EFjTUlPhVRfOh7uN3f8lqKpIAnJ4YzQg','2021-03-10 01:15:34.331133'),('feinnzqcrl3nscwrvgym5alavolhmcjs','.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lD63S:Qkk70_YxWp_PFLyhfdd9HkBGRaprbngMp6hud1WxQ74','2021-03-05 13:42:46.863086'),('jp0v7zb4ugmtrwe1wxw1uzcdb3y11oxq','.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEirH:n9O6uicZeqUzNuprb3-qrQ9P4q1sn7XRkjS8kMbDFjo','2021-03-10 01:20:55.828453'),('nq3evzzceo11sser9zemjct4riwih4q7','.eJxdkMtuwyAURP-FtWtj_JCdZdQusugmVVdVha6BxKQ2RDwqVVH-vdexmzRhBTPM4Q4nwiGGnkevHNeSrEhOkv9aB-JLmcmQBzB7mwprgtNdOl1JF9enr1aqYb3cvQP04HtM1xUuJnMoc8GghEqIsmJNAazoKKM1VNAWu6ppashr1VAKbd4WNC9L1grRUYRecLs4DNzAqJAJctQGjVGZSFYfJzIVyBOy2O8-gtN2SroBz5lXIR6zOMvZoH1AT2MhNCc4OSczg10ZWyUGGK2_QdysZMoELUE-_Z3vcepHXWnFlfYyZx4nWlAPiN5i5vw51-MjGNjjiNhaBP2tltr8CEFjHvWb4i4Cljg6e1AC9zQhyyPc2LFz0zDPm-3mjdyMy-edfwFSe6xi:1lCNye:8t2qp5rvVEoriJokBi-rPfKj7Y86tuLFyW79XurC5Lg','2021-03-03 14:38:52.765117'),('ps3xyycw40487ih585njjhseoxmiqip7','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9HlZ:q0duARw4gKWXh-r5SnUehBw8oiEhBax6miJP3uwPXe8','2021-02-23 01:24:33.116094'),('qj6m1nprr6rbm3295oa8qezp1fzmm8w7','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9EZL:x0LD3relZ4opYCIRKFNVs6UxHrOwxGtGV-wwlHEuoM4','2021-02-22 21:59:43.910873'),('r03nktlspdduuxa2c9tbnxi4vrih0css','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9GAc:kgwimmET5NEKnXoEkTuTOKixa3jknLnEd8xY9icFcA4','2021-02-22 23:42:18.301425'),('s1seedzxx1p0gfuctl56a70ie0o59ku8','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l87vl:7Crm6gVUPt7gAMNskndwoU8Gn0xXzTlfUgrfBL2Y-lA','2021-02-19 20:42:17.605090'),('sgudoz5lukm3gb08qpamxwsma2idoct8','.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3MucucORNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63yfwkia5P3qxU_XN8ewfowHfYXRZ4uGSQM8Ehh0KIvOBVBjxrKaclFFBnu6KqSmClqiiFmtUZZXnOayFaitAzbjf1fWNgUMgEOWiDhjJBS5CNsUPrZuNls9283xjzYmxFBmUmsv48klhHzIefwGk7T3A91qlXYRrTaZHTXvuAnsbF0ZxDkNNqYfALY6tED4P1V4hblDRmePqv73HqV11o2YX2uvQ8JoqoB0Rnsef0tazXDGBgjxHxd0TQP4pEfYSgsR_1q-LOAo4dnT0ogXd6-gM2jaxj:1lCnPg:L7QSCLGdkZCgKukDC9a62hWshEAaCZpjtxLLMUeZs3o','2021-03-04 17:48:28.133504'),('t0gf6okisc9yxa7dsnr2h03g2kgzmsc1','.eJxdkc1uwjAQhN_FZ5o4v0o4onLgUKkC9dRW0cY2xDSxI8dGqhDv3g1xCeBTdmb9ZXZ9JhU421RuEKaSnCxJRBb3Wg3sR6jR4EdQBx0wrayRdTC2BN4dgjfNRbvyvQ-ABoYGb-cZnphHkEYshhQyxtIsLhKIk5rGNIcMymSfFUUOUS4KSqGMyoRGaRqXjNUUoVfc3rVtpaATyATeSYWGUFZy4JXSXW1G43Wz3ezujHGwaEE6oRxZfp6Jrz3mY3BgpB7_YFqsw0FY14duksNWDhY9iYOjOYYgl8XEiG-MrWAtdHqYIWZSQp_h5b9-xIlfcaMlN9p6uvOcyKOeEI3uZkY6M07QOmDyy1G6T9TMEt7Q6jkLl5Zcvqc9VR0oOOCsuGZm5UkQr_dgJQZBfVbMVcBt9EYfBcNvOi_fyl5j9-Z9u97dPwrTXB5Gh1JKLn-ZadKY:1lExK6:yGS-TMjgkphBOTP7tV_qGf0pr1m-o80nMWVWxXBxVI4','2021-03-10 16:47:38.999667'),('uijf9ezibl93djirg47x7n5fizo04f4y','.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEihb:BcuNPOJNrovxJnBKF1vvPOTvWkxzbYMt0Nah9Q_T7xM','2021-03-10 01:10:55.520874'),('vrg2si2h8t0hpcakbdm557rgw0aervd2','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l96av:-LDQ77_ohhw7BigS7DgI_jW3Sd-9vpi2xpcJEBVOBfw','2021-02-22 13:28:49.069533'),('wd9hbe4ni2hxudlgw3h4vczjkwfyo0c1','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l88gK:RFcLnqSIvOQFhhyGYB4Ty_4_gmruoxaZ-KcQIHpYqCE','2021-02-19 21:30:24.275883'),('wsf0871nh6i8z36ie5i85bsxdlne8z49','.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEIRf:kWEyeA6jow2rmYYSwa4DGgxIBW3pkVHwlbU_TQJ-gio','2021-03-08 21:08:43.254749'),('y7f9fit1ru7hmcmn73v6enywi88ab7mg','.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lAfaJ:TQ9FayuYF6S--kEh2hcYKfvzdbKJVB-gs1Lbtqxu4PQ','2021-02-26 21:02:39.074398'),('z1xshp8xm3ukc3z5yzs78c4o8jhc7z0i','.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l96Uu:5HiMyZYTEgaihHKyyG10mDPwTFfiZJ8Gs-cHb_aMh44','2021-02-22 13:22:36.040300'),('zth4i0vn9xpdjanzwv541txx0pjauh39','.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lC14G:htjT89WKLrum3E4g5arx_0zQOkmBJLp0gkjwCY7Z4R0','2021-03-02 14:11:08.643579');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo_administrador_detalleevaluacionanexo1`
--

DROP TABLE IF EXISTS `reclamo_administrador_detalleevaluacionanexo1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `reclamo_administrador_detalleevaluacionanexo1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calificacion` tinyint(1) NOT NULL,
  `observacion` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `evaluacion_id` int DEFAULT NULL,
  `rubro_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reclamo_administrado_created_by_id_ea94a849_fk_setup_usu` (`created_by_id`),
  KEY `reclamo_administrado_evaluacion_id_9a7d5d1f_fk_reclamo_a` (`evaluacion_id`),
  KEY `reclamo_administrado_rubro_id_73d4aa45_fk_setup_rub` (`rubro_id`),
  KEY `reclamo_administrado_updated_by_id_41785d6f_fk_setup_usu` (`updated_by_id`),
  CONSTRAINT `reclamo_administrado_created_by_id_ea94a849_fk_setup_usu` FOREIGN KEY (`created_by_id`) REFERENCES `setup_usuario` (`id`),
  CONSTRAINT `reclamo_administrado_evaluacion_id_9a7d5d1f_fk_reclamo_a` FOREIGN KEY (`evaluacion_id`) REFERENCES `reclamo_administrador_evaluacionanexo1` (`id`),
  CONSTRAINT `reclamo_administrado_rubro_id_73d4aa45_fk_setup_rub` FOREIGN KEY (`rubro_id`) REFERENCES `setup_rubrocalificacion` (`id`),
  CONSTRAINT `reclamo_administrado_updated_by_id_41785d6f_fk_setup_usu` FOREIGN KEY (`updated_by_id`) REFERENCES `setup_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo_administrador_detalleevaluacionanexo1`
--

LOCK TABLES `reclamo_administrador_detalleevaluacionanexo1` WRITE;
/*!40000 ALTER TABLE `reclamo_administrador_detalleevaluacionanexo1` DISABLE KEYS */;
INSERT INTO `reclamo_administrador_detalleevaluacionanexo1` VALUES (1,0,'Sin observación','2021-02-11 21:09:09.491256','2021-02-11 21:13:33.347350','181.177.233.38','181.177.233.38',1,1,1,1),(2,1,'','2021-02-11 21:09:09.508319','2021-02-11 21:13:33.369594','181.177.233.38','181.177.233.38',1,1,2,1),(3,0,'','2021-02-11 21:09:09.528814','2021-02-11 21:13:33.390357','181.177.233.38','181.177.233.38',1,1,3,1),(4,0,'','2021-02-11 21:09:09.548139','2021-02-11 21:13:33.409910','181.177.233.38','181.177.233.38',1,1,4,1),(5,0,'','2021-02-11 21:13:12.067059','2021-02-11 21:13:33.430531','181.177.233.38','181.177.233.38',1,1,5,1),(6,0,'','2021-02-11 21:13:12.082661','2021-02-11 21:13:33.450860','181.177.233.38','181.177.233.38',1,1,6,1),(7,1,'Dudoso','2021-02-11 21:13:12.105123','2021-02-11 21:13:33.472044','181.177.233.38','181.177.233.38',1,1,7,1),(8,0,'','2021-02-11 21:13:12.121001','2021-02-11 21:13:33.493244','181.177.233.38','181.177.233.38',1,1,8,1),(9,0,'S/O','2021-02-11 21:14:18.995641','2021-02-11 21:14:18.995701','181.177.233.38','181.177.233.38',1,2,1,1),(10,1,'','2021-02-11 21:14:19.021556','2021-02-11 21:14:19.021617','181.177.233.38','181.177.233.38',1,2,2,1),(11,0,'','2021-02-11 21:14:19.045508','2021-02-11 21:14:19.045567','181.177.233.38','181.177.233.38',1,2,3,1),(12,1,'','2021-02-11 21:14:19.068875','2021-02-11 21:14:19.068934','181.177.233.38','181.177.233.38',1,2,4,1),(13,0,'','2021-02-11 21:14:19.095776','2021-02-11 21:14:19.095898','181.177.233.38','181.177.233.38',1,2,5,1),(14,1,'','2021-02-11 21:14:19.124013','2021-02-11 21:14:19.124082','181.177.233.38','181.177.233.38',1,2,6,1),(15,1,'SOSO','2021-02-11 21:14:19.145365','2021-02-11 21:14:19.145422','181.177.233.38','181.177.233.38',1,2,7,1),(16,0,'','2021-02-11 21:14:19.165957','2021-02-11 21:14:19.166013','181.177.233.38','181.177.233.38',1,2,8,1),(17,1,'','2021-02-12 17:22:12.969506','2021-02-12 17:22:12.969562','181.177.233.38','181.177.233.38',1,3,1,1),(18,0,'Observación 1','2021-02-12 17:22:12.984731','2021-02-12 17:22:12.984791','181.177.233.38','181.177.233.38',1,3,2,1),(19,1,'','2021-02-12 17:22:12.999490','2021-02-12 17:22:12.999533','181.177.233.38','181.177.233.38',1,3,3,1),(20,0,'','2021-02-12 17:22:13.016542','2021-02-12 17:22:13.016586','181.177.233.38','181.177.233.38',1,3,4,1),(21,1,'','2021-02-12 17:22:13.030624','2021-02-12 17:22:13.030689','181.177.233.38','181.177.233.38',1,3,5,1),(22,0,'','2021-02-12 17:22:13.049528','2021-02-12 17:22:13.049583','181.177.233.38','181.177.233.38',1,3,6,1),(23,1,'','2021-02-12 17:22:13.063186','2021-02-12 17:22:13.063235','181.177.233.38','181.177.233.38',1,3,7,1),(24,0,'','2021-02-12 17:22:13.089958','2021-02-12 17:22:13.090006','181.177.233.38','181.177.233.38',1,3,8,1),(25,0,'','2021-02-16 13:10:28.626441','2021-02-16 13:10:34.499403','181.177.233.38','181.177.233.38',1,4,1,1),(26,0,'','2021-02-16 13:10:28.641852','2021-02-16 13:10:34.524058','181.177.233.38','181.177.233.38',1,4,2,1),(27,0,'','2021-02-16 13:10:28.657381','2021-02-16 13:10:34.549121','181.177.233.38','181.177.233.38',1,4,3,1),(28,0,'','2021-02-16 13:10:28.674458','2021-02-16 13:10:34.574822','181.177.233.38','181.177.233.38',1,4,4,1),(29,1,'','2021-02-16 13:10:28.690698','2021-02-16 13:10:34.602447','181.177.233.38','181.177.233.38',1,4,5,1),(30,0,'','2021-02-16 13:10:28.706957','2021-02-16 13:10:34.626688','181.177.233.38','181.177.233.38',1,4,6,1),(31,0,'','2021-02-16 13:10:28.723131','2021-02-16 13:10:34.651080','181.177.233.38','181.177.233.38',1,4,7,1),(32,0,'','2021-02-16 13:10:28.738728','2021-02-16 13:10:34.674034','181.177.233.38','181.177.233.38',1,4,8,1),(33,1,'123','2021-02-24 14:40:16.702676','2021-02-24 14:40:16.702749','181.177.233.38','181.177.233.38',1,5,1,1),(34,1,'123','2021-02-24 14:40:16.722388','2021-02-24 14:40:16.722451','181.177.233.38','181.177.233.38',1,5,2,1),(35,1,'123','2021-02-24 14:40:16.740438','2021-02-24 14:40:16.740499','181.177.233.38','181.177.233.38',1,5,3,1),(36,0,'','2021-02-24 14:40:16.759848','2021-02-24 14:40:16.759905','181.177.233.38','181.177.233.38',1,5,4,1),(37,0,'123','2021-02-24 14:40:16.778710','2021-02-24 14:40:16.778765','181.177.233.38','181.177.233.38',1,5,5,1),(38,0,'123','2021-02-24 14:40:16.796225','2021-02-24 14:40:16.796278','181.177.233.38','181.177.233.38',1,5,6,1),(39,0,'123','2021-02-24 14:40:16.812412','2021-02-24 14:40:16.812467','181.177.233.38','181.177.233.38',1,5,7,1),(40,0,'','2021-02-24 14:40:16.828999','2021-02-24 14:40:16.829051','181.177.233.38','181.177.233.38',1,5,8,1);
/*!40000 ALTER TABLE `reclamo_administrador_detalleevaluacionanexo1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo_administrador_evaluacionanexo1`
--

DROP TABLE IF EXISTS `reclamo_administrador_evaluacionanexo1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `reclamo_administrador_evaluacionanexo1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `entidad_id` int NOT NULL,
  `periodo_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reclamo_administrado_created_by_id_2c043da6_fk_setup_usu` (`created_by_id`),
  KEY `reclamo_administrado_entidad_id_a19bb982_fk_setup_ent` (`entidad_id`),
  KEY `reclamo_administrado_periodo_id_099ac9bf_fk_setup_per` (`periodo_id`),
  KEY `reclamo_administrado_updated_by_id_48b5bf17_fk_setup_usu` (`updated_by_id`),
  CONSTRAINT `reclamo_administrado_created_by_id_2c043da6_fk_setup_usu` FOREIGN KEY (`created_by_id`) REFERENCES `setup_usuario` (`id`),
  CONSTRAINT `reclamo_administrado_entidad_id_a19bb982_fk_setup_ent` FOREIGN KEY (`entidad_id`) REFERENCES `setup_entidad` (`id`),
  CONSTRAINT `reclamo_administrado_periodo_id_099ac9bf_fk_setup_per` FOREIGN KEY (`periodo_id`) REFERENCES `setup_periodo` (`id`),
  CONSTRAINT `reclamo_administrado_updated_by_id_48b5bf17_fk_setup_usu` FOREIGN KEY (`updated_by_id`) REFERENCES `setup_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo_administrador_evaluacionanexo1`
--

LOCK TABLES `reclamo_administrador_evaluacionanexo1` WRITE;
/*!40000 ALTER TABLE `reclamo_administrador_evaluacionanexo1` DISABLE KEYS */;
INSERT INTO `reclamo_administrador_evaluacionanexo1` VALUES (1,'2021-02-11','2021-02-11 21:09:09.469009','2021-02-11 21:13:33.501174','181.177.233.38','181.177.233.38',1,2,1,1),(2,'2021-02-10','2021-02-11 21:14:18.968502','2021-02-11 21:14:19.180675','181.177.233.38','181.177.233.38',1,2,1,1),(3,'2021-02-12','2021-02-12 17:22:12.950904','2021-02-12 17:22:13.098201','181.177.233.38','181.177.233.38',1,2,1,1),(4,'2021-02-12','2021-02-16 13:10:28.601728','2021-02-16 13:10:34.682838','181.177.233.38','181.177.233.38',1,2,1,1),(5,'2021-02-11','2021-02-24 14:40:16.676642','2021-02-24 14:40:16.837302','181.177.233.38','181.177.233.38',1,1,1,1);
/*!40000 ALTER TABLE `reclamo_administrador_evaluacionanexo1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo_clasificacioncausa`
--

DROP TABLE IF EXISTS `reclamo_clasificacioncausa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `reclamo_clasificacioncausa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  `causa` longtext NOT NULL,
  `definicion` longtext NOT NULL,
  `definicion_corta` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `categoria` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  CONSTRAINT `reclamo_clasificacioncausa_chk_1` CHECK ((`categoria` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo_clasificacioncausa`
--

LOCK TABLES `reclamo_clasificacioncausa` WRITE;
/*!40000 ALTER TABLE `reclamo_clasificacioncausa` DISABLE KEYS */;
INSERT INTO `reclamo_clasificacioncausa` VALUES (1,'1101','EMITIR RECETAS FARMACOLOGICAS SIN LA DENOMINACION GENERICA INTERNACIONAL, DATOS ERRONEOS O INCOMPLETA','SE CONSIDERA AQUELLOS RECLAMOS RELACIONADOS A LA ENTREGA DE RECETAS EMITIDAS POR EL PROFESIONAL DE SALUD, SIN CONSIGNAR EL NOMBRE GENERICO DEL MEDICAMENTO, CON LETRA ILEGIBLE, INCOMPLETA, ENTRE OTROS.','RECETA CON MEDICAMENTOS DE MARCA Y/O INCOMPLETA Y/O ILEGIBLE.','2021-02-05 21:01:08.482366','2021-02-05 21:01:08.482366',1),(2,'1102','DISPENSAR MEDICAMENTOS Y/O DISPOSITIVOS MEDICOS DE MANERA INSATISFACTORIA','SE CONSIDERAN AQUELLAS RECLAMOS RELACIONADOS A:\r\n- ERROR EN EL TIPO DE PRODUCTOS ENTREGADOS.\r\n- ERROR  EN LACANTIDAD DE PRODUCTOS ENTREGADOS.\r\n- ENTREGA DE PRODUCTOS VENCIDOS, CONTAMINADOS O DETERIORADOS.\r\n- ENTREGA DE PRODUCTOS FALSIFICADOS Y7O SIN REGISTRO SANITARIO, ENTRE OTROS.\r\n- NEGAR O ENTREGAR EN FORMA INCOMPLETA AL USUARIO LA PROVISION DE MEDICAMENTOS O DISPOSITIVOS MÉDICOS','- NO ESTOY SATISFECHO CON LOS MEDICAMENTOS ENTREGADOS.\r\n- NO ME ENTREGARON LOS MEDICAMENTOS.\r\n- ME ENTREGARON DE FORMA INCOMPLETA MIS MEDICAMENTOS','2021-02-05 21:05:14.261411','2021-02-05 21:05:14.261411',1),(3,'1103','DIRECCIONAR AL USUARIO A COMPRAR MEDICAMENTOS O DISPOSITIVOS MEDICOS FUERA DEL ESTABLECIMIENTO DE SALUD','INDUCIR AL USUARIO A COMPRAR DETERMINADOS MEDICAMENTOS O DISPOSITIVOS MÉDICOS FUERA DE LA IPRESS A PESAR DE ESTAR CUBIERTOS O CONTAR CON STOCK EN EL ESTABLECIMIENTO.','ME DICEN QUE COMPRE AFUERA.','2021-02-05 21:07:43.019057','2021-02-05 21:07:43.019057',1),(4,'1104','DIRECCIONAR AL USUARIO A REALIZARSE PROCEDIMIENTOS MEDICOS O QUIRURGICOS FUERA DEL EESS.','INDUCIR AL USUARIO A REALIZARSE PROCEDIMIENTOS MÉDICOS O QUIRÚRGICOS FUERA DEL ESTABLECIMIENTO, PESE A ESTAR CUBIERTOS O DISPONIBLES EN LA IPRESS.','ME DIJERON QUE ME REALICE EL PROCEDIMIENTO AFUERA.','2021-02-05 21:09:40.605400','2021-02-05 21:09:40.605400',1),(5,'1105','NEGAR O CONDICIONAR AL USUARIO A REALIZARSE PROCEDIMIENTOS DE APOYO DIAGNOSTICO','NEGAR AL USUARIO A REALIZARSE PROCEDIMIENTOSDE APOYO AL DIAGNOSTICO.','NO QUIEREN REALIZARME EL PROCEDIMEINTO MEDICO.','2021-02-08 13:33:25.608896','2021-02-08 13:33:25.608896',1),(6,'1106','DEMORAR EN EL OTORGAMIENTO DE CITAS O EN LA ATENCION PARA CONSULTA EXTERNA','SE CONSIDERAN LAS INSATISFACCIONES GENERADAS POR:\r\n- FALTA DE CITAS.\r\n- DISPONIBILIDAD DE CITAS PARA ATENCIÓN EN CONSULTA EXTERNA EN UN PLAZO ALEJADO.\r\n- TIEMPO DE ESPERA PARA LA ATENCIÓN QUE EXCEDE AL TIEMPO ESTABLECIDO POR LA INSTITUCIÓN.','- NO HAY CITAS PARA LA ESPECIALIDAD.\r\n- NO PUEDO CONSEGUIR CITA PARA CONSULTA EXTERNA EN FECHA PROXIMA.\r\n- DEMORAN EN ATENDERME.','2021-02-08 13:35:31.886729','2021-02-08 13:35:31.886729',1),(7,'1107','DEMORA PARA LA HOSPITALIZACION','NO PASE A HOSPITALIZACIÓN O PROGRAMACIÓN HOSPITALARIA POR FALTA DE CUPO, INCLUYE UCI.','NO HAY CAMA DISPONIBLE.','2021-02-08 13:36:50.340640','2021-02-08 13:36:50.340640',1),(8,'1108','DEMORAR EN EL OTORGAMIENTO DE PRESTACIONES DE SALUD DURANTE LA HOSPITALIZACION.','DEMORA PARA EL OTORGAMIENTO DE PRESTACIONES O REALIZACIÓN DE PROCEDIMIENTOS EN EL ÁREA DE HOSPITALIZACIÓN. SE CONSIDERA CUANDO:\r\n- DEMORA EN LA VISITA MÉDICA.\r\n- DEMORA EN LA APLICACIÓN DE MEDICACIÓN.\r\n- DEMORA EN EL CAMBIO DE ROPA DE CAMA.\r\n- DEMORA EN EL ASEO DEL USUARIO.\r\n- DEMORA EN LA REALIZACIÓN DE PROCEDIMIENTOS EN HOSPITALIZACIÓN: CURACIÓN DE HERIDAS, RETIRO DE PUNTOS, CABIO DE APÓSITOS, RETIRO O CAMBIO DE SONDAS, ETC.\r\nNO SE INCLUYE LA DEMORA DE TOMA DE EXAMENES AUXILIARES.','NO ESTOY SATISFECHO CON EL SERVICIO DADO EN HOSPITALIZACIÓN.','2021-02-08 13:37:34.726076','2021-02-08 13:37:34.726076',1),(9,'1109','DEMORAR EN LA ATENCION DE EMERGENCIA DE ACUERDO A LA PRIORIDAD','DEMORA EN EL OTORGAMIENTO DE PRESTACIONES O REALIZACIÓN DE PROCEDIMIENTOS EN EL SERVICIO DE EMERGENCIA, DE ACUERDO A LA PRIORIDAD DEL CASO. SE CONSIDERA:\r\n- DEMORA DE ATENCIÓN EN TRIAJE.\r\n- DEMORA EN LA ATENCIÓN EN TÓPICO DE EMERGENCIA.\r\n- DEMORA EN EL TRASLADO DEL USUARIO A OBSERVACIÓN DE EMERGENCIA.\r\n- DEMORA EN LA ATENCIÓN EN EL ÁREA DE OBSERVACIÓN.\r\n- ENETRE OTRAS ATENCIONES.','DEMORA EN LA ATENCIÓN DE EMERGENCIA.','2021-02-08 13:39:38.323186','2021-02-08 13:39:38.324222',1),(10,'1110','DEMORAR EN LA ATENCION DE PACIENTE OBSTETRICA','DEMORA EN EL OTORGAMIENTO DE PRESTACIONES A PACIENTE OBSTÉTRICA. SE CONSIDERA:\r\n- DEMORA DE ATENCIÓN EN TRIAJE.\r\n- DEMORA EN LA ATENCIÓN EN TÓPICO.\r\n- DEMORA EN LA ATENCIÓN EN EL ÁREA DE OBSERVACIÓN, SALA DE DILATACIÓN O SALA DE PARTO.\r\n- DEMORA EN LA REALIZACIÓN DE CESÁREA INDICADA POR EL MÉDICO TRATANTE.\r\n- OTROS TIPOS DE DEMORA.','DEMORA EN LA ATENCIÓN DE EMERGENCIA A PACIENTE OBSTÉTRICA.','2021-02-08 13:41:49.178838','2021-02-08 13:41:49.178838',1),(11,'1111','DEMORAR EN EL OTORGAMIENTO O REPROGRAMACION DE CUPO PARA PROCEDIMIENTO QUIRURGICO.','DEMORA EN UN PLAZO ALEJADO, EN EL OTROGAMIENTO O REPROGRMACIÓN DE UN CUO PARA REALIZACIÓN DE PROCEDIMIENTO QUIRÚRGICO.','DEMORA EN PROGRAMARME CIRUGIA.','2021-02-08 13:43:03.136959','2021-02-08 13:43:03.136959',1),(12,'1112','NEGAR LA ATENCION EN SITUACIONES DE EMERGENCIA.','NEGAR LAATENCIÓN EN SITUACIONES DE EMERGENCIA Y/O PARTOS, (INCLUYE SERVICIOS QUE SE PRESTAN EN EMERGENCIA SEGÚN NIVEL DE CATEGORIZACIÓN, MEDICAMENTOS Y/O DISPOSITIVOS MÉDICOS) O CONDICIOONAR LA ATENCIÓN A LA PRESENTACIÓN DE DOCUMENTO DE IDENTIDAD, FIRMA DE PAGARÉS, ETC.','NEGAR LA ATENCIÓN DE EMERGENCIA.','2021-02-08 13:45:00.056875','2021-02-08 13:45:00.056875',1),(13,'1113','ENCONTRAR IPRESS Y/O UNIDADES PRESTADORAS DE SERVICIOS E SALUD CERRADAS EN HORARIO DE ATENCION O NO PRESENCIA DEL PERSONAL RESPONSABLE DE LA ATENCION.','FALTA DE DISPONIBILIDAD DE SERVICIOS O PRESTACIONES, SEGÚN DISPOSICIONES OFERTADAS 8DIAS Y HORARIOS) POR PARTE DE LA IPRESS. SE INCLUYEN LA FALTA O AUSENCIA D EPERSONAL DE SALUD PROGRAMADO EN TODOS LOS SERVICIOS QUE RETRASA O IMPIDE LA ATENCIÓN OPORTUNA DEL USUARIO.','IPRESS CERRADA O AUSENCIA DEL PERSONAL DE SALUD RESPONSABLE DE LA ATENCIÓN.','2021-02-08 13:46:24.192600','2021-02-08 13:56:17.921600',1),(14,'1114','NO ACCESO A LA HISTORIA CLINICA.','SE CONSIDERAN AQUELLOS RECLAMOS RELACIONADOS  A NO BRINDAR ATENCIÓN AL USUARIO POR NO ENCONTRARSE DISPONIBLE LA HISTORIA CLINICA, SE APOR EXTRAVÍO O POR OMISIÓN, POR DESCONOCIMIENTO DEL CÓDIGO DE LA HC PERSONAL O FAMILIAR.','NO ACCESO A LA HISTORIA CLINICA.','2021-02-08 13:47:13.958164','2021-02-08 13:47:13.958164',1),(15,'1115','RECLAMOS RELACIONADOS A LA INFRAESTRUCTURA DE LA INSTITUCION.','RECLAMOS RELACIONADOS AL ESTADO Y CONSERVACIÓN DE LAS INSTALACIONES DE LA INSTITUCIÓN. SE INCLUYEN:\r\n- ASEO DEL ESTABLECIMIENTO.\r\n- MANTENIMIENTO DE PUERTAS, VENTANAS, PISOS, PAREDES O TECHOS.\r\n- MANTENIEMIENTO DE EQUIPAMIENTO NO BIOMEDICO (SILLAS, MESAS, O SIMILARES, DE USO EN LA IPRESS).\r\n- OTRAS SIMILARES O DEFINIDAS EN NORMA EXPRESA.','- DEFICIENTE\r\n- INFRAESTRUCTURA\r\n- FALTA DE  ASEO\r\n- FALTA DE MANTENIMIENTO','2021-02-08 13:52:42.982649','2021-02-08 13:52:42.982649',1),(16,'1116','NO CUMPLIR O NO ACCEDER A HACER EL PROCEDIMIENTO DE REFERENCIA O CONTRA REFERENCIA DEL USUARIO.','INCUMPLIMIENTO DE LA NORMATIVA VIGENTE SOBRE REFERENCIAO CONTRA REFERENCIA DE LOS USUARIOS, A FIN DE DAR CONTINUIDAD DELA ATENCIÓN DESALUD, LO QUE INCLUYE NEGATIVA O DEMORA EN LAS GESTIONES.','REFERENCIA Y CONTRA REFERENCIA\r\n- DEMORA\r\n- NEGATIVA\r\n- ERROR','2021-02-08 13:54:01.920774','2021-02-08 14:56:54.000873',1),(17,'1117','DEMORAR EN LA TOMA O ENTREGA DE RESULTADOS DE EXAMENES DE APOYO AL DIAGNOSTICO.','RETRASO EN LA TOMA O ENTREGA DE RESULTADOS DE EXÁMENES DE APOYO AL DIAGNÓSTICO, EN CUALQUIERA.','DEMORA ENLA TOMA OENTREGA DE RESULTADO.','2021-02-08 13:54:54.681654','2021-02-08 13:55:35.246537',1),(18,'1118','COBRAR INDEBIDAMENTE.','RECLAMOS RELACIONADOS A COBROS NO ACORDADOS, ADICIONALES O DIFERENTES A LOS APACTADOS INICIALMENTE ENTRE LA IPRESS Y EL USUARIO.','ME COBRARON O HICIERON PAGAR DINERO QUE NO CORRESPONDE.','2021-02-08 13:57:46.335699','2021-02-08 13:57:46.335699',1),(19,'1119','NO CUENTAN CON VENTANILLA PREFERENCIAL.','NO IMPLEMENTACIÓN DE VENTANILLA PARA LA ATENCIÓN PREFERENCIAL DEL ADULTO MAYOR, GESTANTES Y PERSONAS CON DISCAPACIDAD.','NO CUENTAN CON VENTANILLA PREFERENCIAL.','2021-02-08 13:58:43.662936','2021-02-08 13:58:43.662936',1),(20,'1120','INCUMPLIMIENTO EN LA PROGRAMACION DE CITAS.','- ACUDIR A UNA CITA MÉDICA QUE HA SIDO REPROGRAMADA PARA OTRA FECHA SIN COMUNICACIÓN PREVIA AL PACIENTE.\r\n- ACUDIR A UNA CITA MÉDICA Y EL PROFESIONAL DE LA SALUD NO ACUDIÓ A LABORAR.\r\n- OTROS MOTIVOS AJENOS AL PACIENTE,QUE IMPIDEN EL OTORGAMIENTO DE LA CITA EN FECHA PROGRAMADA.','REPROGRAMACIÓN DE CITA SIN COMUNICACIÓN PREVIA AL PACIENTE.','2021-02-08 13:59:31.286687','2021-02-08 13:59:31.286687',1),(21,'1121','INCUMPLIMIENTO EN LA PROGRAMACION DE INTERVENCIONES QUIRURGICAS.','REAPROGRAMACIÓN DE LA FECHA DE INTERVENCIÓN QUIRÚRGICANPOR MOTIVOS AJENOS AL PACIENTE.','REPROGRAMACIÓN DE INERVENCIÓN QUIRÚRGICA.','2021-02-08 14:00:26.885882','2021-02-08 14:00:26.885882',1),(22,'1201','NO BRINDAR INFORMACION DE LOS PROCESOS ADMINISTRATIVOS DE LA IPRESS.','FALTA O ENTREGA< INSATISFACTORIA DE INFORMACIÓN SOBRE:\r\n- NORMAS, REGLAMENTOS O CONDICIONES ADMINISTRATIVAS VINVULADAS A LA ATENIÓN.\r\n- GASTOS CUBIERTOS EN LA PRESTRACIÓN DE SALUD ASÍ COMO LAS CONDICIONES DEL PLAN DE ATENCIÓN EN SALUD, CUANDO EL USUARIO O PERSONAL ADMINSITRATIVO LO SOLICITE.\r\n- ENTRE OTROS.','NO ME DIERON INFORMACIÓN CLARA SOBRE:\r\n- ASUNTOS ADMINISTRATIVOS\r\n- TRATAMIENTO\r\n- GASTOS NO CUBIERTOS\r\n- EL MÉDICO TRATANTE\r\n- MIS DERECHOS','2021-02-08 14:03:20.732286','2021-02-08 14:03:20.732286',2),(23,'1203','NO RECIBIR DE SU MEDICO Y/O PERSONAL DE SALUD TRATANTE, INFORMACION COMPRENSIBLE SOBRE SU ESTADO DE SALUD O TRATAMIENTO.','SE CONSIDERA AQUELLOS RECLAMOS EN EL QUE EL PROFESIONAL DE LA SALUD INFORMA DE MANERA INSATISFACTORIA O SE REHUSA A BRINDAR INFROMACIÓN AL USUARIO ACERCA DEL ESTADO DE SALUD Y/O DEL TRATAMIENTO QUE VIENE RECIBIENDO.','PERSONAL MÉDICO.\r\nINFORMACIÓN INSATISFACTORIA.\r\nNO BRINDA INFORMACIÓN.','2021-02-08 14:04:44.138758','2021-02-08 14:04:44.139797',2),(24,'1302','NO RECIBIR DE SU MEDICO Y7O PERSONAL DE SALUD TRATO AMABLE Y RESPETUOSO','SE CONSIDERA A AQUELLOS RECLAMOS EN QUE EL PROFESIONAL DE LA SALUD BRINDA UN TRATO CONTRA LA MORAL, BUENAS CONSTUMBRES Y/O DIGNIDAD DE LA PERSONA.','NO RECIBÍ UN TRATO AMABLE','2021-02-08 14:08:27.968095','2021-02-08 14:08:27.968095',3),(25,'1303','NO RECIBIR DEL PERSONAL ADMINISTRATIVO TRATO AMABLE Y RESPETUOSO','SE CONSIDERA A AQUELLOS RECLAMOS EN QUE EL PROFESIONAL ADMINISTRATIVO BRINDA UN TRATO CONTRA LA MORAL, BUENAS CONSTUMBRES Y/O DIGNIDAD DE LA PERSONA.','NO RECIBÍ UN TRATO AMABLE.','2021-02-08 14:20:03.761551','2021-02-08 14:20:03.761551',3),(26,'1304','NO BRINDAR EL PROCEDIMIENTO MEDICO O QUIRURGICO ADECUADO.','REALIZAR PROCEDIMIENTOS MÉDICOS O QUIRÚRGICOS DE MANERA ERRÓNEA, NO ACORDE A PROTOCOLOS Y GUÍAS.','MALA ATENCIÓN MÉDICA.','2021-02-08 14:21:06.624810','2021-02-08 14:21:06.624810',3),(27,'1305','NO BRINDAR UN TRATO ACORDE A LA CULTURA, CONDICION Y GENERO DEL USUARIO.','NO SER ATENDIDO CON RESPETO, NO ACORDE A SUS MODOS DE VIDA, CONOCIMEINTOS Y COSTUMBRES PROPIOS DE SU LUGAR DE ORIGEN, O CON LA IDENTIDAD DE GÉNERO, NI RESPETAR CONDICIÓN DE DISCAPACIDAD O ATENCIÓN PREFERENTE DURANTE LA PRESTACIÓN  DE SALUD.','TRATO DISCRIMINATORIO.','2021-02-08 14:22:22.623055','2021-02-08 14:22:22.623055',3),(28,'1306','PRESUNTO ERROR EN LOS RESULTADOS DE EXAMENES DE APOYO AL DIAGNOSTICO.','PRESUCIÓN DE ERROR EN LOS RESULTADOS DE EXÁMENES DE APOYO AL DIAGNOSTICO POR CUALQUIER CAUSA. SE INCLUYEN TODOS LOS EXÁMENES AUXILIARES.','NO ESTOY SATISFECHO CON MIS RESULTADOS.','2021-02-08 14:23:30.950490','2021-02-08 14:23:30.950490',3),(29,'1307','NO BRINDAR ATENCION CON PLENO RESPETO A SU PRIVACIDAD,CON PRESENCIA DE TERCEROS NO AUTORIZADOS POR EL USUARIO.','SE CONSIDERA A AQUELLOS RECLAMOS DONDE LA IPRESS VULNERA O EXPONE AL USUARIO, CONSIDERANDO LA PRESENCIA DE TERCEROS DURANTE SU ATENCIPON Y SIN SU CONSENTIMIENTO.','PRIVACIDAD DE LA ATENCIÓN.','2021-02-08 14:24:33.031790','2021-02-08 14:24:33.031790',3),(30,'1309','RETENER AL USUARIO DE ALTA O AL CADAVER POR MOTIVO DE DEUDA, PREVIO ACUERDO DE PAGOS O TRAMITES ADMINISTRATIVOS.','SE CONSIDERAN AQUELLOS RECLAMOS REAALCIONADOS A LA DEMORA EN EL PROCESO DE ALTA O ENTREGA DE CADÁVER DEBIDO A TRÁMITES ADMINISTRATIVOS O ECONÓMICOS.','DEMORA EN EL ALTA DEL PACIENTE Y LA RETENCIÓN DEL CADÁVER.','2021-02-08 14:26:30.693045','2021-02-08 14:26:30.693045',3),(31,'1310','NO BRINDAR ATENCION CON RESPETO A LA DIGNIDAD DEL USUARIO.','SE CONSIDERAN AQUELLOS RECLAMOS RELACIONADOS A ACTOS IMPROPIOS DE NATURALEZA SEXUAL.','TRATO IMPROPIO.','2021-02-08 14:27:21.187677','2021-02-08 14:27:21.187677',3),(32,'1401','NO SOLICITAR AL USUARIO O SU REPRESENTANTE LEGAL EL CONSENTIMIENTO INFORMADO POR ESCRITO DE ACUERDO A LOS REQUERIMIENTOS DE LA NORMATIVIDAD VIGENTE.','NO CUMPLIR CON RECABAR DEL USUARIO EL CONSENTIMIENTO INFORMADO DE ACUERDO A LO DISPUESTO POR LA NORMA VIGENTE. SE CONSIDERA OBLIGATORIO RECABAR EL CONSENTIMIENTO IFORMADO EN LOS SIGUIENTES CASOS:\r\n- PROCEDIMIENTOS RIESGOSOS O PROCEDIMIENTOS QUIRÚRGICOS QUE PONGAN EN RIEGO LA SALUDDEL USUARIO.\r\n- EXPLORACIÓN, TRATAMIENTO O EXHIBICIÓN DE IMÁGENES CON FINES DOCENTES.\r\n- PARA LA INCLUSIÓN EN ENSAYOS DE INVESTIGACIÓN CLÍNICA.\r\n- PARA NEGARSE A RECIBIR O CONTINUAR TRATAMIENTO.\r\n- PARA RECIBIR CUIDADOS PALIATIVOS.\r\n- ENTRE OTROS.','NO ME EXPLICARON SOBRE PROCEDIMIENTO QUE ME IBAN A REALIZAR NI PIDIERON MI AUTORIZACIÓN.','2021-02-08 14:28:02.026258','2021-02-08 14:28:02.026258',4),(33,'1501','NEGAR O DEMORAR EN BRINDAR AL USUARIO EL ACCESO A SU HISTORIA CLINICA Y A OTROS REGISTROS CLINICOS SOLICITADOS Y NO GARANTIZAR SU CARÁCTER RESERVADO','SE CONSIDERA AQUELLOS RECLMAOS DONDE LA IPRESS NO PERMITE O DEMORA AL USUARIO EN ACCEDER A SU HISTORIA CLINICA U OTROS REGISTROS CLÍNICOS COMO LA CONSTANCIA DE DISCAPACIDAD Y OTROS DOCUMENTOS RELACIONADOS A SU ATENCIÓN, ASÍ COMO RESGUARDAR LA PRIVACIDAD DE LA INFORMACIÓN.','ACCESO A LA HC Y LOS OTROS REGISTROS CLÍNICOS.','2021-02-08 14:33:00.680414','2021-02-08 14:33:00.680414',5),(34,'1502','NO REALIZAR LA GESTION DEL RECLAMO DE FORMA OPORTUNA Y ADECUADA.','SE CONSIDERAN AQUELLOS RECLAMOS DONDE LA IPRESS:\r\n- NO BRINDA INFORMCIÓN AL USUARIO SOBRE LA GESTIÓN DEL RECLAMOSEN EL PLAZO ESTABLECIDO SEGÚN NORMATIVA.\r\n- NO TRASLADA OPORTUNAMENTE EL RECLAMO A LA INSTANCIA CON COMPETENCIA.\r\n- NO TRAMITA EL RECLAMO DENTRO DE LOS PLAZOS ESTABLECIDOS.\r\n- DEMORA O NEGATIVA EN BRINDAR EL LIBRO DE RECLAMACIONES.\r\n- ENTRE OTROS.','GESTIÓN DEL RECLAMO:\r\n- NO ME DAN INFORMACIÓN.\r\n- OBSTACULIZAR.\r\n- DEMORA EN ELPLAZO ESTABLECIDO.','2021-02-08 14:34:22.327946','2021-02-08 14:34:22.327946',5),(35,'1504','NO CONTAR CON PLATAFORMA DE ATENCION AL USUARIO EN SALUD DE ACUERDO A LA NORMATIVIDAD VIGENTE.','NO CONTAR CON UNA PLATAFORMA DE ATENCIÓN AL USURIO EN SALUD PARA LA ATENCIÓN DE CONSULTAS Y RECLAMOS DE ACUERDO A LA NORMATIVIDAD VIGENTE.','NO TIENE PAUS','2021-02-08 14:35:27.764895','2021-02-08 14:35:27.764895',5),(36,'2001','OTROS RELATIVOS A LA ATENCION DE SALUD EN LAS IPRESS.','OTRO RECLAMOS REFERIDOS A LA ATENCIÓN EN LA IPRESS O UGIPRESS.','OTROS RECLAMOS NO IDENTIFICADOS.','2021-02-08 14:36:20.564882','2021-02-08 14:36:20.564882',6);
/*!40000 ALTER TABLE `reclamo_clasificacioncausa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo_entidadreclamo`
--

DROP TABLE IF EXISTS `reclamo_entidadreclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `reclamo_entidadreclamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo_declaracion_id` int NOT NULL,
  `tipo_institucion` int unsigned NOT NULL,
  `codigo_administrado` varchar(8) DEFAULT NULL,
  `medio_presentacion` int unsigned NOT NULL,
  `codigo_registro` varchar(15) NOT NULL,
  `tipo_documento_usuario` int unsigned NOT NULL,
  `numero_documento_usuario` varchar(15) NOT NULL,
  `razon_social_usuario` varchar(150) DEFAULT NULL,
  `nombres_usuario` varchar(150) DEFAULT NULL,
  `apellido_paterno_usuario` varchar(150) DEFAULT NULL,
  `apellido_materno_usuario` varchar(150) DEFAULT NULL,
  `tipo_documento_presenta` int unsigned NOT NULL,
  `numero_documento_presenta` varchar(15) NOT NULL,
  `razon_social_presenta` varchar(150) DEFAULT NULL,
  `nombres_presenta` varchar(150) DEFAULT NULL,
  `apellido_paterno_presenta` varchar(150) DEFAULT NULL,
  `apellido_materno_presenta` varchar(150) DEFAULT NULL,
  `autorizacion_notificacion_correo` int NOT NULL,
  `correo_presenta` varchar(50) DEFAULT NULL,
  `domicilio_presenta` varchar(100) DEFAULT NULL,
  `celular_presenta` varchar(30) DEFAULT NULL,
  `medio_recepcion_reclamo` int unsigned NOT NULL,
  `fecha_reclamo` date NOT NULL,
  `detalle_reclamo` longtext NOT NULL,
  `servicio_hecho_reclamo` int unsigned NOT NULL,
  `competencia_reclamo` int unsigned NOT NULL,
  `clasificacion_reclamo_1_id` int NOT NULL,
  `clasificacion_reclamo_2_id` int DEFAULT NULL,
  `clasificacion_reclamo_3_id` int DEFAULT NULL,
  `estado_reclamo` int unsigned NOT NULL,
  `codigo_reclamo_primigenio` varchar(15) DEFAULT NULL,
  `etapa_reclamo` int unsigned DEFAULT NULL,
  `tipo_administrado_traslado` int unsigned DEFAULT NULL,
  `codigo_administrado_deriva` varchar(8) DEFAULT NULL,
  `resultado_reclamo` int DEFAULT NULL,
  `motivo_conclusion_anticipada` int unsigned DEFAULT NULL,
  `fecha_resultado_reclamo` date DEFAULT NULL,
  `comunicacion_resultado_reclamo` int unsigned DEFAULT NULL,
  `fecha_notificacion` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) DEFAULT NULL,
  `updated_ip` varchar(20) DEFAULT NULL,
  `entidad_id` int DEFAULT NULL,
  `es_mismo_usuario_afectado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reclamo_entidadreclamo_entidad_id_codigo_registro_e22a4f9d_uniq` (`entidad_id`,`codigo_registro`),
  KEY `reclamo_entidadreclamo_clasificacion_reclamo_1_id_2a5c4837` (`clasificacion_reclamo_1_id`),
  KEY `reclamo_entidadreclamo_clasificacion_reclamo_2_id_2679694e` (`clasificacion_reclamo_2_id`),
  KEY `reclamo_entidadreclamo_clasificacion_reclamo_3_id_c5668c2c` (`clasificacion_reclamo_3_id`),
  KEY `reclamo_entidadreclamo_periodo_declaracion_id_78383397` (`periodo_declaracion_id`),
  CONSTRAINT `reclamo_entidadrecla_clasificacion_reclam_2679694e_fk_reclamo_c` FOREIGN KEY (`clasificacion_reclamo_2_id`) REFERENCES `reclamo_clasificacioncausa` (`id`),
  CONSTRAINT `reclamo_entidadrecla_clasificacion_reclam_2a5c4837_fk_reclamo_c` FOREIGN KEY (`clasificacion_reclamo_1_id`) REFERENCES `reclamo_clasificacioncausa` (`id`),
  CONSTRAINT `reclamo_entidadrecla_clasificacion_reclam_c5668c2c_fk_reclamo_c` FOREIGN KEY (`clasificacion_reclamo_3_id`) REFERENCES `reclamo_clasificacioncausa` (`id`),
  CONSTRAINT `reclamo_entidadrecla_periodo_declaracion__78383397_fk_setup_per` FOREIGN KEY (`periodo_declaracion_id`) REFERENCES `setup_periodo` (`id`),
  CONSTRAINT `reclamo_entidadreclamo_entidad_id_a8ff1b6c_fk_setup_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `setup_entidad` (`id`),
  CONSTRAINT `reclamo_entidadreclamo_chk_10` CHECK ((`etapa_reclamo` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_11` CHECK ((`tipo_administrado_traslado` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_13` CHECK ((`motivo_conclusion_anticipada` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_14` CHECK ((`comunicacion_resultado_reclamo` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_2` CHECK ((`tipo_institucion` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_3` CHECK ((`medio_presentacion` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_4` CHECK ((`tipo_documento_usuario` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_5` CHECK ((`tipo_documento_presenta` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_6` CHECK ((`medio_recepcion_reclamo` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_7` CHECK ((`servicio_hecho_reclamo` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_8` CHECK ((`competencia_reclamo` >= 0)),
  CONSTRAINT `reclamo_entidadreclamo_chk_9` CHECK ((`estado_reclamo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo_entidadreclamo`
--

LOCK TABLES `reclamo_entidadreclamo` WRITE;
/*!40000 ALTER TABLE `reclamo_entidadreclamo` DISABLE KEYS */;
INSERT INTO `reclamo_entidadreclamo` VALUES (11,1,1,NULL,1,'123',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,NULL,NULL,NULL,3,'2021-02-12','45',5,1,2,NULL,NULL,6,'45',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-02-24 01:19:27.646949','2021-02-24 01:21:15.641909','181.176.106.1','181.176.106.1',1,0),(12,1,1,NULL,2,'123',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,NULL,NULL,NULL,3,'2021-02-06','45',4,1,25,NULL,NULL,5,'23',2,NULL,NULL,1,3,NULL,NULL,NULL,'2021-02-24 13:28:13.852977','2021-02-24 13:28:13.853011','181.177.233.38','181.177.233.38',NULL,0),(13,1,1,'123',1,'123',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,NULL,NULL,NULL,4,'2021-02-18','123',5,1,10,NULL,NULL,5,'123',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-02-24 13:29:10.384026','2021-02-24 13:29:10.384059','181.177.233.38','181.177.233.38',NULL,0),(14,1,1,NULL,2,'1233',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,'45454545',NULL,'CRISTHIAN IRVING','VALENCIA','BAZAN',1,NULL,NULL,NULL,2,'2021-02-11','ASD',5,1,7,NULL,NULL,5,'123',2,NULL,NULL,NULL,NULL,'2021-02-11',NULL,'2021-02-12','2021-02-24 14:07:47.141829','2021-02-24 16:54:33.298143','181.177.233.38','181.177.233.38',1,1),(15,1,1,'00006600',1,'039-2021',1,'43862416',NULL,'RICARDO DANTE','POMA','FELIPE',1,'43862416',NULL,'RICARDO DANTE','POMA','FELIPE',0,'RICARDODAN2306@HOTMAIL.COM','SOTO BERMEO N° 233 SAN ROQUE SURCO','939155306',1,'2021-01-21','DIRIS LIMASUR NO REALIZA ABORDAJE INICIAL Y ABORDAJE SINDROMICO TEMPRANO DE CASO REGISTRADO EN CONTAC CENTER DIA VIERNES 15 DE ENERO, CASO REPORTADO A SUSALUD POR FALTA DE INFORMACION Y NO CONTESTAR TELEFONOS DE CONTAC CENTER INCUMPLIMIENTO EL EQUIPO DE RESPUESTA RAPIDA DE DIRIS LIMASUR ATENCION DENTRO DE LAS 24 HORAS. HOY 21 DE ENERO SIN INFORMACION-SE PIDE SANCIONES POR FALTA DE CONTROL DE FUNCIONARIOS POR DIRECTORA DIRIS LIMA SUR.',11,3,6,36,36,2,NULL,2,NULL,NULL,0,NULL,NULL,NULL,NULL,'2021-02-25 20:37:24.125703','2021-02-25 20:37:24.136620','201.230.217.121','201.230.217.121',1,1);
/*!40000 ALTER TABLE `reclamo_entidadreclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo_medidaadoptada`
--

DROP TABLE IF EXISTS `reclamo_medidaadoptada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `reclamo_medidaadoptada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) NOT NULL,
  `descripcion` longtext NOT NULL,
  `naturaleza` int unsigned NOT NULL,
  `procesos` int unsigned NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_culminacion` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) DEFAULT NULL,
  `updated_ip` varchar(20) DEFAULT NULL,
  `entidad_reclamo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reclamo_medidaadopta_entidad_reclamo_id_7e7e6ae6_fk_reclamo_e` (`entidad_reclamo_id`),
  CONSTRAINT `reclamo_medidaadopta_entidad_reclamo_id_7e7e6ae6_fk_reclamo_e` FOREIGN KEY (`entidad_reclamo_id`) REFERENCES `reclamo_entidadreclamo` (`id`),
  CONSTRAINT `reclamo_medidaadoptada_chk_1` CHECK ((`naturaleza` >= 0)),
  CONSTRAINT `reclamo_medidaadoptada_chk_2` CHECK ((`procesos` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo_medidaadoptada`
--

LOCK TABLES `reclamo_medidaadoptada` WRITE;
/*!40000 ALTER TABLE `reclamo_medidaadoptada` DISABLE KEYS */;
INSERT INTO `reclamo_medidaadoptada` VALUES (7,'09','213',2,3,'2021-02-11','2021-02-11','2021-02-24 16:42:18.089617','2021-02-24 16:42:31.044086','181.177.233.38','181.177.233.38',14);
/*!40000 ALTER TABLE `reclamo_medidaadoptada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_entidad`
--

DROP TABLE IF EXISTS `setup_entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_entidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `categoria` int unsigned NOT NULL,
  `ris` int unsigned NOT NULL,
  `tipo` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `setup_entidad_chk_1` CHECK ((`categoria` >= 0)),
  CONSTRAINT `setup_entidad_chk_2` CHECK ((`ris` >= 0)),
  CONSTRAINT `setup_entidad_chk_3` CHECK ((`tipo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_entidad`
--

LOCK TABLES `setup_entidad` WRITE;
/*!40000 ALTER TABLE `setup_entidad` DISABLE KEYS */;
INSERT INTO `setup_entidad` VALUES (1,'DIRIS','000',1,1,1),(2,'P.S. QUEBRADA VERDE','0001',1,3,1),(3,'P.S. VISTA ALEGRE DE VILLA','0023',2,1,1);
/*!40000 ALTER TABLE `setup_entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_groupmenu`
--

DROP TABLE IF EXISTS `setup_groupmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_groupmenu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  CONSTRAINT `setup_groupmenu_group_id_e40e8e53_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_groupmenu`
--

LOCK TABLES `setup_groupmenu` WRITE;
/*!40000 ALTER TABLE `setup_groupmenu` DISABLE KEYS */;
INSERT INTO `setup_groupmenu` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `setup_groupmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_groupmenu_menus`
--

DROP TABLE IF EXISTS `setup_groupmenu_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_groupmenu_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupmenu_id` int NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setup_groupmenu_menus_groupmenu_id_menu_id_2e27992f_uniq` (`groupmenu_id`,`menu_id`),
  KEY `setup_groupmenu_menus_menu_id_787ca1f9_fk_setup_menu_id` (`menu_id`),
  CONSTRAINT `setup_groupmenu_menu_groupmenu_id_13d6800c_fk_setup_gro` FOREIGN KEY (`groupmenu_id`) REFERENCES `setup_groupmenu` (`id`),
  CONSTRAINT `setup_groupmenu_menus_menu_id_787ca1f9_fk_setup_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `setup_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_groupmenu_menus`
--

LOCK TABLES `setup_groupmenu_menus` WRITE;
/*!40000 ALTER TABLE `setup_groupmenu_menus` DISABLE KEYS */;
INSERT INTO `setup_groupmenu_menus` VALUES (1,1,1),(2,1,2),(5,1,4),(3,2,2),(4,2,4);
/*!40000 ALTER TABLE `setup_groupmenu_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_menu`
--

DROP TABLE IF EXISTS `setup_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `url` varchar(30) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `type` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setup_menu_parent_id_0babc201_fk_setup_menu_id` (`parent_id`),
  CONSTRAINT `setup_menu_parent_id_0babc201_fk_setup_menu_id` FOREIGN KEY (`parent_id`) REFERENCES `setup_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_menu`
--

LOCK TABLES `setup_menu` WRITE;
/*!40000 ALTER TABLE `setup_menu` DISABLE KEYS */;
INSERT INTO `setup_menu` VALUES (1,'Usuario','user','/setup/usuario/list','Usuario',1,NULL),(2,'Reclamos','eye','/reclamo/entidad-reclamo/list','Reclamos',1,NULL),(3,'Entidad','home','/setup/entidad/list','Entidad',1,NULL),(4,'Evaluación','edit','/evaluacion/list','Evaluación',1,NULL);
/*!40000 ALTER TABLE `setup_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_periodo`
--

DROP TABLE IF EXISTS `setup_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_periodo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `periodo` (`periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_periodo`
--

LOCK TABLES `setup_periodo` WRITE;
/*!40000 ALTER TABLE `setup_periodo` DISABLE KEYS */;
INSERT INTO `setup_periodo` VALUES (1,'Periodo 2021 - 1','2021-01-01','2021-05-31',1);
/*!40000 ALTER TABLE `setup_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_rubrocalificacion`
--

DROP TABLE IF EXISTS `setup_rubrocalificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_rubrocalificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orden` int unsigned NOT NULL,
  `rubro` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orden` (`orden`),
  CONSTRAINT `setup_rubrocalificacion_chk_1` CHECK ((`orden` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_rubrocalificacion`
--

LOCK TABLES `setup_rubrocalificacion` WRITE;
/*!40000 ALTER TABLE `setup_rubrocalificacion` DISABLE KEYS */;
INSERT INTO `setup_rubrocalificacion` VALUES (1,1,'Cuenta con Libro de Reclamaciones'),(2,2,'Libro de Reclamaciones (Físico o Virtual)'),(3,3,'Se ha designado mediante resolución del Titular de la entidad al responsable del Libro de Reclamaciones'),(4,4,'El Libro de Reclamaciones se encuentra en lugar visible y de fácil acceso'),(5,5,'Existen avisos en los que se indique la existencia de libro de reclamaciones y el derecho que poseen los usuarios para solicitarlo cuando los consideren conveniente'),(6,6,'N° total de reclamaciones en el periodo (enero-junio) o (julio-diciembre)'),(7,7,'N° de usuarios a los que se les proporcionó copia o constancia de su reclamo.'),(8,8,'N° de reclamaciones atendidas fuera del plazo de 30 días hábiles o no atendidas');
/*!40000 ALTER TABLE `setup_rubrocalificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_usuario`
--

DROP TABLE IF EXISTS `setup_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `document` varchar(12) DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `entidad_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `setup_usuario_entidad_id_61fb7a05_fk_setup_entidad_id` (`entidad_id`),
  CONSTRAINT `setup_usuario_entidad_id_61fb7a05_fk_setup_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `setup_entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_usuario`
--

LOCK TABLES `setup_usuario` WRITE;
/*!40000 ALTER TABLE `setup_usuario` DISABLE KEYS */;
INSERT INTO `setup_usuario` VALUES (1,'pbkdf2_sha256$216000$k85ho7aRtN7Y$dM7bkvFjbBxNLOOk8Ua345xt/IhgVbwcDpUir3x109M=','2021-02-25 13:27:23.257797',1,'admin','','','admin@gmail.com',1,1,'2021-02-05 20:41:46.000000','12345678',NULL,1),(2,'pbkdf2_sha256$216000$CeojeNDeTFG8$W1PLtfZUxitb+LEpD0TIWbIzSiCS0kJLv3w3W4cLoY8=','2021-02-22 16:59:48.465460',0,'demo','Usuario1','Apellido','usuario2@gmail.com',0,1,'2021-02-10 16:40:02.000000','12345678',979362396,2);
/*!40000 ALTER TABLE `setup_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_usuario_groups`
--

DROP TABLE IF EXISTS `setup_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_usuario_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setup_usuario_groups_usuario_id_group_id_e9697227_uniq` (`usuario_id`,`group_id`),
  KEY `setup_usuario_groups_group_id_a7b41fe1_fk_auth_group_id` (`group_id`),
  CONSTRAINT `setup_usuario_groups_group_id_a7b41fe1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `setup_usuario_groups_usuario_id_ce35ae5c_fk_setup_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `setup_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_usuario_groups`
--

LOCK TABLES `setup_usuario_groups` WRITE;
/*!40000 ALTER TABLE `setup_usuario_groups` DISABLE KEYS */;
INSERT INTO `setup_usuario_groups` VALUES (1,2,2);
/*!40000 ALTER TABLE `setup_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_usuario_user_permissions`
--

DROP TABLE IF EXISTS `setup_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `setup_usuario_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setup_usuario_user_permi_usuario_id_permission_id_26767b6f_uniq` (`usuario_id`,`permission_id`),
  KEY `setup_usuario_user_p_permission_id_2c57fe58_fk_auth_perm` (`permission_id`),
  CONSTRAINT `setup_usuario_user_p_permission_id_2c57fe58_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `setup_usuario_user_p_usuario_id_3ef81a47_fk_setup_usu` FOREIGN KEY (`usuario_id`) REFERENCES `setup_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_usuario_user_permissions`
--

LOCK TABLES `setup_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `setup_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `setup_usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-26 12:04:45
