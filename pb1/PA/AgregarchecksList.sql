CREATE PROCEDURE Crearcheckbox(
    IN pcDescripcion VARCHAR(1000),
    IN pnIdTarea INT,
    OUT codigo int,
    OUT mensaje varchar(1000)
)
sp: BEGIN
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

END