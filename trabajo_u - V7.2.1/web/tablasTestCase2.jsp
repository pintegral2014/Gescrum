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
                                    <table cellpadding="0" cellspacing="0" border="0" class="display table-collapse table-condensed table-responsive" width="100%">
                                        <thead class="btn-default">
                                        <tr style ="font-size: 12px">
                                            <th>ID</th>
                                            <th>Descripcion</th>
                                            <th>Fecha de Creacion</th>
                                            <th>Usuario Creador</th>
                                            <th>Agregar/Listar</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listaTarea">
                                            <tr style ="font-size: 12px">
                                                <td><s:property value="idTarea"/></td>
                                                <td><s:property value="descripcionTarea"/></td>
                                                <td><s:property value="fechaCreacion"/></td>
                                                <td><s:property value="usuCreador"/></td>
                                                <td>
                                                    <button class="btn btn-xs btn-success btnChico" onclick="modalCrearTestCase(<s:property value="idTarea"/>)"> <span class="glyphicon glyphicon-plus" ></span></button>
                                                    <button class="btn btn-primary" onclick="listarTestCase(<s:property value="idTarea"/>)">Lista Testcase</button>
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


<!--MODAL -->
<div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Test Case</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="formCreaTestCase">
                    <div class="form-group" style="display: none">
                        <label class="control-label">id:</label>
                        <input type="text" class="form-control" name="tareaId" id="tareaId" readonly>
                    </div>
                    <div class="form-group" style="display: none">
                        <label class="control-label">id:</label>
                        <input type="text" class="form-control" name="testId" id="testId" readonly>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Enunciado:</label>
                        <textarea class="form-control" name="testEnun" id="testEnun" rows="5" style="resize: none; overflow-y: scroll;" ></textarea >
                    </div>
                    <div class="form-group">
                        <label class="control-label">Dato Requerido:</label>
                        <input type="text" class="form-control" name="testDato" id="testDato" >
                    </div>
                    <div class="form-group">
                        <label class="control-label">Objetivo:</label>
                        <textarea class="form-control" name="testObj" id="testObj" rows="5" style="resize: none; overflow-y: scroll;" ></textarea >
                    </div>

                    <div class="form-group">
                        <label class="control-label">Precondiciones:</label>
                        <textarea class="form-control" name="testPrec" id="testPrec" rows="5" style="resize: none; overflow-y: scroll;" ></textarea >
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnCrearTestCase">Crear</button>
            </div>
        </div>
    </div>
</div>
<div id="tablaTestCase">

</div>


<script>
    $(document).ready(function(){
        $('.modal').appendTo($('body'));
        $('table.display').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true,
            "iDisplayLength": 5
        });
    });

    $('#btnCrearTestCase').click(function(){
        $.ajax({
            url: "crearTestCase.action",
            data: $('#formCreaTestCase').serializeArray(),
            type:"post",
            dataType:"json",
            success: function (data) {
                if(data.mensajeDTO.tipo == "success"){
                    $.growlUI(data.mensajeDTO.texto);

                }
                else{
                    $.growlUI(data.mensaje.texto);
                }
                $('#myModal1').modal('hide');
            }
        });
    });

    function listarTestCase(id2){

        $.ajax({
            type : 'POST',
            url : 'buscarTestCasexTarea.action',
            data : {'tareaId': id2},
            success : function(data) {
                $('#tablaTestCase').html(data)
            }
        });
    }

    function modalCrearTestCase(id) {
        //alert ("mi id es " + id);
        $('#tareaId').val();
        $('#tareaId').val(id);


        $('#myModal1').modal('show');
    }


</script>

<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>

