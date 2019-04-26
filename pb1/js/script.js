/**************************registro correo peticion ajax**************************************************************/      
$("#btn-enviar-correo").click(function(){
    var parametros= "correo="+$("#correo-electronico").val()+"&pnomusuario="+
    $("#pnombre-usuario").val()+"&snomusuario="+
    $("#snombre-usuario").val()+"&papeusuario="+
    $("#papellido-usuario").val()+"&sapeusuario="+
    $("#sapellido-usuario").val()+
    "&fechanacimiento="+$("#fechaNacimiento").val()+
    "&contrasena="+$("#contraseña-usuario").val()+
    "&pais="+$("#select-pais").val()
    console.log("Informacion a enviar: " + parametros);
    $.ajax({
        url:"ajax/registrar.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion  "+respuesta);
            if(respuesta==1){
             console.log("si entro");
             window.location = "home.php";   // con este definiremos a que pagina se redirecionara*/
            }
            if(respuesta==0){
                console.log('No se ingresaron datos');
                $("#campovacio-c1").css("display", "block");
                $("#campovacio-c2").css("display", "block");
                $("#campovacio-c3").css("display", "block");
                $("#campovacio-c4").css("display", "block");
               }
        }
    });
  }); 

