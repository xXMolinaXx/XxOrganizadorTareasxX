<?php   
    include '../conexion.php';

   $consulta="UPDATE tareas SET listas_idlistas = ".$_POST["idlista"]." WHERE tareas.idtareas = ".$_POST["idtarea"]."  ";
   $resultado=mysqli_query( $conexion, $consulta) or die ( "Algo ha ido mal en la consulta a la base de datos");
   echo 1;
   return;
?>