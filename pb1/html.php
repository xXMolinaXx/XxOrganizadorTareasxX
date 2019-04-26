<?php
    include 'seguridad.php' ;
    include 'conexion.php';
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>pagina de prueba</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
</head>
<body>
    <a href="salir.php"> <button> salir</button></a>
    <?php
        $consulta = 'SELECT pro.nombre,pro.descripcion,pro.idtablero FROM proyecto pro
        INNER JOIN uaproyecto uap on uap.tablero_idtablero=pro.idtablero
        INNER JOIN usuario us on us.idusuario=uap.usuario_idusuario
        WHERE us.correo="'.$_SESSION['correo'].'"';
        $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos ok"); 
        while ($columna = mysqli_fetch_array( $resultado ))
        {
            echo    '<div style="background: antiquewhite;height: 200px;">';
            echo    '<h1>'.$columna['nombre'].'  id:'.$columna['idtablero'].'</h1>';
            echo    '<h3>'.$columna['descripcion'].'</h3>';
            echo    '</div>';
        }   
        
        
    ?>
    <select id="idpro">
    <?php
        $consultap = 'SELECT pro.nombre,pro.descripcion,pro.idtablero FROM proyecto pro
        INNER JOIN uaproyecto uap on uap.tablero_idtablero=pro.idtablero
        INNER JOIN usuario us on us.idusuario=uap.usuario_idusuario
        WHERE us.correo="'.$_SESSION['correo'].'"';
        $resultadop = mysqli_query( $conexion, $consultap ) or die ( "no se trajo bien los proyectos"); 
        while ($columnap = mysqli_fetch_array( $resultadop ))
        {
            echo '<option value="'.$columnap['idtablero'].'">'.$columnap['nombre'].'</option>';
        }   
        
        
    ?>  
    </select>
    <button id='enbuton'>entrar</button>    
    
    <script src="js/jquery.min.js"></script>
    <script src="js/prueba.js"></script>
    <script src="js/html.js"></script>

</body>
</html>