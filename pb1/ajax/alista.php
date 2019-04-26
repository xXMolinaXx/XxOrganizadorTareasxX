<?php

      //php con procedimietnos almacenados    
      $mysqli = new mysqli("localhost", "root", "", "proyectobases");
      if ($mysqli->connect_errno) {
          echo "Falló la conexión a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
      }
      
      if (!$mysqli->query("SET @p0='".$_POST["nlista"]."'") ||
       !$mysqli->query("SET @p1='".$_POST["idp"]."'") ||
            !$mysqli->query(" CALL `CreacionLista`(@p0, @p1, @p2, @p3)")
            ) {
          echo "Falló CALL: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
      if (!($resultado = $mysqli->query("SELECT @p2 AS `codigoMensaje`, @p3 AS `Mensaje`;"))) {
          echo "Falló la obtención: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
    
      $fila = $resultado->fetch_assoc();
      if($fila['codigoMensaje']==1 ){
        echo $fila['codigoMensaje'];
        return;
      }
  
      echo $fila['codigoMensaje'];
  

?>