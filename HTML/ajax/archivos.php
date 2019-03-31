<?php
    session_start();
    if($_POST["pagina"]=="registronumero"){
        if($_POST["pais"]=="paises" || $_POST["numero"]=="0" || $_POST["sexo"]=="sexo" || $_POST["edad"]=="edad" )
            echo " los campos vacios o algun campo esta vacio";
        else{
            $archivo = fopen("usuarios.json","a+");
            fwrite( $archivo,json_encode($_POST) . "\n");
            fclose($archivo);
            echo "hola soy la peticion";
        }
    }




/***************************registro mediante correo es el que estamos usando*****************************************************************/    
    if($_POST["pagina"]=="registrocoreo"){
        if($_POST["correo"]=="" || $_POST["nomusuario"]=="" || $_POST["contrasena"]=="" || $_POST["sexo"]=="sexo" || $_POST["edad"]=="edad" )
        echo " los campos estan vacios o algun campo esta vacio";
    else{
        $archivo = fopen("usuarios.json","a+");
        $_SESSION["usuario"] = $_POST["correo"];
        fwrite( $archivo,json_encode($_POST) . "\n");
        fclose($archivo);
        echo 1;
    } 

    }
?> 
