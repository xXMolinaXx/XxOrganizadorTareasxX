 var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
/*******Javasript de Registro-numero*********/
function activar(){
    var respuesta0=false;
    var respuesta1=false;
    var respuesta2=false;
    respuesta0=Inumero();
    respuesta1=select1();
    respuesta2=select2();
    if(respuesta0 && respuesta1 && respuesta2){
    alert("si vamo a entrar");
    document.getElementById("link-entrada").href="principal.html";
}
    else
    alert("no vamo a entrar")
}
/*-------------------------------------------------------------------------------------------- */
function Inumero(){
    if(document.getElementById("inputnumero").value =="0"){
        document.getElementById("campovacio-1").style.display="block";
        return false;
    }else{
        document.getElementById("campovacio-1").style.display="none";
        return true;
    }
}
function select1(){
    if(document.getElementById("select-genero").value=="sexo"){
        document.getElementById("campovacio-2").style.display="block";
        document.getElementById("select-genero").style.color="#FE447D";
        return false;
    }else{
        document.getElementById("campovacio-2").style.display="none";
        document.getElementById("select-genero").style.color="black";
        return true;        
    }

}

function select2(){
     if(document.getElementById("select-edad").value=="edad"){
        document.getElementById("campovacio-3").style.display="block";
        document.getElementById("select-edad").style.color="#FE447D";
        return false;
    }else{
        document.getElementById("campovacio-3").style.display="none";
        document.getElementById("select-edad").style.color="black";
        return true;
    }

}
/*----------------------------------------------------------------------------------------- */






// *********REGISTRO CON CORREO***********

function guardar(){
    var respuesta0=false;
    var respuesta1=false;
    var respuesta2=false;
    var respuesta3=false;
    var respuesta4=false;
    respuesta0=Verificar1(); 
    respuesta1=Verificar2();
    respuesta2=Verificar3();
    respuesta3=Verificar4();
    respuesta4=Verificar5();
    if(respuesta0 && respuesta1 && respuesta2 && respuesta3 && respuesta4){
        alert("si vamo a entrar");      
    } else
    alert("no vamo a entrar")
}


function Verificar1(){
    if(document.getElementById("correo-electronico").value == ""){
        document.getElementById("campovacio-c1").style.display="block";
        return false;
    }else{
        document.getElementById("campovacio-c1").style.display="none";    
        return true;
    }
}
function Verificar2(){
    if(document.getElementById("nombre-usuario").value == ""){
        document.getElementById("campovacio-c2").style.display="block";
        return false;
    }else{
        document.getElementById("campovacio-c2").style.display="none";    
        return true;
    }
    
}
function Verificar3(){
    if(document.getElementById("contraseña-usuario").value == ""){
        document.getElementById("campovacio-c3").style.display="block";
        return false;
    }else{
        document.getElementById("campovacio-c3").style.display="none";    
        return true;
    }
        
}

function Verificar4(){
    if(document.getElementById("select-genero").value =="sexo"){
        document.getElementById("campovacio-c4").style.display="block";
        return false;
    }else{
        document.getElementById("campovacio-c4").style.display="none";    
        return true;
    }
        
}
function Verificar5(){
        if(document.getElementById("select-edad").value =="edad"){
            document.getElementById("campovacio-c5").style.display="block";
            return false;
        }else{
            document.getElementById("campovacio-c5").style.display="none";    
            return true;
        }
            
        }                                    
/*----------------------peticiones asincornas-------------------------------------------- */
    $("#btn-enviar-numero").click(function(){
        alert("Se ejecutará una peticion asincrona");
        var parametros= "pais="+$("#select-pais").val()+"&numero="+$("#inputnumero").val()+
        "&sexo="+$("#select-genero").val()+"&edad="+$("#select-edad").val()+
        "&pagina=registronumero";
        console.log("Informacion a enviar: " + parametros);
        $.ajax({
            url:"ajax/archivos.php",
            method:"Post",
            data:parametros,
            dataType:"html",
            success:function(respuesta){ 
                console.log("El servidor hizo la peticion  "+respuesta);
            }
        });
      });  

/**************************registro correo peticion ajax**************************************************************/      
      $("#btn-enviar-correo").click(function(){
        var parametros= "correo="+$("#correo-electronico").val()+"&nomusuario="+
        $("#nombre-usuario").val()+"&contrasena="+$("#contraseña-usuario").val()+
        "&sexo="+$("#select-genero").val()+"&edad="+$("#select-edad").val()+"&pagina=registrocoreo"
        console.log("Informacion a enviar: " + parametros);
        $.ajax({
            url:"ajax/archivos.php",
            method:"Post",
            data:parametros,
            dataType:"html",
            success:function(respuesta){ 
                console.log("El servidor hizo la peticion  "+respuesta);
                if(respuesta==1){
                 console.log("si entro");
                 window.location = "principal.php";
                }
            }
        });
      });  