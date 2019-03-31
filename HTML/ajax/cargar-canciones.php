<?php
   $archivo = fopen("canciones.json","r");
   $linea="";
   $usuarios=array();
   while(($linea = fgets($archivo))){
       $registro = json_decode($linea,true);
       $usuarios[] = $registro;
   }
   echo json_encode($usuarios);
?>