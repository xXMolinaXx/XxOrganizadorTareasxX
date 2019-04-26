

<?php
    include 'conexion.php';
?>






<!DOCTYPE html>
<html>



<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MaKe organizate y no te olvides de nada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css"  href="css/estilo.css" /> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/deezer-icon.ico">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilo.css">

</head>





<!-- pagina para creacion de una nueva cuenta -->

<body>

    <!-- primer bloque -->
    <nav class="navbar navbar-light bg-light navbar navbar-expand-md">


        <div id="bloque-ofertas" class="col-2 col-md-6  col-lg- col-xl-">
            <a href="#"><button id="txt-oferta"><h4>Bienvenidos a MaKe</h4></button></a>
        </div>

        <div class="collapse navbar-collapse col-md-4 col-lg- col-xl-">
            <a href="conectarse-email.php"><button id="boton-nav-1" class="btn btn-outline-primary ">Ingresar</button></a>
            <a href="registro-correo.php"><button id="boton-nav-2" class="btn btn-primary btm btm "> registrarse </button></a>
        </div>


        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    </nav>

    <!-- fin del nav -->








    <!-- segundo bloque de pagina de registro -->
    <div id="div">
        <div id="div1-1">
            <div id="div1-1-1">
                <div id="div1-1-1-1">
                    <h1 id="header"> ¿Quieres organizarte mejor?</h1>
                    <div>



                        <center>
                            <!-- bloque de  ingreso informacion -->
                            <input id="correo-electronico" class="diseno" type="text" placeholder="nombre de usuario">
                            <span class="campovacio" id="campovacio-c1">Ingrese un correo valido</span><br>
                            <input id="pnombre-usuario" class="diseno" type="text" placeholder="primer nombre de usuario">
                            <input id="snombre-usuario" class="diseno" type="text" placeholder="segundo nombre de usuario">
                            <input id="papellido-usuario" class="diseno" type="text" placeholder="primer apellido de usuario">
                            <input id="sapellido-usuario" class="diseno" type="text" placeholder="segundo apellido de usuario">
                            <span class="campovacio" id="campovacio-c2">llene los  campos de nombre</span><br>
                            <input id="contraseña-usuario" class="diseno" type="password" placeholder="contraseña">
                            <span class="campovacio" id="campovacio-c3">Ingrese una contraseña</span><br>
                            <input id="fechaNacimiento" class="diseno" type="date" placeholder="fecha nacimiento anio-mes-dia">
                        </center>
                        <select id="select-pais">
                            <option >pais</option>
                            <?php
                                $consulta = "SELECT * FROM pais";
                                $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos"); 
                                while ($columna = mysqli_fetch_array( $resultado ))
                                {
                                	echo "<option value='".$columna['idpais']."'>";
                                	echo $columna['nombre'];
                                	echo "</option>";
                                }                            
                            ?>
                        </select>
                        <div class="row col-md-12">
                            <span class=" campovacio col-7" id="campovacio-c4" style="text-align: left">
                                seleciona pais
                            </span>
                        </div>

                        <!-- fin bloque de  ingreso informacion -->



                        <div id="txt-btm-rosado" class="campovacio">por favor rellenar todo los campos</div><br>
                        <!-- fin del bloque -->
                        <button id="btn-enviar-correo" class="boton-rosado boton-rosado-color-cambio" >
                            <p> Registrarse </p>
                        </button><br><br>
                        <!--<a href="Registro-numero.html"><p>deseas registrate con tu numero ></p></a>-->
                    </div>
                </div>
            </div>
        </div>
    </div>








    <!--******************* java script ********************************-->
    <script src="js/jquery.min.js"></script>
    <script src="js/script.js"></script>
    <!--******************* java script ********************************-->                                







</body>

</html>

<!-- Hecho por Kenny Molina -->