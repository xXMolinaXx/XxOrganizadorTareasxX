CREATE PROCEDURE CreacionTareas(
    IN pcNombre VARCHAR(50),
    IN pcdescripcion VARCHAR(1000),
    IN pffechaMaxima DATE,
    IN pnExigibilidad INT,
    IN pfFechaIniciacion DATE,
    in pnLista INT,
    OUT CodigoSalida INT,
    OUT MensajeSalida INT   
)
sp: BEGIN
    DECLARE vnConteo INT;
    DECLARE vcMensaje varchar(1000);
    SET vcMensaje='';

    IF pcNombre ='' AND pcNombre IS NULL THEN
        set vcMensaje='nombre tarea';
    END IF;

    IF pnLista  ='' AND pnLista  IS NULL THEN
        set vcMensaje=concat(vcMensaje,'id lista');
    END IF;

    IF  vcMensaje<>'' THEN
        SET CodigoSalida=0;
        set MensajeSalida=concat('faltan estos parametros',vcMensaje);
        leave sp;
    END IF;

    SELECT COUNT(*) INTO vnConteo FROM listas lis 
    WHERE lis.idlistas=pnLista;

    IF vnConteo=0 THEN
       SET CodigoSalida=0;
        set MensajeSalida='no existe esta id de lista';  
        leave sp;
    END IF;

    SET CodigoSalida=1;
    set MensajeSalida='tarea creada exitosamente';  
    leave sp;


END
