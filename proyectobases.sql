-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-03-2019 a las 21:05:13
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
-- Estructura Stand-in para la vista `administradores`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `administradores`;
CREATE TABLE IF NOT EXISTS `administradores` (
`apodo_nombre` varchar(182)
,`nombre_tablero` varchar(100)
,`descripcion` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

DROP TABLE IF EXISTS `archivos`;
CREATE TABLE IF NOT EXISTS `archivos` (
  `idarchivos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unico del archivo',
  `nombre` int(11) NOT NULL COMMENT 'nombre del archivo',
  `direcion` int(11) NOT NULL COMMENT 'direcion en memoria del archivo',
  `proyecto_idproyecto` int(11) NOT NULL COMMENT 'id del tablero',
  PRIMARY KEY (`idarchivos`),
  KEY `FK_arch` (`proyecto_idproyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzonmensaje`
--

DROP TABLE IF EXISTS `buzonmensaje`;
CREATE TABLE IF NOT EXISTS `buzonmensaje` (
  `idbuzon` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unico del archivo',
  `usuario_idusuario` int(11) NOT NULL COMMENT 'id del usuario',
  PRIMARY KEY (`idbuzon`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
(8, 8),
(9, 10),
(10, 11),
(11, 12),
(12, 413);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzonnotificaciones`
--

DROP TABLE IF EXISTS `buzonnotificaciones`;
CREATE TABLE IF NOT EXISTS `buzonnotificaciones` (
  `idbuzon` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unico del archivo',
  `usuario_idusuario` int(11) DEFAULT NULL COMMENT 'id del usaurio',
  PRIMARY KEY (`idbuzon`),
  KEY `FK_bn` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checkbox`
--

DROP TABLE IF EXISTS `checkbox`;
CREATE TABLE IF NOT EXISTS `checkbox` (
  `idcheckbox` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unico del archivo',
  `descripcion` varchar(10000) NOT NULL COMMENT 'son sub objetivo de una tarea',
  `tareas_idtareas` int(11) NOT NULL COMMENT 'id de la tarea',
  PRIMARY KEY (`idcheckbox`),
  KEY `FK_check` (`tareas_idtareas`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `checkbox`
--

INSERT INTO `checkbox` (`idcheckbox`, `descripcion`, `tareas_idtareas`) VALUES
(1, 'estudiar analisis de maya', 2),
(2, 'chexkbox2', 1),
(3, 'chexkbox2', 5),
(4, 'chexkbox3', 2),
(5, 'chexkbox24', 1),
(6, 'chexkbox25', 5),
(7, 'estudiar analisis de maya chexkbox2', 10),
(8, 'chexkbox23', 12),
(9, 'chexkbox2a', 12),
(10, 'chexkbox3123', 20),
(11, 'chexkbox24213', 1),
(12, 'chexkbox25123123', 12),
(13, 'estudiar analisis de maya 123123', 22),
(14, 'chexkbox23123123', 12),
(15, 'chexkbox21231231', 15),
(16, 'chexkbox312312312', 20),
(17, 'chexkbox24123131', 20),
(18, 'chexkbox251312312', 7),
(19, 'estudiar analisis de maya chexkbox2v 2131', 30),
(20, 'chexkbox23', 12),
(21, 'chexkbox2a 1 1 1 11 1', 31),
(22, 'chexkbox3123 121212121', 29),
(23, 'chexkbox242132112   11 1 1 11 1 ', 50),
(24, 'chexkbox25123123 12    2323  ', 40),
(25, 'checkbox 1', 1),
(26, 'checkbox 2', 1),
(27, 'checkbox 3', 1),
(28, 'checkbox 4', 1),
(29, 'checkbox 5', 5),
(30, 'checkbox 6', 3),
(31, 'checkbox 8', 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `checkbox_tareas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `checkbox_tareas`;
CREATE TABLE IF NOT EXISTS `checkbox_tareas` (
`Ntablero` varchar(100)
,`dTblero` varchar(10000)
,`lista` varchar(100)
,`NTAREA` varchar(40)
,`DTAREA` varchar(1000)
,`fechaCreacion` datetime
,`fechaMaxima` datetime
,`ENOMBRE` varchar(40)
,`CHE` varchar(10000)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `idcomentarios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unico del archivo',
  `texto` varchar(100) NOT NULL COMMENT 'cadena de texto que se agrega a una tarea para hacer algun comentario',
  `tareas_idtareas` int(11) NOT NULL COMMENT 'id de tarea',
  `usuario_idusuario` int(11) NOT NULL COMMENT 'id de usaurio',
  PRIMARY KEY (`idcomentarios`),
  KEY `FK_tarea` (`tareas_idtareas`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuaderno`
--

DROP TABLE IF EXISTS `cuaderno`;
CREATE TABLE IF NOT EXISTS `cuaderno` (
  `idnotas` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unico ',
  `idusuario` int(11) DEFAULT NULL COMMENT 'id usuario',
  PRIMARY KEY (`idnotas`),
  KEY `FK_fk` (`idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuaderno`
--

INSERT INTO `cuaderno` (`idnotas`, `idusuario`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

DROP TABLE IF EXISTS `documentos`;
CREATE TABLE IF NOT EXISTS `documentos` (
  `iddocumentos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id docuemnto',
  `archivos_idarchivos` int(11) NOT NULL COMMENT 'id archivos',
  PRIMARY KEY (`iddocumentos`),
  KEY `PK_doc` (`archivos_idarchivos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE IF NOT EXISTS `evaluacion` (
  `idevaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(1000) DEFAULT NULL COMMENT 'comentario corto para decir cuales fueron las acines buenas y malas de un usaurio',
  `fechaElaborada` date DEFAULT NULL,
  `puntosDados` int(11) DEFAULT NULL COMMENT 'se da una calificacion basada en los puntos maximos que se asgina',
  `puntosMaximos` int(11) DEFAULT NULL COMMENT 'es una escala con la cual se puede compara los puntos dados',
  `usuario_idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idevaluacion`),
  KEY `FK_usuario` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`idevaluacion`, `descripcion`, `fechaElaborada`, `puntosDados`, `puntosMaximos`, `usuario_idusuario`) VALUES
(1, 'se a tardado mucho en entregar sus tiempo se le hizo mucha mora,pero finalmente los entrego,pero debe de mejor en la puntualidad', '2019-03-13', 8, 10, 1),
(2, 'haciendo una pruebaa', '2019-03-09', 2, 10, 2),
(3, 'haciendo una evaluacion', '2019-03-15', 10, 10, 2),
(4, 'es irresponsable en con las entregas,hace mal los trabajos y no le interesa trabjar ', '2019-03-15', 0, 100, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciondesempenio`
--

DROP TABLE IF EXISTS `evaluaciondesempenio`;
CREATE TABLE IF NOT EXISTS `evaluaciondesempenio` (
  `idevaluacionDesempenio` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_idevaluacion` int(11) NOT NULL,
  `notificacion_idnotificacion` int(11) NOT NULL,
  PRIMARY KEY (`idevaluacionDesempenio`),
  KEY `FK_eva` (`evaluacion_idevaluacion`),
  KEY `FK_notificaciones` (`notificacion_idnotificacion`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluaciondesempenio`
--

INSERT INTO `evaluaciondesempenio` (`idevaluacionDesempenio`, `evaluacion_idevaluacion`, `notificacion_idnotificacion`) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 1),
(4, 4, 5);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `evaluacionhecha`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `evaluacionhecha`;
CREATE TABLE IF NOT EXISTS `evaluacionhecha` (
`descripcion` varchar(1000)
,`fechaElaborada` date
,`puntosDados` int(11)
,`puntosMaximos` int(11)
,`porcentajeObtenido` decimal(17,4)
,`evaluado` varchar(213)
,`evaluador` varchar(213)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exigibilidad`
--

DROP TABLE IF EXISTS `exigibilidad`;
CREATE TABLE IF NOT EXISTS `exigibilidad` (
  `idexigibilidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL COMMENT 'nombre dado para definir que tan rapido o necesario es que se haga una tarea',
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
  `nombre` varchar(40) DEFAULT NULL COMMENT 'nombre que se le da a una libreta',
  `idcuaderno` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlibreta`),
  KEY `Fk_cuaderno` (`idcuaderno`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libreta`
--

INSERT INTO `libreta` (`idlibreta`, `nombre`, `idcuaderno`) VALUES
(1, 'Circuitos', 1),
(2, 'bases', 1),
(3, 'arquitectura', 2),
(4, 'proyecto casa', 3),
(5, 'Circuitos', 2),
(6, 'bases', 7),
(7, 'arquitectura', 8),
(8, 'proyecto casa', 11),
(9, 'Circuitos 2', 12),
(10, 'bases 2', 13),
(11, 'arqui', 4),
(12, 'compras', 3),
(13, 'apuntes', 10),
(14, 'apuntes', 7),
(15, 'manualidades', 8),
(16, 'apuntes de casa', 4);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `libretaspusuario`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `libretaspusuario`;
CREATE TABLE IF NOT EXISTS `libretaspusuario` (
`idusuario` int(11)
,`nombreUsuario` varchar(100)
,`Pnombre` varchar(40)
,`Papellido` varchar(40)
,`notas_por_libretas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas`
--

DROP TABLE IF EXISTS `listas`;
CREATE TABLE IF NOT EXISTS `listas` (
  `idlistas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL COMMENT 'nombre de estado que se les da a la tarea ',
  `tablero_idtablero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlistas`),
  KEY `FK_proyecto` (`tablero_idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

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
(9, 'terminadas', 3),
(10, 'creadas', 4),
(11, 'proceso', 4),
(12, 'terminadas', 4),
(13, 'creadas', 5),
(14, 'proceso', 5),
(15, 'terminadas', 5),
(16, 'creadas', 6),
(17, 'proceso', 6),
(18, 'terminadas', 6),
(19, 'creadas', 7),
(20, 'proceso', 7),
(21, 'terminadas', 8),
(22, 'creadas', 9),
(23, 'trabajando', 9),
(24, 'finalizadas', 9),
(25, 'creadas', 10),
(26, 'procesadas', 10),
(27, 'terminadas', 10),
(28, 'creadas', 11),
(29, 'proceso', 11),
(30, 'terminadas', 11),
(31, 'creadas', 12),
(32, 'proceso', 12),
(33, 'terminadas', 12),
(34, 'creadas', 13),
(35, 'proceso', 13),
(36, 'terminadas', 13),
(37, 'creadas', 14),
(38, 'proceso', 14),
(39, 'terminadas', 14),
(40, 'creadas', 15),
(41, 'proceso', 15),
(42, 'terminadas', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE IF NOT EXISTS `mensajes` (
  `idmensajes` int(11) NOT NULL AUTO_INCREMENT,
  `textoMensaje` varchar(10000) NOT NULL COMMENT 'cadena de texto que se envia a otro usuario',
  `fechaMensaje` date NOT NULL,
  `BM_idBM_RESIVE` int(11) NOT NULL,
  `BM_IDBM_ENVIA` int(11) NOT NULL,
  PRIMARY KEY (`idmensajes`),
  KEY `FK_envia` (`BM_IDBM_ENVIA`),
  KEY `FK_resive` (`BM_idBM_RESIVE`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`idmensajes`, `textoMensaje`, `fechaMensaje`, `BM_idBM_RESIVE`, `BM_IDBM_ENVIA`) VALUES
(1, 'mira vos tenes que traer esa pinche tarea maniana sino te saco del grupo', '2019-03-11', 3, 1),
(2, 'manana te quiero alla en el centro a las 12 pm', '2019-03-10', 3, 1),
(3, 'vos cuando vas a venir a la house?', '2019-03-11', 7, 5),
(4, 'hola queria saber si podias avanzar en el landing page del proyecto', '2019-03-23', 3, 12),
(5, 'Buenos dias ,ya termine mi parte del proyecto', '2019-03-24', 12, 3),
(6, 'companiero tenemos un problema en la bd', '2019-03-13', 7, 5),
(7, 'mira vos tenes que traer esa pinche tarea maniana sino te saco del grupo', '2019-03-11', 10, 5),
(8, 'manana te quiero alla en el centro a las 12 pm', '2019-03-10', 5, 12),
(9, 'vos cuando vas a venir a la house?', '2019-03-11', 6, 7),
(10, 'hola queria saber si podias avanzar en el landing page del proyecto', '2019-03-23', 20, 19),
(11, 'Buenos dias ,ya termine mi parte del proyecto', '2019-03-24', 12, 10),
(12, 'companiero tenemos un problema en la bd', '2019-03-13', 1, 2),
(13, 'asddddddasdasdada', '2019-03-23', 12, 11),
(14, 'estamos haciendo la prueba de un mensaje par mostrarlo en la vista que hicimos', '2019-03-23', 5, 6),
(15, 'hola estamos probando los mensaje', '2019-03-24', 9, 7),
(16, 'probado probando probando', '2019-03-24', 11, 8),
(17, 'guardando guardando guardando giaradass', '2019-03-08', 9, 8);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mensajesenviados`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `mensajesenviados`;
CREATE TABLE IF NOT EXISTS `mensajesenviados` (
`textoMensaje` varchar(10000)
,`fechaMensaje` date
,`envia` varchar(183)
,`resive` varchar(184)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelusuario`
--

DROP TABLE IF EXISTS `nivelusuario`;
CREATE TABLE IF NOT EXISTS `nivelusuario` (
  `idnivelUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL COMMENT 'poder que tiene un usaurio dentro de un tablero',
  PRIMARY KEY (`idnivelUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivelusuario`
--

INSERT INTO `nivelusuario` (`idnivelUsuario`, `descripcion`) VALUES
(1, 'dios del olimpo'),
(2, 'semi dios'),
(3, 'mortal');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `nnotasenlibretas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `nnotasenlibretas`;
CREATE TABLE IF NOT EXISTS `nnotasenlibretas` (
`idusuario` int(11)
,`nombreUsuario` varchar(100)
,`Pnombre` varchar(40)
,`Papellido` varchar(40)
,`nombre` varchar(40)
,`notas_por_libretas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `idnotas` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(1000) DEFAULT NULL COMMENT 'cadena de texto donde se puede escribir recordatorios o apuntes de investigacion',
  `libreta_idlibreta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnotas`),
  KEY `FK_libretas` (`libreta_idlibreta`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`idnotas`, `texto`, `libreta_idlibreta`) VALUES
(1, 'estoy probando las libreta de esta base de atos', 1),
(2, 'papblito clavo un clavito', 1),
(3, 'estoyprobandlas asdadasdasdadadlibreta de esta base de atos', 1),
(4, 'hola como estan', 1),
(5, 'prueba de estas cosas', 5),
(6, 'hoalalalalalla', 10),
(7, 'vive la vida de pablo neruda', 16),
(8, 'assdasdadadasd', 2),
(9, 'estoy probando las libreta de esta base de atos', 11),
(10, 'papblito clavo un clavito', 12),
(11, 'estoyprobandlas asdadasdasdadadlibreta de esta base de atos', 8),
(12, 'hola como estan', 7),
(13, 'prueba de estas cosas', 8),
(14, 'hoalalalalalla', 8),
(15, 'vive la vida de pablo neruda', 5),
(16, 'assdasdadadasd', 12);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `notaslibretas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `notaslibretas`;
CREATE TABLE IF NOT EXISTS `notaslibretas` (
`nombreUsuario` varchar(100)
,`Pnombre` varchar(40)
,`Papellido` varchar(40)
,`Nombre_Libreta` varchar(40)
,`Nota_libreta` varchar(1000)
);

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
-- Estructura Stand-in para la vista `numerousuario`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `numerousuario`;
CREATE TABLE IF NOT EXISTS `numerousuario` (
`Numero_de_Usuarios` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL COMMENT 'nombre de algun pais',
  PRIMARY KEY (`idpais`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

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
(12, 'Egipto'),
(13, 'Belgica'),
(14, 'japon'),
(15, 'china'),
(16, 'argentina');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `privilegiosdeusuario`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `privilegiosdeusuario`;
CREATE TABLE IF NOT EXISTS `privilegiosdeusuario` (
`apodo_nombre` varchar(182)
,`nombre_tablero` varchar(100)
,`descripcion` varchar(20)
);

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
  `nombre` varchar(100) NOT NULL COMMENT 'nombre que se le da al tablero',
  `descripcion` varchar(10000) DEFAULT NULL COMMENT 'descripcion breve de lo que se administra en este tablero',
  `tipoTablero_idtablero` int(11) NOT NULL,
  PRIMARY KEY (`idtablero`),
  KEY `FK_tt` (`tipoTablero_idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tablero`
--

INSERT INTO `tablero` (`idtablero`, `nombre`, `descripcion`, `tipoTablero_idtablero`) VALUES
(1, 'I PAC UNAH', 'ORGANIZARE TODAS LA TAREAS DE MI PAC', 1),
(2, 'II PAC UNAH', 'ORGANIZARE TODo', 2),
(3, 'III PAC UNAH', 'HOLA PAC', 1),
(4, 'PROYECTO DE POO', 'asignaremos las tareas de proyecto de poo', 3),
(5, 'proyecto BD', 'organizaremos las tareas de BD', 3),
(6, 'Ventas de chocolates', 'organizaremos las tareas para hacer una venta de chocolates', 2),
(7, 'comida', 'aprenderemos hacer lasagna', 1),
(8, 'actividad del dia del padre', 'nos organizaremos para celebrarle una actividad a mi papa', 2),
(9, 'Construcion', 'se dara todas las ordenes de la construcions a traves de este medio y se requiere constante muestra de procesos', 2),
(10, 'probando base de datos', 'prueba 1', 1),
(11, 'probando base de datos', 'prueba 2', 3),
(12, 'asdasd', 'dasdasd', 2),
(13, 'asdasdasd', 'asdasdas', 1),
(14, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'ssssssssssssssssssssssssssss', 3),
(15, 'creacion de anime', 'se asignaran trabajos en esta plataforma', 2),
(16, ' plataforma de streaming de footbal', 'se creara una plataforma para el streaming atraves de la red de las ligas mas importante de mundo', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

DROP TABLE IF EXISTS `tareas`;
CREATE TABLE IF NOT EXISTS `tareas` (
  `idtareas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL COMMENT 'nombre que se le da a una tarae',
  `descripcion` varchar(1000) DEFAULT NULL COMMENT 'descripcion de que se desea hacer',
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaMaxima` datetime DEFAULT NULL,
  `exigibilidad_idexigibilidad` int(11) DEFAULT NULL,
  `listas_idlistas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtareas`),
  KEY `FK_EXI` (`exigibilidad_idexigibilidad`),
  KEY `FK_lis` (`listas_idlistas`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`idtareas`, `nombre`, `descripcion`, `fechaCreacion`, `fechaMaxima`, `exigibilidad_idexigibilidad`, `listas_idlistas`) VALUES
(1, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 1),
(2, 'estudiar capitulo 4', 'tengo que estudiar el capitulo 4 ', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 1),
(3, 'trabajr en proyecto de bases', 'debo de crear todas las tablas de bases', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 1),
(4, 'traer tortillas', 'tengo que ir a comprar tortilla', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 2),
(5, 'tengo que hacer algo', 'tengo que hacer algo', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 2),
(6, 'asssdasdasdas', 'asdasdasd', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 5),
(7, 'adsfssfg', 'sdfsdfsdf', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 7),
(8, 'CIRCUITO', 'TAREA DE CIRCUITOS asdasd', '2019-03-06 00:00:00', '2019-03-30 00:00:00', 1, 2),
(9, 'estudiar capitulo 4 asdasdasd', 'tengo que estudiar el capitulo 4  asdasdasd', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 3),
(10, 'trabajr en proyecto de bases asdadassda ', 'debo de crear todas las tablas de bases adasdasdadaa', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 2),
(11, 'traer tortillas dasdasdada', 'tengo que ir a comprar tortilla asdasdasdasd', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 1),
(12, 'tengo que hacer algo asdadas', 'tengo que hacer algo adasdasdasd', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 3),
(13, 'asssdasdasdas algo algo algo', 'asdasdasd algo algo algo', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 4),
(14, 'adsfssfg sisisisis', 'sdfsdfsdf siisisis', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 5),
(15, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 1),
(16, 'estudiar capitulo 4', 'tengo que estudiar el capitulo 4 ', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 1),
(17, 'trabajr en proyecto de bases', 'debo de crear todas las tablas de bases', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 6),
(18, 'traer tortillas', 'tengo que ir a comprar tortilla', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 2),
(19, 'tengo que hacer algo', 'tengo que hacer algo', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 3),
(20, 'asssdasdasdas', 'asdasdasd', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 3),
(21, 'adsfssfg', 'sdfsdfsdf', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 1),
(22, 'CIRCUITO', 'TAREA DE CIRCUITOS asdasd', '2019-03-06 00:00:00', '2019-03-30 00:00:00', 1, 2),
(23, 'estudiar capitulo 4 asdasdasd', 'tengo que estudiar el capitulo 4  asdasdasd', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 3),
(24, 'trabajr en proyecto de bases asdadassda ', 'debo de crear todas las tablas de bases adasdasdadaa', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 6),
(25, 'traer tortillas dasdasdada', 'tengo que ir a comprar tortilla asdasdasdasd', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 1),
(26, 'tengo que hacer algo asdadas', 'tengo que hacer algo adasdasdasd', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 2),
(27, 'asssdasdasdas algo algo algo', 'asdasdasd algo algo algo', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 3),
(28, 'adsfssfg sisisisis', 'sdfsdfsdf siisisis', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 1),
(29, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 3),
(30, 'estudiar capitulo 4', 'tengo que estudiar el capitulo 4 ', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 1),
(31, 'trabajr en proyecto de bases', 'debo de crear todas las tablas de bases', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 1),
(32, 'traer tortillas', 'tengo que ir a comprar tortilla', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 2),
(33, 'tengo que hacer algo', 'tengo que hacer algo', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 2),
(34, 'asssdasdasdas', 'asdasdasd', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 5),
(35, 'adsfssfg', 'sdfsdfsdf', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 7),
(36, 'CIRCUITO', 'TAREA DE CIRCUITOS asdasd', '2019-03-06 00:00:00', '2019-03-30 00:00:00', 1, 12),
(37, 'estudiar capitulo 4 asdasdasd', 'tengo que estudiar el capitulo 4  asdasdasd', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 15),
(38, 'trabajr en proyecto de bases asdadassda ', 'debo de crear todas las tablas de bases adasdasdadaa', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 14),
(39, 'traer tortillas dasdasdada', 'tengo que ir a comprar tortilla asdasdasdasd', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 22),
(40, 'tengo que hacer algo asdadas', 'tengo que hacer algo adasdasdasd', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 21),
(41, 'asssdasdasdas algo algo algo', 'asdasdasd algo algo algo', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 15),
(42, 'adsfssfg sisisisis', 'sdfsdfsdf siisisis', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 17),
(43, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 1),
(44, 'estudiar capitulo 4', 'tengo que estudiar el capitulo 4 ', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 1),
(45, 'trabajr en proyecto de bases', 'debo de crear todas las tablas de bases', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 2),
(46, 'traer tortillas', 'tengo que ir a comprar tortilla', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 2),
(47, 'tengo que hacer algo', 'tengo que hacer algo', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 2),
(48, 'asssdasdasdas', 'asdasdasd', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 3),
(49, 'adsfssfg', 'sdfsdfsdf', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 1),
(50, 'CIRCUITO', 'TAREA DE CIRCUITOS asdasd', '2019-03-06 00:00:00', '2019-03-30 00:00:00', 1, 2),
(51, 'estudiar capitulo 4 asdasdasd', 'tengo que estudiar el capitulo 4  asdasdasd', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 3),
(52, 'trabajr en proyecto de bases asdadassda ', 'debo de crear todas las tablas de bases adasdasdadaa', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 14),
(53, 'traer tortillas dasdasdada', 'tengo que ir a comprar tortilla asdasdasdasd', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 1),
(54, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 4),
(55, 'estudiar capitulo 4', 'tengo que estudiar el capitulo 4 ', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 5),
(56, 'trabajr en proyecto de bases', 'debo de crear todas las tablas de bases', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 6),
(57, 'traer tortillas', 'tengo que ir a comprar tortilla', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 6),
(58, 'tengo que hacer algo', 'tengo que hacer algo', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 6),
(59, 'asssdasdasdas', 'asdasdasd', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 6),
(60, 'adsfssfg', 'sdfsdfsdf', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 6),
(61, 'CIRCUITO', 'TAREA DE CIRCUITOS asdasd', '2019-03-06 00:00:00', '2019-03-30 00:00:00', 1, 6),
(62, 'estudiar capitulo 4 asdasdasd', 'tengo que estudiar el capitulo 4  asdasdasd', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 5),
(63, 'trabajr en proyecto de bases asdadassda ', 'debo de crear todas las tablas de bases adasdasdadaa', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 5),
(64, 'traer tortillas dasdasdada', 'tengo que ir a comprar tortilla asdasdasdasd', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 5, 22),
(65, 'tengo que hacer algo asdadas', 'tengo que hacer algo adasdasdasd', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 5),
(66, 'asssdasdasdas algo algo algo', 'asdasdasd algo algo algo', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 4),
(67, 'adsfssfg sisisisis', 'sdfsdfsdf siisisis', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 5),
(68, 'CIRCUITO', 'TAREA DE CIRCUITOS', '2019-03-06 00:00:00', '2019-03-28 00:00:00', 1, 4),
(69, 'estudiar capitulo 4', 'tengo que estudiar el capitulo 4 ', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 6),
(70, 'trabajr en proyecto de bases', 'debo de crear todas las tablas de bases', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 6),
(71, 'traer tortillas', 'tengo que ir a comprar tortilla', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 6),
(72, 'tengo que hacer algo', 'tengo que hacer algo', '2019-03-22 00:00:00', '2019-03-30 00:00:00', 2, 6),
(73, 'asssdasdasdas', 'asdasdasd', '2019-03-23 00:00:00', '2019-03-22 00:00:00', 1, 5),
(74, 'adsfssfg', 'sdfsdfsdf', '2019-03-01 00:00:00', '2019-05-10 00:00:00', 2, 4),
(75, 'CIRCUITO', 'TAREA DE CIRCUITOS asdasd', '2019-03-06 00:00:00', '2019-03-30 00:00:00', 1, 6),
(76, 'estudiar capitulo 4 asdasdasd', 'tengo que estudiar el capitulo 4  asdasdasd', '2019-03-09 00:00:00', '2019-03-16 00:00:00', 2, 4),
(77, 'trabajr en proyecto de bases asdadassda ', 'debo de crear todas las tablas de bases adasdasdadaa', '2019-03-09 00:00:00', '2019-03-30 00:00:00', 3, 4),
(78, 'traer tortillas dasdasdada', 'tengo que ir a comprar tortilla asdasdasdasd', '2019-03-22 00:00:00', '2019-03-31 00:00:00', 2, 4);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tareascreada`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `tareascreada`;
CREATE TABLE IF NOT EXISTS `tareascreada` (
`tableroN` varchar(100)
,`tdescripcion` varchar(10000)
,`estado` varchar(100)
,`tnombre` varchar(40)
,`tadescripcion` varchar(1000)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tareas_estad_asignados`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `tareas_estad_asignados`;
CREATE TABLE IF NOT EXISTS `tareas_estad_asignados` (
`tarea` varchar(40)
,`nombre_tablero` varchar(100)
,`nombre` varchar(100)
,`nombreUsuario` varchar(100)
);

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
-- Estructura de tabla para la tabla `uatablero`
--

DROP TABLE IF EXISTS `uatablero`;
CREATE TABLE IF NOT EXISTS `uatablero` (
  `idproyectoAsignado` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(11) NOT NULL,
  `tablero_idtablero` int(11) NOT NULL,
  `idnivelUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproyectoAsignado`),
  KEY `FK_usuario` (`usuario_idusuario`),
  KEY `FK_tablero` (`tablero_idtablero`),
  KEY `FK_NU` (`idnivelUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `uatablero`
--

INSERT INTO `uatablero` (`idproyectoAsignado`, `usuario_idusuario`, `tablero_idtablero`, `idnivelUsuario`) VALUES
(1, 12, 2, 1),
(2, 9, 1, 3),
(3, 8, 1, 3),
(4, 2, 2, 3),
(5, 1, 2, 3),
(6, 6, 1, 1),
(7, 5, 1, 3),
(8, 4, 1, 3),
(9, 3, 1, 2),
(10, 2, 1, 1),
(11, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uatarea`
--

DROP TABLE IF EXISTS `uatarea`;
CREATE TABLE IF NOT EXISTS `uatarea` (
  `tarea_idtarea` int(11) NOT NULL,
  `UATablero_idUATablero` int(11) NOT NULL,
  KEY `FK_uat1` (`tarea_idtarea`),
  KEY `FK_uat2` (`UATablero_idUATablero`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `uatarea`
--

INSERT INTO `uatarea` (`tarea_idtarea`, `UATablero_idUATablero`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2),
(1, 5),
(2, 5),
(2, 3),
(2, 3),
(5, 5),
(6, 6),
(1, 5),
(1, 6),
(2, 5),
(2, 6),
(1, 7),
(1, 7),
(1, 8),
(1, 8);

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreUsuario`, `descripcion`, `correo`, `Contrasenia`, `Pnombre`, `Snombre`, `Papellido`, `Sapellido`, `pais_idpais`, `fechaNacimiento`) VALUES
(1, 'Akinator', 'Hola me gusta las matematicas y las ciencias de la computacion,veo mucho anime', 'elpapi@yahoo.com', 'asd', 'pedro', 'juan', 'valdiviezo', 'martinez', 2, '1997-12-13'),
(2, 'asd', 'asdasdasd', 'asdafafsdfs', 'asd', 'asd', 'sadsad', 'sada', 'sadasd', 1, NULL),
(3, 'KenJXD', 'HOLA ', 'kjmolina@live.com', 'QWERTY', 'kenny', 'jared', 'molina', 'murillo', 1, NULL),
(4, 'BlackBeattle', 'soy blackBeatle', 'blackbeatle@unah.hn', 'qwerty', 'ronal', NULL, 'varela', 'quinchon', 10, NULL),
(5, 'creador', 'soy io', 'blackadadasd@unah.hn', 'qwerty', 'ronal', NULL, 'varela', 'quinchon', 10, NULL),
(6, 'KenJXD97', 'hola mundo', 'kjmolina@live.com', 'qwerty', 'kenny ', 'jared', 'molina', 'murillo', 1, NULL),
(7, 'MaEMMA ', 'Hola', 'ma!!emma1234@yahoo.com', 'qwer', 'maria', 'emma', 'benitez', 'velazques', 1, NULL),
(8, 'DAN', 'HOLA ME GUSTA ME GUSTAN LOS VIDEOJUEGOS ,MIS JUEGOS FAVORITOS SON KILLZONE Y METAL GEAR .AGREGAME Y TE AGREGO', 'DAN-DANI@LIVE.COM', 'ASDFG', 'DANI', 'LETO', 'MARTINEZ', 'GUEVARA', 2, NULL),
(9, 'Rockgun', 'soy ammante de la armas de fuego', 'gun_fuckers@gmail.com', 'qwerty', 'mario', 'javier', 'castaneda', 'rodriguez', 5, '1990-12-15'),
(10, 'THE ROCK', 'actor de hollywood', 'dawye-therock@yahoo.com', 'qweqwrwetrt', 'dawne', 'davis', 'johnson', 'black', 5, '1960-01-01'),
(11, 'DEVI', 'hola mundo', 'devian123insali@outlook.com', 'devian', 'devian', 'monserat', 'insali', 'neveg', 6, '1997-05-18'),
(12, 'BlackAdam', 'soy afroamerciano y me gusta el rap', 'blackadam@outlook.com', 'blacki', 'adam', NULL, 'forest', 'gump', 5, '1995-08-20'),
(13, 'xXMolinaXx', 'hola mundo', 'molina123@gmail.com', 'qwerty', 'mario', 'javier', 'MARTINEZ', 'alvarez', 10, '1990-03-20'),
(14, 'rubius', 'probando probando probando probando probando', 'rubius@yahoo.com', 'asdas', 'lenin', 'abdi', 'alvarez', 'alonzo', 10, '1980-05-12');

-- --------------------------------------------------------

--
-- Estructura para la vista `administradores`
--
DROP TABLE IF EXISTS `administradores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `administradores`  AS  select concat(`us`.`nombreUsuario`,' ',`us`.`Pnombre`,' ',`us`.`Papellido`) AS `apodo_nombre`,`tab`.`nombre` AS `nombre_tablero`,`nu`.`descripcion` AS `descripcion` from (((`uatablero` `uata` join `usuario` `us` on((`us`.`idusuario` = `uata`.`usuario_idusuario`))) join `tablero` `tab` on((`tab`.`idtablero` = `uata`.`tablero_idtablero`))) join `nivelusuario` `nu` on((`nu`.`idnivelUsuario` = `uata`.`idnivelUsuario`))) where (`nu`.`idnivelUsuario` = 1) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `checkbox_tareas`
--
DROP TABLE IF EXISTS `checkbox_tareas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `checkbox_tareas`  AS  select `tab`.`nombre` AS `Ntablero`,`tab`.`descripcion` AS `dTblero`,`lis`.`nombre` AS `lista`,`tar`.`nombre` AS `NTAREA`,`tar`.`descripcion` AS `DTAREA`,`tar`.`fechaCreacion` AS `fechaCreacion`,`tar`.`fechaMaxima` AS `fechaMaxima`,`ex`.`nombre` AS `ENOMBRE`,`cb`.`descripcion` AS `CHE` from (((((`tablero` `tab` join `listas` `lis` on((`lis`.`tablero_idtablero` = `tab`.`idtablero`))) join `tareas` `tar` on((`tar`.`listas_idlistas` = `lis`.`idlistas`))) join `tipotablero` `tt` on((`tt`.`idtablero` = `tab`.`tipoTablero_idtablero`))) join `checkbox` `cb` on((`cb`.`tareas_idtareas` = `tar`.`idtareas`))) join `exigibilidad` `ex` on((`ex`.`idexigibilidad` = `tar`.`exigibilidad_idexigibilidad`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `evaluacionhecha`
--
DROP TABLE IF EXISTS `evaluacionhecha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `evaluacionhecha`  AS  select `eva`.`descripcion` AS `descripcion`,`eva`.`fechaElaborada` AS `fechaElaborada`,`eva`.`puntosDados` AS `puntosDados`,`eva`.`puntosMaximos` AS `puntosMaximos`,((`eva`.`puntosDados` / `eva`.`puntosMaximos`) * 100) AS `porcentajeObtenido`,concat('apodo del usuario:  ',`us`.`nombreUsuario`,'   nombre:  ',`us`.`Pnombre`,' ',`us`.`Papellido`) AS `evaluado`,concat('apodo del usuario:  ',`evaluador`.`nombreUsuario`,'   nombre:  ',`evaluador`.`Pnombre`,' ',`evaluador`.`Papellido`) AS `evaluador` from ((((`evaluacion` `eva` join `evaluaciondesempenio` `ed` on((`ed`.`evaluacion_idevaluacion` = `eva`.`idevaluacion`))) join `buzonnotificaciones` `bn` on((`bn`.`idbuzon` = `ed`.`notificacion_idnotificacion`))) join `usuario` `us` on((`us`.`idusuario` = `bn`.`usuario_idusuario`))) join (select `us`.`idusuario` AS `idusuario`,`us`.`nombreUsuario` AS `nombreUsuario`,`us`.`Pnombre` AS `Pnombre`,`us`.`Papellido` AS `Papellido` from (`usuario` `us` join `evaluacion` `eva` on((`eva`.`usuario_idusuario` = `us`.`idusuario`)))) `evaluador` on((`evaluador`.`idusuario` = `eva`.`usuario_idusuario`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `libretaspusuario`
--
DROP TABLE IF EXISTS `libretaspusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `libretaspusuario`  AS  select `us`.`idusuario` AS `idusuario`,`us`.`nombreUsuario` AS `nombreUsuario`,`us`.`Pnombre` AS `Pnombre`,`us`.`Papellido` AS `Papellido`,count(0) AS `notas_por_libretas` from (((`usuario` `us` join `cuaderno` `cdn` on((`cdn`.`idusuario` = `us`.`idusuario`))) join `libreta` `lib` on((`lib`.`idcuaderno` = `cdn`.`idnotas`))) join `notas` `n` on((`n`.`libreta_idlibreta` = `lib`.`idlibreta`))) group by `us`.`idusuario`,`us`.`nombreUsuario`,`us`.`Pnombre`,`us`.`Papellido`,`lib`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mensajesenviados`
--
DROP TABLE IF EXISTS `mensajesenviados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mensajesenviados`  AS  select `men`.`textoMensaje` AS `textoMensaje`,`men`.`fechaMensaje` AS `fechaMensaje`,concat(`us`.`nombreUsuario`,' ',`us`.`Pnombre`,'  ',`us`.`Papellido`) AS `envia`,concat(`usres`.`nombreUsuario`,'  ',`usres`.`Pnombre`,'  ',`usres`.`Papellido`) AS `resive` from (((`mensajes` `men` join `buzonmensaje` `bm` on((`bm`.`idbuzon` = `men`.`BM_IDBM_ENVIA`))) join `usuario` `us` on((`us`.`idusuario` = `bm`.`usuario_idusuario`))) join (select `us`.`idusuario` AS `idusuario`,`us`.`nombreUsuario` AS `nombreUsuario`,`us`.`Pnombre` AS `Pnombre`,`us`.`Papellido` AS `Papellido` from ((`mensajes` `men` join `buzonmensaje` `bm` on((`bm`.`idbuzon` = `men`.`BM_idBM_RESIVE`))) join `usuario` `us` on((`us`.`idusuario` = `bm`.`usuario_idusuario`)))) `usres` on((`usres`.`idusuario` = `men`.`BM_idBM_RESIVE`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `nnotasenlibretas`
--
DROP TABLE IF EXISTS `nnotasenlibretas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nnotasenlibretas`  AS  select `us`.`idusuario` AS `idusuario`,`us`.`nombreUsuario` AS `nombreUsuario`,`us`.`Pnombre` AS `Pnombre`,`us`.`Papellido` AS `Papellido`,`lib`.`nombre` AS `nombre`,count(0) AS `notas_por_libretas` from (((`usuario` `us` join `cuaderno` `cdn` on((`cdn`.`idusuario` = `us`.`idusuario`))) join `libreta` `lib` on((`lib`.`idcuaderno` = `cdn`.`idnotas`))) join `notas` `n` on((`n`.`libreta_idlibreta` = `lib`.`idlibreta`))) group by `us`.`idusuario`,`us`.`nombreUsuario`,`us`.`Pnombre`,`us`.`Papellido`,`lib`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `notaslibretas`
--
DROP TABLE IF EXISTS `notaslibretas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notaslibretas`  AS  select `us`.`nombreUsuario` AS `nombreUsuario`,`us`.`Pnombre` AS `Pnombre`,`us`.`Papellido` AS `Papellido`,`lib`.`nombre` AS `Nombre_Libreta`,`n`.`texto` AS `Nota_libreta` from (((`usuario` `us` join `cuaderno` `cdn` on((`cdn`.`idusuario` = `us`.`idusuario`))) join `libreta` `lib` on((`lib`.`idcuaderno` = `cdn`.`idnotas`))) join `notas` `n` on((`n`.`libreta_idlibreta` = `lib`.`idlibreta`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `numerousuario`
--
DROP TABLE IF EXISTS `numerousuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `numerousuario`  AS  select count(0) AS `Numero_de_Usuarios` from `usuario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `privilegiosdeusuario`
--
DROP TABLE IF EXISTS `privilegiosdeusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `privilegiosdeusuario`  AS  select concat(`us`.`nombreUsuario`,' ',`us`.`Pnombre`,' ',`us`.`Papellido`) AS `apodo_nombre`,`tab`.`nombre` AS `nombre_tablero`,`nu`.`descripcion` AS `descripcion` from (((`uatablero` `uata` join `usuario` `us` on((`us`.`idusuario` = `uata`.`usuario_idusuario`))) join `tablero` `tab` on((`tab`.`idtablero` = `uata`.`tablero_idtablero`))) join `nivelusuario` `nu` on((`nu`.`idnivelUsuario` = `uata`.`idnivelUsuario`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tareascreada`
--
DROP TABLE IF EXISTS `tareascreada`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tareascreada`  AS  select `tablero`.`nombre` AS `tableroN`,`tablero`.`descripcion` AS `tdescripcion`,`lis`.`nombre` AS `estado`,`tareas`.`nombre` AS `tnombre`,`tareas`.`descripcion` AS `tadescripcion` from ((`tablero` join `listas` `lis` on((`lis`.`tablero_idtablero` = `tablero`.`idtablero`))) join `tareas` on((`tareas`.`listas_idlistas` = `lis`.`idlistas`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tareas_estad_asignados`
--
DROP TABLE IF EXISTS `tareas_estad_asignados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tareas_estad_asignados`  AS  select `tar`.`nombre` AS `tarea`,`tab`.`nombre` AS `nombre_tablero`,`lis`.`nombre` AS `nombre`,`us`.`nombreUsuario` AS `nombreUsuario` from (((((`uatarea` `uata` join `uatablero` `uat` on((`uat`.`idproyectoAsignado` = `uata`.`UATablero_idUATablero`))) join `tablero` `tab` on((`tab`.`idtablero` = `uat`.`tablero_idtablero`))) join `listas` `lis` on((`lis`.`tablero_idtablero` = `tab`.`idtablero`))) join `tareas` `tar` on((`tar`.`idtareas` = `uata`.`tarea_idtarea`))) join `usuario` `us` on((`us`.`idusuario` = `uat`.`usuario_idusuario`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
