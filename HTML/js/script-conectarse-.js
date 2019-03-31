function ingresar(){
    var ingreso0=false;
    var ingreso1=false;
    ingreso0=validoCorreo();
    ingreso1=validoContra();
    if(ingreso0 && ingreso1){
        document.getElementById("link-entrada").href="principal.html";
    }

}
function validoCorreo(){
    if(document.getElementById("correo-ingresar").value==""){
    document.getElementById("cvc").style.display="block";
    }
    else{
    document.getElementById("cvc").style.display="none";
    }
}
function validoContra(){
    if(document.getElementById("contra-ingresar").value==""){
    document.getElementById("cvc").style.display="block";
    }
    else{
    document.getElementById("cvc").style.display="none";
    }
}
/*******************************Peticion asincrona ajax************************************************ */
$("#ingresar-correo").click(function(){
    var parametros= "correo="+$("#correo-ingresar").val()+"&contrasena="+$("#contra-ingresar").val();
    console.log("Informacion a enviar: " + parametros);
    $.ajax({
        url:"ajax/leer.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion y su respuesta es:  "+respuesta);
            if(respuesta=="si leimos el archivo en el json"){
                alert("-----------vamos a entrar------------------------");
                location.assign("principal.php");
            }else
            alert(" ************no vamos a entrar********************");
        },
        error:function(error){
            console.log(error);
        },
        
    });
  });  