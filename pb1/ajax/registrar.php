<?php
    session_start();
     //include '../conexion.php';
     
  if($_POST["correo"]==""  || $_POST["pnomusuario"]=="" || $_POST["snomusuario"]==""
  || $_POST["papeusuario"]=="" || $_POST["sapeusuario"]=="" || $_POST["fechanacimiento"]==""
  || $_POST["contrasena"]==""  || $_POST["pais"]==""  ){
   echo 0;
   return;
  }else{       
    //php con procedimietnos almacenados    
    $mysqli = new mysqli("localhost", "root", "", "proyectobases");
    if ($mysqli->connect_errno) {
        echo "Falló la conexión a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    }
    
    if (!$mysqli->query("SET @p0='".$_POST["correo"]."'") ||
     !$mysqli->query("SET @p1='".$_POST["pnomusuario"]."'") ||
      !$mysqli->query("SET @p2='". $_POST["snomusuario"]."'") || 
      !$mysqli->query("SET @p3='".$_POST["papeusuario"]."'") ||
       !$mysqli->query("SET @p4='".$_POST["sapeusuario"]."'") ||
        !$mysqli->query("SET @p5='".$_POST["contrasena"]."'") ||
         !$mysqli->query("SET @p6='".$_POST["fechanacimiento"]."'") ||
          !$mysqli->query("SET @p7='".$_POST["pais"]."'") ||
          !$mysqli->query(" CALL `creacionUsuario`(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9)")
          ) {
        echo "Falló CALL: (" . $mysqli->errno . ") " . $mysqli->error;
    }
    
    if (!($resultado = $mysqli->query("SELECT @p8 AS pnCodigoSalida, @p9 AS ppMensajeSalida"))) {
        echo "Falló la obtención: (" . $mysqli->errno . ") " . $mysqli->error;
    }
    
  
    $fila = $resultado->fetch_assoc();
    if($fila['pnCodigoSalida']==1 ){
    $_SESSION["correo"]=$_POST["correo"];
    $_SESSION["contra"]=$_POST["contrasena"];
      echo $fila['pnCodigoSalida'];
      return;
    }

    echo $fila['pnCodigoSalida'];

}

 /*/ insert pero sin utilizar el procedimiento almacenado
 $insert='INSERT INTO usuario 
 ( correo, Contrasenia, Pnombre, Snombre, Papellido, Sapellido, pais_idpais, fechaNacimiento) 
 VALUES ("'.$_POST["correo"] .'","'.$_POST["contrasena"] .'", "'.$_POST["pnomusuario"] .'", "'.$_POST["snomusuario"] .'", "'.$_POST["papeusuario"] .'", "'.$_POST["sapeusuario"] .'",'.$_POST["pais"].' , "'.$_POST["fechanacimiento"] .'") ';
 mysqli_query( $conexion, $insert ) or die ( "no se pudo hacer el insert");
  echo 1;
  return;*/

//if($_POST["correo"]!=""  && $_POST["pnomusuario"]!="" && $_POST["snomusuario"]!="" && $_POST["papeusuario"]!="" && $_POST["sapeusuario"]!="" && $_POST["fechanacimiento"]!="" && $_POST["contrasena"]!=""  && $_POST["pais"]!=""  ){
       
?> 
