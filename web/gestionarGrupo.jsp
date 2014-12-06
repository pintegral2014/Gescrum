<%--
    Document   : asociarHistoria2
    Created on : 17-11-2014, 13:52:32
    Author     : NFuenzalida
--%>
<!-- Control de sesion - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
<script src="framework/datatable/jquery.dataTables2.js"></script>
<script src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
<style type="text/css">
    div.growlUI{
        background: black no-repeat 10px 10px;
        position: absolute;
    }
    div.growlUI{
        color: #ffffff;
        padding: 10px;
    }
</style>
<script>
    $(document).ready(function(){
        $('.modal').appendTo($('body'));
        $('#data-table').dataTable({
            destroy: true,
            sPaginationType: "full_numbers",
            paging: true,
            searching: true
        });
        $('#guardarModGru').click(function(){
            $.ajax({
                url: "modDataGru.action",
                data: $('#formModGru').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensajeDTO.tipo == "success"){

                        $('#myModal').modal('hide');
                        $.growlUI(data.mensajeDTO.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listaGrupos2.action',
                                success: function(data){
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });

                        }, 2000);
                    }
                    else{
                        $('#myModal').modal('hide');
                        $.growlUI(data.mensajeDTO.texto);
                    }
                }
            });
        });
    });

    function onClickEditarGrupo(id) {
        //alert("La historia que seleccionaste es la :"+id);

        $.ajax({
            type : 'POST',
            url : 'DataGrupo.action',
            data : {'idGru': id},
            success : function(data) {
                $('#gruId').val(data.grupoDTO.gruId);
                $('#gruNombre').val(data.grupoDTO.gruNombre);
                $('#gruDescripcion').val(data.grupoDTO.gruDescripcion);
                $('#gruEstado').val(data.grupoDTO.gruEstado);
                $('#myModal').modal('show');
            },
            error : function(erro) {
                alert("error servidor");
            }
        });
    }
</script>

<div class="matter">
    <div>
        <a type="button" class="action btn btn-default" id="listaProyecto" style="margin-left: 20px;" >Crear</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Grupos</div>
                        <div class="widget-icons pull-right">
                            <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="widget-content">
                        <div class="padd">

                            <!-- Table Page -->
                            <div class="page-tables">
                                <!-- Table -->
                                <div class="table-responsive">
                                    <table cellpadding="0" cellspacing="0" border="0" class="table-collase table-condensed table-responsive" id="data-table" width="100%" style="margin-bottom: 10px;">
                                        <thead class="btn-default">
                                        <tr >
                                            <th>ID</th>
                                            <th>Grupo</th>
                                            <th>Descripcion</th>
                                            <th>Estado</th>
                                            <th>Usuario Creador</th>
                                            <th>Fecha Creacion</th>
                                            <th>Fecha Modificacion</th>
                                            <th>Modificar</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listagrupo">
                                            <tr>
                                                <td><s:property value="gruId"/></td>
                                                <td><s:property value="gruNombre"/></td>
                                                <td><s:property value="gruDescripcion"/></td>
                                                <td><s:property value="gruEstado"/></td>
                                                <td><s:property value="gruUsuCreador"/></td>
                                                <td><s:property value="gruFechaCre"/></td>
                                                <td><s:property value="gruFechaMod"/></td>
                                                <td><button class="btn btn-xs btn-warning mod btnChico" onclick="onClickEditarGrupo('<s:property value="gruId"/>')"> <span class="glyphicon glyphicon-edit" ></span></button></td>
                                            </tr>
                                        </s:iterator>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="div-results"></div>

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

<!-- MODAL MOD GRUPO -->
<div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Modificar Proyecto</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="formModGru">
                    <div class="form-group" style="display: none;">
                        <label class="control-label">ID Grupo:</label>
                        <input type="text" class="form-control" name="gruId" id="gruId">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nombre Grupo:</label>
                        <input type="text" class="form-control" name="gruNombre" id="gruNombre">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Descripcion:</label>
                        <input type="text" class="form-control"  name="gruDescripcion" id="gruDescripcion">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Estado:</label>
                        <input type="text" class="form-control"  name="gruEstado" id="gruEstado">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardarModGru">Guardar Cambios</button>
            </div>
        </div>
    </div>
</div>

<!-- fin Contenido de la p�gina -->


<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>