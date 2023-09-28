-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2023 a las 17:26:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbdd_manzanas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `id_establecimiento` int(11) NOT NULL,
  `nom_establecimiento` varchar(30) DEFAULT NULL,
  `admin_establecimiento` varchar(30) DEFAULT NULL,
  `dir_establecimiento` varchar(30) DEFAULT NULL,
  `fk_servicios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzanas`
--

CREATE TABLE `manzanas` (
  `id_manzanas` int(11) NOT NULL,
  `nom_manzanas` varchar(30) DEFAULT NULL,
  `locali_manzanas` varchar(30) DEFAULT NULL,
  `dir_manzanas` varchar(30) DEFAULT NULL,
  `fk_municipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzanas_servicios`
--

CREATE TABLE `manzanas_servicios` (
  `fk_manzanas` int(11) DEFAULT NULL,
  `fk_servicios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mujeres`
--

CREATE TABLE `mujeres` (
  `idDoc` int(11) NOT NULL,
  `tipo_documento` varchar(5) DEFAULT NULL,
  `nom_mujer` varchar(30) DEFAULT NULL,
  `apell_mujer` varchar(30) DEFAULT NULL,
  `tel_mujer` varchar(30) DEFAULT NULL,
  `email_mujer` varchar(30) DEFAULT NULL,
  `passw_mujer` varchar(40) DEFAULT NULL,
  `ciu_mujer` varchar(30) DEFAULT NULL,
  `dir_mujer` varchar(30) DEFAULT NULL,
  `ocu_mujer` varchar(30) DEFAULT NULL,
  `rol` varchar(30) DEFAULT 'Usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mujeres`
--

INSERT INTO `mujeres` (`idDoc`, `tipo_documento`, `nom_mujer`, `apell_mujer`, `tel_mujer`, `email_mujer`, `passw_mujer`, `ciu_mujer`, `dir_mujer`, `ocu_mujer`, `rol`) VALUES
(1011097488, 'TI', 'Natalia', 'Ramos', '3012615198', 'natika23.ramos@gmail.com', '123aguacatico', 'Bogotá', 'Cra 9este #38-26', 'Estudiante', 'Admin'),
(1033696505, 'TI', 'Ana', 'Amaya', '3227572108', 'mariasssa21@gmail.com', 'Ana10336.', 'Bogotá', 'Cra 18a #55-63', 'Estudiante', 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `nombre`) VALUES
(1, 'Prado'),
(2, 'Andes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propuesta`
--

CREATE TABLE `propuesta` (
  `id_propuesta` int(11) NOT NULL,
  `man_propuesta` varchar(30) DEFAULT NULL,
  `ser_propuesta` varchar(30) DEFAULT NULL,
  `fecha_propuesta` datetime DEFAULT NULL,
  `fk_mujeres` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicios` int(11) NOT NULL,
  `nom_servicios` varchar(30) DEFAULT NULL,
  `descri_servicios` varchar(30) DEFAULT NULL,
  `tipo_servicios` varchar(30) DEFAULT NULL,
  `cate_servicios` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicios`, `nom_servicios`, `descri_servicios`, `tipo_servicios`, `cate_servicios`) VALUES
(1, 'Estudiar', 'Adquirir conocimiento y habili', NULL, NULL),
(2, 'Emprender', 'Iniciar y gestionar un negocio', NULL, NULL),
(3, 'Emplearse', 'Trabajar para un empleador o e', NULL, NULL),
(4, 'Descansar', 'Recuperar energía y relajarse.', NULL, NULL),
(5, 'Ejercitarse', 'Hacer actividad física para ma', NULL, NULL),
(6, 'Recibir orientación y asesoría', 'Recibir orientación y asesoram', NULL, NULL),
(7, 'Recibir orientación y asesoría', 'Recibir apoyo y orientación ps', NULL, NULL),
(8, 'Lavar su ropa', 'Proceso de limpiar prendas tex', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_mujeres`
--

CREATE TABLE `servicios_mujeres` (
  `fk_servicios` int(11) DEFAULT NULL,
  `fk_mujeres` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`id_establecimiento`),
  ADD KEY `fk_servicios` (`fk_servicios`);

--
-- Indices de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  ADD PRIMARY KEY (`id_manzanas`),
  ADD KEY `fk_municipio` (`fk_municipio`);

--
-- Indices de la tabla `manzanas_servicios`
--
ALTER TABLE `manzanas_servicios`
  ADD KEY `fk_manzanas1` (`fk_manzanas`),
  ADD KEY `fk_servicios1` (`fk_servicios`);

--
-- Indices de la tabla `mujeres`
--
ALTER TABLE `mujeres`
  ADD PRIMARY KEY (`idDoc`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `propuesta`
--
ALTER TABLE `propuesta`
  ADD PRIMARY KEY (`id_propuesta`),
  ADD KEY `fk_mujeres` (`fk_mujeres`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `servicios_mujeres`
--
ALTER TABLE `servicios_mujeres`
  ADD KEY `fk_mujeres1` (`fk_mujeres`),
  ADD KEY `fk_servicios2` (`fk_servicios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `id_establecimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  MODIFY `id_manzanas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mujeres`
--
ALTER TABLE `mujeres`
  MODIFY `idDoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1033696507;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `propuesta`
--
ALTER TABLE `propuesta`
  MODIFY `id_propuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD CONSTRAINT `fk_servicios` FOREIGN KEY (`fk_servicios`) REFERENCES `servicios` (`id_servicios`);

--
-- Filtros para la tabla `manzanas`
--
ALTER TABLE `manzanas`
  ADD CONSTRAINT `fk_municipio` FOREIGN KEY (`fk_municipio`) REFERENCES `municipios` (`id_municipio`);

--
-- Filtros para la tabla `manzanas_servicios`
--
ALTER TABLE `manzanas_servicios`
  ADD CONSTRAINT `fk_manzanas1` FOREIGN KEY (`fk_manzanas`) REFERENCES `manzanas` (`id_manzanas`),
  ADD CONSTRAINT `fk_servicios1` FOREIGN KEY (`fk_servicios`) REFERENCES `servicios` (`id_servicios`);

--
-- Filtros para la tabla `propuesta`
--
ALTER TABLE `propuesta`
  ADD CONSTRAINT `fk_mujeres` FOREIGN KEY (`fk_mujeres`) REFERENCES `mujeres` (`idDoc`);

--
-- Filtros para la tabla `servicios_mujeres`
--
ALTER TABLE `servicios_mujeres`
  ADD CONSTRAINT `fk_mujeres1` FOREIGN KEY (`fk_mujeres`) REFERENCES `mujeres` (`idDoc`),
  ADD CONSTRAINT `fk_servicios2` FOREIGN KEY (`fk_servicios`) REFERENCES `servicios` (`id_servicios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
