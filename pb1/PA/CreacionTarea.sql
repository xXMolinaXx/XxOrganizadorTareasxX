CREATE PROCEDURE CreacionTareas(
    IN pcNombre VARCHAR(50),
    IN pcdescripcion VARCHAR(1000),
    IN pffechaMaxima DATE,
    IN pnExigibilidad INT,
    IN pfFechaIniciacion DATE,
    in pnProyecto INT,
    OUT CodigoSalida INT,
    OUT MensajeSalida vARCHAR(1000)   
)
sp: BEGIN
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

END
