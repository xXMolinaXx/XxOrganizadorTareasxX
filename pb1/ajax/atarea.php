<?php
    
      //php con procedimietnos almacenados    
      $mysqli = new mysqli("localhost", "root", "", "proyectobases");
      if ($mysqli->connect_errno) {
          echo "Falló la conexión a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
      }
      
      if (!$mysqli->query("SET @p0='".$_POST["ntarea"]."'") ||
       !$mysqli->query("SET @p1='".$_POST["dtarea"]."'") ||
       !$mysqli->query("SET @p3='".$_POST["exi"]."'") ||
       !$mysqli->query("SET @p2='".$_POST["fmaxima"]."'") ||
       !$mysqli->query("SET @p4='".$_POST["finiciacion"]."'") ||
       !$mysqli->query("SET @p5='".$_POST["idp"]."'") ||
            !$mysqli->query(" CALL `CreacionTareas`(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7)")
            ) {
          echo "Falló CALL: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
      if (!($resultado = $mysqli->query(" SELECT @p6 AS `CodigoSalida`, @p7 AS `MensajeSalida`"))) {
          echo "Falló la obtención: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
    
      $fila = $resultado->fetch_assoc();
      if($fila['CodigoSalida']==1 ){
        echo $fila['CodigoSalida'];
        return;
      }
  
      echo $fila['CodigoSalida'];
  

?>