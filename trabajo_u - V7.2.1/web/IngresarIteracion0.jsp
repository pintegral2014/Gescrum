<% if (session.getAttribute("loginConexion")!=null){%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 13-12-2014
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>


<div class="matter" id="contenido">
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div class="widget ">
                <div class="widget-head">
                    <div class="pull-left ">Tareas sin iteraciones</div>
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
                                <table cellpadding="0" cellspacing="0" border="0" class="display" width="100%">
                                    <thead class="btn-default">
                                    <tr style ="font-size: 12px">
                                        <th>Codigo Tarea</th>
                                        <th>Descripcion</th>
                                        <th>Fecha de creacion</th>
                                        <th>Usuario Creador</th>
                                        <th>Historia de usuario origen</th>
                                        <th>Asociar tarea</th>


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
                                                <button type="button" class="btn btn-xs btn-info" onclick="javascript:generarIteracion0(<s:property value="idTarea"/>,<%=request.getParameter("sprint")%>)">Iterar 0</button>
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
</div>
</div>

<div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Generar Iteracion 0</h4>
            </div>
            <div class="modal-body" style="min-height: 350px">
                <form role="form" id="formIngIteracion">
                    <div class="form-group">
                        <label class="control-label">Esfuerzo Necesario:</label>
                        <input type="text" class="form-control" name="iteracionEsfuerzo" id="iteracionEsfuerzo">
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

<script src="framework/macAdminStyle/js/bootstrap.min.js"></script>
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
<script>
    function generarIteracion0(idtarea,idSprint){

            $('#iteracionIdTarea').val(idtarea);
            $('#iteracionIdSprint').val(idSprint);
            $('#myModal').modal('show');

    }

    $(document).ready(function(){

        $('.modal').appendTo($('body'));
        $('table.display').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true,
            "iDisplayLength": 5
        });
        $('#guardarIteracion').click(function(){
            $.ajax({
                url: "iteracionSecundaria.action",
                data: $('#formIngIteracion').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensaje.tipo == "success"){

                        $('#myModal').modal('hide');
                        $.growlUI(data.mensaje.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listaTareasIteracion0.action?hduTarID=<%=request.getParameter("hduTarID")%>&sprint=<%=request.getParameter("sprint")%>',
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

</script>

<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>