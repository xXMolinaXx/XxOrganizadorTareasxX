

CREATE  PROCEDURE CreacionProyecto (
    IN pcNombre VARCHAR(50),
    IN pcDescripcion VARCHAR(50),
    IN pnIdusuario INT,
    OUT pncodigo INT,
    OUT pcMensaje VARCHAR(500)
)  
sp: BEGIN
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

    INSERT INTO `uaproyecto` ( `usuario_idusuario`, `tablero_idtablero`, `idnivelUsuario`) 
    VALUES (pnIdusuario,vnConteo ,1);

	
    	SET pncodigo=1;
        SET pcMensaje='insert realizado correctamente';


END$$