<?php
    include 'seguridad.php' ;
    include 'conexion.php';
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>MaKe</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/album/">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
<link href="/docs/4.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="album.css" rel="stylesheet">
  </head>
  <body>
    <header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row"> 
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">que puedes hacer?</h4>
          <p class="text-muted">en esta plataforma puedes organizar desde tus actividades diarias o organizar las tareas dentro de tu empresa </p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contactanos</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">siguenos en Twitter</a></li>
            <li><a href="#" class="text-white">siguenos en Facebook</a></li>
            <li><a href="#" class="text-white">escribenos</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <div  class="navbar-brand d-flex align-items-center" style="margin-right: 450px;">
        <strong>MaKe bienvenido:</strong> <strong id="nus"><?php echo $_SESSION["correo"];?></strong>
      </div>
      <a class="text-white" href="salir.php">salir</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
    </div>
  </div>
</header>

<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">¡Organize sus proyectos!</h1>
      <p class="lead text-muted">No te olvides de nada</p>
      <p>
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Crear Proyecto</button>
          <button id='enbuton' class="btn btn-primary">entrar</button> 
      </p>
      <select id="idpro">
        <option>selecione un proyecto</option>
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
    
    </div>
  </section>



  <div class="album py-5 bg-light" id="tableros" style='padding: 130px;'>
  <?php
        $consulta = 'SELECT pro.nombre,pro.descripcion,pro.idtablero FROM proyecto pro
        INNER JOIN uaproyecto uap on uap.tablero_idtablero=pro.idtablero
        INNER JOIN usuario us on us.idusuario=uap.usuario_idusuario
        WHERE us.correo="'.$_SESSION['correo'].'"';
        $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos ok"); 
        while ($columna = mysqli_fetch_array( $resultado ))
        {
            echo    '<div class="div-pro" >';
            echo    '<h1 style="border-bottom: solid;color: darkcyan;">'.$columna['nombre'].'</h1>';
            echo    '<h3>'.$columna['descripcion'].'</h3>';
            echo    '</div>';
        }   
        
        
    ?>


  </div>




</main>
<!------------------------ventana modal para crear tablero------------------------------------------------>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Nuevo Proyecto</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Nombre</label>
              <input type="text" class="form-control" id="txt_nombre">
            </div>
            <div class="form-group">
              <label for="message-text" class="col-form-label">Descripción</label>
              <textarea class="form-control" id="txt_descripcion"></textarea>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" id="btn-ct">Crear Proyecto</button>
        </div>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/controllerHome.js"></script>
  <script src="js/jquery.min.js"></script>
  <script src="js/prueba.js"></script>
  <script src="js/html.js"></script>


  </body>
</html>