-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2020 a las 01:03:05
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bookmedik`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Emergencias'),
(2, 'Consultas Diarias'),
(3, 'Ginecologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medic`
--

CREATE TABLE `medic` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medic`
--

INSERT INTO `medic` (`id`, `name`, `lastname`, `email`, `address`, `phone`, `image`, `is_active`, `created_at`, `category_id`) VALUES
(1, 'Carlos', 'Sagastume', 'carlos@gmail.com', 'Zona 3', '12456789', NULL, 1, '2020-09-19 15:28:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacient`
--

CREATE TABLE `pacient` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacient`
--

INSERT INTO `pacient` (`id`, `name`, `lastname`, `email`, `address`, `phone`, `image`, `is_active`, `created_at`) VALUES
(1, 'Marcos', 'Estrada', 'estrada@gmail.com', 'Zona 2', '12345678', NULL, 1, '2020-09-19 15:26:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `message` text NOT NULL,
  `date_at` varchar(50) NOT NULL,
  `time_at` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `pacient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `medic_id` int(11) NOT NULL,
  `is_web` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reservation`
--

INSERT INTO `reservation` (`id`, `title`, `note`, `message`, `date_at`, `time_at`, `created_at`, `pacient_id`, `user_id`, `medic_id`, `is_web`) VALUES
(1, 'Emergencia', 'Presenta HipertensiÃ³n Arterial', '', '2020-09-25', '14:00', '2020-09-19 15:42:06', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `lastname`, `email`, `password`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'admin', 'Walter', 'Chen', '', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2020-09-19 15:22:12'),
(5, 'Oscar', 'Oscar', 'Vazquez', '', 'b0f7eb5585112214da28f6848df7aa1a2c1a0caf', 1, 0, '2020-09-19 15:40:54'),
(6, 'Manrico', 'Manrique', 'Cornelio', '', '4bd5e92f69f6bfd470bd6a9d60a52a564d283efe', 1, 0, '2020-09-19 16:36:36');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medic`
--
ALTER TABLE `medic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `pacient`
--
ALTER TABLE `pacient`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pacient_id` (`pacient_id`),
  ADD KEY `medic_id` (`medic_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medic`
--
ALTER TABLE `medic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pacient`
--
ALTER TABLE `pacient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medic`
--
ALTER TABLE `medic`
  ADD CONSTRAINT `medic_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Filtros para la tabla `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`pacient_id`) REFERENCES `pacient` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`medic_id`) REFERENCES `medic` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
