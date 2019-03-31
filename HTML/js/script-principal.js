$("#guardar-rolon").click(function(){
    var parametros= "artista="+$("#text-artista").val()+"&cancion="+$("#text-cancion").val()+
    "&genero="+$("#text-genero").val();
    console.log("Informacion a enviar: " + parametros);
    $("#guardar-rolon").attr("disabled",true);
    $.ajax({
        url:"ajax/canciones.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion  "+respuesta);
            $("#guardar-rolon").attr("disabled",true);
        }
    });
  }); 
function regargar(){
    location.reload();
    console.log("se supone que recargue la pagina");
}

/**********************peticion del boton de busqueda********************************************************** */
$("#btn-buscar").click(function(){
    var parametros= "dato="+$("#boton-buscar").val();
    console.log("Informacion a enviar: " + parametros);
    $('#canciones-encontradas').show();
    $("#p-ar").html("no se encontro la cancion");
    $("#p-ca").html("");
    $.ajax({
        url:"ajax/buscar-cancion.php",
        method:"Post",
        data:parametros,
        dataType:"json",
        success:function(respuesta){ 
            if(respuesta.mensaje=="no se encontro"){
            $("#canciones-encontradas").fadeOut(5000);
            }else{
                $("#p-ar").html(respuesta.artista);
                $("#p-ca").html(respuesta.cancion);
                $("#canciones-encontradas").fadeOut(5000);
            }

        },
        error:function(error){
            console.log(error);
        }
        
    });
  }); 