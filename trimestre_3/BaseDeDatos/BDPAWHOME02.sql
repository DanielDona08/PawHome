-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2024 a las 00:47:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pawhome`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add mascotas', 7, 'add_mascotas'),
(26, 'Can change mascotas', 7, 'change_mascotas'),
(27, 'Can delete mascotas', 7, 'delete_mascotas'),
(28, 'Can view mascotas', 7, 'view_mascotas'),
(29, 'Can add roles', 8, 'add_roles'),
(30, 'Can change roles', 8, 'change_roles'),
(31, 'Can delete roles', 8, 'delete_roles'),
(32, 'Can view roles', 8, 'view_roles'),
(33, 'Can add sesiones', 9, 'add_sesiones'),
(34, 'Can change sesiones', 9, 'change_sesiones'),
(35, 'Can delete sesiones', 9, 'delete_sesiones'),
(36, 'Can view sesiones', 9, 'view_sesiones'),
(37, 'Can add tipos colormascotas', 10, 'add_tiposcolormascotas'),
(38, 'Can change tipos colormascotas', 10, 'change_tiposcolormascotas'),
(39, 'Can delete tipos colormascotas', 10, 'delete_tiposcolormascotas'),
(40, 'Can view tipos colormascotas', 10, 'view_tiposcolormascotas'),
(41, 'Can add tipos documentos', 11, 'add_tiposdocumentos'),
(42, 'Can change tipos documentos', 11, 'change_tiposdocumentos'),
(43, 'Can delete tipos documentos', 11, 'delete_tiposdocumentos'),
(44, 'Can view tipos documentos', 11, 'view_tiposdocumentos'),
(45, 'Can add tipos genero', 12, 'add_tiposgenero'),
(46, 'Can change tipos genero', 12, 'change_tiposgenero'),
(47, 'Can delete tipos genero', 12, 'delete_tiposgenero'),
(48, 'Can view tipos genero', 12, 'view_tiposgenero'),
(49, 'Can add tipos mascotas', 13, 'add_tiposmascotas'),
(50, 'Can change tipos mascotas', 13, 'change_tiposmascotas'),
(51, 'Can delete tipos mascotas', 13, 'delete_tiposmascotas'),
(52, 'Can view tipos mascotas', 13, 'view_tiposmascotas'),
(53, 'Can add tipos razasmascotas', 14, 'add_tiposrazasmascotas'),
(54, 'Can change tipos razasmascotas', 14, 'change_tiposrazasmascotas'),
(55, 'Can delete tipos razasmascotas', 14, 'delete_tiposrazasmascotas'),
(56, 'Can view tipos razasmascotas', 14, 'view_tiposrazasmascotas'),
(57, 'Can add tipos sangremascotas', 15, 'add_tipossangremascotas'),
(58, 'Can change tipos sangremascotas', 15, 'change_tipossangremascotas'),
(59, 'Can delete tipos sangremascotas', 15, 'delete_tipossangremascotas'),
(60, 'Can view tipos sangremascotas', 15, 'view_tipossangremascotas'),
(61, 'Can add info usuarios', 16, 'add_infousuarios'),
(62, 'Can change info usuarios', 16, 'change_infousuarios'),
(63, 'Can delete info usuarios', 16, 'delete_infousuarios'),
(64, 'Can view info usuarios', 16, 'view_infousuarios'),
(65, 'Can add usuarios', 17, 'add_usuarios'),
(66, 'Can change usuarios', 17, 'change_usuarios'),
(67, 'Can delete usuarios', 17, 'delete_usuarios'),
(68, 'Can view usuarios', 17, 'view_usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
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
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$0EFie1OOd24ndTFn2ow5JF$3bh12nF5xGo+tdEZmZsFgDi6N2OTwA+e4Ium2YgHRxM=', '2024-06-07 18:12:34.956558', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-06-07 18:12:25.330732');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(16, 'Appweb', 'infousuarios'),
(7, 'Appweb', 'mascotas'),
(8, 'Appweb', 'roles'),
(9, 'Appweb', 'sesiones'),
(10, 'Appweb', 'tiposcolormascotas'),
(11, 'Appweb', 'tiposdocumentos'),
(12, 'Appweb', 'tiposgenero'),
(13, 'Appweb', 'tiposmascotas'),
(14, 'Appweb', 'tiposrazasmascotas'),
(15, 'Appweb', 'tipossangremascotas'),
(17, 'Appweb', 'usuarios'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-07 17:28:23.112799'),
(2, 'auth', '0001_initial', '2024-06-07 17:28:24.017446'),
(3, 'admin', '0001_initial', '2024-06-07 17:28:24.233317'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-07 17:28:24.250118'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-07 17:28:24.305245'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-07 17:28:24.422827'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-07 17:28:24.534332'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-07 17:28:24.557094'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-07 17:28:24.573537'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-07 17:28:24.787762'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-07 17:28:24.801944'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-07 17:28:24.817575'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-07 17:28:24.841620'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-07 17:28:24.852012'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-07 17:28:24.887761'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-07 17:28:24.905006'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-07 17:28:24.938620'),
(18, 'sessions', '0001_initial', '2024-06-07 17:28:25.002750'),
(19, 'Appweb', '0001_initial', '2024-06-07 18:10:31.663803'),
(20, 'Appweb', '0002_infousuarios_last_login', '2024-06-07 18:48:34.749495'),
(21, 'Appweb', '0003_infousuarios_is_active_infousuarios_is_staff', '2024-06-10 22:13:09.271764');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('nf46e8oa4cxrcef922nj4f549lpkb8nu', '.eJxVjEEOwiAQRe_C2pAC7VBcuvcMZIYZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMk6dfkfC9JC6E75jvc06zXVdJtK7og_a9HVmeV4O9--gYCvfWgyZkNBnZqSBs4CzKeDYA_IAwtb4LmSLo0vWMftgBHqB3LEHQnLq_QE7NTkm:1sGnmV:ifSB2TvxhthMFPUPqXF9CXzLKb_nc4l_fgvpDGiDZQQ', '2024-06-24 22:46:27.940265');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_usuarios`
--

CREATE TABLE `info_usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `info_usuarios`
--

INSERT INTO `info_usuarios` (`id`, `email`, `password`, `last_login`, `is_active`, `is_staff`, `date_joined`, `is_superuser`) VALUES
(13, 'admin@gmail.com', 'pbkdf2_sha256$720000$9scF9IxEJ4JYRTRfJNr73s$asK+v/R0RaGCb6An4BQF/kJz1WGXJmVOqWeXfAPg+GE=', '2024-06-10 22:46:27.933262', 1, 1, '2024-06-10 22:44:10.043363', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` int(11) NOT NULL,
  `id_tipomascota` int(11) DEFAULT NULL,
  `id_tiporaza` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `condicion_saludmascota` varchar(60) DEFAULT NULL,
  `nombre_mascota` varchar(60) DEFAULT NULL,
  `comportamiento_mascota` varchar(60) DEFAULT NULL,
  `historia_mascota` varchar(60) DEFAULT NULL,
  `peso_mascota` varchar(10) DEFAULT NULL,
  `id_colormascota` int(11) DEFAULT NULL,
  `altura_mascota` varchar(20) DEFAULT NULL,
  `fecha_nacimientomascota` date DEFAULT NULL,
  `id_tiposangremascota` int(11) DEFAULT NULL,
  `id_dueño` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `activa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_colormascotas`
--

CREATE TABLE `tipos_colormascotas` (
  `id` int(11) NOT NULL,
  `abreviacion` varchar(10) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_colormascotas`
--

INSERT INTO `tipos_colormascotas` (`id`, `abreviacion`, `descripcion`) VALUES
(1, 'BL', 'Blanco'),
(2, 'NG', 'Negro'),
(3, 'MR', 'Marron'),
(4, 'GR', 'Gris'),
(5, 'DR', 'Dorado'),
(6, 'AT', 'Atigrado'),
(7, 'NG-BL', 'Negro y Blanco'),
(8, 'MR-BL', 'Marron y Blanco'),
(9, 'NG-MR', 'Negro y Marron');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documentos`
--

CREATE TABLE `tipos_documentos` (
  `id` int(11) NOT NULL,
  `abreviacion` varchar(3) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_documentos`
--

INSERT INTO `tipos_documentos` (`id`, `abreviacion`, `descripcion`) VALUES
(1, 'CC', 'Cedula de Ciudadania'),
(2, 'TI', 'Tarjeta de Identidad'),
(3, 'CE', 'Cedula de Extranjeria'),
(4, 'PP', 'Pasaporte'),
(5, 'RCN', 'Registro Civil de Nacimiento'),
(6, 'TRE', 'Tarjeta de Registro de Extranjeria'),
(7, 'DNI', 'Documento Nacional de Identidad'),
(8, 'PRP', 'Permiso de Residencia Permanente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_genero`
--

CREATE TABLE `tipos_genero` (
  `id` int(11) NOT NULL,
  `abreviacion` varchar(3) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_genero`
--

INSERT INTO `tipos_genero` (`id`, `abreviacion`, `descripcion`) VALUES
(1, 'M', 'Masculino'),
(2, 'F', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_mascotas`
--

CREATE TABLE `tipos_mascotas` (
  `id` int(11) NOT NULL,
  `abreviacion` varchar(3) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_mascotas`
--

INSERT INTO `tipos_mascotas` (`id`, `abreviacion`, `descripcion`) VALUES
(1, 'P', 'Perro'),
(2, 'G', 'Gato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_razasmascotas`
--

CREATE TABLE `tipos_razasmascotas` (
  `id` int(11) NOT NULL,
  `abreviacion` varchar(10) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `id_tipomascota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_razasmascotas`
--

INSERT INTO `tipos_razasmascotas` (`id`, `abreviacion`, `descripcion`, `id_tipomascota`) VALUES
(1, 'LR_P', 'Labrador Retriever', 1),
(2, 'PA_P', 'Pastor Alemán', 1),
(3, 'BD_P', 'Bulldog', 1),
(4, 'GR_P', 'Golden Retriever', 1),
(5, 'BG_P', 'Beagle', 1),
(6, 'PD_P', 'Poodle', 1),
(7, 'CH_P', 'Chihuahua', 1),
(8, 'YT_P', 'Yorkshire Terrier', 1),
(9, 'BX_P', 'Boxer', 1),
(10, 'DH_P', 'Dachshund', 1),
(11, 'SM_G', 'Siamés', 2),
(12, 'MC_G', 'Maine Coon', 2),
(13, 'PR_G', 'Persa', 2),
(14, 'BG_G', 'Bengalí', 2),
(15, 'SP_G', 'Sphynx', 2),
(16, 'RG_G', 'Ragdoll', 2),
(17, 'BS_G', 'British Shorthair', 2),
(18, 'SF_G', 'Scottish Fold', 2),
(19, 'RB_G', 'Russian Blue', 2),
(20, 'PH_G', 'Persa Himalayo', 2),
(21, 'AB_G', 'Abisinio', 2),
(22, 'MZ_P', 'Mestizo', 1),
(23, 'MZ_G', 'Mestizo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_sangremascotas`
--

CREATE TABLE `tipos_sangremascotas` (
  `id` int(11) NOT NULL,
  `abreviacion` varchar(10) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `id_tipomascota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_sangremascotas`
--

INSERT INTO `tipos_sangremascotas` (`id`, `abreviacion`, `descripcion`, `id_tipomascota`) VALUES
(1, 'DEA 1.1+', 'DEA 1.1 positivo', 1),
(2, 'DEA 1.1-', 'DEA 1.1 negativo', 1),
(3, 'DEA 1.2+', 'DEA 1.2 positivo', 1),
(4, 'DEA 1.2-', 'DEA 1.2 negativo', 1),
(5, 'DEA 3+', 'DEA 3 positivo', 1),
(6, 'DEA 3-', 'DEA 3 negativo', 1),
(7, 'DEA 4+', 'DEA 4 positivo', 1),
(8, 'DEA 4-', 'DEA 4 negativo', 1),
(9, 'DEA 5+', 'DEA 5 positivo', 1),
(10, 'DEA 5-', 'DEA 5 negativo', 1),
(11, 'DEA 7+', 'DEA 7 positivo', 1),
(12, 'DEA 7-', 'DEA 7 negativo', 1),
(13, 'A+', 'A positivo', 2),
(14, 'A-', 'A negativo', 2),
(15, 'B+', 'B positivo', 2),
(16, 'B-', 'B negativo', 2),
(17, 'AB+', 'AB positivo', 2),
(18, 'AB-', 'AB negativo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `info_usuario_id` int(11) DEFAULT NULL,
  `id_tipodocumento` int(11) DEFAULT NULL,
  `numero_documento` bigint(20) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `id_tipogenero` int(11) DEFAULT NULL,
  `antecedentes` varchar(100) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indices de la tabla `info_usuarios`
--
ALTER TABLE `info_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipomascota` (`id_tipomascota`),
  ADD KEY `id_tiporaza` (`id_tiporaza`),
  ADD KEY `id_colormascota` (`id_colormascota`),
  ADD KEY `id_tiposangremascota` (`id_tiposangremascota`),
  ADD KEY `id_dueño` (`id_dueño`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tipos_colormascotas`
--
ALTER TABLE `tipos_colormascotas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_documentos`
--
ALTER TABLE `tipos_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_genero`
--
ALTER TABLE `tipos_genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_mascotas`
--
ALTER TABLE `tipos_mascotas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_razasmascotas`
--
ALTER TABLE `tipos_razasmascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipomascota` (`id_tipomascota`);

--
-- Indices de la tabla `tipos_sangremascotas`
--
ALTER TABLE `tipos_sangremascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipomascota` (`id_tipomascota`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `info_usuario_id` (`info_usuario_id`),
  ADD KEY `id_tipodocumento` (`id_tipodocumento`),
  ADD KEY `id_tipogenero` (`id_tipogenero`),
  ADD KEY `id_rol` (`id_rol`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `info_usuarios`
--
ALTER TABLE `info_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_colormascotas`
--
ALTER TABLE `tipos_colormascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipos_documentos`
--
ALTER TABLE `tipos_documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipos_genero`
--
ALTER TABLE `tipos_genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_mascotas`
--
ALTER TABLE `tipos_mascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_razasmascotas`
--
ALTER TABLE `tipos_razasmascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tipos_sangremascotas`
--
ALTER TABLE `tipos_sangremascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_tipomascota`) REFERENCES `tipos_mascotas` (`id`),
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`id_tiporaza`) REFERENCES `tipos_razasmascotas` (`id`),
  ADD CONSTRAINT `mascotas_ibfk_3` FOREIGN KEY (`id_colormascota`) REFERENCES `tipos_colormascotas` (`id`),
  ADD CONSTRAINT `mascotas_ibfk_4` FOREIGN KEY (`id_tiposangremascota`) REFERENCES `tipos_sangremascotas` (`id`),
  ADD CONSTRAINT `mascotas_ibfk_5` FOREIGN KEY (`id_dueño`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD CONSTRAINT `sesiones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `tipos_razasmascotas`
--
ALTER TABLE `tipos_razasmascotas`
  ADD CONSTRAINT `tipos_razasmascotas_ibfk_1` FOREIGN KEY (`id_tipomascota`) REFERENCES `tipos_mascotas` (`id`);

--
-- Filtros para la tabla `tipos_sangremascotas`
--
ALTER TABLE `tipos_sangremascotas`
  ADD CONSTRAINT `tipos_sangremascotas_ibfk_1` FOREIGN KEY (`id_tipomascota`) REFERENCES `tipos_mascotas` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`info_usuario_id`) REFERENCES `info_usuarios` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tipos_documentos` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`id_tipogenero`) REFERENCES `tipos_genero` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
