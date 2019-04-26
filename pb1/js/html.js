/**************************registro correo peticion ajax**************************************************************/      
$("#enbuton").click(function(){
    var parametros= "idpro="+$("#idpro").val();
    console.log("Informacion a enviar: " + parametros);
    $.ajax({
        url:"ajax/itablero.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion  "+respuesta);
            if(respuesta==1){
             console.log("si entro");
             window.location = "lista.php";   // con este definiremos a que pagina se redirecionara*/
            }
            
        }
    });
  }); 
