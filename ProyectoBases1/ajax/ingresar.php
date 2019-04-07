<?php

    include '../conexion.php';

    if($_POST["correo"]=="" || $_POST["contrasena"]=="" ){   
        echo 0;
        exit();
    }else{
        /*$query=" SET @p0='".$_POST["correo"]."'; SET @p1='".$_POST["contrasena"]."'; 
        CALL `IngresarMake`(@p0, @p1, @p2, @p3);
        SELECT @p2 AS ppMensajeSalida, @p3 AS pnCodigoSalida;";
        $resultado=mysqli_multi_query( $conexion, $query ) or die ( "no se pudo llamar el procedimineto almacenado");
        */  
        $query="  SELECT COUNT(*) veri  FROM usuario us
        WHERE us.correo='1' AND us.Contrasenia='1'";
        $resultado=mysqli_query( $conexion, $query ) or die ( "no se pudo llamar el procedimineto almacenado");
        while ($columna = mysqli_fetch_array( $resultado ))
            {
                                	echo $columna['veri'];
            } 
        //echo $resultado;
    }
?>

