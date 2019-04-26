<?php
    
      //php con procedimietnos almacenados    
      $mysqli = new mysqli("localhost", "root", "", "proyectobases");
      if ($mysqli->connect_errno) {
          echo "Falló la conexión a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
      }
      
      if (!$mysqli->query("SET @p0='".$_POST["correo"]."'") ||
       !$mysqli->query("SET @p1='".$_POST["idp"]."'") ||
       !$mysqli->query("SET @p2='".$_POST["privilegio"]."'") ||
            !$mysqli->query("  CALL `UAProyecto`(@p0, @p1, @p2, @p3, @p4)")
            ) {
          echo "Falló CALL: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
      if (!($resultado = $mysqli->query("  SELECT @p3 AS `codigo`, @p4 AS `mensaje`"))) {
          echo "Falló la obtención: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
    
      $fila = $resultado->fetch_assoc();
      if($fila['codigo']==1 ){
        echo $fila['codigo'];
        return;
      }
  
      echo $fila['codigo'].$fila['mensaje'];
  

?>

SET @p0='asdasd'; SET @p1='1'; SET @p2='1';