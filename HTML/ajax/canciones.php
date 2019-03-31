<?php
        $archivo = fopen("canciones.json","a+");
        fwrite( $archivo,json_encode($_POST) . "\n");
        fclose($archivo);
        echo "guardamos";
?> 