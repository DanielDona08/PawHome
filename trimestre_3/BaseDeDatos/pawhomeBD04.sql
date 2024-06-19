-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2024 a las 20:23:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
-- Estructura de tabla para la tabla `info_usuarios`
--

CREATE TABLE `info_usuarios` (
  `id` bigint(20) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `info_usuarios`
--

INSERT INTO `info_usuarios` (`id`, `last_login`, `is_superuser`, `email`, `password`, `is_active`, `is_staff`, `date_joined`) VALUES
(13, '2024-06-10 22:46:27.933262', 1, 'admin@gmail.com', 'pbkdf2_sha256$720000$9scF9IxEJ4JYRTRfJNr73s$asK+v/R0RaGCb6An4BQF/kJz1WGXJmVOqWeXfAPg+GE=', 1, 1, '2024-06-10 22:44:10.043363'),
(14, '2024-06-19 18:18:54.799651', 0, 'prueba@gmail.com', 'pbkdf2_sha256$720000$qYNFGYsStswNzoZ5rWjhH3$bXjpt4qCVtVblJ3nn/GY5SGaXCtWrPeFLGEWgYM6YU8=', 1, 0, '2024-06-18 21:06:12.743292');

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

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `id_tipomascota`, `id_tiporaza`, `foto`, `genero`, `condicion_saludmascota`, `nombre_mascota`, `comportamiento_mascota`, `historia_mascota`, `peso_mascota`, `id_colormascota`, `altura_mascota`, `fecha_nacimientomascota`, `id_tiposangremascota`, `id_dueño`) VALUES
(1, 1, 1, 'fotos_mascotas/descarga.jfif', 'macho', 'Saludable', 'Lucas', 'Activo y Jugueton', 'Rescatado', '3kl', 5, '50cm', '2022-02-18', 1, NULL),
(2, 1, 6, 'fotos_mascotas/descarga_1.jfif', 'hembra', 'Saludable', 'Lulu', 'Tranquilo', 'Rescatado de un refugio', '2kl', 1, '30cm', '2023-11-15', 4, NULL);

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
  `info_usuario_id` bigint(20) NOT NULL,
  `numero_documento` bigint(20) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `antecedentes` varchar(100) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `id_rol` bigint(20) DEFAULT NULL,
  `id_tipoDocumento` bigint(20) DEFAULT NULL,
  `id_tipoGenero` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `info_usuarios`
--
ALTER TABLE `info_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`info_usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `info_usuarios`
--
ALTER TABLE `info_usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
