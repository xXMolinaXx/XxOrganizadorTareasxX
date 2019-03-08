-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-03-2019 a las 00:27:21
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
-- Estructura de tabla para la tabla `exigibilidad`
--

DROP TABLE IF EXISTS `exigibilidad`;
CREATE TABLE IF NOT EXISTS `exigibilidad` (
  `idexigibilidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idexigibilidad`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `exigibilidad`
--

INSERT INTO `exigibilidad` (`idexigibilidad`, `nombre`) VALUES
(1, 'prioridad'),
(2, 'no prioridad'),
(3, 'PARA YA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extrasnotas`
--

DROP TABLE IF EXISTS `extrasnotas`;
CREATE TABLE IF NOT EXISTS `extrasnotas` (
  `idextrasNotas` int(11) NOT NULL AUTO_INCREMENT,
  `direcionMemoria` varchar(10000) DEFAULT NULL,
  `notas_idnotas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idextrasNotas`),
  KEY `FK_notas` (`notas_idnotas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `idfavoritos` int(11) NOT NULL,
  `descripcion` tinyint(1) NOT NULL,
  PRIMARY KEY (`idfavoritos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenusuario`
--

DROP TABLE IF EXISTS `imagenusuario`;
CREATE TABLE IF NOT EXISTS `imagenusuario` (
  `idimagenUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direcion` varchar(1000) DEFAULT NULL,
  `usuario_idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idimagenUsuario`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagenusuario`
--

INSERT INTO `imagenusuario` (`idimagenUsuario`, `nombre`, `direcion`, `usuario_idusuario`) VALUES
(1, 'hola', 'asd/sadasdasda/asdasdaa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libreta`
--

DROP TABLE IF EXISTS `libreta`;
CREATE TABLE IF NOT EXISTS `libreta` (
  `idlibreta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `usuario_idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlibreta`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas`
--

DROP TABLE IF EXISTS `listas`;
CREATE TABLE IF NOT EXISTS `listas` (
  `idlistas` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tablero_idtablero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlistas`),
  KEY `FK_proyecto` (`tablero_idtablero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `idnotas` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(1000) DEFAULT NULL,
  `libreta_idlibreta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnotas`),
  KEY `FK_libretas` (`libreta_idlibreta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `nombre`) VALUES
(1, 'honduras'),
(2, 'mexico'),
(3, 'brazil'),
(4, 'Guatemala'),
(5, 'El Salvador'),
(6, 'Peru'),
(7, 'Estados Unidos de America'),
(8, 'Espania'),
(9, 'China'),
(10, 'Canada'),
(11, 'italia'),
(12, 'Egipto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios`
--

DROP TABLE IF EXISTS `recordatorios`;
CREATE TABLE IF NOT EXISTS `recordatorios` (
  `idrecordatorios` int(11) NOT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaMaxima` datetime DEFAULT NULL,
  `notas_idnotas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrecordatorios`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablero`
--

DROP TABLE IF EXISTS `tablero`;
CREATE TABLE IF NOT EXISTS `tablero` (
  `idtablero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(10000) DEFAULT NULL,
  `tipoTablero_idtablero` int(11) NOT NULL,
  PRIMARY KEY (`idtablero`),
  KEY `FK_tt` (`tipoTablero_idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tablero`
--

INSERT INTO `tablero` (`idtablero`, `nombre`, `descripcion`, `tipoTablero_idtablero`) VALUES
(1, 'I PAC UNAH', 'ORGANIZARE TODAS LA TAREAS DE MI PAC', 1),
(2, 'II PAC UNAH', 'ORGANIZARE TODo', 2),
(3, 'III PAC UNAH', 'HOLA PAC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

DROP TABLE IF EXISTS `tareas`;
CREATE TABLE IF NOT EXISTS `tareas` (
  `idtareas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaMaxima` datetime DEFAULT NULL,
  `exigibilidad_idexigibilidad` int(11) DEFAULT NULL,
  `listas_idlistas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtareas`),
  KEY `FK_EXI` (`exigibilidad_idexigibilidad`),
  KEY `FK_lis` (`listas_idlistas`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`idtareas`, `nombre`, `descripcion`, `fechaCreacion`, `fechaMaxima`, `exigibilidad_idexigibilidad`, `listas_idlistas`) VALUES
(1, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotablero`
--

DROP TABLE IF EXISTS `tipotablero`;
CREATE TABLE IF NOT EXISTS `tipotablero` (
  `idtablero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10000) NOT NULL,
  PRIMARY KEY (`idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipotablero`
--

INSERT INTO `tipotablero` (`idtablero`, `nombre`) VALUES
(1, 'publico'),
(2, 'privado'),
(3, 'semi-privado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `Contrasenia` varchar(100) DEFAULT NULL,
  `Pnombre` varchar(40) DEFAULT NULL,
  `Snombre` varchar(40) DEFAULT NULL,
  `Papellido` varchar(40) DEFAULT NULL,
  `Sapellido` varchar(40) DEFAULT NULL,
  `pais_idpais` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `FK_Pais` (`pais_idpais`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreUsuario`, `descripcion`, `correo`, `Contrasenia`, `Pnombre`, `Snombre`, `Papellido`, `Sapellido`, `pais_idpais`) VALUES
(1, 'elpapi', 'Hola me gusta las matematicas y las ciencias de la computacion,veo mucho anime', 'elpapi@yahoo.com', 'asd', 'pedro', 'juan', 'elpapi', 'martinez', 2),
(2, 'asd', 'asdasdasd', 'asdafafsdfs', 'asd', 'asd', 'sadsad', 'sada', 'sadasd', 1),
(3, 'KenJXD', 'HOLA ', 'kjmolina@live.com', 'QWERTY', 'kenny', 'jared', 'molina', 'murillo', 1),
(4, 'BlackBeattle', 'soy blackBeatle', 'blackbeatle@unah.hn', 'qwerty', 'ronal', NULL, 'varela', 'quinchon', 10),
(5, 'creador', 'soy io', 'blackadadasd@unah.hn', 'qwerty', 'ronal', NULL, 'varela', 'quinchon', 10);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
