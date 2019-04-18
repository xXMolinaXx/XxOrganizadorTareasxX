function validarCampoVacio(id){
    if(document.getElementById(id).value == ""){
        document.getElementById(id).classList.remove("is-valid");
        document.getElementById(id).classList.add("is-invalid");
        return false;
    }else{
        document.getElementById(id).classList.remove("is-invalid");
        document.getElementById(id).classList.add("is-valid");
        return true;
    }
}

//----COSAS QUE NO TENGO IDEA COMO ARREGLAR
//1-CUANDO LE DAS VARIAS VECES A "AGREGUE LISTA" SE CREAN VARIAS, PERO CUANDO LLEGA A 12 SE VA PARA ABAJO, Y LA IDEA ES QUE SIGA HORIZONTALMENTE
//2- NO SE ME CREA LA TARJETA NI LOS DIVS :(

function agregarInput(){
//esta función agrega los inputs necesarios para ir agregando las listas
    document.getElementById("input-nom-Lista").innerHTML +=
    '<div class="col-xl">'+
    '<input type="text" class="form-control" id="txt-nombre-lista" placeholder="Agrega el nombre a tu lista" >'+
    '<button type="submit" id="btn-agr-l" value="Añadir Lista" class="btn btn-sm btn-block btn-primary onclick="crearLista();">Añadir Lista</button></div>';
    }

//AQUI NO SÉ COMO OBTENER EL VALOR DEL INPUT Y PONERLO COMO DE TÍTULO

function crearLista(){
//esta función crea el contenedor de donde irá la lista y las tarjetas
    document.getElementById("div-List").innerHTML +=
    '<div class="js-list list-wrapper"><div class="list js-list-content"><div class="list-header js-list-header u-clearfix is-menu-shown">'
    + getElementById("txt-nombre-lista").value+    '<input type="text" class="form-control" id="txt-nombre-lista" placeholder="Agrega el nombre a tu lista" >'+
    '<button type="submit" id="btn-agr-l" value="Añadir Lista" class="btn btn-sm btn-block btn-primary onclick="crearLista();">Añadir Lista</button></div></div></div></div>'
    ;
}

function crearTarjeta(){
//esta función generará la ventana modal cada vez que se cree una tarjeta
'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Añadir Tarjeta</button>'+

'<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+
  '<div class="modal-dialog" role="document">'+
    '<div class="modal-content">'+
      '<div class="modal-header">'+
        '<h5 class="modal-title" id="exampleModalLabel">Cree su nueva tarjeta</h5>'+
        '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'+
          '<span aria-hidden="true">&times;</span>'+
        '</button>'+
      '</div>'+
      '<div class="modal-body">'+
        '<form>'+
          '<div class="form-group">'+
            '<label for="recipient-name" class="col-form-label">Nombre de la Tarjeta</label>'+
            '<input type="text" class="form-control" id="txt-nom-tar">'+
          '</div>'+
          '<div class="form-group">'+
            '<label for="message-text" class="col-form-label">Descripción</label>'+
            '<textarea class="form-control" id="txt-desc-tar"></textarea>'+
          '</div>'+
          '<div class="form-group">'+
            '<label class="col-form-label" id="l-fI">Fecha Inicio Tarea</label>'+
            '<input type="date" class="form-control" id="fecha-Inicio">'+
          '</div>'+
          '<div class="form-group">'+
            '<label class="col-form-label" id="l-fI">Fecha Máxima</label>'+
            '<input type="date" class="form-control" id="fecha-Maxima">'+
          '</div>'+
          '<div class="form-group">'+
            '<label class="col-form-label" id="l-fF">Fecha Fin Tarea</label>'+
            '<input type="date" class="form-control" id="fecha-Fin">'+
          '</div>'+
            '<div class="form-group row">'+
                '<div class="col-sm-2">CheckList</div>'+
                    '<div class="col-sm-10">'+
                        '<div class="form-check">'+
                            '<input class="form-check-input" type="checkbox" id="gridCheck1">'+
                            '<input type="text" class="form-control" id="txt-nom-tar">'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>+
        '</form>'+
      '</div>'+
      '<div class="modal-footer">'+
        '<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>'+
        '<button type="button" class="btn btn-primary" id="btn-Ag-Tar">Agregar Tarjeta</button>'+
      '</div>'+
    '</div>'+
  '</div>'+
'</div>'
}