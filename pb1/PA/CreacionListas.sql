CREATE PROCEDURE CreacionLista(
    in pcNombre varchar(50),
    in pnproyecto int,
    OUT codigoMensaje INT,
    OUT Mensaje varchar(1000)
)
sp: BEGIN
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
end
