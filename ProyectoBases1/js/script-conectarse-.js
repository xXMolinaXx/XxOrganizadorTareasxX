/*******************************Peticion asincrona ajax************************************************ */
$("#ingresar-correo").click(function(){
    var parametros= "correo="+$("#correo-ingresar").val()+"&contrasena="+$("#contra-ingresar").val();
    console.log("Informacion a enviar: " + parametros);
    $.ajax({
        url:"ajax/ingresar.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion y su respuesta es:  "+respuesta);
            if(respuesta==1){
                console.log("-----------vamos a entrar------hola------------------");
                location.assign("html.html");
            }else
            console.log('hubo algun problema');
            $("#cvc").css("display", "block");
        },
        error:function(error){
            console.log(error);
        },
        
    });
  });  