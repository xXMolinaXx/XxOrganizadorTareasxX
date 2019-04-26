-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-04-2019 a las 14:15:01
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
-- Estructura para la vista `checkboxcreadas`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `checkboxcreadas`  AS  select `tar`.`nombre` AS `Nombre_tarea`,`cb`.`descripcion` AS `descripcion`,`cb`.`fechaAsignacion` AS `fechaAsignacion`,concat(`us`.`Pnombre`,' ',`us`.`Papellido`) AS `concat(us.Pnombre,' ',us.Papellido)` from ((((((`tareas` `tar` join `listas` `lis` on((`lis`.`idlistas` = `tar`.`listas_idlistas`))) join `proyecto` `pro` on((`pro`.`idtablero` = `lis`.`tablero_idtablero`))) join `exigibilidad` `exi` on((`exi`.`idexigibilidad` = `tar`.`exigibilidad_idexigibilidad`))) join `checkbox` `cb` on((`cb`.`tareas_idtareas` = `tar`.`idtareas`))) join `uaproyecto` `uap` on((`uap`.`idproyectoAsignado` = `cb`.`UATablero_asignado`))) join `usuario` `us` on((`us`.`idusuario` = `uap`.`usuario_idusuario`))) ;

--
-- VIEW  `checkboxcreadas`
-- Datos: Ninguna
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
