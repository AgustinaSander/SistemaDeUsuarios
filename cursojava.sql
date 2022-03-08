-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 08-03-2022 a las 16:00:20
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cursojava`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `telefono`, `password`) VALUES
(5, 'Ignacio', 'Sander', 'nacho@hotmail.com', '1234577', '$argon2id$v=19$m=1024,t=1,p=1$IRZbW4fd0DHWdhmL4x7FxQ$h3EN2MRnkzbQJgyusjzHHJtgS3b+h/lbLnDnzh7eWRI'),
(6, 'Agustina', 'Sander', 'asander00@hotmail.com', '3424227082', '$argon2id$v=19$m=1024,t=1,p=1$ue+LJ+WVUTQ+ETeHMPNl0w$QLS/0q5Idpai4EoPHxLUgy5LtG4D816lIIibxG/qoa4'),
(7, 'Lucas', 'Forca', 'lucas@hotmail.com', '123546', '$argon2id$v=19$m=1024,t=1,p=1$ElpTDUde/bRkZjQUeFMcqg$uimr0K4A3Tw0DCuEmyYtR9B2QEYb3GAyL00/lC3Epdc'),
(9, 'Pablo', 'Gimenez', 'pablo@gmail.com', '546785454', '$argon2id$v=19$m=1024,t=1,p=1$furTEULBNNImiBMTeHtYgg$nK/F2fgGwp0CyOSvUeZnCEqrNcJy3+G8x2H12R+T5l0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
