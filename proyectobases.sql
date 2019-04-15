-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-04-2019 a las 19:26:46
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

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `AsignarUsuarioTarea`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AsignarUsuarioTarea` (IN `pnIdusuario` INT, IN `pnIdTarea` INT, OUT `codigo` INT, OUT `mensaje` VARCHAR(1000))  sp: BEGIN
    DECLARE vnNumero int;
    DECLARE vcMensaje varchar(1000);
    SET vcMensaje='';

    IF pnIdusuario='' AND pnIdusuario is NULL THEN
        SET vcMensaje='id usuario';
    END IF;
    
    
    IF pnIdTarea='' AND pnIdTarea is NULL THEN
        SET vcMensaje=concat(vcMensaje,', id tarea');
    END IF;

    IF vcMensaje<>'' THEN
        SET codigo=0;
        SET mensaje=concat('faltan estos parametros:',vcMensaje);
        leave sp;
    END IF;

    SELECT COUNT(*) INTO vnNumero FROM uaproyecto aup
    INNER JOIN proyecto pro on pro.idtablero=aup.tablero_idtablero
    INNER JOIN listas on listas.tablero_idtablero=pro.idtablero
    INNER JOIN tareas on tareas.listas_idlistas=listas.idlistas
    WHERE aup.usuario_idusuario=pnIdusuario AND  tareas.idtareas=pnIdTarea ;

    IF vnNumero=0 THEN
        SET codigo=0;
        SET mensaje='el id de usuario no esta en este proyecto';
        leave sp;
    END IF;

        UPDATE `tareas` SET `UATablero_asignados` =  pnIdusuario WHERE `tareas`.`idtareas` = pnIdTarea;

    SET codigo=1;
    SET mensaje='usuario asignado exitosamente';
    leave sp;
    

end$$

DROP PROCEDURE IF EXISTS `CreacionLista`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreacionLista` (IN `pcNombre` VARCHAR(50), IN `pnproyecto` INT, OUT `codigoMensaje` INT, OUT `Mensaje` VARCHAR(1000))  sp: BEGIN
    DECLARE vnConteo INT;
    DECLARE vcMensaje varchar(500);
    set vcMensaje='';

   IF pcNombre='' and pcNombre is null THEN
    SET vcMensaje='nombre';
   END IF; 

   IF pnproyecto='' and pnproyecto is null THEN
    SET vcMensaje=concat(vcMensaje,',íd proyecto');
   END IF; 

   IF vcMensaje<>'' THEN
        set codigoMensaje=0;
        set Mensaje=concat('faltan estos campos', vcMensaje  );
        LEAVE SP;
   END IF;

    SELECT COUNT(*) INTO vnConteo  FROM proyecto pro
    WHERE pro.idtablero=pnproyecto;

    IF vnConteo=0 THEN
      set codigoMensaje=0;
        set Mensaje='NO EXISTE EL PROYECOT';
        LEAVE SP;
    END IF;

    INSERT INTO `listas` ( `nombre`, `tablero_idtablero`) 
    VALUES (pcNombre ,pnproyecto);

    set codigoMensaje=1;
        set Mensaje='LISTA CREADA EXITOSAMENTE';
        LEAVE SP;
end$$

DROP PROCEDURE IF EXISTS `CreacionProyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreacionProyecto` (IN `pcNombre` VARCHAR(50), IN `pcDescripcion` VARCHAR(50), IN `pnIdusuario` INT, OUT `pncodigo` INT, OUT `pcMensaje` VARCHAR(500))  sp: BEGIN
	DECLARE vnConteo INT;
    DECLARE vcMensaje varchar(1000);
    SET vcMensaje='';


	IF  pcNombre='' AND  pcNombre is null THEN
        SET vcMensaje='nombre proyecto';
    END IF;

    IF pnIdusuario='' AND pnIdusuario IS NULL THEN
        SET vcMensaje=concat(vcMensaje,',id usuario');
    END IF;

    IF vcMensaje<>'' THEN
        set pncodigo=0;
        SET pnIdusuario=concat('faltan estos parametros: ',vcMensaje);
        leave sp;
    END IF;


    INSERT INTO proyecto ( nombre, descripcion, tipoTablero_idtablero) 
    VALUES (pcNombre,pcDescripcion,2);

    SELECT MAX(pro.idtablero) INTO vnConteo  FROM proyecto pro;

    INSERT INTO `listas` ( `nombre`, `tablero_idtablero`) VALUES ('en espera', vnConteo);
    INSERT INTO `listas` ( `nombre`, `tablero_idtablero`) VALUES ('terminadas', vnConteo);

    INSERT INTO `uaproyecto` ( `usuario_idusuario`, `tablero_idtablero`, `idnivelUsuario`) 
    VALUES (pnIdusuario,vnConteo ,1);

	
    	SET pncodigo=1;
        SET pcMensaje='insert realizado correctamente';


END$$

DROP PROCEDURE IF EXISTS `CreacionTareas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreacionTareas` (IN `pcNombre` VARCHAR(50), IN `pcdescripcion` VARCHAR(1000), IN `pffechaMaxima` DATE, IN `pnExigibilidad` INT, IN `pfFechaIniciacion` DATE, IN `pnProyecto` INT, OUT `CodigoSalida` INT, OUT `MensajeSalida` VARCHAR(1000))  sp: BEGIN
    DECLARE vnConteo,vnLista INT;
    DECLARE vcMensaje varchar(1000);
    SET vcMensaje='';

    IF pcNombre ='' AND pcNombre IS NULL THEN
        set vcMensaje='nombre tarea';
    END IF;

    IF pnProyecto  ='' AND pnProyecto  IS NULL THEN
        set vcMensaje=concat(vcMensaje,'id lista');
    END IF;

    IF  vcMensaje<>'' THEN
        SET CodigoSalida=0;
        set MensajeSalida=concat('faltan estos parametros',vcMensaje);
        leave sp;
    END IF;

    IF pffechaMaxima<curdate() AND pffechaMaxima<>'' AND pffechaMaxima is not null THEN
        SET CodigoSalida=0;
        set MensajeSalida='feccha maxima es menor que fecha de creacion';  
        leave sp;
    END IF;

    
    IF pfFechaIniciacion<curdate() AND pfFechaIniciacion<>'' AND pfFechaIniciacion is not null THEN
        SET CodigoSalida=0;
        set MensajeSalida='feccha maxima es menor que fecha de creacion';  
        leave sp;
    END IF;


    SELECT MIN(lis.idlistas) INTO vnLista FROM proyecto pro
INNER JOIN listas lis ON lis.tablero_idtablero=pro.idtablero
WHERE pro.idtablero=pnProyecto;

    INSERT INTO `tareas` ( `nombre`, `descripcion`, `fechaCreacion`, `fechaMaxima`, `exigibilidad_idexigibilidad`, `listas_idlistas`, `fechaIniciacion`)
     VALUES ( pcNombre,pcdescripcion,curdate(), pffechaMaxima,pnExigibilidad,vnLista, pfFechaIniciacion);

    SET CodigoSalida=1;
    set MensajeSalida='tarea creada exitosamente';  
    leave sp;

END$$

DROP PROCEDURE IF EXISTS `creacionUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `creacionUsuario` (IN `ppCorreo` VARCHAR(1000), IN `ppPnombre` VARCHAR(50), IN `ppsnombre` VARCHAR(50), IN `ppPapellido` VARCHAR(50), IN `ppSapellido` VARCHAR(50), IN `ppContrasena` VARCHAR(50), IN `pdNacimiento` DATE, IN `pnPais` INT, OUT `pnCodigoSalida` INT, OUT `ppMensajeSalida` VARCHAR(500))  sp: BEGIN 
	DECLARE vnConteo INT;
    DECLARE vpMensajeSalida varchar(500);
    
    
    /*****comprobacion de que los campos no esten vacios*/
    IF ppCorreo='' AND ppCorreo IS null THEN
    	SET vpMensajeSalida='correo';
    END IF;
	
    IF ppPnombre='' AND ppPnombre IS null THEN
    	SET vpMensajeSalida=concat(vpMensajeSalida,'primer nombre');
    END IF;
    
    
    IF ppsnombre='' AND ppsnombre IS null THEN
    	SET vpMensajeSalida=concat(vpMensajeSalida,'segundo nombre');
    END IF;
    
    
    IF ppPapellido='' AND ppPapellido IS null THEN
    	SET vpMensajeSalida=concat(vpMensajeSalida,'segundo apellido');
    END IF;
    
    
    IF ppSapellido='' AND ppSapellido IS null THEN
    	SET vpMensajeSalida=concat(vpMensajeSalida,'segundo apellido');
    END IF;
    
    
    IF ppContrasena='' AND ppContrasena IS null THEN
    	SET vpMensajeSalida=concat(vpMensajeSalida,'contrasena');
    END IF;
    
    
    IF pdNacimiento='' AND pdNacimiento IS null THEN
    	SET vpMensajeSalida=concat(vpMensajeSalida,'fecha nacimiento');
    END IF;
    
    
    IF pnPais='' AND pnPais IS null THEN
    	SET vpMensajeSalida=concat(vpMensajeSalida,'pais');
    END IF;
    
    IF vpMensajeSalida<>'' THEN
    SET	pnCodigoSalida=0; 
    SET ppMensajeSalida=vpMensajeSalida;
   	LEAVE sp; 	
    END IF;
    
    SELECT COUNT(*) INTO vnConteo FROM usuario us
    WHERE us.correo=ppCorreo;
    
    IF vnConteo=1 THEN
    	SET pnCodigoSalida=0;
        SET ppMensajeSalida="ya existe el correo";
        LEAVE sp;
    END IF;
    
    INSERT INTO usuario ( correo, Contrasenia, Pnombre, Snombre, Papellido, Sapellido, pais_idpais, fechaNacimiento) 
     VALUES (ppCorreo,ppContrasena,ppPnombre,ppsnombre,ppPapellido,ppSapellido,pnPais,pdNacimiento) ;
               
    
    
    /********respuesta final de el procedimiento********/
    SET	pnCodigoSalida=1; 
    SET ppMensajeSalida='el proceso fue exitoso';
    LEAVE sp;
    
END$$

DROP PROCEDURE IF EXISTS `Crearcheckbox`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Crearcheckbox` (IN `pcDescripcion` VARCHAR(1000), IN `pnIdTarea` INT, OUT `codigo` INT, OUT `mensaje` VARCHAR(1000))  sp: BEGIN
    DECLARE vnNumero INT;
    DECLARE vcMensaje varchar(1000);
    SET vcMensaje='';

    IF pcDescripcion and pcDescripcion is NULL THEN
        SET vcMensaje='descripcion';
    END IF;

    IF pnIdTarea='' and pnIdTarea is NULL THEN
        SET vcMensaje=concat(vcMensaje,'id de tarea');
    END IF;

    IF vcMensaje<>'' THEN
        SET codigo=0;
        set mensaje=concat('faltan estos campos',vcMensaje);
        leave sp;
    END IF;

    SELECT count(*) INTO vnNumero FROM tareas ta
    WHERE ta.idtareas= pnIdTarea;

    IF vnNumero=0 THEN  
        SET codigo=0;
        set mensaje='el id de tarea no existe';
        leave sp; 
    END IF;

    INSERT INTO `checkbox` ( `descripcion`, `tareas_idtareas`, `fechaAsignacion`) 
    VALUES (pcDescripcion,pnIdTarea,curdate());

    SET codigo=1;
    set mensaje='checklist agregado exitosamente';
    leave sp;

END$$

DROP PROCEDURE IF EXISTS `IngresarMake`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarMake` (IN `ppCorreo` VARCHAR(100), IN `ppContrasena` VARCHAR(50), OUT `ppMensajeSalida` VARCHAR(500), OUT `pnCodigoSalida` INT)  sp: BEGIN
 DECLARE vnConteo,vnExiste INT;
 DECLARE vpmensaje varchar(200);
 
 
 	IF ppCorreo='' AND ppCorreo IS null THEN
    	SET vpmensaje='correo';
    END IF;

	   IF ppContrasena='' AND ppContrasena IS null THEN
    	SET vpMensaje=concat(vpmensaje,'contrasena');
    END IF;
    
    IF vpmensaje<>'' THEN
    	SET ppMensajeSalida=concat('falta',mensajes);
        SET pnCodigoSalida=0;
        LEAVE sp;
    END IF;
    
    SELECT COUNT(*) INTO vnExiste FROM usuario us
	WHERE us.correo=ppCorreo AND us.Contrasenia=ppContrasena;
	
    IF vnExiste=0 THEN
     SET ppMensajeSalida='no existe este usaurio';
     SET pnCodigoSalida=0;
     LEAVE sp;
    END IF;
	
    SET ppMensajeSalida=' existe este usaurio';
     SET pnCodigoSalida=1;
     LEAVE sp;
END$$

DROP PROCEDURE IF EXISTS `UAProyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UAProyecto` (IN `pcCorreo` VARCHAR(50), IN `pnProyecto` INT, IN `pnNivel` INT, OUT `codigo` INT, OUT `mensaje` VARCHAR(50))  sp: BEGIN
	DECLARE vnNumero int;
    DECLARE vnNumero1 INT;
    DECLARE vcMensaje varchar(50);
    SET vcMensaje='';

    IF pcCorreo='' and pcCorreo is NULL THEN    
        SET vcMensaje='correo';
    END IF;

    IF  pnProyecto='' and  pnProyecto  is NULL THEN
        set vcMensaje=concat(vcMensaje,'id proyecto');
    END IF;

    IF vcMensaje<>'' THEN
        SET codigo=0;
        SET mensaje=concat('FALTA ESTOS REQUISITOS',vcMensaje);
        leave sp;
    END IF;

    SELECT count(*) INTO vnNumero FROM usuario us
    WHERE us.correo=pcCorreo;

    IF vnNumero=0 THEN
        SET codigo=0;
        SET mensaje='no existe el usuario';
        leave sp;
    END IF;


    SELECT us.idusuario INTO vnNumero FROM usuario us
    WHERE us.correo=pcCorreo;

    SELECT COUNT(*) INTO vnNumero1 FROM uaproyecto uap
    WHERE uap.usuario_idusuario=vnNumero and uap.tablero_idtablero=pnProyecto ;

   IF vnNumero1>0 THEN
        SET codigo=0;
        SET mensaje='este usuario ya fue agregado';
        leave sp;
    END IF;

    INSERT INTO `uaproyecto` ( `usuario_idusuario`, `tablero_idtablero`, `idnivelUsuario`) 
    VALUES (vnNumero,pnProyecto,pnNivel);

    SET codigo=1;
    SET mensaje='usuario agregado exitosamente';
    leave sp;



end$$

DELIMITER ;

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
  `fechaAsignacion` date DEFAULT NULL,
  `fechaCompletitud` date DEFAULT NULL,
  `UATablero_asignado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcheckbox`),
  KEY `FK_check` (`tareas_idtareas`),
  KEY `UATChecbox` (`UATablero_asignado`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `checkbox`
--

INSERT INTO `checkbox` (`idcheckbox`, `descripcion`, `tareas_idtareas`, `fechaAsignacion`, `fechaCompletitud`, `UATablero_asignado`) VALUES
(1, 'estudiar analisis de maya', 1, '2019-04-01', NULL, 1),
(2, 'chexkbox2', 2, '2019-04-09', NULL, 2),
(3, 'chexkbox2', 3, '2019-04-11', NULL, 3),
(4, 'chexkbox3', 4, '2019-03-14', NULL, 4),
(5, 'chexkbox24', 5, '2019-04-09', NULL, 5),
(6, 'chexkbox25', 6, '2019-02-12', NULL, 6),
(7, 'estudiar analisis de maya chexkbox2', 7, '2019-04-09', NULL, 7),
(8, 'chexkbox23', 8, '2019-02-05', NULL, 8),
(9, 'chexkbox2a', 9, '2019-01-15', NULL, 1),
(10, 'chexkbox3123', 10, '2019-04-10', NULL, 2),
(11, 'chexkbox24213', 1, '2019-04-17', NULL, 3),
(12, 'chexkbox25123123', 2, '2019-04-18', NULL, 4),
(13, 'estudiar analisis de maya 123123', 3, '2019-04-18', NULL, 5),
(14, 'chexkbox23123123', 4, '2019-04-10', NULL, 6),
(15, 'chexkbox21231231', 5, '2019-04-11', NULL, 7),
(16, 'chexkbox312312312', 6, '2019-04-17', NULL, 8),
(17, 'chexkbox24123131', 7, '2019-04-10', NULL, 1),
(18, 'chexkbox251312312', 8, '2019-04-10', NULL, NULL),
(19, 'estudiar analisis de maya chexkbox2v 2131', 9, '2019-04-17', NULL, NULL),
(20, 'chexkbox23', 10, '2019-04-18', NULL, NULL),
(21, 'chexkbox2a 1 1 1 11 1', 1, NULL, NULL, NULL),
(22, 'chexkbox3123 121212121', 2, NULL, NULL, NULL),
(23, 'chexkbox242132112   11 1 1 11 1 ', 3, NULL, NULL, NULL),
(24, 'chexkbox25123123 12    2323  ', 4, NULL, NULL, NULL),
(25, 'checkbox 1', 5, NULL, NULL, NULL),
(26, 'checkbox 2', 1, NULL, NULL, NULL),
(27, 'checkbox 3', 1, NULL, NULL, NULL),
(28, 'checkbox 4', 1, NULL, NULL, NULL),
(29, 'checkbox 5', 5, NULL, NULL, NULL),
(30, 'checkbox 6', 3, NULL, NULL, NULL),
(31, 'checkbox 8', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `checkboxcreadas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `checkboxcreadas`;
CREATE TABLE IF NOT EXISTS `checkboxcreadas` (
`Nombre_tarea` varchar(40)
,`descripcion` varchar(10000)
,`fechaAsignacion` date
,`concat(us.Pnombre,' ',us.Papellido)` varchar(81)
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
-- Estructura de tabla para la tabla `historicott`
--

DROP TABLE IF EXISTS `historicott`;
CREATE TABLE IF NOT EXISTS `historicott` (
  `idHistorioTT` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicialLista` date NOT NULL,
  `fechaFinLista` date NOT NULL,
  `Tarea_idTarea` int(11) NOT NULL,
  `Listas_idListas` int(11) NOT NULL,
  PRIMARY KEY (`idHistorioTT`),
  KEY `fk1` (`Tarea_idTarea`),
  KEY `fk2` (`Listas_idListas`)
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
-- Estructura de tabla para la tabla `listas`
--

DROP TABLE IF EXISTS `listas`;
CREATE TABLE IF NOT EXISTS `listas` (
  `idlistas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL COMMENT 'nombre de estado que se les da a la tarea ',
  `tablero_idtablero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlistas`),
  KEY `FK_proyecto` (`tablero_idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `listas`
--

INSERT INTO `listas` (`idlistas`, `nombre`, `tablero_idtablero`) VALUES
(1, 'ESPERA', 1),
(2, 'PROCESO', 1),
(3, 'terminadas', 1),
(4, 'en espera', 19),
(5, 'terminadas', 19);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listascreadas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `listascreadas`;
CREATE TABLE IF NOT EXISTS `listascreadas` (
`proyecto` varchar(100)
,`Nlista` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mensajeenviado`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `mensajeenviado`;
CREATE TABLE IF NOT EXISTS `mensajeenviado` (
`usuario_envia` varchar(81)
,`textoMensaje` varchar(10000)
,`fechaMensaje` date
,`usuario_Resive` varchar(82)
);

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
-- Estructura Stand-in para la vista `nivelesusuarioexistentes`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `nivelesusuarioexistentes`;
CREATE TABLE IF NOT EXISTS `nivelesusuarioexistentes` (
`idnivelUsuario` int(11)
,`descripcion` varchar(20)
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
(1, 'privilegiado'),
(2, 'semi-privilegiado'),
(3, 'no-privilegiado');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(16, 'argentina'),
(17, NULL),
(18, 'nuevo pais');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `paisesexistentes`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `paisesexistentes`;
CREATE TABLE IF NOT EXISTS `paisesexistentes` (
`idpais` int(11)
,`nombre` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `idtablero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL COMMENT 'nombre que se le da al tablero',
  `descripcion` varchar(10000) DEFAULT NULL COMMENT 'descripcion breve de lo que se administra en este tablero',
  `tipoTablero_idtablero` int(11) NOT NULL,
  PRIMARY KEY (`idtablero`),
  KEY `FK_tt` (`tipoTablero_idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`idtablero`, `nombre`, `descripcion`, `tipoTablero_idtablero`) VALUES
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
(16, ' plataforma de streaming de footbal', 'se creara una plataforma para el streaming atraves de la red de las ligas mas importante de mundo', 3),
(17, 'prueba proyecto', 'creacion de un proyecto con procedimietnos almacenados', 2),
(18, 'PA prueba', ' descripcion PA prueba', 2),
(19, 'Nuevo proyecto PA', 'Nuevo proyecto PA', 2);

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
  `fechaIniciacion` date DEFAULT NULL,
  `fechaTerminacion` date DEFAULT NULL,
  `UATablero_asignados` int(11) DEFAULT NULL COMMENT 'este es el usuario al que se le encarga que se cumpla la tarea',
  PRIMARY KEY (`idtareas`),
  KEY `FK_EXI` (`exigibilidad_idexigibilidad`),
  KEY `FK_lis` (`listas_idlistas`),
  KEY `UATTAREA` (`UATablero_asignados`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`idtareas`, `nombre`, `descripcion`, `fechaCreacion`, `fechaMaxima`, `exigibilidad_idexigibilidad`, `listas_idlistas`, `fechaIniciacion`, `fechaTerminacion`, `UATablero_asignados`) VALUES
(1, 'trabjar en la tarea 1', ' trabjar en la tarea 1 avanzar en esat tarea', '2019-04-01 00:00:00', '2019-04-24 00:00:00', 1, 1, '2019-04-05', NULL, 5),
(2, 'trabjar en la tarea 2', 'trabajar en la tarea 2', '2019-03-09 00:00:00', '2019-04-02 00:00:00', 2, 1, '2019-04-04', NULL, 2),
(3, 'tarea 3', 'tarea 3', '2019-04-01 00:00:00', '2019-04-09 00:00:00', 3, 1, '2019-04-03', NULL, 1),
(4, 'tarea 3', 'tarea 3', '2019-03-09 00:00:00', '2019-04-25 00:00:00', 1, 1, '2019-04-04', NULL, 3),
(5, 'trabjar en la tarea qwerty', ' trabjar en la tarea qwerty avanzar en esat tarea', '2019-04-01 00:00:00', '2019-04-24 00:00:00', 1, 1, '2019-04-05', NULL, 1),
(6, 'trabjar en la tarea asdf', 'trabajar en la tarea asd', '2019-03-09 00:00:00', '2019-04-02 00:00:00', 2, 1, '2019-04-04', NULL, 2),
(7, 'tarea scrubb 2', 'tarea 3', '2019-04-01 00:00:00', '2019-04-09 00:00:00', 3, 1, '2019-04-03', NULL, 1),
(8, 'tarea suise 2', 'tarea 3', '2019-03-09 00:00:00', '2019-04-25 00:00:00', 1, 1, '2019-04-04', NULL, 3),
(9, 'PRUEBA PA', 'PRUEBA PA', '2019-04-14 00:00:00', '2019-04-30 00:00:00', 1, 1, '2019-04-15', NULL, NULL),
(10, 'PRUEBA PA', 'PRUENA PA', '2019-04-14 00:00:00', '2019-04-16 00:00:00', 1, 1, '2019-04-16', NULL, NULL),
(11, 'prueba 2 pa', 'prueba 2 pa', '2019-04-14 00:00:00', '2019-04-22 00:00:00', 1, 1, '2019-04-16', NULL, NULL),
(12, '1', '1', '2019-04-14 00:00:00', '2019-04-30 00:00:00', 1, 1, '2019-04-16', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tareascreadas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `tareascreadas`;
CREATE TABLE IF NOT EXISTS `tareascreadas` (
`Nombre_tarea` varchar(40)
,`descripcion` varchar(1000)
,`exiibilidad_nombre` varchar(40)
,`fechaCreacion` datetime
,`fechaMaxima` datetime
,`nombre_lista` varchar(100)
,`nombre_proyecto` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproyecto`
--

DROP TABLE IF EXISTS `tipoproyecto`;
CREATE TABLE IF NOT EXISTS `tipoproyecto` (
  `idtablero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10000) NOT NULL,
  PRIMARY KEY (`idtablero`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoproyecto`
--

INSERT INTO `tipoproyecto` (`idtablero`, `nombre`) VALUES
(1, 'publico'),
(2, 'privado'),
(3, 'semi-privado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uaproyecto`
--

DROP TABLE IF EXISTS `uaproyecto`;
CREATE TABLE IF NOT EXISTS `uaproyecto` (
  `idproyectoAsignado` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(11) NOT NULL,
  `tablero_idtablero` int(11) NOT NULL,
  `idnivelUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproyectoAsignado`),
  KEY `FK_usuario` (`usuario_idusuario`),
  KEY `FK_tablero` (`tablero_idtablero`),
  KEY `FK_NU` (`idnivelUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `uaproyecto`
--

INSERT INTO `uaproyecto` (`idproyectoAsignado`, `usuario_idusuario`, `tablero_idtablero`, `idnivelUsuario`) VALUES
(9, 6, 2, 3),
(10, 7, 2, 1),
(14, 3, 1, 2),
(1, 8, 1, 3),
(2, 7, 1, 3),
(3, 6, 1, 3),
(4, 5, 1, 2),
(5, 4, 1, 1),
(6, 3, 1, 1),
(7, 2, 1, 1),
(8, 1, 1, 1),
(12, 3, 19, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `correo`, `Contrasenia`, `Pnombre`, `Snombre`, `Papellido`, `Sapellido`, `pais_idpais`, `fechaNacimiento`) VALUES
(2, 'asdafafsdfs', 'asd', 'asd', 'sadsad', 'sada', 'sadasd', 1, NULL),
(3, 'kjmolina@live.com', 'QWERTY', 'kenny', 'jared', 'molina', 'murillo', 1, NULL),
(7, 'ma!!emma1234@yahoo.com', 'qwer', 'maria', 'emma', 'benitez', 'velazques', 1, NULL),
(8, 'DAN-DANI@LIVE.COM', 'ASDFG', 'DANI', 'LETO', 'MARTINEZ', 'GUEVARA', 2, NULL),
(10, 'dawye-therock@yahoo.com', 'qweqwrwetrt', 'dawne', 'davis', 'johnson', 'black', 5, '1960-01-01'),
(11, 'devian123insali@outlook.com', 'devian', 'devian', 'monserat', 'insali', 'neveg', 6, '1997-05-18'),
(20, '12', '1', '1', '1', '1', '1', 14, '1990-12-13'),
(13, 'molina123@gmail.com', 'qwerty', 'mario', 'javier', 'MARTINEZ', 'alvarez', 10, '1990-03-20'),
(14, 'rubius@yahoo.com', 'asdas', 'lenin', 'abdi', 'alvarez', 'alonzo', 10, '1980-05-12'),
(17, 'coreomio@live.com', 'qwerty', 'qwerty', 'simon', 'alavarez', 'marcio', 1, '1990-01-15'),
(18, 'kenny12@asda.com', 'qwertyuiop', 'kenny', 'benito', 'maradiaga', 'benet', 1, '1980-12-13'),
(19, '1', '1', '1', '1', '1', '1', 1, '1000-01-01');

-- --------------------------------------------------------

--
-- Estructura para la vista `checkboxcreadas`
--
DROP TABLE IF EXISTS `checkboxcreadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `checkboxcreadas`  AS  select `tar`.`nombre` AS `Nombre_tarea`,`cb`.`descripcion` AS `descripcion`,`cb`.`fechaAsignacion` AS `fechaAsignacion`,concat(`us`.`Pnombre`,' ',`us`.`Papellido`) AS `concat(us.Pnombre,' ',us.Papellido)` from ((((((`tareas` `tar` join `listas` `lis` on((`lis`.`idlistas` = `tar`.`listas_idlistas`))) join `proyecto` `pro` on((`pro`.`idtablero` = `lis`.`tablero_idtablero`))) join `exigibilidad` `exi` on((`exi`.`idexigibilidad` = `tar`.`exigibilidad_idexigibilidad`))) join `checkbox` `cb` on((`cb`.`tareas_idtareas` = `tar`.`idtareas`))) join `uaproyecto` `uap` on((`uap`.`idproyectoAsignado` = `cb`.`UATablero_asignado`))) join `usuario` `us` on((`us`.`idusuario` = `uap`.`usuario_idusuario`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `listascreadas`
--
DROP TABLE IF EXISTS `listascreadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listascreadas`  AS  select `pro`.`nombre` AS `proyecto`,`lis`.`nombre` AS `Nlista` from (`proyecto` `pro` join `listas` `lis` on((`lis`.`tablero_idtablero` = `pro`.`idtablero`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mensajeenviado`
--
DROP TABLE IF EXISTS `mensajeenviado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mensajeenviado`  AS  select concat(`us`.`Pnombre`,' ',`us`.`Papellido`) AS `usuario_envia`,`men`.`textoMensaje` AS `textoMensaje`,`men`.`fechaMensaje` AS `fechaMensaje`,concat(`ur`.`Pnombre`,'  ',`ur`.`Papellido`) AS `usuario_Resive` from (((`mensajes` `men` join `buzonmensaje` `bm` on((`bm`.`idbuzon` = `men`.`BM_IDBM_ENVIA`))) join `usuario` `us` on((`us`.`idusuario` = `bm`.`usuario_idusuario`))) join (select `us`.`idusuario` AS `idusuario`,`us`.`Pnombre` AS `Pnombre`,`us`.`Papellido` AS `Papellido` from ((`mensajes` `men` join `buzonmensaje` `bm` on((`bm`.`idbuzon` = `men`.`BM_idBM_RESIVE`))) join `usuario` `us` on((`us`.`idusuario` = `bm`.`usuario_idusuario`)))) `ur` on((`ur`.`idusuario` = `men`.`BM_idBM_RESIVE`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `nivelesusuarioexistentes`
--
DROP TABLE IF EXISTS `nivelesusuarioexistentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nivelesusuarioexistentes`  AS  select `nivelusuario`.`idnivelUsuario` AS `idnivelUsuario`,`nivelusuario`.`descripcion` AS `descripcion` from `nivelusuario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `numerousuario`
--
DROP TABLE IF EXISTS `numerousuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `numerousuario`  AS  select count(0) AS `Numero_de_Usuarios` from `usuario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `paisesexistentes`
--
DROP TABLE IF EXISTS `paisesexistentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `paisesexistentes`  AS  select `pais`.`idpais` AS `idpais`,`pais`.`nombre` AS `nombre` from `pais` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tareascreadas`
--
DROP TABLE IF EXISTS `tareascreadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tareascreadas`  AS  select `tar`.`nombre` AS `Nombre_tarea`,`tar`.`descripcion` AS `descripcion`,`exi`.`nombre` AS `exiibilidad_nombre`,`tar`.`fechaCreacion` AS `fechaCreacion`,`tar`.`fechaMaxima` AS `fechaMaxima`,`lis`.`nombre` AS `nombre_lista`,`pro`.`nombre` AS `nombre_proyecto` from (((`tareas` `tar` join `listas` `lis` on((`lis`.`idlistas` = `tar`.`listas_idlistas`))) join `proyecto` `pro` on((`pro`.`idtablero` = `lis`.`tablero_idtablero`))) join `exigibilidad` `exi` on((`exi`.`idexigibilidad` = `tar`.`exigibilidad_idexigibilidad`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
