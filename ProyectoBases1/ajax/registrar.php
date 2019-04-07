<?php
     include '../conexion.php';
     

       if($_POST["correo"]==""  || $_POST["pnomusuario"]=="" || $_POST["snomusuario"]==""
       || $_POST["papeusuario"]=="" || $_POST["sapeusuario"]=="" || $_POST["fechanacimiento"]==""
       || $_POST["contrasena"]==""  || $_POST["pais"]==""  ){
        echo 0;
        return;
       }


       if($_POST["correo"]!=""  && $_POST["pnomusuario"]!="" && $_POST["snomusuario"]!=""
            && $_POST["papeusuario"]!="" && $_POST["sapeusuario"]!="" && $_POST["fechanacimiento"]!=""
            && $_POST["contrasena"]!=""  && $_POST["pais"]!=""  ){
               
               
                // insert pero sin utilizar el procedimiento almacenado
                $insert='INSERT INTO usuario 
                ( correo, Contrasenia, Pnombre, Snombre, Papellido, Sapellido, pais_idpais, fechaNacimiento) 
                VALUES ("'.$_POST["correo"] .'","'.$_POST["contrasena"] .'", "'.$_POST["pnomusuario"] .'", "'.$_POST["snomusuario"] .'", "'.$_POST["papeusuario"] .'", "'.$_POST["sapeusuario"] .'",'.$_POST["pais"].' , "'.$_POST["fechanacimiento"] .'") ';
                mysqli_query( $conexion, $insert ) or die ( "no se pudo hacer el insert"); 

                /****insert usando procedimiento almacenado*** 
               $insert="SET @p0='".$_POST["correo"]."'; SET @p1='".$_POST["pnomusuario"]."'; SET @p2='"$_POST["snomusuario"]"'; SET @p3='".$_POST["papeusuario"] "'; SET @p4='".$_POST["sapeusuario"] ."'; SET @p5='".$_POST["contrasena"] ."'; SET @p6='".$_POST["fechanacimiento"] ."'; SET @p7='".$_POST["pais"]."'; 
               CALL creacionUsuario (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9);
                SELECT @p8 AS pnCodigoSalida, @p9 AS ppMensajeSalida;";
                $resultado=mysqli_query( $conexion, $insert, MYSQLI_USE_RESULT ) or die('no sirvio tu linea anterior');
                */
                echo 1;
                return;
            }

        
    
        
?> 
