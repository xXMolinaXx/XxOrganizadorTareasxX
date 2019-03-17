-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-03-2019 a las 14:12:36
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
-- Estructura de tabla para la tabla `archivos`
--

DROP TABLE IF EXISTS `archivos`;
CREATE TABLE IF NOT EXISTS `archivos` (
  `idarchivos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(11) NOT NULL,
  `direcion` int(11) NOT NULL,
  `proyecto_idproyecto` int(11) NOT NULL,
  PRIMARY KEY (`idarchivos`),
  KEY `FK_arch` (`proyecto_idproyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzonmensaje`
--

DROP TABLE IF EXISTS `buzonmensaje`;
CREATE TABLE IF NOT EXISTS `buzonmensaje` (
  `idbuzon` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idbuzon`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `buzonmensaje`
--

INSERT INTO `buzonmensaje` (`idbuzon`, `usuario_idusuario`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzonnotificaciones`
--

DROP TABLE IF EXISTS `buzonnotificaciones`;
CREATE TABLE IF NOT EXISTS `buzonnotificaciones` (
  `idbuzon` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbuzon`),
  KEY `FK_bn` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `buzonnotificaciones`
--

INSERT INTO `buzonnotificaciones` (`idbuzon`, `usuario_idusuario`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checkbox`
--

DROP TABLE IF EXISTS `checkbox`;
CREATE TABLE IF NOT EXISTS `checkbox` (
  `idcheckbox` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10000) NOT NULL,
  `tareas_idtareas` int(11) NOT NULL,
  PRIMARY KEY (`idcheckbox`),
  KEY `FK_check` (`tareas_idtareas`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `checkbox`
--

INSERT INTO `checkbox` (`idcheckbox`, `descripcion`, `tareas_idtareas`) VALUES
(1, 'estudiar analisis de maya', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `idcomentarios` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(100) NOT NULL,
  `tareas_idtareas` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idcomentarios`),
  KEY `FK_tarea` (`tareas_idtareas`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

DROP TABLE IF EXISTS `documentos`;
CREATE TABLE IF NOT EXISTS `documentos` (
  `iddocumentos` int(11) NOT NULL AUTO_INCREMENT,
  `archivos_idarchivos` int(11) NOT NULL,
  PRIMARY KEY (`iddocumentos`),
  KEY `PK_doc` (`archivos_idarchivos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE IF NOT EXISTS `evaluacion` (
  `idevaluacion` int(11) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fechaElaborada` date DEFAULT NULL,
  `puntosDados` int(11) DEFAULT NULL,
  `puntosMaximos` int(11) DEFAULT NULL,
  `usuario_idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idevaluacion`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciondesempenio`
--

DROP TABLE IF EXISTS `evaluaciondesempenio`;
CREATE TABLE IF NOT EXISTS `evaluaciondesempenio` (
  `idevaluacionDesempenio` int(11) NOT NULL,
  `evaluacion_idevaluacion` int(11) NOT NULL,
  `notificacion_idnotificacion` int(11) NOT NULL,
  PRIMARY KEY (`idevaluacionDesempenio`),
  KEY `FK_eva` (`evaluacion_idevaluacion`),
  KEY `FK_notificaciones` (`notificacion_idnotificacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `imagen`
--

DROP TABLE IF EXISTS `imagen`;
CREATE TABLE IF NOT EXISTS `imagen` (
  `idimagen` int(11) NOT NULL,
  `archivos_idarchivos` int(11) NOT NULL,
  PRIMARY KEY (`idimagen`),
  KEY `FK_ima` (`archivos_idarchivos`)
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
  `idlistas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `tablero_idtablero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlistas`),
  KEY `FK_proyecto` (`tablero_idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `listas`
--

INSERT INTO `listas` (`idlistas`, `nombre`, `tablero_idtablero`) VALUES
(1, 'creadas', 1),
(2, 'trabajando', 1),
(3, 'finalizadas', 1),
(4, 'creadas', 2),
(5, 'procesadas', 2),
(6, 'terminadas', 2),
(7, 'creadas', 3),
(8, 'proceso', 3),
(9, 'terminadas', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE IF NOT EXISTS `mensajes` (
  `idmensajes` int(11) NOT NULL AUTO_INCREMENT,
  `textoMensaje` varchar(10000) NOT NULL,
  `fechaMensaje` date NOT NULL,
  `usuario_envia` int(11) NOT NULL,
  `buzonMensaje_idbuzonMensaje` int(11) NOT NULL,
  PRIMARY KEY (`idmensajes`),
  KEY `FK_buzon` (`buzonMensaje_idbuzonMensaje`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`idmensajes`, `textoMensaje`, `fechaMensaje`, `usuario_envia`, `buzonMensaje_idbuzonMensaje`) VALUES
(1, 'mira vos tenes que traer esa pinche tarea maniana sino te saco del grupo', '2019-03-11', 1, 3),
(2, 'manana te quiero alla en el centro a las 12 pm', '2019-03-10', 1, 3),
(3, 'vos cuando vas a venir a la house?', '2019-03-11', 5, 7);

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
-- Estructura de tabla para la tabla `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
CREATE TABLE IF NOT EXISTS `notificaciones` (
  `idnotificaciones` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(11) NOT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idnotificaciones`),
  KEY `FK_usua` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`idnotificaciones`, `usuario_idusuario`, `descripcion`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL);

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
-- Estructura de tabla para la tabla `proyectoasignado`
--

DROP TABLE IF EXISTS `proyectoasignado`;
CREATE TABLE IF NOT EXISTS `proyectoasignado` (
  `idproyectoAsignado` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(11) NOT NULL,
  `tablero_idtablero` int(11) NOT NULL,
  PRIMARY KEY (`idproyectoAsignado`),
  KEY `FK_usuario` (`usuario_idusuario`),
  KEY `FK_tablero` (`tablero_idtablero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`idrecordatorios`),
  KEY `FK_notas` (`notas_idnotas`)
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`idtareas`, `nombre`, `descripcion`, `fechaCreacion`, `fechaMaxima`, `exigibilidad_idexigibilidad`, `listas_idlistas`) VALUES
(1, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 1),
(2, 'estudiar capitulo 4', 'tengo que estudiar el capitulo 4 ', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 1),
(3, 'trabajr en proyecto de bases', 'debo de crear todas las tablas de bases', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 1);

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
  `correo` varchar(100) NOT NULL,
  `Contrasenia` varchar(100) DEFAULT NULL,
  `Pnombre` varchar(40) DEFAULT NULL,
  `Snombre` varchar(40) DEFAULT NULL,
  `Papellido` varchar(40) DEFAULT NULL,
  `Sapellido` varchar(40) DEFAULT NULL,
  `pais_idpais` int(11) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `FK_Pais` (`pais_idpais`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreUsuario`, `descripcion`, `correo`, `Contrasenia`, `Pnombre`, `Snombre`, `Papellido`, `Sapellido`, `pais_idpais`, `fechaNacimiento`) VALUES
(1, 'elpapi', 'Hola me gusta las matematicas y las ciencias de la computacion,veo mucho anime', 'elpapi@yahoo.com', 'asd', 'pedro', 'juan', 'elpapi', 'martinez', 2, '1997-12-13'),
(2, 'asd', 'asdasdasd', 'asdafafsdfs', 'asd', 'asd', 'sadsad', 'sada', 'sadasd', 1, NULL),
(3, 'KenJXD', 'HOLA ', 'kjmolina@live.com', 'QWERTY', 'kenny', 'jared', 'molina', 'murillo', 1, NULL),
(4, 'BlackBeattle', 'soy blackBeatle', 'blackbeatle@unah.hn', 'qwerty', 'ronal', NULL, 'varela', 'quinchon', 10, NULL),
(5, 'creador', 'soy io', 'blackadadasd@unah.hn', 'qwerty', 'ronal', NULL, 'varela', 'quinchon', 10, NULL),
(6, 'KenJXD97', 'hola mundo', 'kjmolina@live.com', 'qwerty', 'kenny ', 'jared', 'molina', 'murillo', 1, NULL),
(7, 'MaEMMA ', 'Hola', 'ma!!emma1234@yahoo.com', 'qwer', 'maria', 'emma', 'benitez', 'velazques', 1, NULL),
(8, 'DAN', 'HOLA ME GUSTA ME GUSTAN LOS VIDEOJUEGOS ,MIS JUEGOS FAVORITOS SON KILLZONE Y METAL GEAR .AGREGAME Y TE AGREGO', 'DAN-DANI@LIVE.COM', 'ASDFG', 'DANI', 'LETO', 'MARTINEZ', 'GUEVARA', 2, NULL),
(9, 'Rockgun', 'soy ammante de la armas de fuego', 'gun_fuckers@gmail.com', 'qwerty', 'mario', 'javier', 'castaneda', 'rodriguez', 5, '1990-12-15');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
