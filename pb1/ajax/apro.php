<?php

      //php con procedimietnos almacenados    
      $mysqli = new mysqli("localhost", "root", "", "proyectobases");
      if ($mysqli->connect_errno) {
          echo "Falló la conexión a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
      }
      
      if (!$mysqli->query("SET @p0='".$_POST["npro"]."'") ||
       !$mysqli->query("SET @p1='".$_POST["dpro"]."'") ||
       !$mysqli->query("SET @p2='".$_POST["us"]."'") ||
            !$mysqli->query(" CALL `CreacionProyecto`(@p0, @p1, @p2, @p3, @p4)")
            ) {
          echo "Falló CALL: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
      if (!($resultado = $mysqli->query("SELECT @p3 AS `pncodigo`, @p4 AS `pcMensaje`"))) {
          echo "Falló la obtención: (" . $mysqli->errno . ") " . $mysqli->error;
      }
      
    
      $fila = $resultado->fetch_assoc();
      if($fila['pncodigo']==1 ){
        echo $fila['pncodigo'];
        return;
      }
  
      echo $fila['pncodigo'];
  

?>

   SELECT @p3 AS `pncodigo`, @p4 AS `pcMensaje`

