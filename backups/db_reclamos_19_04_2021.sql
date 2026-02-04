-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2021 a las 19:27:06
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_reclamos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'Administrador IPRESS'),
(1, 'Administrador RIS'),
(2, 'Administrador UGIPRESS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Menu', 1, 'add_menu'),
(2, 'Can change Menu', 1, 'change_menu'),
(3, 'Can delete Menu', 1, 'delete_menu'),
(4, 'Can view Menu', 1, 'view_menu'),
(5, 'Can add Grupo Menu', 2, 'add_groupmenu'),
(6, 'Can change Grupo Menu', 2, 'change_groupmenu'),
(7, 'Can delete Grupo Menu', 2, 'delete_groupmenu'),
(8, 'Can view Grupo Menu', 2, 'view_groupmenu'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add País', 6, 'add_country'),
(22, 'Can change País', 6, 'change_country'),
(23, 'Can delete País', 6, 'delete_country'),
(24, 'Can view País', 6, 'view_country'),
(25, 'Can add department', 7, 'add_department'),
(26, 'Can change department', 7, 'change_department'),
(27, 'Can delete department', 7, 'delete_department'),
(28, 'Can view department', 7, 'view_department'),
(29, 'Can add province', 8, 'add_province'),
(30, 'Can change province', 8, 'change_province'),
(31, 'Can delete province', 8, 'delete_province'),
(32, 'Can view province', 8, 'view_province'),
(33, 'Can add district', 9, 'add_district'),
(34, 'Can change district', 9, 'change_district'),
(35, 'Can delete district', 9, 'delete_district'),
(36, 'Can view district', 9, 'view_district'),
(37, 'Can add Usuario', 10, 'add_usuario'),
(38, 'Can change Usuario', 10, 'change_usuario'),
(39, 'Can delete Usuario', 10, 'delete_usuario'),
(40, 'Can view Usuario', 10, 'view_usuario'),
(41, 'Can add Entidad', 11, 'add_entidad'),
(42, 'Can change Entidad', 11, 'change_entidad'),
(43, 'Can delete Entidad', 11, 'delete_entidad'),
(44, 'Can view Entidad', 11, 'view_entidad'),
(45, 'Can add log entry', 12, 'add_logentry'),
(46, 'Can change log entry', 12, 'change_logentry'),
(47, 'Can delete log entry', 12, 'delete_logentry'),
(48, 'Can view log entry', 12, 'view_logentry'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session'),
(53, 'Can add Entidad Reclamo', 14, 'add_entidadreclamo'),
(54, 'Can change Entidad Reclamo', 14, 'change_entidadreclamo'),
(55, 'Can delete Entidad Reclamo', 14, 'delete_entidadreclamo'),
(56, 'Can view Entidad Reclamo', 14, 'view_entidadreclamo'),
(57, 'Can add Entidad Reclamo', 15, 'add_medidaadoptada'),
(58, 'Can change Entidad Reclamo', 15, 'change_medidaadoptada'),
(59, 'Can delete Entidad Reclamo', 15, 'delete_medidaadoptada'),
(60, 'Can view Entidad Reclamo', 15, 'view_medidaadoptada'),
(61, 'Can add Clasificación de causas', 16, 'add_clasificacioncausa'),
(62, 'Can change Clasificación de causas', 16, 'change_clasificacioncausa'),
(63, 'Can delete Clasificación de causas', 16, 'delete_clasificacioncausa'),
(64, 'Can view Clasificación de causas', 16, 'view_clasificacioncausa'),
(65, 'Can add Periodo', 17, 'add_periodo'),
(66, 'Can change Periodo', 17, 'change_periodo'),
(67, 'Can delete Periodo', 17, 'delete_periodo'),
(68, 'Can view Periodo', 17, 'view_periodo'),
(69, 'Can add Rubros calificación', 18, 'add_rubrocalificacion'),
(70, 'Can change Rubros calificación', 18, 'change_rubrocalificacion'),
(71, 'Can delete Rubros calificación', 18, 'delete_rubrocalificacion'),
(72, 'Can view Rubros calificación', 18, 'view_rubrocalificacion'),
(73, 'Can add Evaluación Anexo 1', 19, 'add_evaluacionanexo1'),
(74, 'Can change Evaluación Anexo 1', 19, 'change_evaluacionanexo1'),
(75, 'Can delete Evaluación Anexo 1', 19, 'delete_evaluacionanexo1'),
(76, 'Can view Evaluación Anexo 1', 19, 'view_evaluacionanexo1'),
(77, 'Can add Detalle evaluación Anexo 1', 20, 'add_detalleevaluacionanexo1'),
(78, 'Can change Detalle evaluación Anexo 1', 20, 'change_detalleevaluacionanexo1'),
(79, 'Can delete Detalle evaluación Anexo 1', 20, 'delete_detalleevaluacionanexo1'),
(80, 'Can view Detalle evaluación Anexo 1', 20, 'view_detalleevaluacionanexo1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_spanish_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-02-05 21:01:08.486377', '1', '1101 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(2, '2021-02-05 21:05:14.263409', '2', '1102 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(3, '2021-02-05 21:07:43.021056', '3', '1103 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(4, '2021-02-05 21:09:40.605400', '4', '1104 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(5, '2021-02-08 13:33:25.619849', '5', '1105 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(6, '2021-02-08 13:35:31.903728', '6', '1106 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(7, '2021-02-08 13:36:50.365639', '7', '1107 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(8, '2021-02-08 13:37:34.750076', '8', '1108 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(9, '2021-02-08 13:39:38.336221', '9', '1109 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(10, '2021-02-08 13:41:49.195838', '10', '1110 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(11, '2021-02-08 13:43:03.136959', '11', '1111 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(12, '2021-02-08 13:45:00.070875', '12', '1112 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(13, '2021-02-08 13:46:24.210601', '13', '1113 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(14, '2021-02-08 13:47:13.976167', '14', '1114 - ACCESO A LOS SERVICIOS DE SALUD ', 1, '[{\"added\": {}}]', 16, 1),
(15, '2021-02-08 13:52:42.996047', '15', '1115 : ACCESO A LOS SERVICIOS DE SALUD - - DEFICIENTE\r\n- INFRAESTRUCTURA\r\n- FALTA DE  ASEO\r\n- FALTA DE MANTENIMIENTO ', 1, '[{\"added\": {}}]', 16, 1),
(16, '2021-02-08 13:54:01.928775', '16', '1116 : ACCESO A LOS SERVICIOS DE SALUD - - REFERENCIA Y CONTRA REFERENCIA\r\n- DEMORA\r\n- NEGATIVA\r\n- ERROR ', 1, '[{\"added\": {}}]', 16, 1),
(17, '2021-02-08 13:54:54.701661', '17', '1117 : ACCESO A LOS SERVICIOS DE SALUD - DEMORA ENLA TOMA OENTREGA DE RESSULTADO. ', 1, '[{\"added\": {}}]', 16, 1),
(18, '2021-02-08 13:55:35.257545', '17', '1117 : ACCESO A LOS SERVICIOS DE SALUD - DEMORA ENLA TOMA OENTREGA DE RESULTADO. ', 2, '[{\"changed\": {\"fields\": [\"Definici\\u00f3n corta\"]}}]', 16, 1),
(19, '2021-02-08 13:56:17.933594', '13', '1113 : ACCESO A LOS SERVICIOS DE SALUD - IPRESS CERRADA O AUSENCIA DEL PERSONAL DE SALUD RESPONSABLE DE LA ATENCIÓN. ', 2, '[{\"changed\": {\"fields\": [\"Definici\\u00f3n corta\"]}}]', 16, 1),
(20, '2021-02-08 13:57:46.341665', '18', '1118 : ACCESO A LOS SERVICIOS DE SALUD - ME COBRARON O HICIERON PAGAR DINERO QUE NO CORRESPONDE. ', 1, '[{\"added\": {}}]', 16, 1),
(21, '2021-02-08 13:58:43.680954', '19', '1119 : ACCESO A LOS SERVICIOS DE SALUD - NO CUENTAN CON VENTANILLA PREFERENCIAL. ', 1, '[{\"added\": {}}]', 16, 1),
(22, '2021-02-08 13:59:31.290721', '20', '1120 : ACCESO A LOS SERVICIOS DE SALUD - REPROGRAMACIÓN DE CITA SIN COMUNICACIÓN PREVIA AL PACIENTE. ', 1, '[{\"added\": {}}]', 16, 1),
(23, '2021-02-08 14:00:26.893882', '21', '1121 : ACCESO A LOS SERVICIOS DE SALUD - REPROGRAMACIÓN DE INERVENCIÓN QUIRÚRGICA. ', 1, '[{\"added\": {}}]', 16, 1),
(24, '2021-02-08 14:03:20.749992', '22', '1201 : ACCESO A LA INFORMACIÓN - NO ME DIERON INFORMACIÓN CLARA SOBRE:\r\n- ASUNTOS ADMINISTRATIVOS\r\n- TRATAMIENTO\r\n- GASTOS NO CUBIERTOS\r\n- EL MÉDICO TRATANTE\r\n- MIS DERECHOS ', 1, '[{\"added\": {}}]', 16, 1),
(25, '2021-02-08 14:04:44.159762', '23', '1203 : ACCESO A LA INFORMACIÓN - PERSONAL MÉDICO.\r\nINFORMACIÓN INSATISFACTORIA.\r\nNO BRINDA INFORMACIÓN. ', 1, '[{\"added\": {}}]', 16, 1),
(26, '2021-02-08 14:08:27.989099', '24', '1302 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - NO RECIBÍ UN TRATO AMABLE ', 1, '[{\"added\": {}}]', 16, 1),
(27, '2021-02-08 14:20:03.775552', '25', '1303 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - NO RECIBÍ UN TRATO AMABLE. ', 1, '[{\"added\": {}}]', 16, 1),
(28, '2021-02-08 14:21:06.632809', '26', '1304 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - MALA ATENCIÓN MÉDICA. ', 1, '[{\"added\": {}}]', 16, 1),
(29, '2021-02-08 14:22:22.633057', '27', '1305 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - TRATO DISCRIMINATORIO. ', 1, '[{\"added\": {}}]', 16, 1),
(30, '2021-02-08 14:23:30.959525', '28', '1306 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - NO ESTOY SATISFECHO CON MIS RESULTADOS. ', 1, '[{\"added\": {}}]', 16, 1),
(31, '2021-02-08 14:24:33.061791', '29', '1307 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - PRIVACIDAD DE LA ATENCIÓN. ', 1, '[{\"added\": {}}]', 16, 1),
(32, '2021-02-08 14:26:30.714046', '30', '1309 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - DEMORA EN EL ALTA DEL PACIENTE Y LA RETENCIÓN DEL CADÁVER. ', 1, '[{\"added\": {}}]', 16, 1),
(33, '2021-02-08 14:27:21.207677', '31', '1310 : ATENCIÓN Y RECUPERACIÓN DE LA SALUD - TRATO IMPROPIO. ', 1, '[{\"added\": {}}]', 16, 1),
(34, '2021-02-08 14:28:02.044261', '32', '1401 : CONSENTIMIENTO INFORMADO - NO ME EXPLICARON SOBRE PROCEDIMIENTO QUE ME IBAN A REALIZAR NI PIDIERON MI AUTORIZACIÓN. ', 1, '[{\"added\": {}}]', 16, 1),
(35, '2021-02-08 14:33:00.696691', '33', '1501 : PROTECCIÓN DE DERECHOS - ACCESO A LA HC Y LOS OTROS REGISTROS CLÍNICOS. ', 1, '[{\"added\": {}}]', 16, 1),
(36, '2021-02-08 14:34:22.343946', '34', '1502 : PROTECCIÓN DE DERECHOS - GESTIÓN DEL RECLAMO:\r\n- NO ME DAN INFORMACIÓN.\r\n- OBSTACULIZAR.\r\n- DEMORA EN ELPLAZO ESTABLECIDO. ', 1, '[{\"added\": {}}]', 16, 1),
(37, '2021-02-08 14:35:27.785857', '35', '1504 : PROTECCIÓN DE DERECHOS - NO TIENE PAUS ', 1, '[{\"added\": {}}]', 16, 1),
(38, '2021-02-08 14:36:20.566882', '36', '2001 : OTROS - OTROS RECLAMOS NO IDENTIFICADOS. ', 1, '[{\"added\": {}}]', 16, 1),
(39, '2021-02-08 14:56:54.003873', '16', '1116 : ACCESO A LOS SERVICIOS DE SALUD - REFERENCIA Y CONTRA REFERENCIA\r\n- DEMORA\r\n- NEGATIVA\r\n- ERROR ', 2, '[{\"changed\": {\"fields\": [\"Definici\\u00f3n corta\"]}}]', 16, 1),
(40, '2021-02-10 16:36:37.712141', '1', ' Usuario ', 1, '[{\"added\": {}}]', 1, 1),
(41, '2021-02-10 16:36:57.810817', '2', ' Reclamos ', 1, '[{\"added\": {}}]', 1, 1),
(42, '2021-02-10 16:37:12.766626', '1', 'Administrador', 1, '[{\"added\": {}}]', 4, 1),
(43, '2021-02-10 16:37:15.854281', '1', 'Administrador', 1, '[{\"added\": {}}]', 2, 1),
(44, '2021-02-10 16:37:23.608677', '2', 'Encargado Sede', 1, '[{\"added\": {}}]', 4, 1),
(45, '2021-02-10 16:37:27.883035', '2', 'Encargado Sede', 1, '[{\"added\": {}}]', 2, 1),
(46, '2021-02-10 17:04:18.109615', '3', ' Entidad ', 1, '[{\"added\": {}}]', 1, 1),
(47, '2021-02-10 19:30:06.570046', '1', ' DIRIS  000 ', 1, '[{\"added\": {}}]', 11, 1),
(48, '2021-02-10 19:35:17.445315', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Entidad\", \"N\\u00famero de DNI\"]}}]', 10, 1),
(49, '2021-02-11 21:05:49.100510', '1', ' 1 - Cuenta con Libro de Reclamaciones ', 1, '[{\"added\": {}}]', 18, 1),
(50, '2021-02-11 21:06:17.657246', '2', ' 2 - Libro de Reclamaciones (Físico o Virtual) ', 1, '[{\"added\": {}}]', 18, 1),
(51, '2021-02-11 21:07:12.667657', '3', ' 3 - Se ha designado mediante resolución del Titular de la entidad al responsable del Libro de Reclamaciones ', 1, '[{\"added\": {}}]', 18, 1),
(52, '2021-02-11 21:08:04.841212', '4', ' 4 - El Libro de Reclamaciones se encuentra en lugar visible y de fácil acceso ', 1, '[{\"added\": {}}]', 18, 1),
(53, '2021-02-11 21:08:44.933458', '1', ' Periodo 2021 - 1 ', 1, '[{\"added\": {}}]', 17, 1),
(54, '2021-02-11 21:11:01.715640', '5', ' 5 - Existen avisos en los que se indique la existencia de libro de reclamaciones y el derecho que poseen los usuarios para solicitarlo cuando los consideren conveniente ', 1, '[{\"added\": {}}]', 18, 1),
(55, '2021-02-11 21:11:46.257774', '6', ' 6 - N° total de reclamaciones en el periodo (enero-junio) o (julio-diciembre) ', 1, '[{\"added\": {}}]', 18, 1),
(56, '2021-02-11 21:12:16.260606', '7', ' 7 - N° de usuarios a los que se les proporcionó copia o constancia de su reclamo. ', 1, '[{\"added\": {}}]', 18, 1),
(57, '2021-02-11 21:12:55.355871', '8', ' 8 - N° de reclamaciones atendidas fuera del plazo de 30 días hábiles o no atendidas ', 1, '[{\"added\": {}}]', 18, 1),
(58, '2021-02-22 14:38:46.482452', '6', '02 - ADMINISTRATIVA Y ASISTENCIAL ', 3, '', 15, 1),
(59, '2021-02-22 14:38:46.492089', '5', '01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IAFAS ', 3, '', 15, 1),
(60, '2021-02-22 14:38:46.500813', '4', '01 - ADMINISTRATIVA Y ASISTENCIAL ', 3, '', 15, 1),
(61, '2021-02-22 14:38:46.507598', '3', '01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IPRESS ', 3, '', 15, 1),
(62, '2021-02-22 14:38:46.514133', '2', '01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IPRESS ', 3, '', 15, 1),
(63, '2021-02-22 14:38:46.521882', '1', '01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IAFAS ', 3, '', 15, 1),
(64, '2021-02-22 14:38:56.190278', '7', 'EntidadReclamo object (7)', 3, '', 14, 1),
(65, '2021-02-22 14:38:56.199203', '6', 'EntidadReclamo object (6)', 3, '', 14, 1),
(66, '2021-02-22 14:38:56.209141', '5', 'EntidadReclamo object (5)', 3, '', 14, 1),
(67, '2021-02-22 14:38:56.219413', '4', 'EntidadReclamo object (4)', 3, '', 14, 1),
(68, '2021-02-22 14:38:56.228076', '3', 'EntidadReclamo object (3)', 3, '', 14, 1),
(69, '2021-02-22 14:38:56.235920', '2', 'EntidadReclamo object (2)', 3, '', 14, 1),
(70, '2021-02-22 14:38:56.243903', '1', 'EntidadReclamo object (1)', 3, '', 14, 1),
(71, '2021-02-22 16:00:58.549752', '8', 'EntidadReclamo object (8)', 3, '', 14, 1),
(72, '2021-02-24 01:18:35.700791', '10', 'EntidadReclamo object (10)', 3, '', 14, 1),
(73, '2021-02-24 01:18:35.714650', '9', 'EntidadReclamo object (9)', 3, '', 14, 1),
(74, '2021-02-24 14:38:34.403032', '4', ' Evaluación ', 1, '[{\"added\": {}}]', 1, 1),
(75, '2021-02-24 14:38:48.162885', '2', 'Encargado Sede', 2, '[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]', 2, 1),
(76, '2021-02-24 14:38:59.008587', '1', 'Administrador', 2, '[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]', 2, 1),
(77, '2021-03-17 15:44:03.544104', '2', ' 2021-2 ', 1, '[{\"added\": {}}]', 17, 1),
(78, '2021-03-18 20:41:28.609213', '5', ' CONFIGURACIÓN ', 1, '[{\"added\": {}}]', 1, 1),
(79, '2021-03-18 20:42:00.285228', '6', ' EVALUACIÓN ', 1, '[{\"added\": {}}]', 1, 1),
(80, '2021-03-18 20:42:19.169928', '7', ' REPORTES ', 1, '[{\"added\": {}}]', 1, 1),
(81, '2021-03-18 20:42:32.737127', '8', ' RECLAMOS ', 1, '[{\"added\": {}}]', 1, 1),
(82, '2021-03-18 20:43:08.708940', '4', ' ANEXO 1 ', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 1, 1),
(83, '2021-03-18 20:43:26.724499', '3', ' EntidadENTIDADES ', 2, '[{\"changed\": {\"fields\": [\"Nombre\", \"T\\u00edtulo\"]}}]', 1, 1),
(84, '2021-03-18 20:43:33.462118', '3', ' ENTIDADES ', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 1, 1),
(85, '2021-03-18 20:43:59.223225', '2', ' LISTA RECLAMOS ', 2, '[{\"changed\": {\"fields\": [\"Nombre\", \"T\\u00edtulo\"]}}]', 1, 1),
(86, '2021-03-18 20:44:15.856623', '1', ' USUARIOS ', 2, '[{\"changed\": {\"fields\": [\"Nombre\", \"T\\u00edtulo\"]}}]', 1, 1),
(87, '2021-03-18 20:44:32.238648', '1', ' USUARIOS ', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(88, '2021-03-18 20:44:39.711570', '2', ' LISTA RECLAMOS ', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(89, '2021-03-18 20:44:48.399705', '3', ' ENTIDADES ', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(90, '2021-03-18 20:45:09.216247', '4', ' ANEXO 1 ', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(91, '2021-03-18 20:45:33.207166', '9', ' ANEXOS ', 1, '[{\"added\": {}}]', 1, 1),
(92, '2021-03-18 20:45:51.200591', '10', ' SIN RECLAMO ', 1, '[{\"added\": {}}]', 1, 1),
(93, '2021-03-18 20:46:08.759454', '11', ' RECLAMO X MES ', 1, '[{\"added\": {}}]', 1, 1),
(94, '2021-03-18 20:48:05.539275', '10', ' SIN RECLAMO ', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(95, '2021-03-26 21:37:28.628459', '12', 'POR RESULTADO', 1, '[{\"added\": {}}]', 1, 1),
(96, '2021-03-29 15:50:08.453008', '13', 'CONCLUSIÓN ANTICIPADA', 1, '[{\"added\": {}}]', 1, 1),
(97, '2021-03-29 20:38:59.663709', '14', 'MEDIO PRESENTACIÓN', 1, '[{\"added\": {}}]', 1, 1),
(98, '2021-04-12 16:08:17.248280', '15', 'CLASIFICACIÓN RECLAMO', 1, '[{\"added\": {}}]', 1, 1),
(99, '2021-04-12 16:08:33.112131', '16', 'ESTADO RECLAMO', 1, '[{\"added\": {}}]', 1, 1),
(100, '2021-04-12 16:08:49.350806', '17', 'AUTORIZACIÓN CORREO', 1, '[{\"added\": {}}]', 1, 1),
(101, '2021-04-12 16:09:03.963518', '18', 'MEDIO RECEPCIÓN', 1, '[{\"added\": {}}]', 1, 1),
(102, '2021-04-12 16:09:19.848680', '19', 'ETAPA RECLAMO', 1, '[{\"added\": {}}]', 1, 1),
(103, '2021-04-12 16:09:52.422965', '20', 'SERVICIO ORIGEN', 1, '[{\"added\": {}}]', 1, 1),
(104, '2021-04-12 16:10:20.685749', '21', 'TIPO RECLAMO', 1, '[{\"added\": {}}]', 1, 1),
(105, '2021-04-12 16:20:05.671455', '14', 'ATENDIDO Y PENDIENTES', 2, '[{\"changed\": {\"fields\": [\"Nombre\", \"Url\", \"T\\u00edtulo\"]}}]', 1, 1),
(106, '2021-04-12 16:51:02.761356', '5', 'CONFIGURACIÓN', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(107, '2021-04-12 16:51:27.076551', '6', 'EVALUACIÓN', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(108, '2021-04-12 16:52:23.788201', '7', 'REPORTES', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(109, '2021-04-12 16:52:44.743726', '8', 'RECLAMOS', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(110, '2021-04-12 16:53:29.256237', '9', 'ANEXOS', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(111, '2021-04-12 16:53:38.241649', '21', 'TIPO RECLAMO', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(112, '2021-04-12 16:54:08.416776', '20', 'SERVICIO ORIGEN', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(113, '2021-04-12 16:54:24.447528', '19', 'ETAPA RECLAMO', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(114, '2021-04-12 16:54:36.544022', '18', 'MEDIO RECEPCIÓN', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(115, '2021-04-12 16:55:59.379631', '17', 'AUTORIZACIÓN CORREO', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(116, '2021-04-12 16:56:16.106322', '16', 'ESTADO RECLAMO', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(117, '2021-04-12 16:56:37.487945', '15', 'CLASIFICACIÓN RECLAMO', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(118, '2021-04-12 16:57:05.403992', '14', 'ATENDIDO Y PENDIENTES', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(119, '2021-04-12 16:57:19.060578', '13', 'CONCLUSIÓN ANTICIPADA', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(120, '2021-04-12 16:57:23.013803', '13', 'CONCLUSIÓN ANTICIPADA', 2, '[]', 1, 1),
(121, '2021-04-12 16:57:41.356848', '12', 'POR RESULTADO', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(122, '2021-04-12 16:58:01.877024', '11', 'RECLAMO X MES', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(123, '2021-04-12 16:58:18.955571', '10', 'SIN RECLAMO', 2, '[{\"changed\": {\"fields\": [\"Icono\"]}}]', 1, 1),
(124, '2021-04-12 16:58:24.002568', '9', 'ANEXOS', 2, '[]', 1, 1),
(125, '2021-04-12 19:51:24.553413', '3', 'IPRESS', 2, '[{\"changed\": {\"fields\": [\"Nombre\", \"T\\u00edtulo\"]}}]', 1, 1),
(126, '2021-04-15 13:17:38.258258', '2', 'ADMINISTRADOR UGIPRESS', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 4, 1),
(127, '2021-04-15 13:18:21.007770', '2', 'Administrador UGIPRESS', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 4, 1),
(128, '2021-04-15 13:19:34.518597', '2', 'Administrador UGIPRESS', 2, '[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]', 2, 1),
(129, '2021-04-15 13:19:50.228907', '1', 'Administrador RIS', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 4, 1),
(130, '2021-04-15 13:20:00.648322', '1', 'Administrador RIS', 2, '[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]', 2, 1),
(131, '2021-04-15 13:20:24.516670', '3', 'Administrador IPRESS', 1, '[{\"added\": {}}]', 4, 1),
(132, '2021-04-15 13:20:41.043525', '3', 'Administrador IPRESS', 1, '[{\"added\": {}}]', 2, 1),
(133, '2021-04-15 13:20:54.765999', '16', 'ESTADO RECLAMO', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(134, '2021-04-15 13:44:41.077663', '2', 'Administrador UGIPRESS', 2, '[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]', 2, 1),
(135, '2021-04-15 16:14:31.706693', '3', 'IPRESS', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(136, '2021-04-15 16:18:42.792125', '22', 'GESTIÓN RECLAMOS', 1, '[{\"added\": {}}]', 1, 1),
(137, '2021-04-15 16:18:50.682951', '3', 'IPRESS', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 1, 1),
(138, '2021-04-15 20:43:00.315066', '23', 'TRAMA', 1, '[{\"added\": {}}]', 1, 1),
(139, '2021-04-15 20:43:27.567407', '24', 'RECLAMOS', 1, '[{\"added\": {}}]', 1, 1),
(140, '2021-04-15 20:43:54.797090', '25', 'MEDIDAS ADOPTADAS', 1, '[{\"added\": {}}]', 1, 1),
(141, '2021-04-15 20:44:14.477937', '3', 'Administrador IPRESS', 2, '[{\"changed\": {\"fields\": [\"Grupos menus\"]}}]', 2, 1),
(142, '2021-04-16 15:39:53.111203', '10', '01 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA UGIPRESS ', 3, '', 15, 1),
(143, '2021-04-16 15:39:53.111203', '9', '1 - ADMINISTRATIVA Y ASISTENCIAL ', 3, '', 15, 1),
(144, '2021-04-16 15:39:53.111203', '8', '1 - ADMINISTRATIVA Y ASISTENCIAL ', 3, '', 15, 1),
(145, '2021-04-16 15:39:53.111203', '7', '09 - ADMINISTRATIVA RESPECTO A PROCESOS PROPIOS DE LA IPRESS ', 3, '', 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'contenttypes', 'contenttype'),
(6, 'localizations', 'country'),
(7, 'localizations', 'department'),
(9, 'localizations', 'district'),
(8, 'localizations', 'province'),
(16, 'reclamo', 'clasificacioncausa'),
(14, 'reclamo', 'entidadreclamo'),
(15, 'reclamo', 'medidaadoptada'),
(20, 'reclamo_administrador', 'detalleevaluacionanexo1'),
(19, 'reclamo_administrador', 'evaluacionanexo1'),
(13, 'sessions', 'session'),
(11, 'setup', 'entidad'),
(2, 'setup', 'groupmenu'),
(1, 'setup', 'menu'),
(17, 'setup', 'periodo'),
(18, 'setup', 'rubrocalificacion'),
(10, 'setup', 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-05 20:40:15.626015'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-02-05 20:40:15.775884'),
(3, 'auth', '0001_initial', '2021-02-05 20:40:15.911886'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-02-05 20:40:16.375691'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-02-05 20:40:16.390659'),
(6, 'auth', '0004_alter_user_username_opts', '2021-02-05 20:40:16.406660'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-02-05 20:40:16.422707'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-02-05 20:40:16.426660'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-02-05 20:40:16.442662'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-02-05 20:40:16.478660'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-02-05 20:40:16.494660'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-02-05 20:40:16.659700'),
(13, 'auth', '0011_update_proxy_permissions', '2021-02-05 20:40:16.680659'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-02-05 20:40:16.698662'),
(15, 'setup', '0001_initial', '2021-02-05 20:40:16.818954'),
(16, 'setup', '0002_entidad_usuario', '2021-02-05 20:40:36.186097'),
(17, 'admin', '0001_initial', '2021-02-05 20:40:45.113127'),
(18, 'admin', '0002_logentry_remove_auto_add', '2021-02-05 20:40:45.404075'),
(19, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-05 20:40:45.428075'),
(20, 'reclamo', '0001_initial', '2021-02-05 20:40:45.599103'),
(21, 'sessions', '0001_initial', '2021-02-05 20:40:45.707220'),
(22, 'reclamo', '0002_clasificacioncausa', '2021-02-05 20:50:08.527434'),
(23, 'reclamo', '0003_auto_20210205_1559', '2021-02-05 20:59:32.819435'),
(24, 'reclamo', '0004_clasificacioncausa_categoria', '2021-02-08 13:48:04.462507'),
(25, 'reclamo', '0005_remove_clasificacioncausa_derecho', '2021-02-08 13:52:53.429303'),
(26, 'reclamo', '0006_auto_20210208_1430', '2021-02-08 19:30:10.773887'),
(27, 'setup', '0003_auto_20210210_1123', '2021-02-10 16:34:25.303036'),
(28, 'reclamo', '0007_auto_20210210_1123', '2021-02-10 16:34:25.939873'),
(29, 'setup', '0004_entidad_ris', '2021-02-10 19:27:43.199480'),
(30, 'reclamo', '0008_auto_20210210_1427', '2021-02-10 19:27:43.985306'),
(31, 'setup', '0005_auto_20210210_1434', '2021-02-10 19:34:59.979568'),
(32, 'setup', '0006_auto_20210210_1437', '2021-02-10 19:37:31.679727'),
(33, 'reclamo', '0009_auto_20210210_1516', '2021-02-10 20:16:24.304041'),
(34, 'reclamo', '0010_auto_20210210_1532', '2021-02-10 20:32:44.554074'),
(35, 'setup', '0007_periodo', '2021-02-10 20:54:10.156169'),
(36, 'setup', '0008_auto_20210211_1555', '2021-02-11 20:55:39.035752'),
(37, 'reclamo_administrador', '0001_initial', '2021-02-11 20:57:50.205254'),
(38, 'reclamo', '0011_auto_20210212_1132', '2021-02-12 16:32:36.606024'),
(39, 'reclamo', '0012_auto_20210222_0928', '2021-02-22 14:28:21.988543'),
(40, 'setup', '0009_entidad_tipo', '2021-02-22 14:28:22.203427'),
(41, 'reclamo', '0013_auto_20210222_0939', '2021-02-22 14:39:24.875891'),
(42, 'reclamo', '0014_auto_20210222_0950', '2021-02-22 14:50:42.154273'),
(43, 'reclamo', '0015_auto_20210222_1059', '2021-02-22 16:06:55.700905'),
(44, 'reclamo', '0016_auto_20210222_1117', '2021-02-22 16:17:27.372830'),
(45, 'reclamo', '0017_auto_20210222_1201', '2021-02-22 17:01:58.576311'),
(46, 'reclamo', '0018_auto_20210222_1244', '2021-02-22 17:44:36.159061'),
(47, 'reclamo', '0019_auto_20210223_2009', '2021-02-24 01:09:35.393800'),
(48, 'reclamo', '0020_entidadreclamo_es_mismo_usuario_afectado', '2021-02-24 16:24:02.097289'),
(49, 'setup', '0010_auto_20210304_1440', '2021-03-04 19:40:39.511204'),
(50, 'setup', '0011_auto_20210304_1443', '2021-03-04 19:43:52.139820'),
(51, 'setup', '0012_auto_20210304_1535', '2021-03-04 20:35:17.887326'),
(52, 'setup', '0013_auto_20210318_1537', '2021-03-18 20:37:24.873290'),
(53, 'reclamo', '0021_auto_20210326_1508', '2021-03-26 20:08:24.609301'),
(54, 'setup', '0014_auto_20210329_1049', '2021-03-29 15:49:27.604278'),
(55, 'reclamo', '0022_auto_20210412_1106', '2021-04-12 16:06:47.807883'),
(56, 'reclamo', '0023_auto_20210412_1247', '2021-04-12 17:47:24.256082'),
(57, 'setup', '0015_remove_entidad_tipo', '2021-04-12 19:53:03.659611'),
(58, 'setup', '0016_auto_20210413_1851', '2021-04-13 23:51:33.522029'),
(59, 'setup', '0017_remove_usuario_ris', '2021-04-15 13:35:32.138389'),
(60, 'setup', '0018_usuario_ris', '2021-04-15 13:35:53.388917'),
(61, 'reclamo', '0024_auto_20210415_1541', '2021-04-15 20:41:30.954443'),
(62, 'reclamo', '0025_auto_20210415_1637', '2021-04-15 21:37:28.641816'),
(63, 'reclamo_administrador', '0002_evaluacionanexo1_anio1', '2021-04-16 15:48:03.233215'),
(64, 'reclamo_administrador', '0003_auto_20210416_1048', '2021-04-16 15:49:51.503245'),
(65, 'reclamo_administrador', '0002_auto_20210416_1125', '2021-04-16 16:25:17.509388'),
(66, 'reclamo_administrador', '0003_auto_20210416_1154', '2021-04-16 16:54:28.933580'),
(67, 'reclamo_administrador', '0004_auto_20210416_1154', '2021-04-16 16:54:40.461260');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('037d92ss3gs7nja5gwutsvh2u3sv2aov', '.eJydlNtu4jAQhl8lyt5CyIFQ6J0bsqtIHKoEVpV2KzTYbnE3sZGdVLuq-u47gQApLdpDrpyZyZd_fo_9Yq-gKjerynC9Esy-tj27046tgf7gsk6wJ5CPyqFKllqsnbrEabLGmSrG85um9g1gA2aDXw9CfHzmQd-jPvQhpLQf-sMA_GDt-u4AQhgFD-FwOABvwIeuCyNvFLhev--PKF27CN3hHqo8X0koODKBFUJigstSMGArqYq1rhORkzlTJ3KsG5KmZBbNW0Wl2CosSW7TOMtacaqYeKwz_tXAC1uJ2hWvYxdcVvb1t5dm8WLX8bBjN1qi-exz8mWZkij5XrkuC2a1Yp1j6hOuBNqGy43C4teOTTciZ5pLsyM2f2hIy2xJ0mSeHb_vGV5W215lKtBC9XJhyhOxNgWJe0hwhMSzRTIm4_gdpenqjLLXdV9z2u0NTryvZLL83976RwyZxXdzyzuJ4s-QV0CFkmeKOBPlB4qujqg0vp2ni1aDfyVl9FZKyx7Nt0qX3PS0MF2Q_Kcy74DNVrlHSJbMrDSOJmQ6v0AyQnY1pzkU6hLOa_W0Q1l31jT-UNoeZLr43i34RYH-kYgeocBsOVmQ8SWJmpsqL4FdFBi0pzyaLLPDGFgExyxKbsmYXGAXqhTPqotUmlcGtxmtLQUVW2Dwx_Ebnhvzj5t9smGSZAtivaMcDD2cisNOnc_ir526-_0lsCpAwiOeOryAKHbH7Sa-hVIgCOOniN4FcGq3Wj1ximu3yR3k1v6-_gbuWbs0:1lQu9o:ttE-3wY-MXRdWz1r9tmBtCEtM9wAu0RPMTgScvhE6EQ', '2021-04-12 15:50:24.074631'),
('0frzn17ztvsf9fmtr0m5mmmzy0u9tuek', '.eJydlF9vmzAUxb9KxF4Twv8mfaOETUgJVJBMlbYK3dhu4w7syIZqVdTvPpMQQpNG2saTuefy49yDzU7Loa42eS2JyCnWbjVTG_Zra0C_CGsE_ALsmeuIs0rQtd606K0q9QXHpLhrez8ANiA36mnPVZeFTXBMZIEDLkKOa01ssOy1YRkeuDC1n9zJxAPTIxPDgKk5tQ3TcawpQmtDQfe4p7oocgYlUUzAJWVKIKyiGHDOeLkWjRDomb7QA31w56epHwdJr6miW65aovs0zLJeHXFMnxvFuvFMtyc0qZhDrSSs1m5_7NrFTmvq7lBrvQRJ_DX6tkr9IPpZGwa248axKJT0Ra2oik0tN1w1vw81tKEFFoTJPbF9Q0taZSs_jZKse34sSVVvx7WsQVA-LqisTsQmFEU8QOwOEsbLaObPwgtKO9UZ5eDrseH0x_NOvO_-fPW_szkdxo_Dh2RgnkyRVyhqQJSzM0cE0-oTRzcdKg3vk3TZG_CvrEw_WunFI8iWi4rIsaByBIz85vIC2H4qo4NkUTxIw2DuL5IrJEnZSBBUQMmv4czeTHvU4GGwCD-1dgDJkbofleSqQasjqoyUwWw1X_qzaxYFkXVRAb4weJH-5NzpP6Z_8jWPsqU_uKAcJzxu02N055vjbe_u8XAq8xIYPKtjoP4IqKKvRGvrW6ioAqn6qSL2BbWNtoK_EKTWRqsd7Tb5vf8BobyXXA:1lQrgJ:cTpYFm1cagrKAwAKLjGqrYl3_Kqu49hEh6ftmvYB0JI', '2021-04-12 13:11:47.046526'),
('11lrv2dp8u7syqn4o2l2is8zg9g0u6z3', '.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEITX:L5LQDsziMHQr8ipbr7cA4jCflkeK3NrnWNJwy4As_v8', '2021-03-08 21:10:39.423456'),
('2b63fmp3x3ay7k51a5ocv5ldpsrq8l0p', '.eJxdkctugzAQRf_F6xTMU9Bl1SyyqFQl6qqt0GA7wSnYyNiRqij_3iG4gYQVPtc-vgxnUoGzTeUGYSrJyTOJyGrJamA_Qo0BP4I66IBpZY2sg3FL4NMheNNctC9-752ggaHB03mGT8wjSCMWQwoZY2kWFwnESU1jmkMGZbLPiiKHKBcFpVBGZUKjNI1LxmqK0qtu79q2UtAJdALvpMJAKCs58ErprjZj8LrZbnaLwMpeI968b9e7JWeay8OYUEoXeJxDtCKdUI48f56JX_tbPwYHRuqxkGlxHQ7Cuj50Ew5bOVjMJM4Jw7EzuawmR3xzbAVrodPDLDETCX2Hp__1vU78ipstudnW05nHRl71oGh0NzvS2XGC1gGTX47SfaJml_CBVo9duLTk8j3NqepAwQG_Ff8Ks_IkiOc9WIlFkM_EXAFOtDf6KBi-08sf8fDSlw:1lHu8b:FkkYfIglJq7i3GyBDcy-Fk8JYLD5Ubie970sRpe01kI', '2021-03-18 19:59:57.849220'),
('2v1md2xan12rw1wv7mivjfg9v13hlr8o', '.eJydlF1v2jAUhv9KlN1CcPgK9M4N2RQJSJXAVGmrkLFNcZfYkZ1Um6r-951AgJQ22sedc87x4_ccv86LvSFlsd-UhuuNYPaN7dqdZmxL6A8uqwR7IvJROVTJQoutU5U4ddY4C8V4elvXvgHsidnD7vFuMtzSidefjHZTtEUeGgwp2hHXYy5DY49wOh54fLojU-T2BxyNh6MJQl4fjRCi2xFAD7hdmaYbSTIOTMIyISHBZSEYYRupsq2uEr6TOAvHd6xbHMd46UeNokLkCkrCuzhIkkacKiYeq0zfG7ujRqKaituxMy5L--bbS714sav4qGPXWvxo-Tn8so6xH34vEWKDZaVYp5D6BCsBY4PlXkHxa8eme5EyzaU5EOsTatI6WeM4jJLz_p7hRZn3SlMSLVQvFaa4EKuhAPEIGZwhwXIVzvAseEepu7qiHHU9VJxme-ML7yuer_-3t-EZg5fBfWS5F1H8maQloULJK0WcieIDRd4ZFQd3UbxqNPhXUqZvpTTGo3mudMFNTwvTJZL_VOYdsL4qdIYk4dKKA3-OF1ELyQjZ1ZymJFNtOLfR0wFl3VuL4ENpR5Dpwnc3460C-2cizAgEJuv5Cs_aJGpuyrQgrFXgoOlyf75OTjawMNjMD-_wDLewM1WIZ9UFKk1LA9cMoy0EFTlhpO24i10WwSyMrOqlgp8_cN_VWeAZ1c2hHTD5wVN_NPjkevT_aKfLoOdhssLWO8rpyk7v7uSFa7f_Oqh7OP5mNhmR5BHeNfziKMyP23U8J4UAEMQvEX0IgJBcqydOYY1efwNkKdQR:1lVix2:R5mpNwxyC3wSTXCY2T6ZIu5qL-ob7wUB_2_6HwhpNOs', '2021-04-25 22:53:08.360021'),
('33b9rakunvhamcmhmuh1s6hpfit99s21', '.eJyFlV1v2jAUhv8Kym5JSyFA6V0GWRWpBRRg2leFHOdAvDlxZDvd1qr_fceUxW5J1TvnOHnOez7z6G1JrfNtrUBuWeZdef2J13WNKaG_oDQ32U9S7sUZFaWWLD0zr5wdb9XZrciAfzy--wKQE5Xj14M0oEF2ORkFw91okPZG6WVKL8fpuDceoiXoBf3-cEKGAQGS0d4QAjK5CMYjCv0AYDRE6AG3qznflqQAo4hJpjgriKol3kOpWUaybSmKVJr7cP6j7vWywTy-XTj3Js5e1yugrL2r74_Hw6Nn7MOud4RPF_NP8fUmCafxkWIkSI5XH_DEMA94rOqHBw5-xYCC99T1aM54JqFUB7IhXjTEzWoTJvFi1XDOFei6Oq9VTSQT55wpbckmWu_p7qn7UuC4wSXRcpGso1WbrJRIn-ZE6nZNkwYSzqMvriIJlZAa1Dlm1icl_BHKUjk2QE32JtBjbL0GtIrnnSSa3oSHVLfRFCt9CZSTQjhCgXNfcewRX1jshRPkAdn50rmNWmU-A5WPz34BjlhKOPYi5kEztLv0fkPHBKLo1eZmHc7eki1B1VyTzBG9Q72_LG_g9sz0ZrP63zCdcL6Op_EynIVvwAuh2b3wEUt5rZgoMeeaUVaRjFh_uajlHn0qf2C9BraG62g-i2eLztfO0pyi-bo9V6akGpPCMpMwc8CRcHNWMCpFlYsSnmtivTlzcROu4k_x1M7FO3XHAim2Y5RQE99JByiNNcoJ3_lQVPqvdTlqXEYrU5933IAyRTrl7_cWaYcn3KwXSfzNCWK6SJLoLTiuMyHZw3MIVEgJrgch9twZisvGy200iw-6o-XpFnnVCZCxg3qojBOnj3OgTrPZ0Y3W4TJ8LymaVKRl6lgpaM2JVA2474xylHzGtl10MEPX0VuCcT3dY6cKHxOzB0cwKWkupAXbYV7Hy_eqqFnVUkMuKNGH6ZBS_G7Zin0709fYLa87s3VHKvTqE17lxCeKti9KO9rxEhfFyeo-_lJere5c4Cco8u75J7MtSIlbU5rcUJx38I72CoNCAtqtRR4M2KiVFD-B6uZXtf2vDtf30z8taXdk:1lXEUX:cQ-7R3HypwPhVY1yx9CFaz72L1LjaOpiroV7tQVDRDk', '2021-04-30 02:45:57.296503'),
('3dzlmgltyn6n3s4xk5zeilsiybmkjq86', '.eJydlF1v2jAUhv9KlN1CcPgK9M4N2RQJSJXAVGmrkLFNcZfYkZ1Um6r-951AgJQ22sedc87x4_ccv86LvSFlsd-UhuuNYPaN7dqdZmxL6A8uqwR7IvJROVTJQoutU5U4ddY4C8V4elvXvgHsidnD7vFuMtzSidefjHZTtEUeGgwp2hHXYy5DY49wOh54fLojU-T2BxyNh6MJQl4fjRCi2xFAD7hdmaYbSTIOTMIyISHBZSEYYRupsq2uEr6TOAvHd6xbHMd46UeNokLkCkrCuzhIkkacKiYeq0zfG7ujRqKaituxMy5L--bbS714sav4qGPXWvxo-Tn8so6xH34vEWKDZaVYp5D6BCsBY4PlXkHxa8eme5EyzaU5EOsTatI6WeM4jJLz_p7hRZn3SlMSLVQvFaa4EKuhAPEIGZwhwXIVzvAseEepu7qiHHU9VJxme-ML7yuer_-3t-EZg5fBfWS5F1H8maQloULJK0WcieIDRd4ZFQd3UbxqNPhXUqZvpTTGo3mudMFNTwvTJZL_VOYdsL4qdIYk4dKKA3-OF1ELyQjZ1ZymJFNtOLfR0wFl3VuL4ENpR5Dpwnc3460C-2cizAgEJuv5Cs_aJGpuyrQgrFXgoOlyf75OTjawMNjMD-_wDLewM1WIZ9UFKk1LA9cMoy0EFTlhpO24i10WwSyMrOqlgp8_cN_VWeAZ1c2hHTD5wVN_NPjkevT_aKfLoOdhssLWO8rpyk7v7uSFa7f_Oqh7OP5mNhmR5BHeNfziKMyP23U8J4UAEMQvEX0IgJBcqydOYY1efwNkKdQR:1lRc1i:nDzGUX0rmtL3W3vZjvk3-Ok95gX_u05GaftDvkS_O3w', '2021-04-14 14:40:58.146000'),
('3o14uj08zo3mdzo094xbwetexm3ylx4k', '.eJxdkctugzAQRf_F6xTMU9Bl1SyyqFQl6qqt0GA7wSnYyNiRqij_3iG4gYQVPtc-vgxnUoGzTeUGYSrJyTOJyGrJamA_Qo0BP4I66IBpZY2sg3FL4NMheNNctC9-752ggaHB03mGT8wjSCMWQwoZY2kWFwnESU1jmkMGZbLPiiKHKBcFpVBGZUKjNI1LxmqK0qtu79q2UtAJdALvpMJAKCs58ErprjZj8LrZbnaLwMpeI968b9e7JWeay8OYUEoXeJxDtCKdUI48f56JX_tbPwYHRuqxkGlxHQ7Cuj50Ew5bOVjMJM4Jw7EzuawmR3xzbAVrodPDLDETCX2Hp__1vU78ipstudnW05nHRl71oGh0NzvS2XGC1gGTX47SfaJml_CBVo9duLTk8j3NqepAwQG_Ff8Ks_IkiOc9WIlFkM_EXAFOozf6KBi-08sf8f7SmA:1lEyPq:op2EuoKxO1e3mEki77FPBkNYNeCWSYgYnV8lo3_Ec_0', '2021-03-10 17:57:38.224077'),
('5j8boji73kzxfk30gkqvdvj687y6tpn5', '.eJxdkc1uwjAQhF-l8pkmjvNTwg0Qhx5oq6Ce2ira2IaYJnbk2EgV4t3rNCkJ-OSdWX-aXZ9RDtaUuW25zgVDCxSg2VQrgH5z2RnsCPKgPKqk0aLwuhZvcFtvqxivVkPvDaCEtnSvk9gdwgKIAkoggpjSKCbzEEhYYIITiCEN9_F8nkCQ8DnGkAZpiIMoIimlBXbQP9zeVlUuoeaOCawW0hlcGsGA5VLVhe6Mtbfztt7ae1gts2z5sn6dNBnRKNfy_JZtdruJThUTh84hT0kQT4xuK8EM1VxatPg4o6EeMry3FrRQXTxdudpvubGNb3vZr0RrnCfc1pzZTYAus55BroyM0wpq1Y4Q3Sv-kOHxv77F8R9-pYVX2qZ_c59oQN0hSlWPjGhknKCyQMWnxXgfypHFB0PJ-yxMGHT56veU1yDh4GZ1f0SNOHE06A0Y4YI4fVT0n-C20Wh15NTd8eUXZT3V2A:1lJdB8:r2Sx96Rq5b0Fd9yyqhhKO1T1uHpD7Rf4-_m6tIOgPPw', '2021-03-23 14:17:42.984481'),
('5rt7f1tk4jkswp13jifbli4xeiic0qve', '.eJxdkc1uwjAQhF-l8pkmjvNTwg0Qhx5oq6Ce2ira2IaYJnbk2EgV4t3rNCkJ-OSdWX-aXZ9RDtaUuW25zgVDCxSg2VQrgH5z2RnsCPKgPKqk0aLwuhZvcFtvqxivVkPvDaCEtnSvk9gdwgKIAkoggpjSKCbzEEhYYIITiCEN9_F8nkCQ8DnGkAZpiIMoIimlBXbQP9zeVlUuoeaOCawW0hlcGsGA5VLVhe6Mtbfztt7ae1gts2z5sn6dNBnRKNfy_JZtdruJThUTh84hT0kQT4xuK8EM1VxatPg4o6EeMry3FrRQXTxdudpvubGNb3vZr0RrnCfc1pzZTYAus55BroyM0wpq1Y4Q3Sv-kOHxv77F8R9-pYVX2qZ_c59oQN0hSlWPjGhknKCyQMWnxXgfypHFB0PJ-yxMGHT56veU1yDh4GZ1f0SNOHE06A0Y4YI4fVT0n-DyN1odOXV3fPkFZUvV2Q:1lKpF5:SR02-g9N5XlPyt8iZFnKY23HoWxL9RgU47v4rFQS0uc', '2021-03-26 21:22:43.192072'),
('6475y3jie3z5a2mj80mvvgsrhdna8izz', '.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3MucucORNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63yfwkia5P3qxU_XN8ewfowHfYXRZ4uGSQM8Ehh0KIvOBVBjxrKaclFFBnu6KqSmClqiiFmtUZZXnOayFaitAzbjf1fWNgUMgEOWiDhjJBS5CNsUPrZuNls9283xjzYmxFBmUmsv48klhHzIefwGk7T3A91qlXYRrTaZHTXvuAnsbF0ZxDkNNqYfALY6tED4P1V4hblDRmePqv73HqV11o2YX2uvQ8JoqoB0Rnsef0tazXDGBgjxHxd0TQP4pEfYSgsR_1q-LOAo4dnT0ogXd6-gM2jaxj:1lAJ3C:nzj2jP0GyBBSjMF2mKv21ilZAXJmdqz9fs-9knvEoLg', '2021-02-25 20:58:58.553261'),
('6gs5m1u3bwwxryom91b14iim14xeg5af', '.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1l9w1r:n2gCW5vQstKnOuKNlEd-ASkqb51ix_fqzL369yjVbpo', '2021-02-24 20:24:03.270180'),
('7dla9lyyqs0u6y33iph6tpkopmutif1w', '.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lCQXp:gNMXjCJBviDqv2JeM6vPgeUzPayJ_4W4j8RqmVzhP4M', '2021-03-03 17:23:21.603509'),
('7sw0yxqmufarb0zgke4bfse073ssllsh', '.eJyFVV2PmzgU_SuIfR0ykEw-pm-U0AopCRGQqttuFTnGAXcMRjbMbmc0_32vkwx4EqK8ObY599zjc25ezS1q6nzbSCK2NDU_mY55p-_tEH4ipTpIf6My4wPMy1rQ3UBdGZxO5WDJU8I-n-5-AMiRzOHryX72sMOz6XA23j_aO3tqjx6wvUfONHVSezJFBE9GU_K4R4-2MxwRe_Iwntn2dGiPbRvvxgB6gNs3jG1LVBDARGlBSzggZU1TlG5LXuyEOvAG8WA58AbGZzeK3JUXapcwT2nG4dJwOnHG2oHq3rkzC1I25qefr6fFq6n2x3fmqaYXrr4EXzeR6wX_NLadjlaKmWBw9BesKMgDy6p5eWHEqijBxHy7M3FOWSpIKQ_Ip0onxE28caMgjFuce0nqprpvZIME5feMyrpDViIA4hFk1IIE68iPLyBOrZ1B5Bw-efulQPQeJy2Y_81dbG40SEpMWX9rDy2Qu_K_h4bT0SLPiDUIU16ecSIprXs4TVuoyF-HUeLHfWR2SFg4R6Lu5_P4kY-mkiAVFzWR94JKC5XkPy47VAZ2b1BGWrUduwWKg5UR-d7CXYZX0CQtLUEwQwXXiBLGLMkgERbvYB2tyQOk8d1Y-r00j4DSgt9WQTSyGDFIHuhQU9jX0YctOggIpOPNInHn12gLIhtWo1QjvQe-Tx3eSI-Ct9jE7zYx3FUSeMHanbtXwAte02duASxmjQQTgOY1xbRCKdLt2YgMakpr1FXVPJX4q3kwD42_jbVa-aukXyv1pDWIQlMlmFpAHHTNCooFr3JekuObdNW0uC_cOPgSeF0abrw7PJCke4oPJr90gKzhjXLE9hYpqvpPV7JzurtJwij4oVX0wijyrxWEScsFfTnWw1wIopXLOM-Y5uBZW2Xpz4NQ9eKvL4N-9mwQTq5aIZUqopkuJ1hzRpczP3HX7g2hSI0q1BMRWnLcMCRkCzzUcudH38BjoQEKffWvEYYR-Qy24hYIkxGNMCpxzrvxOeySlwTr8Abhmlb8ki_jGNUHKwvB_-0ZYbPzdPeOsByVqSU4fjpEt2eIdTFeBHHSivvB-Qdq70P_ner5oP2j2UEb-bEaCreeTKrJcKlBlqm-fx3_O7cFKmFqCiU3hrwT87RfgU7ADfa7HXHYgN4qwX8TDGv77X8qGbeV:1lWRk6:EQY4MfS53OGv3h_SjSNcUH5pFwqSx3NcTWllAv6mmbU', '2021-04-27 22:42:46.879867'),
('8gb5gq84nbu6cm4hda115tg1rbze3nn4', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9D9D:ys_DvM6hTH1kpEWnGVv9iB-ud7hk16siA0T-EKnKSrg', '2021-02-22 20:28:39.762624'),
('8km8kn39cm7r00dwa16jhy1apnyjkkfh', '.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEim6:5TFcyQi08R_EFjTUlPhVRfOh7uN3f8lqKpIAnJ4YzQg', '2021-03-10 01:15:34.331133'),
('9t3gnzjn1p2gzn3o7kmh7ofb0xiq4yej', '.eJydk29vmzAQxr8KYm8Twv8mfUcpm5AaqCCZKm0Vuthu4g7syIZqVdTvPpMQQpNW2sar457zz8-d7Z1eQFNvikYSUVCsX-uWPhrmVoB-EdYK-BnYmhuIs1rQldGWGJ0qjTnHpLzpat8BNiA3arXvqc_GFrgWssEFDyHXs6cO2M7KtE0fPJg5T9506oPlk6lpwsyaOabluvYMoZWpoHvcU1OWBYOKKCbgijIlEFZTDLhgvFqJVgiN3JgboaHdBFkWJGE6KKrplquS-D6L8nyQRxzTdavYV77lDYR2KtZIrwhr9Osfuy7Y6W3eG-mdlzBNvsbfllkQxj8b08RO0joWpZK-qIiqsalww1Xx20hHG1piQZjcE7sdOtIyXwZZnOb9-okkdbOdNLIBQfmkpLI-EduhKOIB4vSQKFnEt8FtdEHpujqjHHw9tpxhe_6J9z24W_5vb26PCZLoIdWskynyAmUDiHJ25ohgWn_g6KpHZdF9mi0GDf6Vldl7K4PxCLLloiZyIqgcAyO_ubwAdkdl9pA8TrQsCu-CefoJSVI2FgSVUPHPcNagpz1Ke9Dm0YfWDiA5Vv_jilwYvBjX9Bz9j-Oy-_V3cb4ItAvK0dLxXh17PT_N1727x8MzKipgsFb3Vj1hVNMXonf5LdRUgVT-lBH7hGpkK_gzQSo2O-1oV9l8-wPuI35m:1lO2au:aSxtrVpyRhbTyaJIyzuXmLVyISe20sKcSkwC2Yg_xVM', '2021-04-04 18:14:32.556742'),
('9y2whidkmbky91eifgvqoudkjbp8nfjo', '.eJyFlV1v2jAUhv8Kym5JSyFA6V0GWRWpBRRg2leFHOdAvDlxZDvd1qr_fceUxW5J1TvnOHnOez7z6G1JrfNtrUBuWeZdef2J13WNKaG_oDQ32U9S7sUZFaWWLD0zr5wdb9XZrciAfzy--wKQE5Xj14M0oEF2ORkFw91okPZG6WVKL8fpuDceoiXoBf3-cEKGAQGS0d4QAjK5CMYjCv0AYDRE6AG3qznflqQAo4hJpjgriKol3kOpWUaybSmKVJr7cP6j7vWywTy-XTj3Js5e1yugrL2r74_Hw6Nn7MOud4RPF_NP8fUmCafxkWIkSI5XH_DEMA94rOqHBw5-xYCC99T1aM54JqFUB7IhXjTEzWoTJvFi1XDOFei6Oq9VTSQT55wpbckmWu_p7qn7UuC4wSXRcpGso1WbrJRIn-ZE6nZNkwYSzqMvriIJlZAa1Dlm1icl_BHKUjk2QE32JtBjbL0GtIrnnSSa3oSHVLfRFCt9CZSTQjhCgXNfcewRX1jshRPkAdn50rmNWmU-A5WPz34BjlhKOPYi5kEztLv0fkPHBKLo1eZmHc7eki1B1VyTzBG9Q72_LG_g9sz0ZrP63zCdcL6Op_EynIVvwAuh2b3wEUt5rZgoMeeaUVaRjFh_uajlHn0qf2C9BraG62g-i2eLztfO0pyi-bo9V6akGpPCMpMwc8CRcHNWMCpFlYsSnmtivTlzcROu4k_x1M7FO3XHAim2Y5RQE99JByiNNcoJ3_lQVPqvdTlqXEYrU5933IAyRTrl7_cWaYcn3KwXSfzNCWK6SJLoLTiuMyHZw3MIVEgJrgch9twZisvGy200iw-6o-XpFnnVCZCxg3qojBOnj3OgTrPZ0Y3W4TJ8LymaVKRl6lgpaM2JVA2474xylHzGtl10MEPX0VuCcT3dY6cKHxOzB0cwKWkupAXbYV7Hy_eqqFnVUkMuKNGH6ZBS_G7Zin0709fYLa87s3VHKvTqE17lxCeKti9KO9rxEhfFyeo-_lJere5c4Cco8u75J7MtSIlbU5rcUJx38I72CoNCAtqtRR4MOG6VFD-B6uZXtf2vDpvg6R8tGXda:1lXPSx:jzPMrUaRUl_vcEjyijDkdlJtuxhNv1g9MiGaf4t_x8A', '2021-04-30 14:29:03.391798'),
('az8acfba2881x3ijbjb7c8d62bw4k0px', '.eJyFlV1v2jAUhv8Kym5JSyFA6V0GWRWpBRRg2leFHOdAvDlxZDvd1qr_fceUxW5J1TvnOHnOez7z6G1JrfNtrUBuWeZdef2J13WNKaG_oDQ32U9S7sUZFaWWLD0zr5wdb9XZrciAfzy--wKQE5Xj14M0oEF2ORkFw91okPZG6WVKL8fpuDceoiXoBf3-cEKGAQGS0d4QAjK5CMYjCv0AYDRE6AG3qznflqQAo4hJpjgriKol3kOpWUaybSmKVJr7cP6j7vWywTy-XTj3Js5e1yugrL2r74_Hw6Nn7MOud4RPF_NP8fUmCafxkWIkSI5XH_DEMA94rOqHBw5-xYCC99T1aM54JqFUB7IhXjTEzWoTJvFi1XDOFei6Oq9VTSQT55wpbckmWu_p7qn7UuC4wSXRcpGso1WbrJRIn-ZE6nZNkwYSzqMvriIJlZAa1Dlm1icl_BHKUjk2QE32JtBjbL0GtIrnnSSa3oSHVLfRFCt9CZSTQjhCgXNfcewRX1jshRPkAdn50rmNWmU-A5WPz34BjlhKOPYi5kEztLv0fkPHBKLo1eZmHc7eki1B1VyTzBG9Q72_LG_g9sz0ZrP63zCdcL6Op_EynIVvwAuh2b3wEUt5rZgoMeeaUVaRjFh_uajlHn0qf2C9BraG62g-i2eLztfO0pyi-bo9V6akGpPCMpMwc8CRcHNWMCpFlYsSnmtivTlzcROu4k_x1M7FO3XHAim2Y5RQE99JByiNNcoJ3_lQVPqvdTlqXEYrU5933IAyRTrl7_cWaYcn3KwXSfzNCWK6SJLoLTiuMyHZw3MIVEgJrgch9twZisvGy200iw-6o-XpFnnVCZCxg3qojBOnj3OgTrPZ0Y3W4TJ8LymaVKRl6lgpaM2JVA2474xylHzGtl10MEPX0VuCcT3dY6cKHxOzB0cwKWkupAXbYV7Hy_eqqFnVUkMuKNGH6ZBS_G7Zin0709fYLa87s3VHKvTqE17lxCeKti9KO9rxEhfFyeo-_lJere5c4Cco8u75J7MtSIlbU5rcUJx38I72CoNCAtqtRR4MJp5Kip9AdfOv2v6Xh7Ke_gGfzneL:1lX4hq:mt3fPBMQAi5prtjHMPFtHh5ovoR2t9m9DKD8k7RTH90', '2021-04-29 16:19:02.792634'),
('cekjx6eq8psorlvh6ndu3morlsy263yq', '.eJydk29vmzAQxr8KYm8Twv8mfUcpm5AaqCCZKm0Vuthu4g7syIZqVdTvPpMQQpNW2sar457zz8-d7Z1eQFNvikYSUVCsX-uWPhrmVoB-EdYK-BnYmhuIs1rQldGWGJ0qjTnHpLzpat8BNiA3arXvqc_GFrgWssEFDyHXs6cO2M7KtE0fPJg5T9506oPlk6lpwsyaOabluvYMoZWpoHvcU1OWBYOKKCbgijIlEFZTDLhgvFqJVgiN3JgboaHdBFkWJGE6KKrplquS-D6L8nyQRxzTdavYV77lDYR2KtZIrwhr9Osfuy7Y6W3eG-mdlzBNvsbfllkQxj8b08RO0joWpZK-qIiqsalww1Xx20hHG1piQZjcE7sdOtIyXwZZnOb9-okkdbOdNLIBQfmkpLI-EduhKOIB4vSQKFnEt8FtdEHpujqjHHw9tpxhe_6J9z24W_5vb26PCZLoIdWskynyAmUDiHJ25ohgWn_g6KpHZdF9mi0GDf6Vldl7K4PxCLLloiZyIqgcAyO_ubwAdkdl9pA8TrQsCu-CefoJSVI2FgSVUPHPcNagpz1Ke9Dm0YfWDiA5Vv_jilwYvBjX9Bz9j-Oy-_V3cb4ItAvK0dLxXh17PT_N1727x8MzKipgsFb3Vj1hVNMXonf5LdRUgVT-lBH7hDr3reDPBKnY7LSj3XaEb38AbFl-lQ:1lNMXJ:cQzwz8fGA0Ech6p5EqdEoLqejgL9XcXXB4gTMwmIsDA', '2021-04-02 21:20:01.151894'),
('d6x8hdd6n7skrddoguzl4ezuwc2ahoa5', '.eJxdkc1uwjAQhF-l8pkmjvNTwg0Qhx5oq6Ce2ira2IaYJnbk2EgV4t3rNCkJ-OSdWX-aXZ9RDtaUuW25zgVDCxSg2VQrgH5z2RnsCPKgPKqk0aLwuhZvcFtvqxivVkPvDaCEtnSvk9gdwgKIAkoggpjSKCbzEEhYYIITiCEN9_F8nkCQ8DnGkAZpiIMoIimlBXbQP9zeVlUuoeaOCawW0hlcGsGA5VLVhe6Mtbfztt7ae1gts2z5sn6dNBnRKNfy_JZtdruJThUTh84hT0kQT4xuK8EM1VxatPg4o6EeMry3FrRQXTxdudpvubGNb3vZr0RrnCfc1pzZTYAus55BroyM0wpq1Y4Q3Sv-kOHxv77F8R9-pYVX2qZ_c59oQN0hSlWPjGhknKCyQMWnxXgfypHFB0PJ-yxMGHT56veU1yDh4GZ1f0SNOHE06A0Y4YI4fVT0n-C20Wh15NTd8eUXZT3V2A:1lJc9z:vcVyLnsxjPygpZ1zrT-KTUVQSASgAgjfCMPLu-hbdNw', '2021-03-23 13:12:27.430842'),
('eg8tw4kehsmeluaonassauzcwj6b6p69', '.eJyVkN1vmzAUxf8V5L4ywjehb16K1Ej5qEI6bdoqdLENuAU7MlCpivK_185Ymm5Pe7v3nHN_OrpHVMA4NMXYM1Vwim6R5yP7WiyBvDBhHPoMopYOkWJQvHRMxJnc3llLytqvU_YToIG-0dd-CYmXRElFy5JVNADmRmnghmGUxkB9P3DLJPXT-byM_HlIoyQNYhbElQdRGHhhpaFnXDW2bSGgY5pZ16AIB20xMXAKtBCyK5WxFk7uWA_b3R7fYesus9Z4s7jHP66iAz9IHVw-7LI8v9KJpLw2Tuym_pVuvuN5qY06JkZ0-_M4DUdknNhGU6nsG1494sXy1-i6NNiY3qrV-o2euH6eHhupkycbkYa3VDHRn3EGE14weJN931re5XzGXqEdgXApZi3vhw8ao3xAp6eT_bnR_ILaZYsVXm_z_6viX-5Xy3yPrX8oM8VIC52cTR_68mf_q94bM-2efj-u6EBAzZQ2gAz8laFJP8DANUjrH4o6C7rIQclnRvTsnt4Bz9XZEg:1lUvW9:F9RWCPDV4krfwzKWjunLNd-N57d4k_PGM45JEji-m-E', '2021-04-23 18:06:05.739906'),
('fck8546wpezl4psm1fzhw7nicswpslqw', '.eJx1kluP2jAQhf9K5L5CSEI2wL65EKlIgayAVpXaVTS-QLwkNnKc7QXx3-vQENiWfTs-M_PpeDRHlEFt8qyuuM4EQ49o6KHerUmA7rlsKuwF5E65VEmjBXGbFretVu5CMV58bHvfAHKocjsdhGRMCfUgCok3Hm23EHpjP9pSnwZ-EMGITNjI9yeBT8JgSCccSBQReAgIsXo8tNAzblsXRSah5JapKspK9tuWuDSCAcukKoluSlM3dp01XjpP8WyVOrPYSdK1M_2UrlbzJLmZoIqJnbITkR8FN36zjFEPlVzW6PHbsRVH1PhRD7UJ4i84-Yyn8--157HhsgmpC-t_sErYTVl54JKKAp16iOaiYJrL6gxsQGEHwsv4a-r4HWDAX6GogQolB4WozJXHmTDo9Hzqvc007lCreJrgRbq-FyYHyfpa0X1f3U8UdJhkvt5g5z_YQHNaQKkG7aL6l_c_KX_xOyGDYYffrPAC34toNDBegt6_EzB8_6MDO1tC3_w0l5TVDfeHMDRHTaQz56HjLOLZfIbXDp6lTxts1T1gaffOoOoDUwcDVl3JleEmt7eoDuc_P_-9mqwECTuubQNQI145av0DGGGXZ_2ro8-GvauDVi-cWu21tcsG7LGc_gCPISnf:1lXRPN:dbtheccyw_dS9h0SfagJOVBqBy_e_gIdVnbKcdeULaM', '2021-04-30 16:33:29.183194'),
('feinnzqcrl3nscwrvgym5alavolhmcjs', '.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lD63S:Qkk70_YxWp_PFLyhfdd9HkBGRaprbngMp6hud1WxQ74', '2021-03-05 13:42:46.863086'),
('gs83yq99ewmfjhdjzin027977dyr32bk', '.eJydk29vmzAQxr8KYm8Twv8mfUcpm5AaqCCZKm0Vuthu4g7syIZqVdTvPpMQQpNW2sar457zj-fuzE4voKk3RSOJKCjWr3VLHw1zK0C_CGsF_AxszQ3EWS3oymhLjE6VxpxjUt50te8AG5Abddr31GNjC1wL2eCCh5Dr2VMHbGdl2qYPHsycJ2869cHyydQ0YWbNHNNyXXuG0MpU0D3uqSnLgkFFFBNwRZkSCKspBlwwXq1EK4RGbsyN0NBugiwLkjAdFNV0y1VJfJ9FeT7II47pulXsK9_yBkI7FWukV4Q1-vWPXRfs9DbvjfTOS5gmX-NvyywI45-NaWInaR2LUklfVETV2FS44ar4baSjDS2xIEzuid0XOtIyXwZZnOb9-YkkdbOdNLIBQfmkpLI-EduhKOIB4vSQKFnEt8FtdEHpujqjHHw9tpxhe_6J9z24W_5vb26PCZLoIdWskynyAmUDiHJ25ohgWn_g6KpHZdF9mi0GDf6Vldl7K4PxCLLloiZyIqgcAyO_ubwAdqsye0geJ1oWhXfBPP2EJCkbC4JKqPhnOGvQ0x6lPWjz6ENrB5Acq_dxRS4MXoxreo7-x3HZ_fm7OF8E2gXlaOl4r469nm_zde_u8fAbFRUwWKt7q35hVNMXonf5LdRUgVT-lBH7hNr7VvBnglRsdtrRbruRtz9sV36U:1lPtS6:Il51IsMMa7IOEheKHOqEsgXz_iVY6T2Mi5XtAYkiy50', '2021-04-09 20:53:06.214511'),
('gwt4cwh4xezujb04vhz0xqr0clt6w6cc', '.eJxVjMEOwiAQRP-FsyGlrCx49N5vIAu7StXQpLQn47_bJj1o5jbvzbxVpHUpcW0yx5HVRRl1-u0S5afUHfCD6n3SearLPCa9K_qgTQ8Ty-t6uH8HhVrZ1mCS5Qw3tDlgMkwOsO8zhixA7IBsh-yD8di5wMKcwFo4G_QkW6z6fAHk8TgF:1lXQZK:6S1f_IAsHhDAe_zRzyMlNidCGtQM5G1AelKjPzR21qo', '2021-04-30 15:39:42.767189'),
('igrd54rr2l2ctbhyfcp6blfq2wzscnla', '.eJxdkc1uwjAQhF-l8pkmjvNTwg0Qhx5oq6Ce2ira2IaYJnbk2EgV4t3rNCkJ-OSdWX-aXZ9RDtaUuW25zgVDCxSg2VQrgH5z2RnsCPKgPKqk0aLwuhZvcFtvqxivVkPvDaCEtnSvk9gdwgKIAkoggpjSKCbzEEhYYIITiCEN9_F8nkCQ8DnGkAZpiIMoIimlBXbQP9zeVlUuoeaOCawW0hlcGsGA5VLVhe6Mtbfztt7ae1gts2z5sn6dNBnRKNfy_JZtdruJThUTh84hT0kQT4xuK8EM1VxatPg4o6EeMry3FrRQXTxdudpvubGNb3vZr0RrnCfc1pzZTYAus55BroyM0wpq1Y4Q3Sv-kOHxv77F8R9-pYVX2qZ_c59oQN0hSlWPjGhknKCyQMWnxXgfypHFB0PJ-yxMGHT56veU1yDh4GZ1f0SNOHE06A0Y4YI4fVT0n-C20Wh15NTd8eUXZT3V2A:1lJ30M:gTUSqINn4CGaLuPxTI_3ZPk7Pd_rx7IwJVpesjFegI8', '2021-03-21 23:40:10.405584'),
('iwhw41fh7c65gk2rvvef1rd3l2yg2pht', '.eJydlF1v2jAUhv9KlN1CcPgK9M4N2RQJSJXAVGmrkLFNcZfYkZ1Um6r-951AgJQ22sedc87J4_ccv_aLvSFlsd-UhuuNYPaN7dqdZmxL6A8uqwR7IvJROVTJQoutU5U4ddY4C8V4elvXvgHsidnD3-PdZLilE68_Ge2maIs8NBhStCOux1yGxh7hdDzw-HRHpsjtDzgaD0cThLw-GiFEtyOAHnC7Mk03kmQcmIRlQkKCy0IwwjZSZVtdJXwncRaO71i3OI7x0o8aRYXIFZSEd3GQJI04VUw8Vpm-N3ZHjUQ1FbdjZ1yW9s23l3rxYlfxUceutfjR8nP4ZR1jP_xeIsQGy0qxTiH1CVYCxgbLvYLi145N9yJlmktzINY71KR1ssZxGCXn_3uGF2XeK01JtFC9VJjiQqyGAsQjZHCGBMtVOMOz4B2l7uqKctT1UHGa7Y0vvK94vv7f3oZnDF4G95HlXkTxZ5KWhAolrxRxJooPFHlnVBzcRfGq0eBfSZm-ldIYj-a50gU3PS1Ml0j-U5l3wPqo0BmShEsrDvw5XkQtJCNkV3Oakky14dxGTweUdW8tgg-lHUGmC9_djLcK7J-JMCMQmKznKzxrk6i5KdOCsFaBg6bL_fk6OdnAwmAzP7zDM9zCzlQhnlUXqDQtDRwzjLYQVOSEkbbtLnZZBLMwsqqbCn7-wH1Xe4FnVDeHdsDkB0_90eCT69H_o50ug56HyQpb7yinIzvdu5MXrt3-66Du4fjMbDIiySPca3jiKMyP23U8J4UAEMQvEX0IwEOUa_XEKaxRnTvJhZG-_gaIDtpM:1lUsif:Q4nKa7XNiqJmaXlnNaXlPzwNJC3T2R2Y7xFMAoFpXYY', '2021-04-23 15:06:49.349098'),
('jiuy4rprdfeo58fbwoywq8aqjdiwk83f', '.eJydlF1v2jAUhv9KlN1CcPgK9M4N2RQJSJXAVGmrkLFNcZfYkZ1Um6r-951AgJQ22sedc87x4_ccv86LvSFlsd-UhuuNYPaN7dqdZmxL6A8uqwR7IvJROVTJQoutU5U4ddY4C8V4elvXvgHsidnD7vFuMtzSidefjHZTtEUeGgwp2hHXYy5DY49wOh54fLojU-T2BxyNh6MJQl4fjRCi2xFAD7hdmaYbSTIOTMIyISHBZSEYYRupsq2uEr6TOAvHd6xbHMd46UeNokLkCkrCuzhIkkacKiYeq0zfG7ujRqKaituxMy5L--bbS714sav4qGPXWvxo-Tn8so6xH34vEWKDZaVYp5D6BCsBY4PlXkHxa8eme5EyzaU5EOsTatI6WeM4jJLz_p7hRZn3SlMSLVQvFaa4EKuhAPEIGZwhwXIVzvAseEepu7qiHHU9VJxme-ML7yuer_-3t-EZg5fBfWS5F1H8maQloULJK0WcieIDRd4ZFQd3UbxqNPhXUqZvpTTGo3mudMFNTwvTJZL_VOYdsL4qdIYk4dKKA3-OF1ELyQjZ1ZymJFNtOLfR0wFl3VuL4ENpR5Dpwnc3460C-2cizAgEJuv5Cs_aJGpuyrQgrFXgoOlyf75OTjawMNjMD-_wDLewM1WIZ9UFKk1LA9cMoy0EFTlhpO24i10WwSyMrOqlgp8_cN_VWeAZ1c2hHTD5wVN_NPjkevT_aKfLoOdhssLWO8rpyk7v7uSFa7f_Oqh7OP5mNhmR5BHeNfziKMyP23U8J4UAEMQvEX0IgJBcqydOYY1efwNkKdQR:1lUxq7:dl__CRqoq8nMzhay69jndRFH2Z2DCm9gFpopskg8hK4', '2021-04-23 20:34:51.122481'),
('jp0v7zb4ugmtrwe1wxw1uzcdb3y11oxq', '.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEirH:n9O6uicZeqUzNuprb3-qrQ9P4q1sn7XRkjS8kMbDFjo', '2021-03-10 01:20:55.828453'),
('ll594mc3qei0avnt2bpdyt4woi0ggaba', '.eJyVkF9vmzAUxb8K8l4ZsRP-hL7RlElIJJmStpq0VcjYl-AM7MhApCnKd6-d0jTdnvZ2OeeeH8f3hAo69HUxdKALwdEdmvrIvRVLyn6DtA7fU7lTHlOy16L07Io3up23VBya-3H3E6CmXW3SYRRUFGJSVQSTqMQzv_SDaD4L51XFAs5KmMaEgh8zHEcRmzMchhwTmIUkpn6MDfSCq4amKSRtwTD3rdppdYS9Mi7IXnDKC6naUlt34S29zHOeszxPnGWy-TVgzHjiPKS587jJnlbf1jexXhyUCWXfN-l2e6MzxcXOOiEJyI1ujxX4LmpBDuju52kcTsgaoYvGiulzkj8li8z-nM9W9hW6MfoXMwlzSjPWymyeXcRq0XANsrvgLMa_YpJV-mPtkGt8AkfaDJQJJSeN6PoPGnDRo_PL2f3caH5FbdJFnizX2_-rMr3m82z7mDj_UCYaWENbNRkP9PX9-696f8C2e3k7XNFSSXegjUFZL46ARv1Ae2FARv9Q9EUwDzlotQdmZjx673VNzfMrUzXkfA:1lUywz:5JfiDRE3KfE6JMBvIjDJ0nomFxbdgH35V_iftWz0flc', '2021-04-23 21:46:01.419585'),
('lwchtqpnjnpxx1thwdzccevpr7qx9ur2', '.eJx1kluP2jAQhf9K5L5CSEI2wL65EKlIgayAVpXaVTS-QLwkNnKc7QXx3-vQENiWfTs-M_PpeDRHlEFt8qyuuM4EQ49o6KHerUmA7rlsKuwF5E65VEmjBXGbFretVu5CMV58bHvfAHKocjsdhGRMCfUgCok3Hm23EHpjP9pSnwZ-EMGITNjI9yeBT8JgSCccSBQReAgIsXo8tNAzblsXRSah5JapKspK9tuWuDSCAcukKoluSlM3dp01XjpP8WyVOrPYSdK1M_2UrlbzJLmZoIqJnbITkR8FN36zjFEPlVzW6PHbsRVH1PhRD7UJ4i84-Yyn8--157HhsgmpC-t_sErYTVl54JKKAp16iOaiYJrL6gxsQGEHwsv4a-r4HWDAX6GogQolB4WozJXHmTDo9Hzqvc007lCreJrgRbq-FyYHyfpa0X1f3U8UdJhkvt5g5z_YQHNaQKkG7aL6l_c_KX_xOyGDYYffrPAC34toNDBegt6_EzB8_6MDO1tC3_w0l5TVDfeHMDRHTaQz56HjLOLZfIbXDp6lTxts1T1gaffOoOoDUwcDVl3JleEmt7eoDuc_P_-9mqwECTuubQNQI145av0DGGGXZ_2ro8-GvauDVi-cWu21tcsG7LGc_gCPISnf:1lXRQX:UnwhZXeqKNJddKZEHnpiVAZJstyC_15xJT8hHMC_3RA', '2021-04-30 16:34:41.993897'),
('nq3evzzceo11sser9zemjct4riwih4q7', '.eJxdkMtuwyAURP-FtWtj_JCdZdQusugmVVdVha6BxKQ2RDwqVVH-vdexmzRhBTPM4Q4nwiGGnkevHNeSrEhOkv9aB-JLmcmQBzB7mwprgtNdOl1JF9enr1aqYb3cvQP04HtM1xUuJnMoc8GghEqIsmJNAazoKKM1VNAWu6ppashr1VAKbd4WNC9L1grRUYRecLs4DNzAqJAJctQGjVGZSFYfJzIVyBOy2O8-gtN2SroBz5lXIR6zOMvZoH1AT2MhNCc4OSczg10ZWyUGGK2_QdysZMoELUE-_Z3vcepHXWnFlfYyZx4nWlAPiN5i5vw51-MjGNjjiNhaBP2tltr8CEFjHvWb4i4Cljg6e1AC9zQhyyPc2LFz0zDPm-3mjdyMy-edfwFSe6xi:1lCNye:8t2qp5rvVEoriJokBi-rPfKj7Y86tuLFyW79XurC5Lg', '2021-03-03 14:38:52.765117'),
('nwcxw82e85hh06qcv0xx737uwjlo5tim', '.eJydk29vmzAQxr8KYm8Twv8mfUcpm5AaqCCZKm0Vuthu4g7syIZqVdTvPpMQQpNW2sar457zz8-d7Z1eQFNvikYSUVCsX-uWPhrmVoB-EdYK-BnYmhuIs1rQldGWGJ0qjTnHpLzpat8BNiA3arXvqc_GFrgWssEFDyHXs6cO2M7KtE0fPJg5T9506oPlk6lpwsyaOabluvYMoZWpoHvcU1OWBYOKKCbgijIlEFZTDLhgvFqJVgiN3JgboaHdBFkWJGE6KKrplquS-D6L8nyQRxzTdavYV77lDYR2KtZIrwhr9Osfuy7Y6W3eG-mdlzBNvsbfllkQxj8b08RO0joWpZK-qIiqsalww1Xx20hHG1piQZjcE7sdOtIyXwZZnOb9-okkdbOdNLIBQfmkpLI-EduhKOIB4vSQKFnEt8FtdEHpujqjHHw9tpxhe_6J9z24W_5vb26PCZLoIdWskynyAmUDiHJ25ohgWn_g6KpHZdF9mi0GDf6Vldl7K4PxCLLloiZyIqgcAyO_ubwAdkdl9pA8TrQsCu-CefoJSVI2FgSVUPHPcNagpz1Ke9Dm0YfWDiA5Vv_jilwYvBjX9Bz9j-Oy-_V3cb4ItAvK0dLxXh17PT_N1727x8MzKipgsFb3Vj1hVNMXonf5LdRUgVT-lBH7hDr3reDPBKnY7LSj3XaEb38AbFl-lQ:1lN08n:NUw4z_EUk-l5I7uj6fL5u01zEujt1F0LwPTDtiNxtGc', '2021-04-01 21:25:13.755811'),
('oez0vdveb7t0mo9oqobqp29n9m8dc9ro', '.eJxdkctugzAQRf_F6xTMU9Bl1SyyqFQl6qqt0GA7wSnYyNiRqij_3iG4gYQVPtc-vgxnUoGzTeUGYSrJyTOJyGrJamA_Qo0BP4I66IBpZY2sg3FL4NMheNNctC9-752ggaHB03mGT8wjSCMWQwoZY2kWFwnESU1jmkMGZbLPiiKHKBcFpVBGZUKjNI1LxmqK0qtu79q2UtAJdALvpMJAKCs58ErprjZj8LrZbnaLwMpeI968b9e7JWeay8OYUEoXeJxDtCKdUI48f56JX_tbPwYHRuqxkGlxHQ7Cuj50Ew5bOVjMJM4Jw7EzuawmR3xzbAVrodPDLDETCX2Hp__1vU78ipstudnW05nHRl71oGh0NzvS2XGC1gGTX47SfaJml_CBVo9duLTk8j3NqepAwQG_Ff8Ks_IkiOc9WIlFkM_EXAHe3Rt9FAzf6eUP8hrSmg:1lGlkD:RZdS759ukyh8ZcvNbLYEByFvG5eRDA4el_dYktOJCYk', '2021-03-15 16:50:05.581509'),
('ps3xyycw40487ih585njjhseoxmiqip7', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9HlZ:q0duARw4gKWXh-r5SnUehBw8oiEhBax6miJP3uwPXe8', '2021-02-23 01:24:33.116094'),
('pyw2oaosv9m3ujkv2151dc3hbkjdybod', '.eJxdkctugzAQRf_F6xTMU9Bl1SyyqFQl6qqt0GA7wSnYyNiRqij_3iG4gYQVPtc-vgxnUoGzTeUGYSrJyTOJyGrJamA_Qo0BP4I66IBpZY2sg3FL4NMheNNctC9-752ggaHB03mGT8wjSCMWQwoZY2kWFwnESU1jmkMGZbLPiiKHKBcFpVBGZUKjNI1LxmqK0qtu79q2UtAJdALvpMJAKCs58ErprjZj8LrZbnaLwMpeI968b9e7JWeay8OYUEoXeJxDtCKdUI48f56JX_tbPwYHRuqxkGlxHQ7Cuj50Ew5bOVjMJM4Jw7EzuawmR3xzbAVrodPDLDETCX2Hp__1vU78ipstudnW05nHRl71oGh0NzvS2XGC1gGTX47SfaJml_CBVo9duLTk8j3NqepAwQG_Ff8Ks_IkiOc9WIlFkM_EXAFOozf6KBi-08sf8f7SmA:1lGij5:8Zv7ApQEOdDZUwhwbl6Mnud4A8g-BrECVA5gpzn8kUQ', '2021-03-15 13:36:43.248050'),
('q7zz2ryd8zrjbqk1ckyhirqfgoutec20', '.eJyFVV1zmzoQ_SsM9zU4YMcf6RvFtMOMbTyAO73t7XhkIYMagRgJ0iaZ_Pe7sh1QHDx-k3fls2eP9iwv5hY1db5tJBFbmpqfTMe80WM7hB9IqRLpb1RmfIB5WQu6G6grg1NWDpY8Jezz6e47gBzJHP492c_udng2Hc7G-3t7Z0_t0R2298iZpk5qT6aI4MloSu736N52hiNiT-7GM9ueDu2xbePdGEAPcPuGsW2JCgKYKC1oCQlS1jRF6bbkxU6ohDeIB8uBNzA-u1HkrrxQu1TTisOVYB35cazFMU9ppjLD6cQZawmlinNjFqRszE8_X06HF1PFxzfmiYsXrr4EXzeR6wX_NbadjlaKsWCQ-gdOFGSDY9U8PzNiVZRgYr7emDinLBWklAfkU6UT4ibeuFEQxi3OrSR1U902skGC8ltGZd0hK3EA8QgyakHaNt9BnFo7g8g5_OX1lwLRe5y0YP43d7G50iApMWX9rd21QO7K_x4aTkeLPCLWIEx5ecaJpLTu4TRtoSJ_HUaJH_eR2SFh4RyJup_P_Xs-mkqCVFzURN4KKi1Ukr9cdqgMbNCgjLRqO3YLFAcrI_K9hbsML6BJWlqCYIYKrhEljFmSgVMs3sE6WpMHSOO7sfR7aR4BpQW_rYJoZDFi4EjQoaYQ19GHLToICKTjzSJx55doCyIbVqNUI70Hvg8d3ki3grfYxG9jYrirJPCCtTt3L4AXvKaP3AJYzBoJQwCa1xTTCqVIH89GZFBTWqOuqjZTib-aB_PQ-NdYq5O_Svq1Uk9agyg0VYKpA9hB16ygWPAq5yU5vklXTbP7wo2DL4HXueHKu8MDSbqn-DDkHydA1vBGOWJ7ixRV_dSV7Cbd3SRhFPzQKnphFPmXCsIG5oI-H-thLgTRymWcZ0yb4FlbZenPg1D14q8_Gv3s2cCcXLVCKlVEG7qcYG0yOp_5ibt2rwhFalShHovQkuOGISFb4KHmOz_6BjMWGqDQV_8SYViRjzBW3AJhMqIRRiXOebc-h53zkmAdXiGsPigf-TKOUX0YZSH4n54VNjt3d-8Ky1GZWoLjh4N1e5ZYZ-NFECetuO8m_0Dtbem_UT1ftE_aOGgrP1ZL4dqTSbUZPmqQZarvX8dv57ZAJWxNoeTG4HdinuIV6ATcIN5FxCEAdqsE_00wnO1T7k0B-Mi9_g9iVsWK:1lW2dw:GxT4oS9VA6sDmxbLUTnNbdhCU8-mLenyhblyTmJJXcs', '2021-04-26 19:54:44.191857'),
('qj6m1nprr6rbm3295oa8qezp1fzmm8w7', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9EZL:x0LD3relZ4opYCIRKFNVs6UxHrOwxGtGV-wwlHEuoM4', '2021-02-22 21:59:43.910873'),
('r03nktlspdduuxa2c9tbnxi4vrih0css', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l9GAc:kgwimmET5NEKnXoEkTuTOKixa3jknLnEd8xY9icFcA4', '2021-02-22 23:42:18.301425'),
('rj2m3fdpoqme5wuj7pj0ythwwsqnbhy6', '.eJydlF1v2jAUhv9KlN1CcPgK9M4N2RQJSJXAVGmrkLFNcZfYkZ1Um6r-951AgJQ22sedc87J4_ccv_aLvSFlsd-UhuuNYPaN7dqdZmxL6A8uqwR7IvJROVTJQoutU5U4ddY4C8V4elvXvgHsidnD3-PdZLilE68_Ge2maIs8NBhStCOux1yGxh7hdDzw-HRHpsjtDzgaD0cThLw-GiFEtyOAHnC7Mk03kmQcmIRlQkKCy0IwwjZSZVtdJXwncRaO71i3OI7x0o8aRYXIFZSEd3GQJI04VUw8Vpm-N3ZHjUQ1FbdjZ1yW9s23l3rxYlfxUceutfjR8nP4ZR1jP_xeIsQGy0qxTiH1CVYCxgbLvYLi145N9yJlmktzINY71KR1ssZxGCXn_3uGF2XeK01JtFC9VJjiQqyGAsQjZHCGBMtVOMOz4B2l7uqKctT1UHGa7Y0vvK94vv7f3oZnDF4G95HlXkTxZ5KWhAolrxRxJooPFHlnVBzcRfGq0eBfSZm-ldIYj-a50gU3PS1Ml0j-U5l3wPqo0BmShEsrDvw5XkQtJCNkV3Oakky14dxGTweUdW8tgg-lHUGmC9_djLcK7J-JMCMQmKznKzxrk6i5KdOCsFaBg6bL_fk6OdnAwmAzP7zDM9zCzlQhnlUXqDQtDRwzjLYQVOSEkbbtLnZZBLMwsqqbCn7-wH1Xe4FnVDeHdsDkB0_90eCT69H_o50ug56HyQpb7yinIzvdu5MXrt3-66Du4fjMbDIiySPca3jiKMyP23U8J4UAEMQvEX0IwEOUa_XEKaxRnTvJhXfh9TeIEtpO:1lUyDR:tzeBP7zInEFXoG4BeE2dtRhtwDcP_BMuX8tAUuG4-NA', '2021-04-23 20:58:57.898203'),
('s1seedzxx1p0gfuctl56a70ie0o59ku8', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l87vl:7Crm6gVUPt7gAMNskndwoU8Gn0xXzTlfUgrfBL2Y-lA', '2021-02-19 20:42:17.605090'),
('sgudoz5lukm3gb08qpamxwsma2idoct8', '.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3MucucORNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63yfwkia5P3qxU_XN8ewfowHfYXRZ4uGSQM8Ehh0KIvOBVBjxrKaclFFBnu6KqSmClqiiFmtUZZXnOayFaitAzbjf1fWNgUMgEOWiDhjJBS5CNsUPrZuNls9283xjzYmxFBmUmsv48klhHzIefwGk7T3A91qlXYRrTaZHTXvuAnsbF0ZxDkNNqYfALY6tED4P1V4hblDRmePqv73HqV11o2YX2uvQ8JoqoB0Rnsef0tazXDGBgjxHxd0TQP4pEfYSgsR_1q-LOAo4dnT0ogXd6-gM2jaxj:1lCnPg:L7QSCLGdkZCgKukDC9a62hWshEAaCZpjtxLLMUeZs3o', '2021-03-04 17:48:28.133504'),
('t0gf6okisc9yxa7dsnr2h03g2kgzmsc1', '.eJxdkc1uwjAQhN_FZ5o4v0o4onLgUKkC9dRW0cY2xDSxI8dGqhDv3g1xCeBTdmb9ZXZ9JhU421RuEKaSnCxJRBb3Wg3sR6jR4EdQBx0wrayRdTC2BN4dgjfNRbvyvQ-ABoYGb-cZnphHkEYshhQyxtIsLhKIk5rGNIcMymSfFUUOUS4KSqGMyoRGaRqXjNUUoVfc3rVtpaATyATeSYWGUFZy4JXSXW1G43Wz3ezujHGwaEE6oRxZfp6Jrz3mY3BgpB7_YFqsw0FY14duksNWDhY9iYOjOYYgl8XEiG-MrWAtdHqYIWZSQp_h5b9-xIlfcaMlN9p6uvOcyKOeEI3uZkY6M07QOmDyy1G6T9TMEt7Q6jkLl5Zcvqc9VR0oOOCsuGZm5UkQr_dgJQZBfVbMVcBt9EYfBcNvOi_fyl5j9-Z9u97dPwrTXB5Gh1JKLn-ZadKY:1lExK6:yGS-TMjgkphBOTP7tV_qGf0pr1m-o80nMWVWxXBxVI4', '2021-03-10 16:47:38.999667'),
('t1zwqdxuga32xrw71bole9si0bhqomca', '.eJxdkctugzAQRf_F6xTMU9Bl1SyyqFQl6qqt0GA7wSnYyNiRqij_3iG4gYQVPtc-vgxnUoGzTeUGYSrJyTOJyGrJamA_Qo0BP4I66IBpZY2sg3FL4NMheNNctC9-752ggaHB03mGT8wjSCMWQwoZY2kWFwnESU1jmkMGZbLPiiKHKBcFpVBGZUKjNI1LxmqK0qtu79q2UtAJdALvpMJAKCs58ErprjZj8LrZbnaLwMpeI968b9e7JWeay8OYUEoXeJxDtCKdUI48f56JX_tbPwYHRuqxkGlxHQ7Cuj50Ew5bOVjMJM4Jw7EzuawmR3xzbAVrodPDLDETCX2Hp__1vU78ipstudnW05nHRl71oGh0NzvS2XGC1gGTX47SfaJml_CBVo9duLTk8j3NqepAwQG_Ff8Ks_IkiOc9WIlFkM_EXAFOozf6KBi-08sf8f7SmA:1lGlj9:brsp_loenoCHKyosNFDX7I1VdwzGqntebwvmMBuQGQU', '2021-03-15 16:48:59.718696'),
('uijf9ezibl93djirg47x7n5fizo04f4y', '.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEihb:BcuNPOJNrovxJnBKF1vvPOTvWkxzbYMt0Nah9Q_T7xM', '2021-03-10 01:10:55.520874'),
('vjakotp2r1sks6wtckfnr1wuqv68c9lc', '.eJyFlWFz2jgQhv8K4_saJwYMhH7zgdvxDAHGhk7buw4jywtWK1seSU7vksl_v5XhbDVxhm_Kyjz77u67yrNzILXOD7UCeWCZ88EZzZ0bO5gS-hNKc5P9IOVJ3FJRasnSW_PJ7eVW3T6IDPifl29_A-RE5fjrcepTP7ufT_3JcTpOvWl6n9L7WTrzZhOM-J4_Gk3mZOITIBn1JuCT-dCfTSmMfIDpBKEN7lhzfihJAUYRk0xxVhBVS7yHUrOMZIdSFKk098H679rzsvE6ethY96ZO78YpoKydD389Xw7PjolPbpwLfLFZf4w-7eNgEV0oRoLkePUHnhj2AY9V_fTEwa0YUHBebhyaM55JKFVDNsRhS9wn-yCONknLuVOg6-quVjWRTNxxpnRHNtUi8QwZt5BoG4fJG8SltFeIXOBPXr4biF3jtIWFn4PV_kqBUFLG-0vzW1CwDr9sBsNOFjwSXhPKRPlKE2RM92iatag43G7iXZj0iUmJdGlOpO7XM_9dj9UlCZWQGtQdGsYlJfwjVEfl6OuanKDt9tBrQUm0HsThYhU0DuqjKVa6EignhbCEAueu4mh9V3TYoVVkgxx8GTyEvTLPQOXi324BllhKOK4Y9kEzjNv0UUvHBqLoZL_aBcv3ZEtQNdcks0QfUe_Pjje2V2Gx2if_22QQrHfRItoGy-AdeCE0exQuYimvFZoAe64ZZRXJiG3PWp4wp3LHXVbLU7twvYyWm8HXwdacwvWuv1dmpBqbwjLTMHPAdbB7VjAqRZWLEs4z6bJZ674KkuhjtOi24crccUCKHRltTP7WAUrjjHLCjy4Ulf63S2ltX2LmcyUNKDOkt_zTqUN2yxPsd5s4-mYVsdjEcfgeHF9pIdnTuQQqpAQ7gxAnbi3FfZvlIVxGje5w-_bteOUE3PdGPVQmieXjHKhltm51w12wDa41RZOK9GwdKwWtOZGqBY-sVQ7jz2jbzQA79Cl8TzC-uo_oVOFiY05gCSYlzUX3Io-6Zd5F22tT1KzqmSEXlOhmO6QUv8yr-P38b-lQkBIfJGnSUlwlcC7xCr9Hc2O8i8gmgNtfSfEDKJ69l_8A7m-AIg:1lX27C:BghholtRjeVF7a6fMNYvFJE38yT6wKe_XlyDJkRM4Oc', '2021-04-29 13:33:02.343973'),
('vrg2si2h8t0hpcakbdm557rgw0aervd2', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l96av:-LDQ77_ohhw7BigS7DgI_jW3Sd-9vpi2xpcJEBVOBfw', '2021-02-22 13:28:49.069533'),
('wd9hbe4ni2hxudlgw3h4vczjkwfyo0c1', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l88gK:RFcLnqSIvOQFhhyGYB4Ty_4_gmruoxaZ-KcQIHpYqCE', '2021-02-19 21:30:24.275883'),
('wsf0871nh6i8z36ie5i85bsxdlne8z49', '.eJxdkMtugzAQRf_F6xRsXoIuq2aRRaUqUVdVhQbbCU7BRrapVEX59w7BTUhYMed6jsdzIjWMvq1HJ22tBHkmjKyWrAH-LfUUiCPog4m40d6qJpqORCF10ZsRsnsJZ-8ELbgWu4scv0QwyBhPIIOc8yxPyhSStKEJLSCHKt3nZVkAK2RJKVSsSinLsqTivKEovej2Y9fVGnqJThC90hhI7ZUAUWvTN3YKXjfbzW4ReDUYxJv37Xq35NwIdZgSSukCT3tgK9JLPZLnzxMJdbj1w41glZkGsh3WsZN-HOJxxnGnnMdM4Z4wnGYm59XsSK6OreQd9MbdJHYmcZjh6b--18lfebWlV9t67nmcKKgeFK3BnvPX_Ly6Bw0HHBGXyb36kSTwAbzCfuQ3Yi8AHzFYc5Qc_-n5D61vu0U:1lEIRf:kWEyeA6jow2rmYYSwa4DGgxIBW3pkVHwlbU_TQJ-gio', '2021-03-08 21:08:43.254749'),
('ww25vb1oxb1pg3ifajpf2c6dmt1w8sff', '.eJyFlV1v2jAUhv8Kym5JSyFA6V0GWRWpBRRg2leFHOdAvDlxZDvd1qr_fceUxW5J1TvnOHnOez7z6G1JrfNtrUBuWeZdef2J13WNKaG_oDQ32U9S7sUZFaWWLD0zr5wdb9XZrciAfzy--wKQE5Xj14M0oEF2ORkFw91okPZG6WVKL8fpuDceoiXoBf3-cEKGAQGS0d4QAjK5CMYjCv0AYDRE6AG3qznflqQAo4hJpjgriKol3kOpWUaybSmKVJr7cP6j7vWywTy-XTj3Js5e1yugrL2r74_Hw6Nn7MOud4RPF_NP8fUmCafxkWIkSI5XH_DEMA94rOqHBw5-xYCC99T1aM54JqFUB7IhXjTEzWoTJvFi1XDOFei6Oq9VTSQT55wpbckmWu_p7qn7UuC4wSXRcpGso1WbrJRIn-ZE6nZNkwYSzqMvriIJlZAa1Dlm1icl_BHKUjk2QE32JtBjbL0GtIrnnSSa3oSHVLfRFCt9CZSTQjhCgXNfcewRX1jshRPkAdn50rmNWmU-A5WPz34BjlhKOPYi5kEztLv0fkPHBKLo1eZmHc7eki1B1VyTzBG9Q72_LG_g9sz0ZrP63zCdcL6Op_EynIVvwAuh2b3wEUt5rZgoMeeaUVaRjFh_uajlHn0qf2C9BraG62g-i2eLztfO0pyi-bo9V6akGpPCMpMwc8CRcHNWMCpFlYsSnmtivTlzcROu4k_x1M7FO3XHAim2Y5RQE99JByiNNcoJ3_lQVPqvdTlqXEYrU5933IAyRTrl7_cWaYcn3KwXSfzNCWK6SJLoLTiuMyHZw3MIVEgJrgch9twZisvGy200iw-6o-XpFnnVCZCxg3qojBOnj3OgTrPZ0Y3W4TJ8LymaVKRl6lgpaM2JVA2474xylHzGtl10MEPX0VuCcT3dY6cKHxOzB0cwKWkupAXbYV7Hy_eqqFnVUkMuKNGH6ZBS_G7Zin0709fYLa87s3VHKvTqE17lxCeKti9KO9rxEhfFyeo-_lJere5c4Cco8u75J7MtSIlbU5rcUJx38I72CoNCAtqtRR4MJp5Kip9AdfOv2v6Xh7Ke_gGfzneL:1lXVhz:8SZXx3yR1PYR9g9BLEPmob4BhRaNquQHdWEuYyDP4vo', '2021-04-30 21:08:59.770452'),
('y7f9fit1ru7hmcmn73v6enywi88ab7mg', '.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lAfaJ:TQ9FayuYF6S--kEh2hcYKfvzdbKJVB-gs1Lbtqxu4PQ', '2021-02-26 21:02:39.074398'),
('z1xshp8xm3ukc3z5yzs78c4o8jhc7z0i', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l96Uu:5HiMyZYTEgaihHKyyG10mDPwTFfiZJ8Gs-cHb_aMh44', '2021-02-22 13:22:36.040300'),
('zbpoigy7sqtzofeujvtium268xcfepft', '.eJx1kluP2jAUhP9K5L5CSEI2wL65EKlIgayAVpXaVXR8gXhJbOQ42wviv9ehIbAt-zae4_NpPPIRZVCbPKsrrjPB0CMaeqh3axKgey6bCXsBuVMuVdJoQdzmittOK3ehGC8-tnffAHKocrsdhGRMCfUgCok3Hm23EHpjP9pSnwZ-EMGITNjI9yeBT8JgSCccSBQReAgIsXo8tNAzblsXRSah5JapKspK9tuOuDSCAcukKoluRlM3dp01XjpP8WyVOrPYSdK1M_2UrlbzJLnZoIqJnbIbkR8FN35TxqiHSi5r9Pjt2Iojavyoh9oE8RecfMbT-ffa89hw2YTUhfU_WCVsU1YeuKSiQKceorkomOayOgMbUNiB8DL-mjp-BxjwVyhqoELJQSEqc-VxJgw6PZ96bzONO9QqniZ4ka7vhclBsr5WdN9X9xMFHSaZrzfY-Q820JwWUKpBW1T_cv4n5S9-J2Qw7PCbFV7gexGNBsZL0Pt3AobvP3Rgd0vom5_mkrK64f4QhuaoiXTmPHScRTybz_DawbP0aYOtugcsbe8Mqj4wdTBg1ZVcGW5y-xfV4fzm57-_JitBwo5rewGoEa8ctf4BjLDlWf_q6LPR1HPQ6oVTe_Da4aWCJvLpD95IKkE:1lX9hA:PDrFWXWrss0TuH7JU1kujvzGpGoLuTrPCRZgLLEjb6g', '2021-04-29 21:38:40.310808'),
('zth4i0vn9xpdjanzwv541txx0pjauh39', '.eJxdkMtuwyAQRf-FdWoDfsjOsmoXWXSTqquqssZAYlIbLMCVqij_3nFM82LF3DtzmMuRNDCFrpm8co2WZE0YWd1qLYhvZWZDHsDsbSKsCU63ydySRNcnb1aq_jn23gE68B1OlwUeLhnkTHDIoRAiL3iVAc9aymkJBdTZrqiqElipKkqhZnVGWZ7zWoiWIvSM20193xgYFDJBDtqgoUzQEmRj7NC62XjZbDfvN8YcjK3IoMxE1p9HEuuI-fATOG3nF1yPdepVmMZ0WuS01z6gpzE4mvMS5LRaGPzC2CrRw2D9FeIWJY07PP3X9zj1qy607EJ7XWYeN4qoB0Rnceb0tcRrBjCwxxXxd0TQP4pEfYSgcR71q-LOAoYYnT0ogXd6-gM2f6xi:1lC14G:htjT89WKLrum3E4g5arx_0zQOkmBJLp0gkjwCY7Z4R0', '2021-03-02 14:11:08.643579'),
('zz167ecrs1k0tqx2db2ecfsx4ibaudbr', '.eJyVkUtvwjAQhP8Kcq9pyMNBCbeUckDiJdJWlVoULbZDTBMbOQlShfjvtWkaHrfe1jO7n0bjI0qhqfO0qZhKOUVD5A2QdS1ugHwxYRy6A7GVNpGiVnxjmxW7dSt7JikrntrdG0AOVa6vB0HoOBHGDJPIx9ilmAahT0kQuhGlOIo8RjLXCQLwMpx5OPSziIAfhR4Fz42Yhp5xWVMUqYCSaaaq5B6EdpioOQWaCllulHGWdmL3pnFvNZmPFvP4Ob5aqvle6pXJcjVOkiudSMq3xhm4rnelm1oCx0IlEw0afhzb4YiMMbBQG2b8Fk9f49Hks3Ec6s9NXlVo_UFPXJemx1zqzZOFSM4LqpiozjiDwR0mno_fFz23O--zAxQNEC5Fv-BVfaExymt0Wp-s20Rhh1qNR9N4tkj-F8Xr7qeT5EVXeE_pK0YKKGW_Lejx730X75uZdOvf4tISBGyZ0gaQmh_Mf571PdRcg7R-UdRZ0EH2Su4Y0bNz-gHi3tce:1lUxXM:ILwZotYZt8jAFIpKY8OksLGWwrkveJlRu_8uwzuxT5U', '2021-04-23 20:15:28.589181');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_administrador_detalleevaluacionanexo1`
--

CREATE TABLE `reclamo_administrador_detalleevaluacionanexo1` (
  `id` int(11) NOT NULL,
  `calificacion` tinyint(1) NOT NULL,
  `observacion` longtext COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `evaluacion_id` int(11) DEFAULT NULL,
  `rubro_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reclamo_administrador_detalleevaluacionanexo1`
--

INSERT INTO `reclamo_administrador_detalleevaluacionanexo1` (`id`, `calificacion`, `observacion`, `created_at`, `updated_at`, `created_ip`, `updated_ip`, `created_by_id`, `evaluacion_id`, `rubro_id`, `updated_by_id`) VALUES
(1, 0, '123', '2021-04-16 16:37:44.802338', '2021-04-16 16:37:44.802338', '127.0.0.1', '127.0.0.1', 30, 1, 1, 30),
(2, 0, '123', '2021-04-16 16:37:44.822340', '2021-04-16 16:37:44.823340', '127.0.0.1', '127.0.0.1', 30, 1, 2, 30),
(3, 0, '123', '2021-04-16 16:37:44.836341', '2021-04-16 16:37:44.836341', '127.0.0.1', '127.0.0.1', 30, 1, 3, 30),
(4, 0, '', '2021-04-16 16:37:44.849342', '2021-04-16 16:37:44.849342', '127.0.0.1', '127.0.0.1', 30, 1, 4, 30),
(5, 0, '', '2021-04-16 16:37:44.862343', '2021-04-16 16:37:44.862343', '127.0.0.1', '127.0.0.1', 30, 1, 5, 30),
(6, 0, '', '2021-04-16 16:37:44.875344', '2021-04-16 16:37:44.875344', '127.0.0.1', '127.0.0.1', 30, 1, 6, 30),
(7, 0, '', '2021-04-16 16:37:44.889346', '2021-04-16 16:37:44.889346', '127.0.0.1', '127.0.0.1', 30, 1, 7, 30),
(8, 0, '', '2021-04-16 16:37:44.902346', '2021-04-16 16:37:44.902346', '127.0.0.1', '127.0.0.1', 30, 1, 8, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_administrador_evaluacionanexo1`
--

CREATE TABLE `reclamo_administrador_evaluacionanexo1` (
  `id` int(11) NOT NULL,
  `anio` int(10) UNSIGNED NOT NULL,
  `periodo` int(10) UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `entidad_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reclamo_administrador_evaluacionanexo1`
--

INSERT INTO `reclamo_administrador_evaluacionanexo1` (`id`, `anio`, `periodo`, `created_at`, `updated_at`, `created_ip`, `updated_ip`, `created_by_id`, `entidad_id`, `updated_by_id`) VALUES
(1, 2021, 2, '2021-04-16 16:37:44.786337', '2021-04-16 16:37:44.903347', '127.0.0.1', '127.0.0.1', 30, 7, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_clasificacioncausa`
--

CREATE TABLE `reclamo_clasificacioncausa` (
  `id` int(11) NOT NULL,
  `codigo` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `causa` longtext COLLATE utf8_spanish_ci NOT NULL,
  `definicion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `definicion_corta` longtext COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `categoria` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reclamo_clasificacioncausa`
--

INSERT INTO `reclamo_clasificacioncausa` (`id`, `codigo`, `causa`, `definicion`, `definicion_corta`, `created_at`, `updated_at`, `categoria`) VALUES
(1, '1101', 'EMITIR RECETAS FARMACOLOGICAS SIN LA DENOMINACION GENERICA INTERNACIONAL, DATOS ERRONEOS O INCOMPLETA', 'SE CONSIDERA AQUELLOS RECLAMOS RELACIONADOS A LA ENTREGA DE RECETAS EMITIDAS POR EL PROFESIONAL DE SALUD, SIN CONSIGNAR EL NOMBRE GENERICO DEL MEDICAMENTO, CON LETRA ILEGIBLE, INCOMPLETA, ENTRE OTROS.', 'RECETA CON MEDICAMENTOS DE MARCA Y/O INCOMPLETA Y/O ILEGIBLE.', '2021-02-05 21:01:08.482366', '2021-02-05 21:01:08.482366', 1),
(2, '1102', 'DISPENSAR MEDICAMENTOS Y/O DISPOSITIVOS MEDICOS DE MANERA INSATISFACTORIA', 'SE CONSIDERAN AQUELLAS RECLAMOS RELACIONADOS A:\r\n- ERROR EN EL TIPO DE PRODUCTOS ENTREGADOS.\r\n- ERROR  EN LACANTIDAD DE PRODUCTOS ENTREGADOS.\r\n- ENTREGA DE PRODUCTOS VENCIDOS, CONTAMINADOS O DETERIORADOS.\r\n- ENTREGA DE PRODUCTOS FALSIFICADOS Y7O SIN REGISTRO SANITARIO, ENTRE OTROS.\r\n- NEGAR O ENTREGAR EN FORMA INCOMPLETA AL USUARIO LA PROVISION DE MEDICAMENTOS O DISPOSITIVOS MÉDICOS', '- NO ESTOY SATISFECHO CON LOS MEDICAMENTOS ENTREGADOS.\r\n- NO ME ENTREGARON LOS MEDICAMENTOS.\r\n- ME ENTREGARON DE FORMA INCOMPLETA MIS MEDICAMENTOS', '2021-02-05 21:05:14.261411', '2021-02-05 21:05:14.261411', 1),
(3, '1103', 'DIRECCIONAR AL USUARIO A COMPRAR MEDICAMENTOS O DISPOSITIVOS MEDICOS FUERA DEL ESTABLECIMIENTO DE SALUD', 'INDUCIR AL USUARIO A COMPRAR DETERMINADOS MEDICAMENTOS O DISPOSITIVOS MÉDICOS FUERA DE LA IPRESS A PESAR DE ESTAR CUBIERTOS O CONTAR CON STOCK EN EL ESTABLECIMIENTO.', 'ME DICEN QUE COMPRE AFUERA.', '2021-02-05 21:07:43.019057', '2021-02-05 21:07:43.019057', 1),
(4, '1104', 'DIRECCIONAR AL USUARIO A REALIZARSE PROCEDIMIENTOS MEDICOS O QUIRURGICOS FUERA DEL EESS.', 'INDUCIR AL USUARIO A REALIZARSE PROCEDIMIENTOS MÉDICOS O QUIRÚRGICOS FUERA DEL ESTABLECIMIENTO, PESE A ESTAR CUBIERTOS O DISPONIBLES EN LA IPRESS.', 'ME DIJERON QUE ME REALICE EL PROCEDIMIENTO AFUERA.', '2021-02-05 21:09:40.605400', '2021-02-05 21:09:40.605400', 1),
(5, '1105', 'NEGAR O CONDICIONAR AL USUARIO A REALIZARSE PROCEDIMIENTOS DE APOYO DIAGNOSTICO', 'NEGAR AL USUARIO A REALIZARSE PROCEDIMIENTOSDE APOYO AL DIAGNOSTICO.', 'NO QUIEREN REALIZARME EL PROCEDIMEINTO MEDICO.', '2021-02-08 13:33:25.608896', '2021-02-08 13:33:25.608896', 1),
(6, '1106', 'DEMORAR EN EL OTORGAMIENTO DE CITAS O EN LA ATENCION PARA CONSULTA EXTERNA', 'SE CONSIDERAN LAS INSATISFACCIONES GENERADAS POR:\r\n- FALTA DE CITAS.\r\n- DISPONIBILIDAD DE CITAS PARA ATENCIÓN EN CONSULTA EXTERNA EN UN PLAZO ALEJADO.\r\n- TIEMPO DE ESPERA PARA LA ATENCIÓN QUE EXCEDE AL TIEMPO ESTABLECIDO POR LA INSTITUCIÓN.', '- NO HAY CITAS PARA LA ESPECIALIDAD.\r\n- NO PUEDO CONSEGUIR CITA PARA CONSULTA EXTERNA EN FECHA PROXIMA.\r\n- DEMORAN EN ATENDERME.', '2021-02-08 13:35:31.886729', '2021-02-08 13:35:31.886729', 1),
(7, '1107', 'DEMORA PARA LA HOSPITALIZACION', 'NO PASE A HOSPITALIZACIÓN O PROGRAMACIÓN HOSPITALARIA POR FALTA DE CUPO, INCLUYE UCI.', 'NO HAY CAMA DISPONIBLE.', '2021-02-08 13:36:50.340640', '2021-02-08 13:36:50.340640', 1),
(8, '1108', 'DEMORAR EN EL OTORGAMIENTO DE PRESTACIONES DE SALUD DURANTE LA HOSPITALIZACION.', 'DEMORA PARA EL OTORGAMIENTO DE PRESTACIONES O REALIZACIÓN DE PROCEDIMIENTOS EN EL ÁREA DE HOSPITALIZACIÓN. SE CONSIDERA CUANDO:\r\n- DEMORA EN LA VISITA MÉDICA.\r\n- DEMORA EN LA APLICACIÓN DE MEDICACIÓN.\r\n- DEMORA EN EL CAMBIO DE ROPA DE CAMA.\r\n- DEMORA EN EL ASEO DEL USUARIO.\r\n- DEMORA EN LA REALIZACIÓN DE PROCEDIMIENTOS EN HOSPITALIZACIÓN: CURACIÓN DE HERIDAS, RETIRO DE PUNTOS, CABIO DE APÓSITOS, RETIRO O CAMBIO DE SONDAS, ETC.\r\nNO SE INCLUYE LA DEMORA DE TOMA DE EXAMENES AUXILIARES.', 'NO ESTOY SATISFECHO CON EL SERVICIO DADO EN HOSPITALIZACIÓN.', '2021-02-08 13:37:34.726076', '2021-02-08 13:37:34.726076', 1),
(9, '1109', 'DEMORAR EN LA ATENCION DE EMERGENCIA DE ACUERDO A LA PRIORIDAD', 'DEMORA EN EL OTORGAMIENTO DE PRESTACIONES O REALIZACIÓN DE PROCEDIMIENTOS EN EL SERVICIO DE EMERGENCIA, DE ACUERDO A LA PRIORIDAD DEL CASO. SE CONSIDERA:\r\n- DEMORA DE ATENCIÓN EN TRIAJE.\r\n- DEMORA EN LA ATENCIÓN EN TÓPICO DE EMERGENCIA.\r\n- DEMORA EN EL TRASLADO DEL USUARIO A OBSERVACIÓN DE EMERGENCIA.\r\n- DEMORA EN LA ATENCIÓN EN EL ÁREA DE OBSERVACIÓN.\r\n- ENETRE OTRAS ATENCIONES.', 'DEMORA EN LA ATENCIÓN DE EMERGENCIA.', '2021-02-08 13:39:38.323186', '2021-02-08 13:39:38.324222', 1),
(10, '1110', 'DEMORAR EN LA ATENCION DE PACIENTE OBSTETRICA', 'DEMORA EN EL OTORGAMIENTO DE PRESTACIONES A PACIENTE OBSTÉTRICA. SE CONSIDERA:\r\n- DEMORA DE ATENCIÓN EN TRIAJE.\r\n- DEMORA EN LA ATENCIÓN EN TÓPICO.\r\n- DEMORA EN LA ATENCIÓN EN EL ÁREA DE OBSERVACIÓN, SALA DE DILATACIÓN O SALA DE PARTO.\r\n- DEMORA EN LA REALIZACIÓN DE CESÁREA INDICADA POR EL MÉDICO TRATANTE.\r\n- OTROS TIPOS DE DEMORA.', 'DEMORA EN LA ATENCIÓN DE EMERGENCIA A PACIENTE OBSTÉTRICA.', '2021-02-08 13:41:49.178838', '2021-02-08 13:41:49.178838', 1),
(11, '1111', 'DEMORAR EN EL OTORGAMIENTO O REPROGRAMACION DE CUPO PARA PROCEDIMIENTO QUIRURGICO.', 'DEMORA EN UN PLAZO ALEJADO, EN EL OTROGAMIENTO O REPROGRMACIÓN DE UN CUO PARA REALIZACIÓN DE PROCEDIMIENTO QUIRÚRGICO.', 'DEMORA EN PROGRAMARME CIRUGIA.', '2021-02-08 13:43:03.136959', '2021-02-08 13:43:03.136959', 1),
(12, '1112', 'NEGAR LA ATENCION EN SITUACIONES DE EMERGENCIA.', 'NEGAR LAATENCIÓN EN SITUACIONES DE EMERGENCIA Y/O PARTOS, (INCLUYE SERVICIOS QUE SE PRESTAN EN EMERGENCIA SEGÚN NIVEL DE CATEGORIZACIÓN, MEDICAMENTOS Y/O DISPOSITIVOS MÉDICOS) O CONDICIOONAR LA ATENCIÓN A LA PRESENTACIÓN DE DOCUMENTO DE IDENTIDAD, FIRMA DE PAGARÉS, ETC.', 'NEGAR LA ATENCIÓN DE EMERGENCIA.', '2021-02-08 13:45:00.056875', '2021-02-08 13:45:00.056875', 1),
(13, '1113', 'ENCONTRAR IPRESS Y/O UNIDADES PRESTADORAS DE SERVICIOS E SALUD CERRADAS EN HORARIO DE ATENCION O NO PRESENCIA DEL PERSONAL RESPONSABLE DE LA ATENCION.', 'FALTA DE DISPONIBILIDAD DE SERVICIOS O PRESTACIONES, SEGÚN DISPOSICIONES OFERTADAS 8DIAS Y HORARIOS) POR PARTE DE LA IPRESS. SE INCLUYEN LA FALTA O AUSENCIA D EPERSONAL DE SALUD PROGRAMADO EN TODOS LOS SERVICIOS QUE RETRASA O IMPIDE LA ATENCIÓN OPORTUNA DEL USUARIO.', 'IPRESS CERRADA O AUSENCIA DEL PERSONAL DE SALUD RESPONSABLE DE LA ATENCIÓN.', '2021-02-08 13:46:24.192600', '2021-02-08 13:56:17.921600', 1),
(14, '1114', 'NO ACCESO A LA HISTORIA CLINICA.', 'SE CONSIDERAN AQUELLOS RECLAMOS RELACIONADOS  A NO BRINDAR ATENCIÓN AL USUARIO POR NO ENCONTRARSE DISPONIBLE LA HISTORIA CLINICA, SE APOR EXTRAVÍO O POR OMISIÓN, POR DESCONOCIMIENTO DEL CÓDIGO DE LA HC PERSONAL O FAMILIAR.', 'NO ACCESO A LA HISTORIA CLINICA.', '2021-02-08 13:47:13.958164', '2021-02-08 13:47:13.958164', 1),
(15, '1115', 'RECLAMOS RELACIONADOS A LA INFRAESTRUCTURA DE LA INSTITUCION.', 'RECLAMOS RELACIONADOS AL ESTADO Y CONSERVACIÓN DE LAS INSTALACIONES DE LA INSTITUCIÓN. SE INCLUYEN:\r\n- ASEO DEL ESTABLECIMIENTO.\r\n- MANTENIMIENTO DE PUERTAS, VENTANAS, PISOS, PAREDES O TECHOS.\r\n- MANTENIEMIENTO DE EQUIPAMIENTO NO BIOMEDICO (SILLAS, MESAS, O SIMILARES, DE USO EN LA IPRESS).\r\n- OTRAS SIMILARES O DEFINIDAS EN NORMA EXPRESA.', '- DEFICIENTE\r\n- INFRAESTRUCTURA\r\n- FALTA DE  ASEO\r\n- FALTA DE MANTENIMIENTO', '2021-02-08 13:52:42.982649', '2021-02-08 13:52:42.982649', 1),
(16, '1116', 'NO CUMPLIR O NO ACCEDER A HACER EL PROCEDIMIENTO DE REFERENCIA O CONTRA REFERENCIA DEL USUARIO.', 'INCUMPLIMIENTO DE LA NORMATIVA VIGENTE SOBRE REFERENCIAO CONTRA REFERENCIA DE LOS USUARIOS, A FIN DE DAR CONTINUIDAD DELA ATENCIÓN DESALUD, LO QUE INCLUYE NEGATIVA O DEMORA EN LAS GESTIONES.', 'REFERENCIA Y CONTRA REFERENCIA\r\n- DEMORA\r\n- NEGATIVA\r\n- ERROR', '2021-02-08 13:54:01.920774', '2021-02-08 14:56:54.000873', 1),
(17, '1117', 'DEMORAR EN LA TOMA O ENTREGA DE RESULTADOS DE EXAMENES DE APOYO AL DIAGNOSTICO.', 'RETRASO EN LA TOMA O ENTREGA DE RESULTADOS DE EXÁMENES DE APOYO AL DIAGNÓSTICO, EN CUALQUIERA.', 'DEMORA ENLA TOMA OENTREGA DE RESULTADO.', '2021-02-08 13:54:54.681654', '2021-02-08 13:55:35.246537', 1),
(18, '1118', 'COBRAR INDEBIDAMENTE.', 'RECLAMOS RELACIONADOS A COBROS NO ACORDADOS, ADICIONALES O DIFERENTES A LOS APACTADOS INICIALMENTE ENTRE LA IPRESS Y EL USUARIO.', 'ME COBRARON O HICIERON PAGAR DINERO QUE NO CORRESPONDE.', '2021-02-08 13:57:46.335699', '2021-02-08 13:57:46.335699', 1),
(19, '1119', 'NO CUENTAN CON VENTANILLA PREFERENCIAL.', 'NO IMPLEMENTACIÓN DE VENTANILLA PARA LA ATENCIÓN PREFERENCIAL DEL ADULTO MAYOR, GESTANTES Y PERSONAS CON DISCAPACIDAD.', 'NO CUENTAN CON VENTANILLA PREFERENCIAL.', '2021-02-08 13:58:43.662936', '2021-02-08 13:58:43.662936', 1),
(20, '1120', 'INCUMPLIMIENTO EN LA PROGRAMACION DE CITAS.', '- ACUDIR A UNA CITA MÉDICA QUE HA SIDO REPROGRAMADA PARA OTRA FECHA SIN COMUNICACIÓN PREVIA AL PACIENTE.\r\n- ACUDIR A UNA CITA MÉDICA Y EL PROFESIONAL DE LA SALUD NO ACUDIÓ A LABORAR.\r\n- OTROS MOTIVOS AJENOS AL PACIENTE,QUE IMPIDEN EL OTORGAMIENTO DE LA CITA EN FECHA PROGRAMADA.', 'REPROGRAMACIÓN DE CITA SIN COMUNICACIÓN PREVIA AL PACIENTE.', '2021-02-08 13:59:31.286687', '2021-02-08 13:59:31.286687', 1),
(21, '1121', 'INCUMPLIMIENTO EN LA PROGRAMACION DE INTERVENCIONES QUIRURGICAS.', 'REAPROGRAMACIÓN DE LA FECHA DE INTERVENCIÓN QUIRÚRGICANPOR MOTIVOS AJENOS AL PACIENTE.', 'REPROGRAMACIÓN DE INERVENCIÓN QUIRÚRGICA.', '2021-02-08 14:00:26.885882', '2021-02-08 14:00:26.885882', 1),
(22, '1201', 'NO BRINDAR INFORMACION DE LOS PROCESOS ADMINISTRATIVOS DE LA IPRESS.', 'FALTA O ENTREGA< INSATISFACTORIA DE INFORMACIÓN SOBRE:\r\n- NORMAS, REGLAMENTOS O CONDICIONES ADMINISTRATIVAS VINVULADAS A LA ATENIÓN.\r\n- GASTOS CUBIERTOS EN LA PRESTRACIÓN DE SALUD ASÍ COMO LAS CONDICIONES DEL PLAN DE ATENCIÓN EN SALUD, CUANDO EL USUARIO O PERSONAL ADMINSITRATIVO LO SOLICITE.\r\n- ENTRE OTROS.', 'NO ME DIERON INFORMACIÓN CLARA SOBRE:\r\n- ASUNTOS ADMINISTRATIVOS\r\n- TRATAMIENTO\r\n- GASTOS NO CUBIERTOS\r\n- EL MÉDICO TRATANTE\r\n- MIS DERECHOS', '2021-02-08 14:03:20.732286', '2021-02-08 14:03:20.732286', 2),
(23, '1203', 'NO RECIBIR DE SU MEDICO Y/O PERSONAL DE SALUD TRATANTE, INFORMACION COMPRENSIBLE SOBRE SU ESTADO DE SALUD O TRATAMIENTO.', 'SE CONSIDERA AQUELLOS RECLAMOS EN EL QUE EL PROFESIONAL DE LA SALUD INFORMA DE MANERA INSATISFACTORIA O SE REHUSA A BRINDAR INFROMACIÓN AL USUARIO ACERCA DEL ESTADO DE SALUD Y/O DEL TRATAMIENTO QUE VIENE RECIBIENDO.', 'PERSONAL MÉDICO.\r\nINFORMACIÓN INSATISFACTORIA.\r\nNO BRINDA INFORMACIÓN.', '2021-02-08 14:04:44.138758', '2021-02-08 14:04:44.139797', 2),
(24, '1302', 'NO RECIBIR DE SU MEDICO Y7O PERSONAL DE SALUD TRATO AMABLE Y RESPETUOSO', 'SE CONSIDERA A AQUELLOS RECLAMOS EN QUE EL PROFESIONAL DE LA SALUD BRINDA UN TRATO CONTRA LA MORAL, BUENAS CONSTUMBRES Y/O DIGNIDAD DE LA PERSONA.', 'NO RECIBÍ UN TRATO AMABLE', '2021-02-08 14:08:27.968095', '2021-02-08 14:08:27.968095', 3),
(25, '1303', 'NO RECIBIR DEL PERSONAL ADMINISTRATIVO TRATO AMABLE Y RESPETUOSO', 'SE CONSIDERA A AQUELLOS RECLAMOS EN QUE EL PROFESIONAL ADMINISTRATIVO BRINDA UN TRATO CONTRA LA MORAL, BUENAS CONSTUMBRES Y/O DIGNIDAD DE LA PERSONA.', 'NO RECIBÍ UN TRATO AMABLE.', '2021-02-08 14:20:03.761551', '2021-02-08 14:20:03.761551', 3),
(26, '1304', 'NO BRINDAR EL PROCEDIMIENTO MEDICO O QUIRURGICO ADECUADO.', 'REALIZAR PROCEDIMIENTOS MÉDICOS O QUIRÚRGICOS DE MANERA ERRÓNEA, NO ACORDE A PROTOCOLOS Y GUÍAS.', 'MALA ATENCIÓN MÉDICA.', '2021-02-08 14:21:06.624810', '2021-02-08 14:21:06.624810', 3),
(27, '1305', 'NO BRINDAR UN TRATO ACORDE A LA CULTURA, CONDICION Y GENERO DEL USUARIO.', 'NO SER ATENDIDO CON RESPETO, NO ACORDE A SUS MODOS DE VIDA, CONOCIMEINTOS Y COSTUMBRES PROPIOS DE SU LUGAR DE ORIGEN, O CON LA IDENTIDAD DE GÉNERO, NI RESPETAR CONDICIÓN DE DISCAPACIDAD O ATENCIÓN PREFERENTE DURANTE LA PRESTACIÓN  DE SALUD.', 'TRATO DISCRIMINATORIO.', '2021-02-08 14:22:22.623055', '2021-02-08 14:22:22.623055', 3),
(28, '1306', 'PRESUNTO ERROR EN LOS RESULTADOS DE EXAMENES DE APOYO AL DIAGNOSTICO.', 'PRESUCIÓN DE ERROR EN LOS RESULTADOS DE EXÁMENES DE APOYO AL DIAGNOSTICO POR CUALQUIER CAUSA. SE INCLUYEN TODOS LOS EXÁMENES AUXILIARES.', 'NO ESTOY SATISFECHO CON MIS RESULTADOS.', '2021-02-08 14:23:30.950490', '2021-02-08 14:23:30.950490', 3),
(29, '1307', 'NO BRINDAR ATENCION CON PLENO RESPETO A SU PRIVACIDAD,CON PRESENCIA DE TERCEROS NO AUTORIZADOS POR EL USUARIO.', 'SE CONSIDERA A AQUELLOS RECLAMOS DONDE LA IPRESS VULNERA O EXPONE AL USUARIO, CONSIDERANDO LA PRESENCIA DE TERCEROS DURANTE SU ATENCIPON Y SIN SU CONSENTIMIENTO.', 'PRIVACIDAD DE LA ATENCIÓN.', '2021-02-08 14:24:33.031790', '2021-02-08 14:24:33.031790', 3),
(30, '1309', 'RETENER AL USUARIO DE ALTA O AL CADAVER POR MOTIVO DE DEUDA, PREVIO ACUERDO DE PAGOS O TRAMITES ADMINISTRATIVOS.', 'SE CONSIDERAN AQUELLOS RECLAMOS REAALCIONADOS A LA DEMORA EN EL PROCESO DE ALTA O ENTREGA DE CADÁVER DEBIDO A TRÁMITES ADMINISTRATIVOS O ECONÓMICOS.', 'DEMORA EN EL ALTA DEL PACIENTE Y LA RETENCIÓN DEL CADÁVER.', '2021-02-08 14:26:30.693045', '2021-02-08 14:26:30.693045', 3),
(31, '1310', 'NO BRINDAR ATENCION CON RESPETO A LA DIGNIDAD DEL USUARIO.', 'SE CONSIDERAN AQUELLOS RECLAMOS RELACIONADOS A ACTOS IMPROPIOS DE NATURALEZA SEXUAL.', 'TRATO IMPROPIO.', '2021-02-08 14:27:21.187677', '2021-02-08 14:27:21.187677', 3),
(32, '1401', 'NO SOLICITAR AL USUARIO O SU REPRESENTANTE LEGAL EL CONSENTIMIENTO INFORMADO POR ESCRITO DE ACUERDO A LOS REQUERIMIENTOS DE LA NORMATIVIDAD VIGENTE.', 'NO CUMPLIR CON RECABAR DEL USUARIO EL CONSENTIMIENTO INFORMADO DE ACUERDO A LO DISPUESTO POR LA NORMA VIGENTE. SE CONSIDERA OBLIGATORIO RECABAR EL CONSENTIMIENTO IFORMADO EN LOS SIGUIENTES CASOS:\r\n- PROCEDIMIENTOS RIESGOSOS O PROCEDIMIENTOS QUIRÚRGICOS QUE PONGAN EN RIEGO LA SALUDDEL USUARIO.\r\n- EXPLORACIÓN, TRATAMIENTO O EXHIBICIÓN DE IMÁGENES CON FINES DOCENTES.\r\n- PARA LA INCLUSIÓN EN ENSAYOS DE INVESTIGACIÓN CLÍNICA.\r\n- PARA NEGARSE A RECIBIR O CONTINUAR TRATAMIENTO.\r\n- PARA RECIBIR CUIDADOS PALIATIVOS.\r\n- ENTRE OTROS.', 'NO ME EXPLICARON SOBRE PROCEDIMIENTO QUE ME IBAN A REALIZAR NI PIDIERON MI AUTORIZACIÓN.', '2021-02-08 14:28:02.026258', '2021-02-08 14:28:02.026258', 4),
(33, '1501', 'NEGAR O DEMORAR EN BRINDAR AL USUARIO EL ACCESO A SU HISTORIA CLINICA Y A OTROS REGISTROS CLINICOS SOLICITADOS Y NO GARANTIZAR SU CARÁCTER RESERVADO', 'SE CONSIDERA AQUELLOS RECLMAOS DONDE LA IPRESS NO PERMITE O DEMORA AL USUARIO EN ACCEDER A SU HISTORIA CLINICA U OTROS REGISTROS CLÍNICOS COMO LA CONSTANCIA DE DISCAPACIDAD Y OTROS DOCUMENTOS RELACIONADOS A SU ATENCIÓN, ASÍ COMO RESGUARDAR LA PRIVACIDAD DE LA INFORMACIÓN.', 'ACCESO A LA HC Y LOS OTROS REGISTROS CLÍNICOS.', '2021-02-08 14:33:00.680414', '2021-02-08 14:33:00.680414', 5),
(34, '1502', 'NO REALIZAR LA GESTION DEL RECLAMO DE FORMA OPORTUNA Y ADECUADA.', 'SE CONSIDERAN AQUELLOS RECLAMOS DONDE LA IPRESS:\r\n- NO BRINDA INFORMCIÓN AL USUARIO SOBRE LA GESTIÓN DEL RECLAMOSEN EL PLAZO ESTABLECIDO SEGÚN NORMATIVA.\r\n- NO TRASLADA OPORTUNAMENTE EL RECLAMO A LA INSTANCIA CON COMPETENCIA.\r\n- NO TRAMITA EL RECLAMO DENTRO DE LOS PLAZOS ESTABLECIDOS.\r\n- DEMORA O NEGATIVA EN BRINDAR EL LIBRO DE RECLAMACIONES.\r\n- ENTRE OTROS.', 'GESTIÓN DEL RECLAMO:\r\n- NO ME DAN INFORMACIÓN.\r\n- OBSTACULIZAR.\r\n- DEMORA EN ELPLAZO ESTABLECIDO.', '2021-02-08 14:34:22.327946', '2021-02-08 14:34:22.327946', 5),
(35, '1504', 'NO CONTAR CON PLATAFORMA DE ATENCION AL USUARIO EN SALUD DE ACUERDO A LA NORMATIVIDAD VIGENTE.', 'NO CONTAR CON UNA PLATAFORMA DE ATENCIÓN AL USURIO EN SALUD PARA LA ATENCIÓN DE CONSULTAS Y RECLAMOS DE ACUERDO A LA NORMATIVIDAD VIGENTE.', 'NO TIENE PAUS', '2021-02-08 14:35:27.764895', '2021-02-08 14:35:27.764895', 5),
(36, '2001', 'OTROS RELATIVOS A LA ATENCION DE SALUD EN LAS IPRESS.', 'OTRO RECLAMOS REFERIDOS A LA ATENCIÓN EN LA IPRESS O UGIPRESS.', 'OTROS RECLAMOS NO IDENTIFICADOS.', '2021-02-08 14:36:20.564882', '2021-02-08 14:36:20.564882', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_entidadreclamo`
--

CREATE TABLE `reclamo_entidadreclamo` (
  `id` int(11) NOT NULL,
  `tipo_institucion` int(10) UNSIGNED NOT NULL,
  `codigo_administrado` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `medio_presentacion` int(10) UNSIGNED NOT NULL,
  `codigo_registro` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_documento_usuario` int(10) UNSIGNED NOT NULL,
  `numero_documento_usuario` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `razon_social_usuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombres_usuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_paterno_usuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_materno_usuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_documento_presenta` int(10) UNSIGNED NOT NULL,
  `numero_documento_presenta` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `razon_social_presenta` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombres_presenta` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_paterno_presenta` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_materno_presenta` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `autorizacion_notificacion_correo` int(11) NOT NULL,
  `correo_presenta` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domicilio_presenta` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular_presenta` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `medio_recepcion_reclamo` int(10) UNSIGNED NOT NULL,
  `fecha_reclamo` date NOT NULL,
  `detalle_reclamo` longtext COLLATE utf8_spanish_ci NOT NULL,
  `servicio_hecho_reclamo` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `competencia_reclamo` int(10) UNSIGNED NOT NULL,
  `clasificacion_reclamo_1_id` int(11) NOT NULL,
  `clasificacion_reclamo_2_id` int(11) DEFAULT NULL,
  `clasificacion_reclamo_3_id` int(11) DEFAULT NULL,
  `estado_reclamo` int(10) UNSIGNED NOT NULL,
  `codigo_reclamo_primigenio` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `etapa_reclamo` int(10) UNSIGNED DEFAULT NULL,
  `tipo_administrado_traslado` int(10) UNSIGNED DEFAULT NULL,
  `codigo_administrado_deriva` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `resultado_reclamo` int(11) DEFAULT NULL,
  `motivo_conclusion_anticipada` int(10) UNSIGNED DEFAULT NULL,
  `fecha_resultado_reclamo` date DEFAULT NULL,
  `comunicacion_resultado_reclamo` int(10) UNSIGNED DEFAULT NULL,
  `fecha_notificacion` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entidad_id` int(11) DEFAULT NULL,
  `es_mismo_usuario_afectado` tinyint(1) NOT NULL,
  `periodo` varchar(6) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reclamo_entidadreclamo`
--

INSERT INTO `reclamo_entidadreclamo` (`id`, `tipo_institucion`, `codigo_administrado`, `medio_presentacion`, `codigo_registro`, `tipo_documento_usuario`, `numero_documento_usuario`, `razon_social_usuario`, `nombres_usuario`, `apellido_paterno_usuario`, `apellido_materno_usuario`, `tipo_documento_presenta`, `numero_documento_presenta`, `razon_social_presenta`, `nombres_presenta`, `apellido_paterno_presenta`, `apellido_materno_presenta`, `autorizacion_notificacion_correo`, `correo_presenta`, `domicilio_presenta`, `celular_presenta`, `medio_recepcion_reclamo`, `fecha_reclamo`, `detalle_reclamo`, `servicio_hecho_reclamo`, `competencia_reclamo`, `clasificacion_reclamo_1_id`, `clasificacion_reclamo_2_id`, `clasificacion_reclamo_3_id`, `estado_reclamo`, `codigo_reclamo_primigenio`, `etapa_reclamo`, `tipo_administrado_traslado`, `codigo_administrado_deriva`, `resultado_reclamo`, `motivo_conclusion_anticipada`, `fecha_resultado_reclamo`, `comunicacion_resultado_reclamo`, `fecha_notificacion`, `created_at`, `updated_at`, `created_ip`, `updated_ip`, `entidad_id`, `es_mismo_usuario_afectado`, `periodo`) VALUES
(11, 1, NULL, 1, '123', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, NULL, NULL, NULL, 3, '2021-02-12', '45', '5', 1, 2, NULL, NULL, 6, '45', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-24 01:19:27.646949', '2021-02-24 01:21:15.641909', '181.176.106.1', '181.176.106.1', 1, 0, '000000'),
(12, 1, NULL, 2, '123', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, NULL, NULL, NULL, 3, '2021-02-06', '45', '4', 1, 25, NULL, NULL, 5, '23', 2, NULL, NULL, 1, 3, NULL, NULL, NULL, '2021-02-24 13:28:13.852977', '2021-02-24 13:28:13.853011', '181.177.233.38', '181.177.233.38', NULL, 0, '000000'),
(13, 1, '123', 1, '123', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, NULL, NULL, NULL, 4, '2021-02-18', '123', '5', 1, 10, NULL, NULL, 5, '123', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-24 13:29:10.384026', '2021-02-24 13:29:10.384059', '181.177.233.38', '181.177.233.38', NULL, 0, '000000'),
(14, 1, NULL, 2, '1233', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, NULL, NULL, NULL, 2, '2021-02-11', 'ASD', '5', 1, 7, NULL, NULL, 5, '123', 2, NULL, NULL, NULL, NULL, '2021-02-11', NULL, '2021-02-12', '2021-02-24 14:07:47.141829', '2021-03-17 20:22:09.155344', '181.177.233.38', '10.130.36.105', 1, 1, '000000'),
(15, 1, '00006600', 1, '039-2021', 1, '43862416', NULL, 'RICARDO DANTE', 'POMA', 'FELIPE', 1, '43862416', NULL, 'RICARDO DANTE', 'POMA', 'FELIPE', 0, 'RICARDODAN2306@HOTMAIL.COM', 'SOTO BERMEO N° 233 SAN ROQUE SURCO', '939155306', 1, '2021-01-21', 'DIRIS LIMASUR NO REALIZA ABORDAJE INICIAL Y ABORDAJE SINDROMICO TEMPRANO DE CASO REGISTRADO EN CONTAC CENTER DIA VIERNES 15 DE ENERO, CASO REPORTADO A SUSALUD POR FALTA DE INFORMACION Y NO CONTESTAR TELEFONOS DE CONTAC CENTER INCUMPLIMIENTO EL EQUIPO DE RESPUESTA RAPIDA DE DIRIS LIMASUR ATENCION DENTRO DE LAS 24 HORAS. HOY 21 DE ENERO SIN INFORMACION-SE PIDE SANCIONES POR FALTA DE CONTROL DE FUNCIONARIOS POR DIRECTORA DIRIS LIMA SUR.', '11', 3, 6, 36, 36, 2, NULL, 2, NULL, NULL, 2, 3, '2021-03-25', 1, '2021-03-25', '2021-02-25 20:37:24.125703', '2021-04-12 17:24:05.347389', '201.230.217.121', '10.130.36.105', 1, 1, '012021'),
(16, 1, '6094', 1, '1515', 1, '45987410', NULL, 'FELIX ADRIAN', 'ARROYO', 'HUAMAN', 1, '45987410', NULL, 'FELIX ADRIAN', 'ARROYO', 'HUAMAN', 1, NULL, NULL, NULL, 1, '2021-03-21', 'ESTA CERRADO EL ESTABLECIMIENTO', '1', 1, 13, NULL, NULL, 2, NULL, 1, NULL, NULL, 5, 3, '2021-03-21', 1, '2021-03-21', '2021-03-22 03:16:54.339777', '2021-03-22 03:16:54.339777', '200.121.149.177', '200.121.149.177', 112, 1, '000000'),
(17, 1, '6151', 2, '6151-29', 1, '43253215', NULL, 'JANET MARLENE', 'SANCHEZ', 'LUYO', 1, '43253215', NULL, 'JANET MARLENE', 'SANCHEZ', 'LUYO', 0, 'RENECHUMPITAZ11@GMAIL.COM', 'PSJE LOS JASMINES  MZ B LT M', '924999712', 2, '2021-01-15', 'NO SE LE ATENDIO EN EL SERVICIO DE OBSTETRICIA A PESAR DE TENER CITA PROGRAMADA', '5', 1, 20, NULL, NULL, 1, NULL, 4, NULL, NULL, 1, NULL, '2021-02-17', 2, '2021-02-02', '2021-04-09 20:45:34.730297', '2021-04-09 20:45:34.730297', '201.230.217.55', '201.230.217.55', 54, 1, '012021'),
(18, 1, '676767', 1, '6767', 1, '45626886', NULL, 'OSCAR DAVID', 'MENDOZA', 'APAZA', 1, '45626886', NULL, 'OSCAR DAVID', 'MENDOZA', 'APAZA', 1, NULL, NULL, NULL, 3, '2021-02-12', '123', '4', 1, 2, NULL, NULL, 1, NULL, 2, NULL, NULL, 2, 3, '2021-04-13', 3, '2021-04-15', '2021-04-09 20:58:31.015853', '2021-04-09 20:58:31.015853', '10.130.36.105', '10.130.36.105', 1, 1, '022021'),
(19, 1, '6151', 2, '6151-30', 1, '09714370', NULL, 'SILVIA GLADYS', 'CORTEZ', 'ALATA', 1, '09714370', NULL, 'SILVIA GLADYS', 'CORTEZ', 'ALATA', 1, NULL, 'JR. PROGRESO 603', '994060416', 2, '2021-01-25', 'UN TRATO NO AGRADABLE Y NO ME ATENDIERON', '1', 1, 6, NULL, NULL, 1, NULL, 4, NULL, NULL, 5, 2, '2021-01-27', NULL, NULL, '2021-04-09 21:39:39.712557', '2021-04-09 21:39:39.712557', '201.230.217.55', '201.230.217.55', 54, 1, '012021'),
(20, 1, 'C1', 2, '000097', 1, '00000000', NULL, 'LIZ NOEMI', 'BELTRAN', 'YAURI', 1, '00000000', NULL, 'LIZ NOEMI', 'BELTRAN', 'YAURI', 1, NULL, NULL, NULL, 2, '2021-03-04', 'USUARIA REFIERE : \" VACUNARON A MI MENOR HIJA PERO EN EL SISTEMA NO APARECE\".', '8', 1, 36, NULL, NULL, 1, NULL, 4, NULL, NULL, 5, 2, '2021-03-04', NULL, NULL, '2021-04-10 13:04:15.626174', '2021-04-10 13:05:02.892977', '190.233.181.242', '190.233.181.242', 119, 1, '032021'),
(21, 1, '123', 1, '123', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, '45454545', NULL, 'CRISTHIAN IRVING', 'VALENCIA', 'BAZAN', 1, NULL, 'CASA', '7676767', 4, '2021-04-14', '343434', '06', 1, 9, NULL, NULL, 1, NULL, 4, NULL, NULL, 3, 3, '2021-04-22', 3, '2021-04-16', '2021-04-15 20:46:32.170261', '2021-04-15 20:46:32.173262', '127.0.0.1', '127.0.0.1', 7, 1, '042021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_medidaadoptada`
--

CREATE TABLE `reclamo_medidaadoptada` (
  `id` int(11) NOT NULL,
  `codigo` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `naturaleza` int(10) UNSIGNED NOT NULL,
  `procesos` int(10) UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_culminacion` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `updated_ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entidad_reclamo_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_entidad`
--

CREATE TABLE `setup_entidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `categoria` int(10) UNSIGNED NOT NULL,
  `ris` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `setup_entidad`
--

INSERT INTO `setup_entidad` (`id`, `nombre`, `codigo`, `categoria`, `ris`) VALUES
(1, 'C.S.M.C. BARRANCO', '27615', 3, 1),
(2, 'C.S. GAUDENCIO BERNASCONI*', '5989', 3, 1),
(3, 'C.S. ALICIA LASTRES DE LA TORR', '5988', 3, 1),
(4, 'C.S. GUSTAVO LANATTA LUJAN', '5990', 3, 1),
(5, 'C.M.I. VIRGEN DEL CARMEN', '5991', 4, 1),
(6, 'P.S. ARMATAMBO', '5992', 2, 1),
(7, 'C.E. SAN PEDRO DE LOS CHORRILL', '6162', 4, 1),
(8, 'C.M.I. BUENOS AIRES DE VILLA', '5998', 4, 1),
(9, 'C.S. DELICIAS DE VILLA', '5999', 3, 1),
(10, 'C.S. SAN GENARO DE VILLA', '6000', 4, 1),
(11, 'P.S. VISTA ALEGRE DE VILLA', '6001', 2, 1),
(12, 'P.S. SANTA ISABEL DE VILLA', '6002', 2, 1),
(13, 'C.S. TUPAC AMARU DE VILLA', '6003', 3, 1),
(14, 'P.S. SAN JUAN DE LA LIBERTAD', '6004', 2, 1),
(15, 'P.S. MATEO PUMACAHUA', '6005', 2, 1),
(16, 'P.S. SANTA TERESA DE CHORRILLOS', '6006', 2, 1),
(17, 'P.S. VILLA VENTURO', '6007', 2, 1),
(18, 'P.S. NUEVA CALEDONIA', '6008', 2, 1),
(19, 'P.S. LOS INCAS', '6009', 2, 1),
(20, 'P.S. DEFENSORES DE LIMA', '6010', 2, 1),
(21, 'C.S.M.C. SAN SEBASTIAN', '26221', 3, 1),
(22, 'C.S.M.C. COMUNITARIO NANCY REYES BAHAMONETE', '24374', 3, 1),
(23, 'C.S. SANTIAGO DE SURCO', '5993', 3, 1),
(24, 'P.S. SAN CARLOS', '5994', 1, 1),
(25, 'P.S. SAN ROQUE', '5995', 2, 1),
(26, 'P.S. LOS VIÑEDOS DE SURCO', '5996', 2, 1),
(27, 'P.S. LAS FLORES', '5997', 2, 1),
(28, 'P.S. LAS DUNAS', '6952', 2, 1),
(29, 'C.S. SAN JUAN DE MIRAFLORES', '6115', 3, 4),
(30, 'P.S. DESIDERIO MOSCOSO CASTILLO', '23635', 2, 4),
(31, 'P.S. VILLA SOLIDARIDAD', '6118', 2, 4),
(32, 'P.S. VALLE SHARON', '6116', 2, 4),
(33, 'P.S. PAMPAS DE SAN JUAN', '6117', 2, 4),
(34, 'C.S. TRÉBOL AZUL', '6122', 3, 4),
(35, 'P.S. HÉROES DEL PACÍFICO', '6123', 2, 4),
(36, 'P.S. PARAÍSO', '6120', 2, 4),
(37, 'P.S. SANTA URSULA', '6121', 2, 4),
(38, 'P.S. RICARDO PALMA', '6119', 2, 4),
(39, 'P.S. LADERAS DE VILLA', '7434', 2, 4),
(40, 'C.S. VILLA SAN LUIS', '6106', 3, 1),
(41, 'C.S. LEONOR SAAVEDRA', '6105', 3, 4),
(42, 'C.S. JESÚS PODEROSO', '6109', 3, 4),
(43, 'P.S. EL BRILLANTE', '6113', 2, 4),
(44, 'P.S. 6 DE JULIO', '6114', 2, 4),
(45, 'C.M.I. MANUEL BARRETO', '6104', 4, 4),
(46, 'P.S. VIRGEN DEL BUEN PASO', '6108', 2, 4),
(47, 'P.S. SAN FRANCISCO DE LA CRUZ', '6110', 2, 4),
(48, 'P.S. MARIANNE PREUSS DE STARK', '13486', 2, 4),
(49, 'C.M.I. \"OLLANTAY\"', '6107', 4, 4),
(50, 'P.S. LA RINCONADA', '6112', 2, 4),
(51, 'P.S. LEONCIO PRADO', '6163', 2, 4),
(52, 'P.S. JOSÉ M. ARGUEDAS', '6872', 2, 4),
(53, 'P.S. 5 DE MAYO', '7645', 2, 4),
(54, 'C.M.I. VILLA MARÍA DEL TRIUNFO', '6151', 4, 6),
(55, 'P.S. 12 DE JUNIO', '16630', 2, 6),
(56, 'P.S. SANTA ROSA DE BELÉN', '6154', 2, 6),
(57, 'C.M.I. JOSÉ CARLOS MARIÁTEGUI', '6152', 4, 6),
(58, 'P.S. VILLA LIMATAMBO', '6158', 2, 6),
(59, 'P.S. JUAN CARLOS SOBERON', '17440', 2, 6),
(60, 'P.S. BUENOS AIRES', '6157', 2, 6),
(61, 'P.S. VALLE ALTO', '6159', 2, 6),
(62, 'P.S. PARAÍSO ALTO', '9565', 2, 6),
(63, 'C.S.M.C. 12 DE NOVIEMBRE', '24847', 3, 4),
(64, 'P.S. VALLE BAJO', '6156', 2, 6),
(65, 'C.M.I. JOSÉ GALVEZ', '6141', 4, 6),
(66, 'P.S. MÓDULO I', '6146', 2, 6),
(67, 'P.S. NUEVO PROGRESO', '6145', 2, 6),
(68, 'P.S. CIUDAD DE GOSEN', '12847', 2, 6),
(69, 'C.S. NUEVA ESPERANZA', '6140', 3, 6),
(70, 'P.S. VIRGEN DE LOURDES', '6142', 2, 6),
(71, 'P.S. CÉSAR VALLEJO II', '6144', 2, 6),
(72, 'P.S. NUEVA ESPERANZA ALTA', '6143', 2, 6),
(73, 'C.M.I.  DANIEL A. CARRIÓN', '6153', 4, 6),
(74, 'P.S. TORRES DE MELGAR', '6161', 2, 6),
(75, 'P.S. MICAELA BASTIDAS', '6160', 4, 6),
(76, 'C.M.I. TABLADA DE LURÍN', '6164', 4, 6),
(77, 'P.S. SANTA ROSA DE LAS CONCHITAS', '6150', 2, 6),
(78, 'C.S.M.C. SAN GABRIEL ALTO', '6155', 2, 6),
(79, '*** CAM. TAYTA WASI', '15544', 3, 6),
(80, 'P.S. DAVID GUERRERO DUARTE', '6149', 2, 6),
(81, 'C.S.M.C. MONSEÑOR JOSE RAMON GURUCHAGA', '27621', 3, 6),
(82, 'C.M.I. SAN JOSÉ', '6132', 4, 5),
(83, 'P.S. SEÑOR DE LOS MILAGROS', '6134', 2, 5),
(84, 'P.S LLANAVILLA', '6135', 2, 5),
(85, 'C.S.M.C. EL SOL DE VILLA', '27622', 3, 5),
(86, 'C.S.M.C. VILLA EL SALVADOR', '26282', 3, 5),
(87, 'C.S. SAN MARTÍN DE PORRES', '6125', 3, 5),
(88, 'P.S. VIRGEN DE LA ASUNCIÓN', '6130', 2, 5),
(89, 'P.S. SAGRADA FAMILIA', '6131', 2, 5),
(90, 'C.M.I. JUAN PABLO II', '6133', 4, 5),
(91, 'P.S.  FERNANDO LUYO SIERRA', '6136', 2, 5),
(92, 'P.S. CRISTO SALVADOR', '6137', 2, 5),
(93, 'P.S. SARITA COLONIA', '6138', 2, 5),
(94, 'P.S. OASIS DE VILLA', '6139', 2, 5),
(95, 'P.S. SASBI', '7716', 2, 5),
(96, 'C.M.I.  CÉSAR LOPEZ SILVA', '6124', 4, 5),
(97, 'P.S. PRÍNCIPE DE ASTURIAS', '6126', 2, 5),
(98, 'P.S. PACHACAMAC', '6127', 2, 5),
(99, 'P.S. EDILBERTO RAMOS', '6128', 2, 5),
(100, 'C.S. HÉROES DEL  CENEPA', '7278', 3, 5),
(101, 'P.S. BRISAS DE PACHACAMAC', '6129', 2, 5),
(102, 'C.M.I. LURÍN', '6079', 4, 2),
(103, 'P.S. BUENA VISTA', '6083', 2, 2),
(104, 'CLAS JULIO C TELLO', '6080', 3, 2),
(105, 'C.S. VILLA ALEJANDRO', '6082', 3, 2),
(106, 'P.S. MARTHA MILAGROS BAJA', '16852', 2, 2),
(107, 'C.S. NUEVO LURIN KM. 40 (CLAS)', '6081', 3, 2),
(108, 'C.S.M.C. LA MEDALLA MILAGROSA', '25771', 3, 3),
(109, 'C.S.M.C. SANTA ROSA DE MANCHAY', '25772', 3, 3),
(110, 'C.S. PACHACAMAC', '6090', 3, 3),
(111, 'P.S.VILLA LIBERTAD (CLAS)', '6093', 2, 3),
(112, 'P.S. PAMPA GRANDE', '6094', 2, 3),
(113, 'P.S. QUEBRADA VERDE', '6095', 2, 3),
(114, 'P.S. GUAYABO', '6096', 2, 3),
(115, 'P.S. PICA PIEDRA', '6097', 2, 3),
(116, 'P.S. CARDAL', '6099', 2, 3),
(117, 'P.S. MANCHAY ALTO', '6091', 2, 3),
(118, 'P.S. TAMBO INGA', '6098', 1, 3),
(119, 'C.S. PORTADA DE MANCHAY', '6092', 3, 3),
(120, 'P.S. HUERTOS DE MANCHAY', '6102', 2, 3),
(121, 'C.S. CLAS JUAN PABLO II', '15075', 3, 3),
(122, 'P.S. COLLANAC', '6101', 2, 3),
(123, 'P.S. PARQUES DE MANCHAY', '6103', 2, 3),
(124, 'C.S. SAN BARTOLO', '6088', 3, 2),
(125, 'C.S. PUCUSANA', '6084', 3, 2),
(126, 'C.S. BENJAMÍN DOIG', '6085', 3, 2),
(127, 'P.S. PUNTA HERMOSA', '6086', 2, 2),
(128, 'C.S. PUNTA NEGRA', '6087', 3, 2),
(129, 'P.S. VILLA MERCEDES', '6089', 2, 2),
(130, 'sdsd', 'sdsd', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_groupmenu`
--

CREATE TABLE `setup_groupmenu` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `setup_groupmenu`
--

INSERT INTO `setup_groupmenu` (`id`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_groupmenu_menus`
--

CREATE TABLE `setup_groupmenu_menus` (
  `id` int(11) NOT NULL,
  `groupmenu_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `setup_groupmenu_menus`
--

INSERT INTO `setup_groupmenu_menus` (`id`, `groupmenu_id`, `menu_id`) VALUES
(24, 1, 3),
(25, 1, 5),
(6, 2, 1),
(7, 2, 3),
(8, 2, 5),
(10, 2, 7),
(11, 2, 9),
(12, 2, 10),
(13, 2, 11),
(14, 2, 12),
(15, 2, 13),
(16, 2, 14),
(17, 2, 15),
(18, 2, 16),
(19, 2, 17),
(20, 2, 18),
(21, 2, 19),
(22, 2, 20),
(23, 2, 21),
(27, 3, 2),
(28, 3, 4),
(29, 3, 6),
(26, 3, 8),
(32, 3, 23),
(30, 3, 24),
(31, 3, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_menu`
--

CREATE TABLE `setup_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `url` varchar(80) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `setup_menu`
--

INSERT INTO `setup_menu` (`id`, `name`, `icon`, `url`, `title`, `type`, `parent_id`) VALUES
(1, 'USUARIOS', 'user', '/setup/usuario/list', 'USUARIOS', 1, 5),
(2, 'LISTA RECLAMOS', 'eye', '/reclamo/entidad-reclamo/list', 'LISTA RECLAMOS', 1, 8),
(3, 'IPRESS', 'home', '/setup/entidad/list', 'IPRESS', 1, 22),
(4, 'ANEXO 1', 'edit', '/evaluacion/list', 'Evaluación', 1, 6),
(5, 'CONFIGURACIÓN', 'puzzle-piece', '#', 'CONFIGURACIÓN', 1, NULL),
(6, 'EVALUACIÓN', 'pencil', '#', 'EVALUACIÓN', 1, NULL),
(7, 'REPORTES', 'bar-chart', '#', 'REPORTES', 1, NULL),
(8, 'RECLAMOS', 'hand-rock-o', '#', 'RECLAMOS', 1, NULL),
(9, 'ANEXOS', 'language', '/reportes/ris-anexos', 'ANEXOS', 1, 7),
(10, 'SIN RECLAMO', 'bell-slash-o', '/reportes/ris-sin-reclamo', 'SIN RECLAMO', 1, 7),
(11, 'RECLAMO X MES', 'calendar-times-o', '/reportes/reclamos-por-mes', 'RECLAMO X MES', 1, 7),
(12, 'POR RESULTADO', 'flask', '/reportes/ris-resultado', 'POR RESULTADO', 1, 7),
(13, 'CONCLUSIÓN ANTICIPADA', 'hourglass-3', '/reportes/ris-motivo-conclusion-anticipada', 'CONCLUSIÓN ANTICIPADA', 1, 7),
(14, 'ATENDIDO Y PENDIENTES', 'microphone-slash', '/reportes/ris-atendidos-pendientes', 'ATENDIDO Y PENDIENTES', 1, 7),
(15, 'CLASIFICACIÓN RECLAMO', 'star-half-empty', '/reportes/ris-clasificacion-reclamo', 'CLASIFICACIÓN RECLAMO', 1, 7),
(16, 'ESTADO RECLAMO', 'gg', '/reportes/ris-estado-reclamo', 'ESTADO RECLAMO', 1, 7),
(17, 'AUTORIZACIÓN CORREO', 'google', '/reportes/ris-autorizacion-correo', 'AUTORIZACIÓN CORREO', 1, 7),
(18, 'MEDIO RECEPCIÓN', 'check', '/reportes/ris-medio-recepcion', 'MEDIO RECEPCIÓN', 1, 7),
(19, 'ETAPA RECLAMO', 'binoculars', '/reportes/ris-etapa-reclamo', 'ETAPA RECLAMO', 1, 7),
(20, 'SERVICIO ORIGEN', 'anchor', '/reportes/ris-servicio-origen', 'SERVICIO ORIGEN', 1, 7),
(21, 'TIPO RECLAMO', 'location-arrow', '/reportes/ris-tipo-reclamo', 'TIPO RECLAMO', 1, 7),
(22, 'GESTIÓN RECLAMOS', 'sort-alpha-asc', '#', 'GESTIÓN RECLAMOS', 1, NULL),
(23, 'TRAMA', 'trademark', '#', 'TRAMA', 1, NULL),
(24, 'RECLAMOS', 'twitch', '/trama-txt/reclamos', 'RECLAMOS', 1, 23),
(25, 'MEDIDAS ADOPTADAS', 'stethoscope', '/trama-txt/medidas-adoptadas', 'MEDIDAS ADOPTADAS', 1, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_periodo`
--

CREATE TABLE `setup_periodo` (
  `id` int(11) NOT NULL,
  `periodo` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `setup_periodo`
--

INSERT INTO `setup_periodo` (`id`, `periodo`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 'Periodo 2021 - 1', '2021-01-01', '2021-05-31', 0),
(2, '2021-2', '2021-03-17', '2021-05-28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_rubrocalificacion`
--

CREATE TABLE `setup_rubrocalificacion` (
  `id` int(11) NOT NULL,
  `orden` int(10) UNSIGNED NOT NULL,
  `rubro` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `setup_rubrocalificacion`
--

INSERT INTO `setup_rubrocalificacion` (`id`, `orden`, `rubro`) VALUES
(1, 1, 'Cuenta con Libro de Reclamaciones'),
(2, 2, 'Libro de Reclamaciones (Físico o Virtual)'),
(3, 3, 'Se ha designado mediante resolución del Titular de la entidad al responsable del Libro de Reclamaciones'),
(4, 4, 'El Libro de Reclamaciones se encuentra en lugar visible y de fácil acceso'),
(5, 5, 'Existen avisos en los que se indique la existencia de libro de reclamaciones y el derecho que poseen los usuarios para solicitarlo cuando los consideren conveniente'),
(6, 6, 'N° total de reclamaciones en el periodo (enero-junio) o (julio-diciembre)'),
(7, 7, 'N° de usuarios a los que se les proporcionó copia o constancia de su reclamo.'),
(8, 8, 'N° de reclamaciones atendidas fuera del plazo de 30 días hábiles o no atendidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_usuario`
--

CREATE TABLE `setup_usuario` (
  `id` int(11) NOT NULL,
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
  `celular` int(11) DEFAULT NULL,
  `entidad_id` int(11) DEFAULT NULL,
  `ris` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `setup_usuario`
--

INSERT INTO `setup_usuario` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `document`, `celular`, `entidad_id`, `ris`) VALUES
(1, 'pbkdf2_sha256$216000$62pi5W9w6T8i$RBOptrxr5vcnGGbo/ClqGsJJfUUNs/rXodzkj5RMZn4=', '2021-04-16 15:39:42.751564', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2021-02-05 20:41:46.000000', '12345678', NULL, 1, 0),
(2, 'pbkdf2_sha256$216000$CeojeNDeTFG8$W1PLtfZUxitb+LEpD0TIWbIzSiCS0kJLv3w3W4cLoY8=', '2021-03-21 16:27:46.536700', 0, 'demo', 'Usuario1', 'Apellido', 'usuario2@gmail.com', 0, 1, '2021-02-10 16:40:02.000000', '12345678', 979362396, 2, 0),
(3, 'pbkdf2_sha256$216000$U8H8bYIZZWzR$3QGWnhYFZAmnki7IVJ7CZNRrt/fy5Vibzle+K6dS3Ps=', NULL, 1, 'oscdmdz@gmail.com', '', '', 'oscdmdz@gmail.com', 1, 1, '2021-03-04 19:47:15.971388', NULL, NULL, NULL, 0),
(4, 'pbkdf2_sha256$216000$NUsQrXJKzVwA$eKSyN7UfJGIFTd1HWMrTqE5bZ5Hx4vUN+41igFpT364=', NULL, 0, 'jrojas', 'JEFERSON ALISEO', 'ROJAS GHIO', 'jjrojasghio88@gmail.com', 0, 1, '2021-03-08 19:56:48.000000', '45396300', 989483681, 5, 0),
(5, 'pbkdf2_sha256$216000$HrpbOvMCLW5I$gftVJVEAuLKoFniuj917OX1JDEfTKCFkVV24Su+vQlc=', NULL, 0, 'hramos', 'HAYDEE URSULA', 'RAMOS SARMIENTO', 'secretaria.csdv@gmail.com', 0, 1, '2021-03-08 20:02:47.000000', '10633713', 992720201, 9, 0),
(6, 'pbkdf2_sha256$216000$7jBtArPlISbO$j4g9UK2pCylrh9qNSrFxa88DZnU76EYQxuqk/VFuVrE=', NULL, 0, 'cbendezu', 'CINTYA LUISA', 'BENDEZÚ PEREZ', '', 0, 1, '2021-03-08 20:05:34.000000', '73069289', 975335545, 13, 0),
(7, 'pbkdf2_sha256$216000$m56NjjJSvKUF$DGabx257bhJ57KxZU/RBHzV1jmrOLS7J1hX40aRVCtg=', NULL, 0, 'mherrera', 'MYRNA VIOLETA', 'HERRERA FIESTAS', 'sosmikela@gmail.com', 0, 1, '2021-03-08 20:07:58.000000', '40273993', 986665554, 14, 0),
(8, 'pbkdf2_sha256$216000$wuww0I8vuRRo$CgRWgU75CPRkvw4I3C+93YtNiaEXWAqNk+lfLeLm6Oo=', NULL, 0, 'nlopez', 'NOEMI ESTELA', 'LOPEZ REVILLA', 'noemy65@hotmail.com', 0, 1, '2021-03-08 20:14:36.000000', '42405231', 988832057, 17, 0),
(9, 'pbkdf2_sha256$216000$8yYrRmZXMegW$oHu1PmpDLaP348EJEwsMi5hG0Sl1vfGocUUH+XxVQ+Q=', NULL, 0, 'smarchena', 'SUSANA', 'MARCHENA VALENCIA', 'sefean1@hotmail.com', 0, 1, '2021-03-08 20:20:36.000000', '10311520', 938116434, 11, 0),
(10, 'pbkdf2_sha256$216000$wXjRZxMIYwc2$Rk1Y1wSPzfcFz3FJUr7oMvjYez9kJs8S9KbT3rY7w68=', NULL, 0, 'cpatazca', 'CECILIA ELIZABETH', 'PATAZCA FARRO', 'cecinut@hotmail.com', 0, 1, '2021-03-08 20:23:27.000000', '16678314', 964044955, 27, 0),
(11, 'pbkdf2_sha256$216000$JjJL62NAoLxa$VSR/ugrKNRfbok9xb7CbWPH1OBqj7FxAoHSH0TGNkRA=', NULL, 0, 'aperez', 'ANDREA', 'PEREZ LOPEZ', 'andreaperezves@hotmail.com', 0, 1, '2021-03-08 20:26:36.000000', '06667278', 990113935, 110, 0),
(12, 'pbkdf2_sha256$216000$ZOHXcw6zkTWi$EeeI7ZPVuSPa/rBZW/RR9ugQfozpx1LFyAcpIQ2uJSg=', '2021-04-10 12:34:03.723542', 0, 'ggarcia', 'GUILLERMO', 'GARCIA CUYA', 'psdavidgarcia@hotmail.com', 0, 1, '2021-03-08 20:30:51.000000', '46170221', 943102119, 119, 0),
(13, 'pbkdf2_sha256$216000$AK6Q57x3iswZ$UyeRefIIGkuk4MYSU4zZKVsYKIsBcGdVsPtXHmItv4M=', NULL, 0, 'mhanco', 'MATILDE', 'HANCO CARAZAS', 'sormatildehsc@hotmail.com', 0, 1, '2021-03-08 20:41:52.000000', '09877602', 992316805, 121, 0),
(14, 'pbkdf2_sha256$216000$6qP4yTAtXmws$+75MJ6TRUHORDA5WcSajxM5hnrso92cXVkZ2YXRGGVk=', NULL, 0, 'mmechato', 'MARIANA', 'MECHATO VILELA', 'marianamechato@gmail.com', 0, 1, '2021-03-08 21:02:47.000000', '02871365', 990113935, 109, 0),
(15, 'pbkdf2_sha256$216000$OyQIs36C1uUr$KWoHHtXtt2sRoAY5zqF5hD9z4VCqhR8VLClQbv6axzc=', NULL, 0, 'mjimenez', 'NANCY VICTORIA', 'JIMENEZ BAUTISTA', 'nanvic5@hotmail.com', 0, 1, '2021-03-08 21:04:38.000000', '40552065', 967796844, 108, 0),
(16, 'pbkdf2_sha256$216000$8lNUezWmuodV$rNUkY3CEX39oAzB0dQd693U42wGgwJLNizRPoCTSjdI=', NULL, 0, 'fsuarez', 'FERNANDO', 'SUAREZ SALAZAR', 'fersua121@hotmail.com', 0, 1, '2021-03-09 15:45:48.000000', '10002414', 989860829, 117, 0),
(17, 'pbkdf2_sha256$216000$RfbOm7PgDmkM$2zt9zg7x1rqzOpCMgs/eA/PAFaPYzgr5ExRxZXW4jt8=', NULL, 0, 'igarcia', 'IRMA', 'GARCIA RENDON', 'irmagarciarendon@gmail.com', 0, 1, '2021-03-09 15:49:46.000000', '07889004', 950473510, 118, 0),
(18, 'pbkdf2_sha256$216000$Boc9fksqiEJx$S9yjjsIdHxdzCLw+BQJcfHXXf4MYciuK2nt2FfKHN4A=', NULL, 0, 'rsuazo', 'RICARDO YONAH', 'SUAZO FERNANDE<', 'suazo_fernandez@hotmail.com', 0, 1, '2021-03-09 15:52:35.000000', '40153576', 401535760, 115, 0),
(19, 'pbkdf2_sha256$216000$HCwuIHzTUh9Y$TKBY4WW13PWAEXofhE5Ll9ev76dFNlDSe3oeCl+VopI=', NULL, 0, 'rfernandez', 'RAFAEL', 'FERNANDEZ ARISTI', 'pcmerfer@gmail.com', 0, 1, '2021-03-09 15:57:00.000000', '71878197', 980538466, 114, 0),
(20, 'pbkdf2_sha256$216000$4cqAG7zzz2GT$DxsttuWiIbxsKiqUddrt8F4bCHb5NOFwy/fpmGSw9pA=', NULL, 0, 'pporras', 'PAOLA BEATRIZ', 'PORRAS ALATA', 'paobet_1011@hotmail.com', 0, 1, '2021-03-09 16:03:54.000000', '44710041', 945635518, 113, 0),
(21, 'pbkdf2_sha256$216000$6rhjuByTCxq2$QURAxYVhbuF61JQDFO2Vf88xEUoJTWEhIl4Lfne+0Ec=', '2021-03-22 03:09:54.192366', 0, 'pborja', 'PATRICIA', 'BORJA VILCHEZ', 'milipaty13@hotmail.com', 0, 1, '2021-03-09 16:07:26.000000', '10543859', 934368178, 112, 0),
(22, 'pbkdf2_sha256$216000$I3TDDyxY2Vkj$/twiDipcP9jHbA+I300InXgYQU3yw+NZS85miBDXdHg=', '2021-04-15 14:35:45.615629', 0, '123123', 'GILBERT', '', '', 0, 1, '2021-03-12 20:57:52.000000', NULL, 987565656, NULL, 1),
(23, 'pbkdf2_sha256$216000$L0EMiyjX78Mb$ZJ5ksr3WvM6FzpmMKy8MVBxf8bTxl2YXZDvaS3z9ybA=', NULL, 0, 'mquispe', 'MARY', 'QUISPE', 'maycarmen07.mcqr@gmail.com', 0, 1, '2021-04-09 17:02:13.000000', '72499024', 999130926, 116, 0),
(24, 'pbkdf2_sha256$216000$qi2fQ2tx4gUu$tRrRWZfU7VatuCdY2MplmtyJGNHGvsAcpVbuJ91Etkc=', '2021-04-09 20:31:06.212724', 0, 'jmogrovejo', 'JUAN DAVID', 'MOGROVEJO SERRANO', 'paus.cmivmt@gmail.com', 0, 1, '2021-04-09 17:03:58.000000', '42751739', 957798831, 54, 0),
(25, 'pbkdf2_sha256$216000$h2i8m3K39JOJ$lE5ITwhLJbOtBCpd+VC3DwtI8MgimxnfshEKAismLts=', NULL, 0, 'dvasquez', 'DANTE AURELIO', 'VASQUEZ LOLI', 'navarra28@gmail.com', 0, 1, '2021-04-09 17:26:56.000000', '07632896', 986501523, 4, 0),
(26, 'pbkdf2_sha256$216000$Uwtl0UT4xw1n$CZ/bq/p7ieRLxJrrKAkgnqnLsbS2x0fbc2V5VASH3WQ=', '2021-04-09 20:15:28.535799', 0, 'rsopan', 'ROSA FELICITA', 'SOPAN RIOS', 'sopan2086@gmail.com', 0, 1, '2021-04-09 19:43:24.000000', '43619159', 937049487, 50, 0),
(27, 'pbkdf2_sha256$216000$4HAgh43nZ7SN$MKXwiSN0utwQ9rQfH+AuNrJgT+HEAxcsZiM6k2ZOnQ0=', NULL, 0, 'khuamani', 'KELY ELIZABETH', 'HUAMANI LUCANA', 'kely-311@hotmail.com', 0, 1, '2021-04-09 19:56:03.000000', '21550807', 987612283, 120, 0),
(28, 'pbkdf2_sha256$216000$3qZu7guYNRAO$PTi4WbQ9BW8EHuU9JjhWibQLE1lyQs63PXx4WNPiHPw=', '2021-04-09 20:08:29.000000', 0, 'mquispec', 'MARISOL', 'QUISPE CORDIVA', 'marisol.q1981@hotmail.com', 0, 1, '2021-04-09 19:57:47.000000', '40978797', 917521597, 7, 0),
(29, 'pbkdf2_sha256$216000$fvEZY7oAxKrJ$Y6Q7UUzIJ5gq1T9Ux/mBtwhUj41O/OiuLVM7yLDujkY=', '2021-04-16 21:04:21.542453', 0, 'dirislimasur', 'Diris', 'Diris', '', 0, 1, '2021-04-15 13:20:59.000000', NULL, NULL, NULL, 0),
(30, 'pbkdf2_sha256$216000$CgloDUx7Iuyw$+Gj9r12ljOPa7Qq20rU5GziuGdck6W+VTdS4WZYRhJw=', '2021-04-16 16:34:36.765475', 0, 'oscdmdz', 'Luis', 'lopez', 'tramite.dirislimasur2021@gmail.com', 0, 1, '2021-04-15 20:44:41.000000', NULL, NULL, 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_usuario_groups`
--

CREATE TABLE `setup_usuario_groups` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `setup_usuario_groups`
--

INSERT INTO `setup_usuario_groups` (`id`, `usuario_id`, `group_id`) VALUES
(1, 2, 2),
(2, 4, 2),
(3, 5, 2),
(4, 6, 2),
(5, 7, 2),
(6, 8, 2),
(7, 9, 2),
(8, 10, 2),
(9, 11, 2),
(10, 12, 2),
(11, 13, 2),
(12, 14, 2),
(13, 15, 2),
(15, 16, 2),
(14, 17, 2),
(16, 18, 2),
(17, 19, 2),
(18, 20, 2),
(19, 21, 2),
(20, 22, 1),
(21, 23, 2),
(22, 24, 2),
(23, 25, 2),
(24, 26, 2),
(25, 27, 2),
(30, 28, 3),
(27, 29, 2),
(28, 30, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_usuario_user_permissions`
--

CREATE TABLE `setup_usuario_user_permissions` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_setup_usuario_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `reclamo_administrador_detalleevaluacionanexo1`
--
ALTER TABLE `reclamo_administrador_detalleevaluacionanexo1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reclamo_administrador_detal_created_by_id_ea94a849` (`created_by_id`),
  ADD KEY `reclamo_administrador_detal_evaluacion_id_9a7d5d1f` (`evaluacion_id`),
  ADD KEY `reclamo_administrador_detalleevaluacionanexo1_rubro_id_73d4aa45` (`rubro_id`),
  ADD KEY `reclamo_administrador_detal_updated_by_id_41785d6f` (`updated_by_id`);

--
-- Indices de la tabla `reclamo_administrador_evaluacionanexo1`
--
ALTER TABLE `reclamo_administrador_evaluacionanexo1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reclamo_administrador_evaluacionanexo1_created_by_id_2c043da6` (`created_by_id`),
  ADD KEY `reclamo_administrador_evaluacionanexo1_entidad_id_a19bb982` (`entidad_id`),
  ADD KEY `reclamo_administrador_evaluacionanexo1_updated_by_id_48b5bf17` (`updated_by_id`);

--
-- Indices de la tabla `reclamo_clasificacioncausa`
--
ALTER TABLE `reclamo_clasificacioncausa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `reclamo_entidadreclamo`
--
ALTER TABLE `reclamo_entidadreclamo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reclamo_entidadreclamo_entidad_id_codigo_registro_e22a4f9d_uniq` (`entidad_id`,`codigo_registro`),
  ADD KEY `reclamo_entidadreclamo_clasificacion_reclamo_1_id_2a5c4837` (`clasificacion_reclamo_1_id`),
  ADD KEY `reclamo_entidadreclamo_clasificacion_reclamo_2_id_2679694e` (`clasificacion_reclamo_2_id`),
  ADD KEY `reclamo_entidadreclamo_clasificacion_reclamo_3_id_c5668c2c` (`clasificacion_reclamo_3_id`);

--
-- Indices de la tabla `reclamo_medidaadoptada`
--
ALTER TABLE `reclamo_medidaadoptada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reclamo_medidaadopta_entidad_reclamo_id_7e7e6ae6_fk_reclamo_e` (`entidad_reclamo_id`);

--
-- Indices de la tabla `setup_entidad`
--
ALTER TABLE `setup_entidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `setup_groupmenu`
--
ALTER TABLE `setup_groupmenu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`);

--
-- Indices de la tabla `setup_groupmenu_menus`
--
ALTER TABLE `setup_groupmenu_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setup_groupmenu_menus_groupmenu_id_menu_id_2e27992f_uniq` (`groupmenu_id`,`menu_id`),
  ADD KEY `setup_groupmenu_menus_menu_id_787ca1f9_fk_setup_menu_id` (`menu_id`);

--
-- Indices de la tabla `setup_menu`
--
ALTER TABLE `setup_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setup_menu_parent_id_0babc201_fk_setup_menu_id` (`parent_id`);

--
-- Indices de la tabla `setup_periodo`
--
ALTER TABLE `setup_periodo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `periodo` (`periodo`);

--
-- Indices de la tabla `setup_rubrocalificacion`
--
ALTER TABLE `setup_rubrocalificacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orden` (`orden`);

--
-- Indices de la tabla `setup_usuario`
--
ALTER TABLE `setup_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `setup_usuario_entidad_id_61fb7a05_fk_setup_entidad_id` (`entidad_id`);

--
-- Indices de la tabla `setup_usuario_groups`
--
ALTER TABLE `setup_usuario_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setup_usuario_groups_usuario_id_group_id_e9697227_uniq` (`usuario_id`,`group_id`),
  ADD KEY `setup_usuario_groups_group_id_a7b41fe1_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `setup_usuario_user_permissions`
--
ALTER TABLE `setup_usuario_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setup_usuario_user_permi_usuario_id_permission_id_26767b6f_uniq` (`usuario_id`,`permission_id`),
  ADD KEY `setup_usuario_user_p_permission_id_2c57fe58_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `reclamo_administrador_detalleevaluacionanexo1`
--
ALTER TABLE `reclamo_administrador_detalleevaluacionanexo1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `reclamo_administrador_evaluacionanexo1`
--
ALTER TABLE `reclamo_administrador_evaluacionanexo1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reclamo_clasificacioncausa`
--
ALTER TABLE `reclamo_clasificacioncausa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `reclamo_entidadreclamo`
--
ALTER TABLE `reclamo_entidadreclamo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `reclamo_medidaadoptada`
--
ALTER TABLE `reclamo_medidaadoptada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `setup_entidad`
--
ALTER TABLE `setup_entidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `setup_groupmenu`
--
ALTER TABLE `setup_groupmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `setup_groupmenu_menus`
--
ALTER TABLE `setup_groupmenu_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `setup_menu`
--
ALTER TABLE `setup_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `setup_periodo`
--
ALTER TABLE `setup_periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `setup_rubrocalificacion`
--
ALTER TABLE `setup_rubrocalificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `setup_usuario`
--
ALTER TABLE `setup_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `setup_usuario_groups`
--
ALTER TABLE `setup_usuario_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `setup_usuario_user_permissions`
--
ALTER TABLE `setup_usuario_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
