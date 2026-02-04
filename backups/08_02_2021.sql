-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2021 a las 20:30:59
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(64, 'Can view Clasificación de causas', 16, 'view_clasificacioncausa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(39, '2021-02-08 14:56:54.003873', '16', '1116 : ACCESO A LOS SERVICIOS DE SALUD - REFERENCIA Y CONTRA REFERENCIA\r\n- DEMORA\r\n- NEGATIVA\r\n- ERROR ', 2, '[{\"changed\": {\"fields\": [\"Definici\\u00f3n corta\"]}}]', 16, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(13, 'sessions', 'session'),
(11, 'setup', 'entidad'),
(2, 'setup', 'groupmenu'),
(1, 'setup', 'menu'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(26, 'reclamo', '0006_auto_20210208_1430', '2021-02-08 19:30:10.773887');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('s1seedzxx1p0gfuctl56a70ie0o59ku8', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l87vl:7Crm6gVUPt7gAMNskndwoU8Gn0xXzTlfUgrfBL2Y-lA', '2021-02-19 20:42:17.605090'),
('vrg2si2h8t0hpcakbdm557rgw0aervd2', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l96av:-LDQ77_ohhw7BigS7DgI_jW3Sd-9vpi2xpcJEBVOBfw', '2021-02-22 13:28:49.069533'),
('wd9hbe4ni2hxudlgw3h4vczjkwfyo0c1', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l88gK:RFcLnqSIvOQFhhyGYB4Ty_4_gmruoxaZ-KcQIHpYqCE', '2021-02-19 21:30:24.275883'),
('z1xshp8xm3ukc3z5yzs78c4o8jhc7z0i', '.eJxVjMFugzAQRP_F5wjZxkaQY-_9giiyhvUmOAUTGZNL1X-PSZDa7mn05u18C4c1D25dOLngxVEocfjLetAXx63wN8TrXNEccwp9tSnV3i7V5-x5_NjdfwMDlqF8N7ac9gpGkYaBJTJWtzV03UstG1h09cW2bQPVcCslOtXVUhmjO6JeltHX3GUdRxcxcdmEn0IsxcRxFcfT-Z3chIgrp02gHB68G-6OHDjmwn9JegF5EPc035i2_PMEeCNaBA:1l96Uu:5HiMyZYTEgaihHKyyG10mDPwTFfiZJ8Gs-cHb_aMh44', '2021-02-22 13:22:36.040300');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_clasificacioncausa`
--

CREATE TABLE `reclamo_clasificacioncausa` (
  `id` int(11) NOT NULL,
  `codigo` varchar(4) NOT NULL,
  `causa` longtext NOT NULL,
  `definicion` longtext NOT NULL,
  `definicion_corta` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `categoria` int(10) UNSIGNED NOT NULL CHECK (`categoria` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `periodo_declaracion` varchar(6) DEFAULT NULL,
  `tipo_administrador` int(10) UNSIGNED NOT NULL CHECK (`tipo_administrador` >= 0),
  `codigo_administrador` varchar(8) DEFAULT NULL,
  `codigo_ugipress` varchar(8) DEFAULT NULL,
  `tipo_institucion` int(10) UNSIGNED NOT NULL CHECK (`tipo_institucion` >= 0),
  `codigo_administrado` varchar(8) DEFAULT NULL,
  `medio_presentacion` int(10) UNSIGNED NOT NULL CHECK (`medio_presentacion` >= 0),
  `codigo_registro` varchar(15) DEFAULT NULL,
  `tipo_documento_usuario` int(10) UNSIGNED NOT NULL CHECK (`tipo_documento_usuario` >= 0),
  `numero_documento_usuario` varchar(15) DEFAULT NULL,
  `razon_social_usuario` varchar(150) DEFAULT NULL,
  `nombres_usuario` varchar(150) DEFAULT NULL,
  `apellido_paterno_usuario` varchar(150) DEFAULT NULL,
  `apellido_materno_usuario` varchar(150) DEFAULT NULL,
  `tipo_documento_presenta` int(10) UNSIGNED NOT NULL CHECK (`tipo_documento_presenta` >= 0),
  `numero_documento_presenta` varchar(15) DEFAULT NULL,
  `razon_social_presenta` varchar(150) DEFAULT NULL,
  `nombres_presenta` varchar(150) DEFAULT NULL,
  `apellido_paterno_presenta` varchar(150) DEFAULT NULL,
  `apellido_materno_presente` varchar(150) DEFAULT NULL,
  `autorizacion_notificacion_correo` int(11) NOT NULL,
  `correo_presenta` varchar(50) DEFAULT NULL,
  `domicilio_presenta` varchar(100) DEFAULT NULL,
  `celular_presenta` varchar(30) DEFAULT NULL,
  `medio_recepcion_reclamo` int(10) UNSIGNED NOT NULL CHECK (`medio_recepcion_reclamo` >= 0),
  `fecha_reclamo` date DEFAULT NULL,
  `detalle_reclamo` longtext DEFAULT NULL,
  `servicio_hecho_reclamo` int(10) UNSIGNED NOT NULL CHECK (`servicio_hecho_reclamo` >= 0),
  `competencia_reclamo` int(10) UNSIGNED NOT NULL CHECK (`competencia_reclamo` >= 0),
  `clasificacion_reclamo_1_id` int(11) NOT NULL,
  `clasificacion_reclamo_2_id` int(11) DEFAULT NULL,
  `clasificacion_reclamo_3_id` int(11) DEFAULT NULL,
  `estado_reclamo` int(10) UNSIGNED NOT NULL CHECK (`estado_reclamo` >= 0),
  `codigo_reclamo_primigenio` varchar(15) DEFAULT NULL,
  `etapa_reclamo` int(10) UNSIGNED NOT NULL CHECK (`etapa_reclamo` >= 0),
  `tipo_administrado_traslado` int(10) UNSIGNED NOT NULL CHECK (`tipo_administrado_traslado` >= 0),
  `codigo_administrado_deriva` varchar(8) DEFAULT NULL,
  `resultado_reclamo` int(10) UNSIGNED NOT NULL CHECK (`resultado_reclamo` >= 0),
  `motivo_conclusion_anticipada` int(10) UNSIGNED NOT NULL CHECK (`motivo_conclusion_anticipada` >= 0),
  `fecha_resultado_reclamo` date DEFAULT NULL,
  `comunicacion_resultado_reclamo` int(10) UNSIGNED NOT NULL CHECK (`comunicacion_resultado_reclamo` >= 0),
  `fecha_notificacion` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) DEFAULT NULL,
  `updated_ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reclamo_entidadreclamo`
--

INSERT INTO `reclamo_entidadreclamo` (`id`, `periodo_declaracion`, `tipo_administrador`, `codigo_administrador`, `codigo_ugipress`, `tipo_institucion`, `codigo_administrado`, `medio_presentacion`, `codigo_registro`, `tipo_documento_usuario`, `numero_documento_usuario`, `razon_social_usuario`, `nombres_usuario`, `apellido_paterno_usuario`, `apellido_materno_usuario`, `tipo_documento_presenta`, `numero_documento_presenta`, `razon_social_presenta`, `nombres_presenta`, `apellido_paterno_presenta`, `apellido_materno_presente`, `autorizacion_notificacion_correo`, `correo_presenta`, `domicilio_presenta`, `celular_presenta`, `medio_recepcion_reclamo`, `fecha_reclamo`, `detalle_reclamo`, `servicio_hecho_reclamo`, `competencia_reclamo`, `clasificacion_reclamo_1_id`, `clasificacion_reclamo_2_id`, `clasificacion_reclamo_3_id`, `estado_reclamo`, `codigo_reclamo_primigenio`, `etapa_reclamo`, `tipo_administrado_traslado`, `codigo_administrado_deriva`, `resultado_reclamo`, `motivo_conclusion_anticipada`, `fecha_resultado_reclamo`, `comunicacion_resultado_reclamo`, `fecha_notificacion`, `created_at`, `updated_at`, `created_ip`, `updated_ip`) VALUES
(1, '012021', 1, '123456', '2345', 1, '123', 1, NULL, 1, '124578212', NULL, NULL, NULL, NULL, 1, '457878', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2021-02-08', 'no permitio ingreso al hospital', 1, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, '2021-02-08', 1, '2021-02-08', '2021-02-08 13:25:24.972421', '2021-02-08 13:25:24.972421', '192.168.11.39', '192.168.11.39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_medidaadoptada`
--

CREATE TABLE `reclamo_medidaadoptada` (
  `id` int(11) NOT NULL,
  `codigo` varchar(2) NOT NULL,
  `descripcion` longtext NOT NULL,
  `naturaleza` int(10) UNSIGNED NOT NULL CHECK (`naturaleza` >= 0),
  `procesos` int(10) UNSIGNED NOT NULL CHECK (`procesos` >= 0),
  `fecha_inicio` date DEFAULT NULL,
  `fecha_culminacion` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_ip` varchar(20) DEFAULT NULL,
  `updated_ip` varchar(20) DEFAULT NULL,
  `entidad_reclamo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reclamo_medidaadoptada`
--

INSERT INTO `reclamo_medidaadoptada` (`id`, `codigo`, `descripcion`, `naturaleza`, `procesos`, `fecha_inicio`, `fecha_culminacion`, `created_at`, `updated_at`, `created_ip`, `updated_ip`, `entidad_reclamo_id`) VALUES
(1, '01', 'sanción al personal administrativo', 1, 4, '2021-02-08', '2021-02-10', '2021-02-08 13:27:26.631166', '2021-02-08 13:27:26.631166', '192.168.11.39', '192.168.11.39', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_entidad`
--

CREATE TABLE `setup_entidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `codigo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_groupmenu`
--

CREATE TABLE `setup_groupmenu` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_groupmenu_menus`
--

CREATE TABLE `setup_groupmenu_menus` (
  `id` int(11) NOT NULL,
  `groupmenu_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_menu`
--

CREATE TABLE `setup_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `url` varchar(30) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `document` varchar(12) NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `renipress` varchar(25) DEFAULT NULL,
  `entidad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `setup_usuario`
--

INSERT INTO `setup_usuario` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `document`, `celular`, `renipress`, `entidad_id`) VALUES
(1, 'pbkdf2_sha256$216000$k85ho7aRtN7Y$dM7bkvFjbBxNLOOk8Ua345xt/IhgVbwcDpUir3x109M=', '2021-02-08 13:28:49.051533', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2021-02-05 20:41:46.579520', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_usuario_groups`
--

CREATE TABLE `setup_usuario_groups` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setup_usuario_user_permissions`
--

CREATE TABLE `setup_usuario_user_permissions` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indices de la tabla `setup_usuario`
--
ALTER TABLE `setup_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `document` (`document`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `reclamo_clasificacioncausa`
--
ALTER TABLE `reclamo_clasificacioncausa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `reclamo_entidadreclamo`
--
ALTER TABLE `reclamo_entidadreclamo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reclamo_medidaadoptada`
--
ALTER TABLE `reclamo_medidaadoptada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `setup_entidad`
--
ALTER TABLE `setup_entidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `setup_groupmenu`
--
ALTER TABLE `setup_groupmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `setup_groupmenu_menus`
--
ALTER TABLE `setup_groupmenu_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `setup_menu`
--
ALTER TABLE `setup_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `setup_usuario`
--
ALTER TABLE `setup_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `setup_usuario_groups`
--
ALTER TABLE `setup_usuario_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_setup_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `setup_usuario` (`id`);

--
-- Filtros para la tabla `reclamo_entidadreclamo`
--
ALTER TABLE `reclamo_entidadreclamo`
  ADD CONSTRAINT `reclamo_entidadrecla_clasificacion_reclam_2679694e_fk_reclamo_c` FOREIGN KEY (`clasificacion_reclamo_2_id`) REFERENCES `reclamo_clasificacioncausa` (`id`),
  ADD CONSTRAINT `reclamo_entidadrecla_clasificacion_reclam_2a5c4837_fk_reclamo_c` FOREIGN KEY (`clasificacion_reclamo_1_id`) REFERENCES `reclamo_clasificacioncausa` (`id`),
  ADD CONSTRAINT `reclamo_entidadrecla_clasificacion_reclam_c5668c2c_fk_reclamo_c` FOREIGN KEY (`clasificacion_reclamo_3_id`) REFERENCES `reclamo_clasificacioncausa` (`id`);

--
-- Filtros para la tabla `reclamo_medidaadoptada`
--
ALTER TABLE `reclamo_medidaadoptada`
  ADD CONSTRAINT `reclamo_medidaadopta_entidad_reclamo_id_7e7e6ae6_fk_reclamo_e` FOREIGN KEY (`entidad_reclamo_id`) REFERENCES `reclamo_entidadreclamo` (`id`);

--
-- Filtros para la tabla `setup_groupmenu`
--
ALTER TABLE `setup_groupmenu`
  ADD CONSTRAINT `setup_groupmenu_group_id_e40e8e53_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `setup_groupmenu_menus`
--
ALTER TABLE `setup_groupmenu_menus`
  ADD CONSTRAINT `setup_groupmenu_menu_groupmenu_id_13d6800c_fk_setup_gro` FOREIGN KEY (`groupmenu_id`) REFERENCES `setup_groupmenu` (`id`),
  ADD CONSTRAINT `setup_groupmenu_menus_menu_id_787ca1f9_fk_setup_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `setup_menu` (`id`);

--
-- Filtros para la tabla `setup_menu`
--
ALTER TABLE `setup_menu`
  ADD CONSTRAINT `setup_menu_parent_id_0babc201_fk_setup_menu_id` FOREIGN KEY (`parent_id`) REFERENCES `setup_menu` (`id`);

--
-- Filtros para la tabla `setup_usuario`
--
ALTER TABLE `setup_usuario`
  ADD CONSTRAINT `setup_usuario_entidad_id_61fb7a05_fk_setup_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `setup_entidad` (`id`);

--
-- Filtros para la tabla `setup_usuario_groups`
--
ALTER TABLE `setup_usuario_groups`
  ADD CONSTRAINT `setup_usuario_groups_group_id_a7b41fe1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `setup_usuario_groups_usuario_id_ce35ae5c_fk_setup_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `setup_usuario` (`id`);

--
-- Filtros para la tabla `setup_usuario_user_permissions`
--
ALTER TABLE `setup_usuario_user_permissions`
  ADD CONSTRAINT `setup_usuario_user_p_permission_id_2c57fe58_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `setup_usuario_user_p_usuario_id_3ef81a47_fk_setup_usu` FOREIGN KEY (`usuario_id`) REFERENCES `setup_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
