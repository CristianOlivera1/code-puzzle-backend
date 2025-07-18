-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2025 a las 01:56:45
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `codepuzzle`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloquecodigo`
--

CREATE TABLE `bloquecodigo` (
  `idBloqueCodigo` char(36) NOT NULL,
  `idNivel` char(36) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `ordenCorrecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` char(36) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `idNivel` char(36) NOT NULL,
  `idCategoria` char(36) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `tiempoLimite` int(11) DEFAULT NULL,
  `ayudaDescripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progresousuario`
--

CREATE TABLE `progresousuario` (
  `idProgresoUsuario` char(36) NOT NULL,
  `idUsuario` char(36) DEFAULT NULL,
  `idNivel` char(36) DEFAULT NULL,
  `estrellas` int(11) DEFAULT NULL CHECK (`estrellas` between 0 and 3),
  `tiempoSegundos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` char(36) NOT NULL,
  `tipo` enum('ADMINISTRADOR','USUARIO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `tipo`) VALUES
('013223f0-6110-11f0-8917-40c2bab2b776', 'USUARIO'),
('782e7d36-610c-11f0-8917-40c2bab2b776', 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` char(36) NOT NULL,
  `idRol` char(36) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contrasenha` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `fechaRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idRol`, `nombre`, `email`, `contrasenha`, `foto`, `fechaRegistro`) VALUES
('22c623c5-0653-49de-951b-616c20e8cfa5', '013223f0-6110-11f0-8917-40c2bab2b776', 'Cristian Oner', 'oliverachavezcristian@gmail.com', NULL, 'https://anvdtwwhaqhhueiqrtjn.supabase.co/storage/v1/object/public/perfil/foto/22c623c5-0653-49de-951b-616c20e8cfa5.png', '2025-07-18 18:50:25'),
('5d322077-02e9-4a8e-a6ec-45462fbaacb8', '013223f0-6110-11f0-8917-40c2bab2b776', 'Cristian Olivera Chavez', '221181@unamba.edu.pe', NULL, 'https://anvdtwwhaqhhueiqrtjn.supabase.co/storage/v1/object/public/perfil/foto/5d322077-02e9-4a8e-a6ec-45462fbaacb8.png', '2025-07-18 18:42:20'),
('60f5ddb6-9d4c-4ff4-907a-f63de55b70cf', '013223f0-6110-11f0-8917-40c2bab2b776', 'Cris', 'cris@gmail.com', '2mbMIAYMp6KAbJdlV7eZcw==', 'https://anvdtwwhaqhhueiqrtjn.supabase.co/storage/v1/object/public/perfil/foto/60f5ddb6-9d4c-4ff4-907a-f63de55b70cf.png', '2025-07-18 18:37:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bloquecodigo`
--
ALTER TABLE `bloquecodigo`
  ADD PRIMARY KEY (`idBloqueCodigo`),
  ADD KEY `idNivel` (`idNivel`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idNivel`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `progresousuario`
--
ALTER TABLE `progresousuario`
  ADD PRIMARY KEY (`idProgresoUsuario`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idNivel` (`idNivel`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `correo` (`email`),
  ADD KEY `idRol` (`idRol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bloquecodigo`
--
ALTER TABLE `bloquecodigo`
  ADD CONSTRAINT `bloquecodigo_ibfk_1` FOREIGN KEY (`idNivel`) REFERENCES `nivel` (`idNivel`);

--
-- Filtros para la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD CONSTRAINT `nivel_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Filtros para la tabla `progresousuario`
--
ALTER TABLE `progresousuario`
  ADD CONSTRAINT `progresousuario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `progresousuario_ibfk_2` FOREIGN KEY (`idNivel`) REFERENCES `nivel` (`idNivel`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
