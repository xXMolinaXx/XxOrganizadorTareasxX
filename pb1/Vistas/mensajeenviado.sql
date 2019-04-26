-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-04-2019 a las 14:15:11
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
-- Estructura para la vista `mensajeenviado`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mensajeenviado`  AS  select concat(`us`.`Pnombre`,' ',`us`.`Papellido`) AS `usuario_envia`,`men`.`textoMensaje` AS `textoMensaje`,`men`.`fechaMensaje` AS `fechaMensaje`,concat(`ur`.`Pnombre`,'  ',`ur`.`Papellido`) AS `usuario_Resive` from (((`mensajes` `men` join `buzonmensaje` `bm` on((`bm`.`idbuzon` = `men`.`BM_IDBM_ENVIA`))) join `usuario` `us` on((`us`.`idusuario` = `bm`.`usuario_idusuario`))) join (select `us`.`idusuario` AS `idusuario`,`us`.`Pnombre` AS `Pnombre`,`us`.`Papellido` AS `Papellido` from ((`mensajes` `men` join `buzonmensaje` `bm` on((`bm`.`idbuzon` = `men`.`BM_idBM_RESIVE`))) join `usuario` `us` on((`us`.`idusuario` = `bm`.`usuario_idusuario`)))) `ur` on((`ur`.`idusuario` = `men`.`BM_idBM_RESIVE`))) ;

--
-- VIEW  `mensajeenviado`
-- Datos: Ninguna
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
