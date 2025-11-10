-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2025 a las 16:00:09
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
-- Base de datos: `programacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `cedula_admin` varchar(15) NOT NULL,
  `nombre_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE `administrativo` (
  `cedula_admin` varchar(20) NOT NULL,
  `contraseña` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`cedula_admin`, `contraseña`) VALUES
('123', '123'),
('1231', '1231'),
('1234', '1234'),
('12345', '1234'),
('1234567', '1234567'),
('12345678', '12345678'),
('123456789', '123456789'),
('345', '345'),
('56789', '56789'),
('57610701', 'pepe'),
('676767', '6767'),
('98765', '98765'),
('98789', '98789'),
('Cedula', 'Password');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `cedula_docente` varchar(20) NOT NULL,
  `nombre_docente` varchar(100) DEFAULT NULL,
  `apellido_docente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`cedula_docente`, `nombre_docente`, `apellido_docente`) VALUES
('1234', 'dr', 'tr5'),
('123456789', 'german', 'yanez'),
('2345', 'Fanrp', 'hadsa'),
('3434531', 'Perrita', 'Chocotona'),
('3434667', 'perro', 'delaboca'),
('344212', 'Mateo', 'Perrito'),
('34545', 'gf', 'ff'),
('34567', 'bruno', 'peerrita'),
('4767232', 'Santiago', 'Yanez'),
('52365587', 'Leandro', 'Rizzler'),
('5435253', 'Roman', 'Perritadelaboca'),
('764327', 'Roman', 'Delcerro'),
('78987698789', 'adsad', 'asdsa'),
('877969', 'Leandro', 'perrona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inasistencias`
--

CREATE TABLE `inasistencias` (
  `id_inasistencia` int(11) NOT NULL,
  `cedula_docente` varchar(20) DEFAULT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inasistencias`
--

INSERT INTO `inasistencias` (`id_inasistencia`, `cedula_docente`, `desde`, `hasta`) VALUES
(8, '344212', '2025-10-25', '2025-10-31'),
(9, '3434531', '2025-10-19', '2025-10-24'),
(10, '52365587', '2025-10-25', '2025-10-30'),
(11, '4767232', '2025-10-28', '2026-01-19'),
(12, '2345', '2025-11-08', '2025-11-14'),
(13, '1234', '2025-11-03', '2025-11-12'),
(14, '34545', '2025-11-06', '2025-11-15'),
(15, '764327', '2025-11-08', '2025-11-19'),
(16, '3434667', '2025-11-05', '2025-11-06'),
(17, '5435253', '2025-11-03', '2025-11-30'),
(18, '34567', '2025-11-07', '2025-11-17'),
(19, '123456789', '2025-11-03', '2025-11-21'),
(20, '877969', '2025-11-12', '2025-11-20'),
(21, '78987698789', '2025-11-11', '2025-11-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresa`
--

CREATE TABLE `ingresa` (
  `cedula_admin` varchar(20) NOT NULL,
  `cedula_docente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`cedula_admin`);

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`cedula_admin`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`cedula_docente`);

--
-- Indices de la tabla `inasistencias`
--
ALTER TABLE `inasistencias`
  ADD PRIMARY KEY (`id_inasistencia`),
  ADD KEY `cedula_docente` (`cedula_docente`);

--
-- Indices de la tabla `ingresa`
--
ALTER TABLE `ingresa`
  ADD PRIMARY KEY (`cedula_admin`,`cedula_docente`),
  ADD KEY `cedula_docente` (`cedula_docente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inasistencias`
--
ALTER TABLE `inasistencias`
  MODIFY `id_inasistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inasistencias`
--
ALTER TABLE `inasistencias`
  ADD CONSTRAINT `inasistencias_ibfk_1` FOREIGN KEY (`cedula_docente`) REFERENCES `docente` (`cedula_docente`);

--
-- Filtros para la tabla `ingresa`
--
ALTER TABLE `ingresa`
  ADD CONSTRAINT `ingresa_ibfk_1` FOREIGN KEY (`cedula_admin`) REFERENCES `administrativo` (`cedula_admin`),
  ADD CONSTRAINT `ingresa_ibfk_2` FOREIGN KEY (`cedula_docente`) REFERENCES `docente` (`cedula_docente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
