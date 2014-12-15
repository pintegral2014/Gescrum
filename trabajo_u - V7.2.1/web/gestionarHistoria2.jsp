<%-- 
    Document   : gestionarHistoria2
    Created on : 17-11-2014, 11:05:22
    Author     : Dvaldebenito
--%>
<!-- Control de sesión - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar historias de husario</title>
    <script src="framework/jquery/jquery.validate.js"></script>
    <script src="framework/jquery/login.validate.2.js" type="text/javascript"></script>
    <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
    <script src="framework/datatable/jquery.dataTables2.js"></script>
    <script src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
    <style type="text/css">
        div.growlUI{
            background: black;
            position: absolute;
        }
        div.growlUI{
            color: #ffffff;
            padding: 10px;
        }
    </style>

</head>
<body>

        <div class="matter" id="contenido">
            <% if(!session.getAttribute("rol").equals("Desarrollador") && !session.getAttribute("rol").equals("Analista QA")){ %>
            <div class="">
            <a type="button" class="action btn btn-default" id="crear" name="listaProyecto" style="margin-left: 20px;" >Crear</a>
            </div>
            <% } %>

        <div class="container">
          <div class="row">
            <div class="col-md-12">

              <div class="widget ">
                <div class="widget-head">
                  <div class="pull-left ">Historias</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <!--<a href="#" class="wclose"><i class="fa fa-times"></i></a>-->
                  </div>  
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content">
                  <div class="padd">

                      <!-- Table Page -->
                      <div class="page-tables">
                          <!-- Table -->
                          <div class="table-responsive">
                              <!-- aqui comienza el data table-->
                              <table class="table table-collase table-condensed table-responsive" cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%">
                                  <thead class="btn-default">
                                  <tr >
                                      <th>ID</th>
                                      <th>Nombre</th>
                                      <th>Prioridad</th>
                                      <th>Solicitado Por</th>
                                      <th>Descripcion</th>
                                      <th>Proyecto</th>
                                      <% if(!session.getAttribute("rol").equals("Desarrollador") && !session.getAttribute("rol").equals("Analista QA") ){ %>
                                      <th>Modificar/Eliminar</th>
                                      <th>Subir archivo</th>
                                      <% } %>
                                      <th>Descargar archivo</th>
                                      <th style="display: none"></th>

                                  </tr>
                                  </thead>
                                  <tbody>
                                  <s:iterator value="listHistorias" >

                                      <tr>
                                          <td><s:property value="hisId"/></td>
                                          <td><s:property value="nombrehistoria"/></td>
                                          <td><s:property value="prioridad"/></td>
                                          <td><s:property value="solicitadoPor"/></td>
                                          <td><s:property value="descripcion"/></td>
                                          <td><s:property value="proyectoDTO.proNombre"/></td>
                                          <% if(!session.getAttribute("rol").equals("Desarrollador") && !session.getAttribute("rol").equals("Analista QA")){ %>
                                          <td>
                                              <button class="btn btn-xs btnChico btn-warning mod" onclick="onClickEditarHistoria('<s:property value="hisId"/>','<s:property value="nombrehistoria"/>')"> <span class="glyphicon glyphicon-edit" ></span></button>
                                              <button class="btn btn-xs btnChico btn-danger mod" data-toggle="tooltip" data-placement="bottom" title="eliminar hdu"
                                                      onclick="onClickBorrarHdu('<s:property value="hisId"/>')">
                                                  <span class="glyphicon glyphicon-remove" ></span>
                                              </button>
                                          </td>

                                          <td><button class="btn btn-xs btnChico btn-danger mod" onclick="javascript:prueba(<s:property value="hisId"/>);">
                                              <span class="glyphicon glyphicon-edit" ></span></button></td>
                                          <% } %>
                                          <td style="display: none"><s:property value="proyectoDTO.proId" /></td>
                                          <td><form name="frmDescarga" method="POST" action="descarga.action">
                                              <input type="hidden" name="idHdu"value=<s:property value="hisId"/> >
                                              <input type="submit" class="btn btn-xs btn-success mod">
                                          </form></td>
                                      </tr>
                                  </s:iterator>
                                  </tbody>

                              </table>
                              <div class="clearfix"></div>
                          </div>
                      </div>
                  </div>
                </div>

					
                  </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
                </div>
              </div>  
              <!-- -->
            </div>
        </div>
        
        <!-- Mainbar ends -->	    	
   <div class="clearfix"></div>
   




<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

<!-- Matter ends -->

</div>

<!-- Mainbar ends -->
<div class="clearfix"></div>

</div>
<!-- Content ends -->


<!-- MODAL MOD HISTORIA -->
        <div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Modificar Historia</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" id="formModHis">
                            <div class="form-group" style="display: none">
                                <label class="control-label">id:</label>
                                <input type="text" class="form-control" name="hisId" id="hisId" readonly>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Historia:</label>
                                <input type="text" class="form-control" name="nombrehistoria" id="nombrehistoria" readonly>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Prioridad:</label>
                                <input type="text" class="form-control" name="prioridad" id="prioridad">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Solicitado Por:</label>
                                <input type="text" class="form-control" name="solicitadoPor" id="solicitadoPor" >
                            </div>
                            <div class="form-group">
                                <label class="control-label">Eventum:</label>
                                <input type="text" class="form-control" name="eventum" id="eventum" >
                            </div>
                            <div class="form-group">
                                <label class="control-label">Dependencia:</label>
                                <input type="text" class="form-control" name="dependencia" id="dependencia">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Descripcion:</label>
                                <textarea class="form-control" name="descripcion" id="descripcion" rows="3" style="resize: none; overflow-y: scroll;" ></textarea >
                            </div>
                            <div class="form-group">
                                <label class="control-label">Criterios de Aceptacion:</label>
                                <textarea class="form-control" name="criAceptacion" id="criAceptacion" rows="3" style="resize: none; overflow-y: scroll;" ></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="guardarModhis">Guardar Cambios</button>
                    </div>
                </div>
            </div>
         </div>

        <div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Subir Archivo</h4>
                    </div>
                    <div class="modal-body" style="width: 500px; height: 200px;">

                        <iframe src="http://www.virtualnauta.com"  frameborder="0"></iframe>

                    </div>

                </div>
            </div>
        </div>

        <!-- Librerías JS para el tema macadmin -->

<script>


$(document).ready(function() {
    $('.modal').appendTo($('body'));

    $('#data-table').dataTable({
        destroy: true,
        "sPaginationType": "full_numbers",
        paging: true,
        searching: true
    });


    $('#crear').click(function(){
        var action = this.name;
        $.ajax({
            url: action +'.action',
            success: function(data){
                $('#contenido').html(data);
            }
        })
    });
    $('#guardarModhis').click(function(){
        $.ajax({
            url: "modDataHis.action",
            data: $('#formModHis').serializeArray(),
            type:"post",
            dataType:"json",
            success: function (data) {

                if(data.mensaje.tipo == "success"){

                    $('#myModal').modal('hide');
                    $.growlUI(data.mensaje.texto);
                    setTimeout(function(){

                        $.ajax({
                            url: 'listarHistorias.action',
                            success: function(data){
                                $('#contenidoPagina').html("");
                                $('#contenidoPagina').html(data);
                            }
                        });

                    }, 2000);
                }
                else{
                    $('#myModal').modal('hide');
                    $.growlUI(data.mensaje.texto);
                }
            }
        });
    });

}); // fin document ready

function onClickEditarHistoria(id) {
   // alert("La historia que seleccionaste es la :"+id);

    $.ajax({
        type : 'POST',
        url : 'buscarData.action',
        data : {'idHis': id},
        success : function(data) {
            $('#hisId').val(data.historiaDTO.hisId);
            $('#nombrehistoria').val(data.historiaDTO.nombrehistoria);
            $('#prioridad').val(data.historiaDTO.prioridad);
            $('#eventum').val(data.historiaDTO.eventum);
            $('#dependencia').val(data.historiaDTO.dependencia);
            $('#descripcion').val(data.historiaDTO.descripcion);
            $('#criAceptacion').val(data.historiaDTO.criAceptacion);
            $('#solicitadoPor').val(data.historiaDTO.solicitadoPor)
            $('#myModal').modal('show');
        },
        error : function(erro) {
            alert("error servidor");
        }
    });
}
function onClickBorrarHdu(idHis, nomHis){
    var confirmar = confirm(String.fromCharCode(191)+"Esta seguro que desea eliminar la HDU?");
    if(confirmar == true){
        $.ajax({
            type:'post',
            url:'borrarHistoria.action',
            data:{'hisId':idHis,
                  'nombrehistoria': nomHis},
            success: function(data){
                if(data.mensaje.tipo == "success"){

                    $.growlUI(data.mensaje.texto);
                    setTimeout(function(){

                        $.ajax({
                            url: 'listarHistorias.action',
                            success: function(data){
                                $('#contenidoPagina').html("");
                                $('#contenidoPagina').html(data);
                            }
                        });

                    }, 4000);
                }
                else{

                    $.growlUI(data.mensaje.texto);
                }
            }
        });
    }
}
function prueba(idHdu)
{
    $('#idHdu').val(idHdu);

    $('#upload').modal('show')
}
function pruebadescarga(idHdu)
{
    $('#idHdu').val(idHdu);
    $('#upload').modal('hide');
    $('#download').modal('show');
}
</script>
<!--ver funciones propias de cada página -->
</body>

<!-- Control de sesión - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>