<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>

<script src="framework/datatable/jquery.dataTables2.js"></script>
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap-->
<script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
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

<div class="matter" id="contenido">

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Test Case</div>
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
                                    <table cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%">
                                        <thead class="btn-default">
                                        <tr style ="font-size: 12px">
                                            <th >Id</th>
                                            <th>Descripcion</th>
                                            <th>Fecha de creacion</th>
                                            <th>Usuario Creador</th>
                                            <th>Crear TestCase</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listaTarea">
                                            <tr style ="font-size: 12px">
                                                <td><s:property value="idTarea"/></td>
                                                <td><s:property value="descripcionTarea"/></td>
                                                <td><s:property value="fechaCreacion"/></td>
                                                <td><s:property value="usuCreador"/></td>
                                                <td><button class="btn btn-xs btn-success btnChico" onclick="CrearTestCase(<s:property value="idTarea"/>)"> <span class="glyphicon glyphicon-pencil" ></span></button></td>
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Crear TestCase</h4>
            </div>
            <div class="modal-body" style="min-height: 300px;">
                <form role="form" id="formCreaTestCase">
                    <div class="form-group" style="display: none;">
                        <label class="col-lg-4 control-label"></label>
                        <div class="col-lg-5">
                            <input type="text" name="idTarea" id="idTarea" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Enunciado</label>
                        <div class="col-lg-5">
                            <input type="text" name="testEnun" id="testEnun" class="form-control" placeholder="Ingrese Enunciado">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Objetivo</label>
                        <div class="col-lg-5">
                            <input type="text" name="testObj" id="testObj" class="form-control" placeholder="Ingrese Objetivo">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Dato Requerido</label>
                        <div class="col-lg-5">
                            <input type="text" name="testDato" id="testDato" class="form-control" placeholder="Ingrese Dato Requerido">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Precondiciones</label>
                        <div class="col-lg-5">
                            <input type="text" name="testPrec" id="testPrec" class="form-control" placeholder="Ingrese Precondiciones">
                        </div><br>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnCrearTestCase" name="btnCrearTestCase" class="btn btn-warning btn-smt ">Guardar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>



<script>
    $(document).ready(function(){
        $('.modal').appendTo($('body'));
        $('#data-table').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true
        });
    });
    function CrearTestCase(id) {
        $('#idTarea').val(id);
        $('#myModal').modal('show');
    }
    $('#btnCrearTestCase').click(function(){
        $.ajax({
            url: "crearTestCase.action",
            data: $('#formCreaTestCase').serializeArray(),
            type:"post",
            dataType:"json",
            success: function (data) {

                if(data.mensaje.tipo == "success"){
                    $.growlUI(data.mensaje.texto);
                    setTimeout(function(){

                        $.ajax({
                            url: 'listaTareaTestCase.action',
                            success: function(data){
                                $('#contenidoPagina').html("");
                                $('#contenidoPagina').html(data);
                            }
                        });
                    }, 2000);
                }
                else{
                    $.growlUI(data.mensaje.texto);
                }
                $('#myModal').modal('hide');
            }
        });
    });

</script>

<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>

