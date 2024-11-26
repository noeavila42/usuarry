-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 03:30:03
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
-- Base de datos: `beca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `tipo_beca` varchar(50) NOT NULL,
  `etapa` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT 'Pendiente',
  `comentario` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimenticia`
--

CREATE TABLE `alimenticia` (
  `ID_ALUMNO` int(11) NOT NULL,
  `NOMBRE_COMPLETO` varchar(200) NOT NULL,
  `carrera` varchar(50) NOT NULL,
  `semestre` int(11) NOT NULL,
  `SOLICITUD` longblob NOT NULL,
  `ine` longblob NOT NULL,
  `carga_horaria` longblob NOT NULL,
  `estudio_socio` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alimenticia`
--

INSERT INTO `alimenticia` (`ID_ALUMNO`, `NOMBRE_COMPLETO`, `carrera`, `semestre`, `SOLICITUD`, `ine`, `carga_horaria`, `estudio_socio`) VALUES
(22021483, 'NOE AVILA ACOSTA', 'INGENIERIA EN SISTEMAS COMPUTACIONALE', 5, 0x75706c6f6164732f434f4e53554c5441532053494e4459312e706466, 0x75706c6f6164732f506172696461644865726d692e706466, 0x75706c6f6164732f436f6e636570746f735f42c3a17369636f735f64655f6c615f53696d756c616369c3b36e5b315d2e706466, 0x75706c6f6164732f696d616a2e706466),
(22021135, 'LUIS FERNANDO LAZO DIAZ', 'Sistemas Computacionales', 5, 0x75706c6f6164732f506172696461644865726d692e706466, 0x75706c6f6164732f427562626c654261795b315d2e706466, 0x75706c6f6164732f4469706c6f6d61646f2e706466, 0x75706c6f6164732f50726573656e74616369c3b36e2064652070726f796563746f20656e206163756172656c61206d6f6465726e612076657264652e706466),
(22021483, 'NOE AVILA ACOSTA', 'Ingenieria en Sistemas Computacionales', 5, 0x75706c6f6164732f455820636f6e7461622066696e616e6320756e69642020345f4e6f654176696c612e706466, 0x75706c6f6164732f636f6e7374616e6369615f4445465f4e4f45204156494c41202041434f5354412e706466, 0x75706c6f6164732f54656d61332e706466, 0x75706c6f6164732f),
(22021483, 'NOE AVILA ACOSTA', 'Ingenieria en Sistemas Computacionales', 5, 0x75706c6f6164732f455820636f6e7461622066696e616e6320756e69642020345f4e6f654176696c612e706466, 0x75706c6f6164732f636f6e7374616e6369615f4445465f4e4f45204156494c41202041434f5354412e706466, 0x75706c6f6164732f54656d61332e706466, 0x75706c6f6164732f),
(22021483, 'NOE AVILA ACOSTA', 'Ingenieria en Sistemas Computacionales', 5, 0x75706c6f6164732f455820636f6e7461622066696e616e6320756e69642020345f4e6f654176696c612e706466, 0x75706c6f6164732f636f6e7374616e6369615f4445465f4e4f45204156494c41202041434f5354412e706466, 0x75706c6f6164732f54656d61332e706466, 0x75706c6f6164732f),
(22021483, 'NOE AVILA ACOSTA', 'Ingenieria en Sistemas Computacionales', 5, 0x75706c6f6164732f455820636f6e7461622066696e616e6320756e69642020345f4e6f654176696c612e706466, 0x75706c6f6164732f636f6e7374616e6369615f4445465f4e4f45204156494c41202041434f5354412e706466, 0x75706c6f6164732f54656d61332e706466, 0x75706c6f6164732f),
(22021483, 'NOE AVILA ACOSTA', 'Ingeniería en Innovación Agrícola Sustentable', 5, 0x75706c6f6164732f54656d61332e706466, 0x75706c6f6164732f6375657374696f6e6172696f5f736f63696f65636f6e6f6d69636f2e706466, 0x75706c6f6164732f6578706f2e706466, 0x75706c6f6164732f);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_alimenticia`
--

CREATE TABLE `alumnos_alimenticia` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `ap_paterno` varchar(200) NOT NULL,
  `ap_materno` varchar(200) NOT NULL,
  `semestre` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `carrera` varchar(200) NOT NULL,
  `matricula` int(11) NOT NULL,
  `ine` longblob NOT NULL,
  `solicitud` longblob NOT NULL,
  `carga_horaria` longblob NOT NULL,
  `estudio_socio` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_aprovechamiento`
--

CREATE TABLE `alumnos_aprovechamiento` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `ap_paterno` varchar(200) NOT NULL,
  `ap_materno` varchar(200) NOT NULL,
  `semestre` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `carrera` varchar(200) NOT NULL,
  `matricula` int(11) NOT NULL,
  `ine` longblob NOT NULL,
  `solicitud` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_egel`
--

CREATE TABLE `alumnos_egel` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `ap_paterno` varchar(200) NOT NULL,
  `ap_materno` varchar(200) NOT NULL,
  `semestre` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `carrera` varchar(200) NOT NULL,
  `matricula` int(11) NOT NULL,
  `ine` longblob NOT NULL,
  `solicitud` longblob NOT NULL,
  `comprobante_pago` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_trabajadores`
--

CREATE TABLE `alumnos_trabajadores` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `ap_paterno` varchar(200) NOT NULL,
  `ap_materno` varchar(200) NOT NULL,
  `semestre` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `carrera` varchar(200) NOT NULL,
  `matricula` int(11) NOT NULL,
  `ine` longblob NOT NULL,
  `solicitud` longblob NOT NULL,
  `nombramiento` longblob NOT NULL,
  `acta_nac` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprovechamiento`
--

CREATE TABLE `aprovechamiento` (
  `ID_ALUMNO` int(11) NOT NULL,
  `NOMBRE_COMPLETO` varchar(200) NOT NULL,
  `SEMESTRE` int(11) NOT NULL,
  `CARRERA` varchar(50) NOT NULL,
  `SOLICITUD` longblob NOT NULL,
  `INE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprovechamiento`
--

INSERT INTO `aprovechamiento` (`ID_ALUMNO`, `NOMBRE_COMPLETO`, `SEMESTRE`, `CARRERA`, `SOLICITUD`, `INE`) VALUES
(22021483, 'LUIS FERNANDO LAZO DIAZ', 5, 'Ingenieria en Sistemas Computacionales', 0x75706c6f6164732f434f4e53554c54415353494e4459312e706466, 0x75706c6f6164732f434f4e53554c5441535f5553554152494f2e706466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egel`
--

CREATE TABLE `egel` (
  `ID_ALUMNO` int(11) NOT NULL,
  `NOMBRE_COMPLETO` varchar(200) NOT NULL,
  `SEMESTRE` int(11) NOT NULL,
  `CARRERA` varchar(50) NOT NULL,
  `COMPROBANTE` longblob NOT NULL,
  `INE` longblob NOT NULL,
  `SOLICITUD` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `egel`
--

INSERT INTO `egel` (`ID_ALUMNO`, `NOMBRE_COMPLETO`, `SEMESTRE`, `CARRERA`, `COMPROBANTE`, `INE`, `SOLICITUD`) VALUES
(22021483, 'NOE AVILA ACOSTA', 6, 'Ingeniria en Gestion Empresarial', 0x75706c6f6164732f636f6e7374616e6369615f4445465f4e4f45204156494c41202041434f5354412e706466, 0x75706c6f6164732f54656d61332e706466, 0x75706c6f6164732f455820636f6e7461622066696e616e6320756e69642020345f4e6f654176696c612e706466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `ID_TRABA_HIJO` int(11) NOT NULL,
  `NOMBRE_COMPLETO` varchar(200) NOT NULL,
  `SEMESTRE` int(11) NOT NULL,
  `CARRERA` varchar(50) NOT NULL,
  `SOLICITUD` longblob NOT NULL,
  `NOMBRAMIENTO` longblob NOT NULL,
  `ACTA_NACIMIENTO` longblob NOT NULL,
  `INE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`ID_TRABA_HIJO`, `NOMBRE_COMPLETO`, `SEMESTRE`, `CARRERA`, `SOLICITUD`, `NOMBRAMIENTO`, `ACTA_NACIMIENTO`, `INE`) VALUES
(22021135, 'NOE AVILA ACOSTA', 6, 'Ingenieria en Sistemas Computacionales', 0x75706c6f6164732f50524553454e544143494f4e5f43415041352e706466, 0x75706c6f6164732f6375657374696f6e6172696f5f736f63696f65636f6e6f6d69636f2e706466, 0x75706c6f6164732f54656d61332e706466, 0x75706c6f6164732f6578706f2e706466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `MATRICULA` int(11) NOT NULL,
  `NOMBRE` varchar(200) NOT NULL,
  `EMAIL` varchar(200) NOT NULL,
  `CONTRASENIA` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`MATRICULA`, `NOMBRE`, `EMAIL`, `CONTRASENIA`) VALUES
(21021489, 'xitlali', 'a21021489@iteshu.edu.mx', '12345'),
(22021142, 'KEVIN URIEL SANTOS DICIPLINA', 'a22021142@iteshu.edu.mx', 'qwertyuiop'),
(22021145, 'Cristian Yahir Leonardo Rojas', 'a22021145@iteshu.edu.mx', 'Elvenudo77'),
(22021170, 'kiko', 'a22021170@iteshu.edu.mx', '22021170'),
(22021210, 'BRIGITTE GALILEA MENDOZA VALDEZ', 'a22021210@iteshu.edu.mx', '123456'),
(22021335, 'papi', 'a22021335@iteshu.edu.mx', 'alaverga'),
(22021352, 'IRMA DIAZ', 'a22021352@iteshu.edu.mx', 'irma1234'),
(22021483, 'NOE AVILA ACOSTA', 'a22021483@iteshu.edu.mx', 'noeavila48'),
(22021558, 'ADRIAN GUERRERO DIEGO', 'a22021558@iteshu.edu.mx', 'prueba1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `alumnos_alimenticia`
--
ALTER TABLE `alumnos_alimenticia`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `alumnos_aprovechamiento`
--
ALTER TABLE `alumnos_aprovechamiento`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `alumnos_egel`
--
ALTER TABLE `alumnos_egel`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `alumnos_trabajadores`
--
ALTER TABLE `alumnos_trabajadores`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`MATRICULA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos_alimenticia`
--
ALTER TABLE `alumnos_alimenticia`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos_aprovechamiento`
--
ALTER TABLE `alumnos_aprovechamiento`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos_egel`
--
ALTER TABLE `alumnos_egel`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos_trabajadores`
--
ALTER TABLE `alumnos_trabajadores`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos_alimenticia`
--
ALTER TABLE `alumnos_alimenticia`
  ADD CONSTRAINT `alumnos_alimenticia_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `usuario` (`MATRICULA`);

--
-- Filtros para la tabla `alumnos_aprovechamiento`
--
ALTER TABLE `alumnos_aprovechamiento`
  ADD CONSTRAINT `alumnos_aprovechamiento_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `usuario` (`MATRICULA`);

--
-- Filtros para la tabla `alumnos_egel`
--
ALTER TABLE `alumnos_egel`
  ADD CONSTRAINT `alumnos_egel_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `usuario` (`MATRICULA`);

--
-- Filtros para la tabla `alumnos_trabajadores`
--
ALTER TABLE `alumnos_trabajadores`
  ADD CONSTRAINT `alumnos_trabajadores_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `usuario` (`MATRICULA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
