<?php
    include 'conexion.php';
    include 'seguridad.php';
    /*            select para traer el tipo de tablero    * */
    $consultatp = "SELECT pro.nombre,tp.nombre tipotablero FROM proyecto pro 
    INNER JOIN tipoproyecto tp on tp.idtablero=pro.idtablero
    WHERE pro.idtablero=". $_SESSION["idp"]."";
    $resultadotp = mysqli_query( $conexion, $consultatp ) or die ( "Algo ha ido mal en la consulta a la base de datos"); 
    $columnatp = mysqli_fetch_array( $resultadotp );

    /*select para traer los usuarios que estas asignados al tablero* */
    $consultauap = "SELECT * FROM uaproyecto uap
    INNER JOIN proyecto pro on pro.idtablero=uap.tablero_idtablero
    INNER JOIN usuario us on us.idusuario=uap.usuario_idusuario
    WHERE pro.idtablero=".$_SESSION["idp"]."  ";
    $resultadouap = mysqli_query( $conexion, $consultauap ) or die ( "Algo ha ido mal en la consulta a la base de datos"); 
    /*nombre de tablero* */
    $consultata="SELECT * FROM proyecto pro WHERE pro.idtablero=".$_SESSION["idp"]."    ";
    $resultadota = mysqli_query( $conexion, $consultata) or die ( "Algo ha ido mal en la consulta a la base de datos"); 

?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="generator" content="5">
    <title>Proyecto</title>

    <link rel="canonical" href="/docs/4.3/examples/pricing/">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">


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
    <!--<link href="pricing.css" rel="stylesheet">-->
  </head>
  <body>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h4 class="my-0 mr-md-auto font-weight-normal">MaKe:  <?php while ($columnata = mysqli_fetch_array( $resultadota )){  echo $columnata["nombre"]; } ?></h4>
    <form class="form-inline">
      <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
    </form>
  <nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark" href="home.php">Tableros</a>
   <a class="p-2 text-dark" href="salir.php">salir</a>
  </nav>
  <a class="btn btn-outline-primary" href="#">Notificaciones</a>
</div>
<div id="div-navcito">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="navbar-brand" id="idTablero"  ><?php echo  $_SESSION["idp"];?></div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <p class="nav-link" >TipoTablero-> <span class="sr-only"></span></p>
            </li>
            <li class="nav-item">
              <p class="nav-link" ><?php echo $columnatp['tipotablero']; ?></p>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Miembros del Equipo
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <?php
              while ($columnauap = mysqli_fetch_array( $resultadouap ))
              {  
                echo '<p class="dropdown-item" >'.$columnauap["correo"].'</p>';
              }  
                ?>  
              </div>
            </li>
          </ul>
        </div>
      </nav>
</div>
<!------------------------contenedor del las listas-------------------------------------------------------------->
<section id="slista" style="margin-bottom: 50px">
    <?php
       $consulta = "SELECT * FROM listas lis WHERE lis.tablero_idtablero=".$_SESSION["idp"]."";
       $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos"); 
       $consulta1 = "SELECT tar.nombre,tar.descripcion,tar.idtareas,tar.listas_idlistas lista,tar.fechaMaxima,tar.fechaIniciacion,exi.nombre exi FROM tareas tar  INNER JOIN listas lis on lis.idlistas=tar.listas_idlistas INNER JOIN proyecto pro on pro.idtablero=lis.tablero_idtablero INNER JOIN exigibilidad exi ON exi.idexigibilidad=tar.exigibilidad_idexigibilidad  WHERE pro.idtablero=".$_SESSION["idp"]."";
       $resultado1 = mysqli_query( $conexion, $consulta1 ) or die ( "Algo ha ido mal en la consulta a la base de datos"); 
       
       while ($columna = mysqli_fetch_array( $resultado ))
       {
        echo '<div class="lista" style="display: inline-block;">';
        echo '<p class="tlista">'.$columna['nombre'].'</p>';
        echo '<div>';
         while ($columna1 = mysqli_fetch_array( $resultado1 )){
            if($columna1['lista']==$columna['idlistas']){
            echo '<div class="dTarea">';
            echo '<p class="tarea" >'.$columna1['nombre'].' </p>';
            echo '<div class="tarea">';
            echo $columna1['descripcion'];
            echo '</div>';
            echo '<p class="tarea" >exigibilidad:  '.$columna1['exi'].' </p>';
            echo '<p class="tarea" >fecha de iniciacion:  '.$columna1['fechaIniciacion'].' </p>';
            echo '<p class="tarea" >fecha entrega:  '.$columna1['fechaMaxima'].' </p>';
            echo '</div>';
            }
           } 
           mysqli_data_seek($resultado1,0) ; 
        echo'</div>';
        echo '</div>';
       }  
       mysqli_data_seek($resultado1,0) ; 
       mysqli_data_seek($resultado,0) ;                           
     ?>
</section>
<!------------------------contenedor del las listas-------------------------------------------------------------->


<!--botones para agregar tarea-->
<div id='div-botones'>
  <!-- Button trigger modal de lista -->
<button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#AgregarLista">
  agregar Lista
</button>
<!-- Button trigger modal de tarea -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AgregarTarea">
    agregar tarea
  </button>
  <!-- Button trigger modal de cambiar lista de tarea-->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#CL">cambiar de lista</button>
<button type="button" class="btn btn-primary" id="btn-au" data-toggle="modal" data-target="#Agregarusuario">agregar usuario</button>

</div>



<!----------------------------------------------- Modal de lista ------------------------------------>
<div class="modal fade" id="AgregarLista" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agrege una lista nueva</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align: center;">
        <input type="text" id="tlista" placeholder="agrege titulo de lista">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="Alista">Agregar</button>
      </div>
    </div>
  </div>
</div>
<!-------------------------------- fin Modal ------------------------------------->

<!------------------------contenedor del las listas-------------------------------------------------------------->



  
  <!----------------------------------------------- Modal de tarea ------------------------------------>
  <div class="modal fade" id="AgregarTarea" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Agrege una tarea nueva</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" style="text-align: center">
          <input type="text" id="ntarea" placeholder="nombre" class='inputI'><br>
          <input type="texta" id="dtarea" placeholder="descripcion" class='inputI'><br>
          <select id="sexi" class='inputI'>
          <?php
              $consulta = "SELECT * FROM exigibilidad";
              $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos"); 
              while ($columna = mysqli_fetch_array( $resultado ))
              {
              	echo "<option value='".$columna['idexigibilidad']."'>";
              	echo $columna['nombre'];
              	echo "</option>";
              }                            
          ?>
          </select>
          <br>
          <p>fecha maxima para entregar</p>
          <input type="date" id="fmaxima" placeholder="fecha maxima anio-mes-dia" class='inputI'><br>
          <p>fecha fecha para empezar a trabajar</p>
          <input type="date" id="finiciacion" placeholder="fecha iniciacion anio-mes-dia" class='inputI'><br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="atarea">Agregar</button>
        </div>
      </div>
    </div>
  </div>
  <!-------------------------------- fin Modal ------------------------------------->
  <!-------------------------------- fin Modal ------------------------------------->
  <div class="modal fade" id="Agregarusuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Agregar usuario nuevo</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" style="text-align: center">
              <input type="text" placeholder='correo usuario agregar' id='itcorreo'>
                <div class="input-group mb-3">
              
               <div class="input-group-append">
               </div>
              </div>

              
              <select  id="nup">
              <?php
              $consultanu= "SELECT * FROM nivelusuario";
              $resultadonu = mysqli_query( $conexion, $consultanu ) or die ( "Algo ha ido mal en la consulta a la base de datos"); 
              while ($columnanu = mysqli_fetch_array( $resultadonu ))
              {
              	echo "<option value='".$columnanu['idnivelUsuario']."'>";
              	echo $columnanu['descripcion'];
              	echo "</option>";
              }                            
          ?>
              </select>
              <div class="alert alert-danger" role="alert" id='cne' style='display:none'>
                este usuario no existe
              </div>
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="ausuario">Agregar</button>
        </div>
      </div>
    </div>
  </div>
  <!-------------------------------- fin Modal ------------------------------------->
  <!----------------------------------------------- Modal de lista ------------------------------------>
<div class="modal fade" id="CL" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">cambiar de lista</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align: center;">
        <select  id="s-tarea">  
          <option value="">selecione la tarea</option>
          <?php
          while ($columna1 = mysqli_fetch_array( $resultado1 ))
              {
              	echo "<option value='".$columna1['idtareas']."'>";
              	echo $columna1['nombre'];
              	echo "</option>";
              }?>
        </select>
        <select  id="s-lista">
          <option value="">seleciones la lista</option>
          <?php
           $consultalista = "SELECT * FROM listas lis WHERE lis.tablero_idtablero=".$_SESSION["idp"]."";
           $resultadolista = mysqli_query( $conexion, $consultalista ) or die ( "Algo ha ido mal en la consulta a la base de datos");     
          while ($columnalista = mysqli_fetch_array( $resultadolista ))
            {
            	echo "<option value='".$columnalista['idlistas']."'>";
            	echo $columnalista['nombre'];
            	echo "</option>";
            }
          ?>
        </select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="cambiar-lista">cambiar lista</button>
      </div>
    </div>
  </div>
</div>
<!-------------------------------- fin Modal ------------------------------------->

<!-- script del proyecto-->  
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/controller.js"></script>


<!-- script del proyecto-->


</body>
</html>
