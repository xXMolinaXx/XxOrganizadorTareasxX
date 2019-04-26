CREATE PROCEDURE UAProyecto(
    IN pcCorreo varchar(50),
    in pnProyecto int,
    in pnNivel int,
    OUT codigo INT,
    OUT mensaje varchar(50)    
)
sp: BEGIN
    DECLARE vnNumero,vnNumero1 int;
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
    WHERE uap.usuario_idusuario=vnNumero and uap.tablero_idtablero=pnProyecto=pnProyecto ;

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



end
