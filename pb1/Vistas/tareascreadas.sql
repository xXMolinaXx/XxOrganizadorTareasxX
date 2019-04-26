-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-04-2019 a las 14:15:34
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectobases`
--

-- --------------------------------------------------------

--
-- Estructura para la vista `tareascreadas`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tareascreadas`  AS  select `tar`.`nombre` AS `Nombre_tarea`,`tar`.`descripcion` AS `descripcion`,`exi`.`nombre` AS `exiibilidad_nombre`,`tar`.`fechaCreacion` AS `fechaCreacion`,`tar`.`fechaMaxima` AS `fechaMaxima`,`lis`.`nombre` AS `nombre_lista`,`pro`.`nombre` AS `nombre_proyecto` from (((`tareas` `tar` join `listas` `lis` on((`lis`.`idlistas` = `tar`.`listas_idlistas`))) join `proyecto` `pro` on((`pro`.`idtablero` = `lis`.`tablero_idtablero`))) join `exigibilidad` `exi` on((`exi`.`idexigibilidad` = `tar`.`exigibilidad_idexigibilidad`))) ;

--
-- VIEW  `tareascreadas`
-- Datos: Ninguna
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
