<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 01-12-2014
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>

<!-- Contenido de la p�gina -->

<div class="matter">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Tareas</div>
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
                                    <table class="display" cellpadding="0" cellspacing="0" border="0" width="100%"  style="margin-bottom: 10px;">
                                        <thead class="btn-default">
                                        <tr >
                                            <th>Codigo Tarea</th>
                                            <th>Descripcion</th>
                                            <th>Fecha de creacion</th>
                                            <th>Usuario Creador</th>
                                            <th>Historia de usuario origen</th>
                                            <th>Iterar Tarea</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listaTarea">
                                            <tr>
                                                <td><s:property value="idTarea"/></td>
                                                <td><s:property value="descripcionTarea"/></td>
                                                <td><s:property value="fechaCreacion"/></td>
                                                <td><s:property value="usuCreador"/></td>
                                                <td><s:property value ="nombreHistoria" /></td>
                                                <td>
                                                    <button type="button" class="btn btn-xs btn-info" onclick="javascript:generarIteracion(<s:property value="idTarea"/>,<%=request.getParameter("sprint")%>)">Iterar</button>
                                                </td>
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

<!-- modal 2 -->
<div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Generar Iteracion</h4>
            </div>
            <div class="modal-body" style="min-height: 350px">
                <form role="form" id="formIngIteracion">
                    <div class="form-group">
                        <label class="control-label">Consumo de esfuerzo:</label>
                        <input type="text" class="form-control" name="iteracionEsfuerzo" id="iteracionEsfuerzo">
                    </div>

                    <div class="col-lg-5">
                        <label class="control-label">Asignar Usuario:</label>
                        <s:select
                                name="iteracionUsuarioAsignado.usuLoginConexion"
                                id="iteracionUsuarioAsignado"
                                headerKey="-1"
                                headerValue="-- Asignar Usuario --"
                                list="listaUsuariosTarea"
                                listKey="usuLoginConexion"
                                listValue="usuLoginConexion"
                                cssClass="form-control"

                                />
                        <span class="glyphicon form-control-feedback" id="usuarios1"></span>
                    </div>


                    <input type="hidden" name="iteracionIdSprint" id="iteracionIdSprint">
                    <input type="hidden" name="iteracionIdTarea" id="iteracionIdTarea">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardarIteracion">Ingresar</button>
            </div>
        </div>
    </div>
</div>





<!-- Mainbar ends -->
<div class="clearfix"></div>


<!-- Content ends -->




<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a style="cursor:pointer;"><i class="fa fa-chevron-up"></i></a></span>



<!-- fin Contenido de la p�gina -->
<!-- Librerías JS para el tema macadmin -->
<script src="framework/datatable/jquery.dataTables2.js"></script>
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="framework/bootstrap-3.2.0/docs/assets/js/ie-emulation-modes-warning.js"></script>
<script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="framework/macAdminStyle/js/respond.min.js"></script>
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap-->
<!-- fin  Librer�as para el tema macadmin -->
<script>



    function generarIteracion(idtarea,idSprint) {
        $('#iteracionIdTarea').val(idtarea);
        $('#iteracionIdSprint').val(idSprint);
        $('#myModal').modal('show');
    }
    $(document).ready(function(){
        $('.modal').appendTo($('body'));
        $('#data-table').dataTable({
            destroy: true,
            sPaginationType: "full_numbers",
            paging: true,
            searching: true
        });
        $('#guardarIteracion').click(function(){
            $.ajax({
                url: "iteracionPrincipal",
                data: $('#formIngIteracion').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensajeDTO.tipo == "success"){

                        $('#myModal').modal('hide');
                        // $.growlUI(data.mensajeDTO.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: '.action',
                                success: function(data){
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });

                        }, 2000);
                    }
                    else{
                        $('#myModal').modal('hide');
                        //$.growlUI(data.mensajeDTO.texto);
                    }
                }
            });
        });


    }); // fin document ready
</script>

<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>
