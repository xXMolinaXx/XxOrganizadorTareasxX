<?php
    include 'conexion.php';
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>no te olvides de nada</title>
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
            <button id="txt-oferta"><h4>Bienvenidos a Make</h4></button>
        </div>

        <div class="collapse navbar-collapse col-md-4 col-lg- col-xl-">
            <a href="#"><button id="boton-nav-1" class="btn btn-outline-primary ">ingresar</button></a>
            <a href="Registro-correo.php"><button id="boton-nav-2" class="btn btn-primary btm btm "> registrarse </button></a>
        </div>


        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    </nav>

    <!-- segundo bloque de pagina de registro -->
    <div id="div-conectarse">
        <div id="div1-1">
            <div id="div1-1-1">
                <div id="div1-1-1-1">
                    <h1 id="header"> no te olvides de nada</h1>
                    <div>

                        <center>
                            <input id="correo-ingresar" type="text" class="diseno" placeholder="nombre de usuario"><br>
                            <br>
                            <input id="contra-ingresar" type="password" class="diseno" placeholder="Contraseña">
                            <span id="cvc">Tus datos son incorrectos. Vuelve a intentarlo.</span><br>


                        </center>
                        <br>
                         <button id="ingresar-correo" class="boton-rosado boton-rosado-color-cambio" >
                                <p> conectarse </p>
                            </button><br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="js/jquery.min.js"></script>
    <script src="js/script-conectarse-.js"></script>

</body>

</html>