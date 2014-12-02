<%-- 
    Document   : gestionarHistoria2
    Created on : 17-11-2014, 11:05:22
    Author     : Dvaldebenito
--%>
<!-- Control de sesión - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

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

            <div class="">
            <a type="button" class="action btn btn-default" id="crear" name="listaProyecto" style="margin-left: 20px;" >Crear</a>


        </div>
        <div class="container">
          <div class="row">
            <div class="col-md-12">

              <div class="widget ">
                <div class="widget-head">
                  <div class="pull-left ">Data Tables</div>
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
                                      <th>Descripcion</th>
                                      <th>Proyecto</th>
                                      <th>accion</th>
                                      <th>Subir archivo</th>
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
                                          <td><s:property value="descripcion"/></td>
                                          <td><s:property value="proyectoDTO.proNombre"/></td>
                                          <td><button class="btn btn-xs btnChico btn-warning mod" onclick="onClickEditarHistoria('<s:property value="hisId"/>')"> <span class="glyphicon glyphicon-edit" ></span></button></td>
                                          <td style="display: none"><s:property value="proyectoDTO.proId" /></td>
                                          <td><button class="btn btn-xs btnChico btn-danger mod" onclick="javascript:prueba(<s:property value="hisId"/>);">
                                              <span class="glyphicon glyphicon-edit" ></span></button></td>
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
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Historia</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="#" name="formModificarUsu">

                    <div class="form-group  has-feedback">
                        <label class="col-lg-2 control-label">Nombre HDU</label>
                        <div class="col-lg-5">
                            <input type="text" name="nombrehistoria" id="nombrehistoria" class="form-control" placeholder="Input Box">
                            <span class="glyphicon form-control-feedback" id="nombre1"></span>
                        </div>
                    </div>

                    <div class="form-group  has-feedback">
                        <label class="col-lg-2 control-label">Prioridad</label>
                        <div class="col-lg-5">
                            <input type="text" name="prioridad" id="prioridad" class="form-control">
                            <span class="glyphicon form-control-feedback" id="prioridad1"></span>
                        </div>
                    </div>
                    <div class="form-group  has-feedback">
                        <label class="col-lg-2 control-label">Eventum</label>
                        <div class="col-lg-5">
                            <input type="text" name="eventum" id="eventum" class="form-control" placeholder="Ingrese n° eventum">
                            <span class="glyphicon form-control-feedback" id="eventum1"></span>
                        </div>
                    </div>
                    <div class="form-group  has-feedback">
                        <label class="col-lg-2 control-label">Dependencia</label>
                        <div class="col-lg-5">
                            <input type="text" name="dependencia" id="dependencia" class="form-control">
                            <span class="glyphicon form-control-feedback" id="dependencia1"></span>
                        </div>
                    </div>

                    <div class="form-group  has-feedback">
                        <label class="col-lg-2 control-label">Descripcion</label>
                        <div class="col-lg-5">
                            <textarea class="form-control" name="descripcion" id="descripcion" rows="3" placeholder="Ingrese descripcion de historia"></textarea>
                            <span class="glyphicon form-control-feedback" id="descripcion1"></span>
                        </div>
                    </div>
                    <div class="form-group  has-feedback">
                        <label class="col-lg-2 control-label">Criterios de aceptacion</label>
                        <div class="col-lg-5">
                            <textarea class="form-control" name="criAceptacion" id="criAceptacion" rows="3" placeholder="Ingrese detalles"></textarea>
                            <span class="glyphicon form-control-feedback" id="aceptacion1"></span>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Guardar Cambios</button>
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
                        <!-- Modificado -->

                        <form action="cargaArchivo.action"   name="frmCarga" id="frmCarga" class="form-horizontal" method="POST" enctype="multipart/form-data">

                                    <input type="hidden" name ="idHdu" id="idHdu" />

                                    <div class="form-group has-feedback" style="margin-left: 100px;">
                                        <label class="col-lg-2 control-label">Archivo</label>
                                        <div class="col-lg-5" style="margin-left: 30px;">
                                            <div class='custom-input-file' >
                                                <input type="file" name="archivo" id="archivo" label="Archivo" class="file">
                                                Agregar archivos
                                            </div>
                                            <span class="glyphicon form-control-feedback" id="archivo1"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback" style="margin-left: 100px;">
                                    <label class="col-lg-2 control-label">Descripci&oacute;n</label>
                                        <div class="col-lg-9" style="margin-left: 30px;">
                                            <input type="text" class="form-control" name="descripcionRepo" id="descripcionRepo" label="Descripcion Archivo" rows="3" placeholder="Ingrese descripcionRepo archivo">
                                            <span class="glyphicon form-control-feedback" id="descripcionRepo1"></span>
                                        </div>
                                    </div>
                            <button type="submit" class="btn btn-primary" >Subir</button>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="btnSubirArchivo">Subir</button>
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
}); // fin document ready

function onClickEditarHistoria(id) {
   // alert("La historia que seleccionaste es la :"+id);

    $.ajax({
        type : 'POST',
        url : 'buscarData.action',
        data : {'idHis': id},
        success : function(data) {
            $('#nombrehistoria').val(data.historiaDTO.nombrehistoria);
            $('#myModal').modal('show');
        },
        error : function(erro) {
            alert("error servidor");
        }
    });


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