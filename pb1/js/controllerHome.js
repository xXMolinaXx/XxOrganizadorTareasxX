/*peticion ajax * */
$("#btn-ct").click(function(){
  var parametros= "npro="+$("#txt_nombre").val()+"&dpro="+$("#txt_descripcion").val()+"&us="+$("#nus").html();
  console.log("Informacion a enviar: " + parametros);
  $.ajax({
      url:"ajax/apro.php",
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