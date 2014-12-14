<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 30-11-2014
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>

<%@ taglib prefix="s" uri="/struts-tags" %>




<div class="matter">
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
                                            <th>Grupo</th>
                                            <th>Descripcion</th>
                                            <th>Generar Sprint</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listagrupo">
                                            <tr>
                                                <td><s:property value="gruId"/></td>
                                                <td><s:property value="gruNombre"/></td>
                                                <td><s:property value="gruDescripcion"/></td>
                                                <td><button class="btn btn-info" onclick="javascript:onClickGenerarSprint('<s:property value="gruId"/>')">Sprint</button></td>

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

<!-- modal 2 -->
<div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Generar Sprint</h4>
            </div>
            <div class="modal-body" style="min-height: 350px">
                <form role="form" id="formIngSprint">
                    <div class="form-group">
                        <label class="control-label">Sprint Nombre:</label>
                        <input type="text" class="form-control" name="nombreSprint" id="nombreSprint">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Sprint Descripcion:</label>
                        <input type="text" class="form-control" name="descripcionSprint" id="descripcionSprint">
                    </div>

                        <input type="hidden" name="usuCreadorSprint" id="usuCreadorSprint" value="<%=session.getAttribute("loginConexion")%>">
                        <input type="hidden" name="gruSprintId" id="gruSprintId">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardarSpint">Ingrsar</button>
            </div>
        </div>
    </div>
</div>
</div>



<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>


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
<!-- fin  Librerías para el tema macadmin -->
<script>
    $(document).ready(function(){
        $('.modal').appendTo($('body'));
        $('#data-table').dataTable({
            destroy: true,
            sPaginationType: "full_numbers",
            paging: true,
            searching: true
        });
        $('#guardarSpint').click(function(){
            $.ajax({
                url: "ingresaSprint.action",
                data: $('#formIngSprint').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensajeDTO.tipo == "success"){

                        $('#myModal').modal('hide');
                       // $.growlUI(data.mensajeDTO.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listaGrupoSprint.action',
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

    function onClickGenerarSprint(id) {
       $('#gruSprintId').val(id);
       $('#myModal').modal('show');
}




</script>
<br>


<!--ver funciones propias de cada p�gina -->
</div>


<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>