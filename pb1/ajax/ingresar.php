<?php
    session_start();
    //include '../conexion.php';

    if($_POST["correo"]=="" || $_POST["contrasena"]=="" ){   
        echo 0;
        exit();
    }else{
 //php con procedimietnos almacenados    
    $mysqli = new mysqli("localhost", "root", "", "proyectobases");
if ($mysqli->connect_errno) {
    echo "Falló la conexión a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

if ( !$mysqli->query(" SET @p0='".$_POST["correo"]."'"   ) ||
!$mysqli->query("  SET @p1='".$_POST["contrasena"]."'" )      || 
!$mysqli->query("CALL `IngresarMake`(@p0, @p1, @p2, @p3)")) {
    echo "Falló CALL: (" . $mysqli->errno . ") " . $mysqli->error;
}

if (!($resultado = $mysqli->query("SELECT @p2 AS ppMensajeSalida, @p3 AS pnCodigoSalida"))) {
    echo "Falló la obtención: (" . $mysqli->errno . ") " . $mysqli->error;
}

$fila = $resultado->fetch_assoc();
if($fila['pnCodigoSalida']==1 ){
    $_SESSION["correo"]=$_POST["correo"];
    $_SESSION["contra"]=$_POST["contrasena"];
echo $fila['pnCodigoSalida'];
}
    }
?>

