$(document).ready(function(){
    cargarUsuarios();
});

function cargarUsuarios(){
    $("#tabla-canciones").html("");
    $.ajax({
        url:"ajax/cargar-canciones.php",
        dataType:"json",
        success: function(respuesta){
             console.log(respuesta);
             for (var i=0;i<respuesta.length;i++){
                 $("#tabla-canciones").append(
                     `<tr>
                     <td>${i}</td>
                     <td>${respuesta[i].cancion}</td>
                     <td>${respuesta[i].artista}</td>
                     <td>${respuesta[i].genero}</td>
                     </tr>`
                 );
             }
        },
        error:function(error){
            console.log(error);
        }
     });
}