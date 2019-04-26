$("#btn-EP").click(function(){
    var parametros= "proyecto="+$("#pro").html();
    console.log("Informacion a enviar: " + parametros);
    $.ajax({
        url:"ajax/registr.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion  "+respuesta);
            if(respuesta==1){
             console.log("si entro");
             window.location = "html.php";   // con este definiremos a que pagina se redirecionara*/
            }
        }
    });
  }); 
