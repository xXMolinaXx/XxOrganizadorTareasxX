<?php
    session_start();
    if($_POST["correo"]=="" || $_POST["contrasena"]=="" ){   
        echo "parametros vacios";
        exit();
    }else{
        $archivo = fopen("usuarios.json","r");
        $linea="";
        $usuarios=array();
        while(($linea = fgets($archivo))){
            $registro = json_decode($linea,true);
            if($registro["correo"]==$_POST["correo"] && $registro["contrasena"]==$_POST["contrasena"] ){
                $_SESSION["usuario"] = $_POST["correo"];
                echo "si leimos el archivo en el json";
                exit();
            }
        }
    }
?>