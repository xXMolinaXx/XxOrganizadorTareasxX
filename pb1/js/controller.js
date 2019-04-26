/*******************************Peticion asincrona ajax lista************************************************ */
$("#Alista").click(function(){
  var parametros= "nlista="+$("#tlista").val()+"&idp="+$("#idTablero").html();
  console.log("Informacion a enviar: " + parametros);
  $.ajax({
      url:"ajax/alista.php",
      method:"Post",
      data:parametros,
      dataType:"html",
      success:function(respuesta){ 
          console.log("El servidor hizo la peticion y su respuesta es:  "+respuesta);
          if(respuesta==1){
              console.log("agregada corectamente");
              location.reload();
          }else
          console.log('hubo algun problema en el procedimiento almacenado');
      },
      error:function(error){
          console.log(error);
      },
      
  });
}); 

/*******************************Peticion asincrona ajax tarea************************************************ */
$("#atarea").click(function(){
  var parametros= "ntarea="+$("#ntarea").val()+"&dtarea="+$("#dtarea").val()+"&exi="+$("#sexi").val()
  +"&fmaxima="+$("#fmaxima").val()+"&finiciacion="+$("#finiciacion").val()+"&idp="+$("#idTablero").html();
  console.log("Informacion a enviar: " + parametros);
  $.ajax({
      url:"ajax/atarea.php",
      method:"Post",
      data:parametros,
      dataType:"html",
      success:function(respuesta){ 
          console.log("El servidor hizo la peticion y su respuesta es:  "+respuesta);
          if(respuesta==1){
            console.log("agregada corectamente");
            location.reload();
          }else
          console.log('hubo algun problema en el procedimiento almacenado');
      },
      error:function(error){
          console.log(error);
      },
      
  });
}); 

/*******************************Peticion asincrona ajax usuario************************************************ */
$("#ausuario").click(function(){
    var parametros= "correo="+$("#itcorreo").val()+"&privilegio="+$("#nup").val()+"&idp="+$("#idTablero").html();
    console.log("Informacion a enviar: " + parametros);
    $.ajax({
        url:"ajax/ausuario.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion y su respuesta es:  "+respuesta);
            if(respuesta==1){
              console.log("agregada corectamente");
              location.reload();
            }else
            console.log('hubo algun problema en el procedimiento almacenado');
            $("#cne").css("display", "block");
        },
        error:function(error){
            console.log(error);
        },
        
    });
  }); 

/*******************************Peticion asincrona ajax cambiar lista************************************************ */
$("#cambiar-lista").click(function(){
    var parametros= "idlista="+$("#s-lista").val()+"&idtarea="+$("#s-tarea").val();
    console.log("Informacion a enviar: " + parametros);
    $.ajax({
        url:"ajax/cambiarlista.php",
        method:"Post",
        data:parametros,
        dataType:"html",
        success:function(respuesta){ 
            console.log("El servidor hizo la peticion y su respuesta es:  "+respuesta);
            if(respuesta==1){
              console.log("agregada corectamente");
              location.reload();
            }
        },
        error:function(error){
            console.log(error);
        },
        
    });
  }); 
