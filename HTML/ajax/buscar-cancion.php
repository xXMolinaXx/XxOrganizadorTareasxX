<?php
    
    /*asi es como se accede a una variable de un json_decode $json->cancion
    $linea = fgets($archivo);
    $json=json_decode($linea);
    echo $json->cancion;
    $registro = json_decode($linea,true);

    como funciona si enviamos los parametro por html
    echo $json["artista"];
        echo $json["cancion"];
        echo $json["genero"];
    */
    $com1=$_POST['dato'];
    $com2;
    $com3;
    $com4;
    $canciones=array();
    $respuesta['mensaje']='no se encontro';
    $respuesta['codigo']='0';
    $jsonre=json_encode($respuesta);
    
    $archivo = fopen("canciones.json","r");
    $linea="";
    while($linea=fgets($archivo)){
        $json=json_decode($linea,true);
        $com2=$json['artista'];
        $com3=$json['cancion'];
        $com4=$json['genero'];
        if($com1==$com2){
            echo json_encode($json);
            return true;
        }
        if($com1==$com3){
            echo json_encode($json);
            return true;
        }
        if($com1==$com4){
            echo json_encode($json);
            return true;
        }
    }
    echo $jsonre;
?>








