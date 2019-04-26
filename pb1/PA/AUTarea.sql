CREATE PROCEDURE  AsignarUsuarioTarea(
    IN pnIdusuario int,
    IN pnIdTarea INT,
    OUT codigo INT,
    OUT mensaje varchar(1000)
)
sp: BEGIN
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
    

end
