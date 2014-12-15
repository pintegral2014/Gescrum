<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Jordan
  Date: 14-12-2014
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Contenido de la p�gina -->
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
        /* Widget close */
        $('.wclose').click(function(e){
            e.preventDefault();
            var $wbox = $(this).parent().parent().parent();
            $wbox.hide(100);
        });

        /* Widget minimize */
        $('.wminimize').click(function(e){
            e.preventDefault();
            var $wcontent = $(this).parent().parent().next('.widget-content');
            if($wcontent.is(':visible'))
            {
                $(this).children('i').removeClass('fa fa-chevron-up');
                $(this).children('i').addClass('fa fa-chevron-down');
            }
            else
            {
                $(this).children('i').removeClass('fa fa-chevron-down');
                $(this).children('i').addClass('fa fa-chevron-up');
            }
            $wcontent.toggle(500);
        });


    });
    function modificarTestCase(id){
        //alert("el test case a modificar es: " + id);

        $.ajax({
            type : 'POST',
            url : 'buscarDataTestCase.action',
            data : {'testId': id},
            success : function(data) {
                    $('#tareaId2').val(data.testCaseDTO.tareaId);
                    $('#testId').val(data.testCaseDTO.testId);
                    $('#testEnun').val(data.testCaseDTO.testEnun);
                    $('#testDato').val(data.testCaseDTO.testDato);
                    $('#testObj').val(data.testCaseDTO.testObj);
                    $('#testPrec').val(data.testCaseDTO.testPrec);
                    $('#testEstado').val(data.testCaseDTO.testEstado);
                    $('#myModal').modal('show');


            },
            error : function(erro) {
                alert("error servidor");
            }
        });

    }
    function eliminarTestCase (id, idTarea) {
        //alert("el test case a eliminar es: " + id);
        var confirmar = confirm(String.fromCharCode(191) + "Esta seguro que desea eliminar el test Case?");
        if (confirmar == true) {

            $.ajax({
                type: 'post',
                url: 'borrarTestCase.action',
                data: {'testId': id },
                success: function (data) {
                    if (data.mensajeDTO.tipo == "success") {

                        $.growlUI(data.mensajeDTO.texto);
                        setTimeout(function () {
                            //alert (idTarea);
                            $.ajax({
                                type: 'POST',
                                url: 'buscarTestCasexTarea.action',
                                data: {'tareaId': idTarea},
                                success: function (data) {
                                    $('#tablaTestCase').html("");
                                    $('#tablaTestCase').html(data);
                                }
                            });

                        }, 4000);
                    }
                    else {

                        $.growlUI(data.mensajeDTO.texto);
                    }
                }
            });
        }
    }


    $('#btnModificarTestCase').click(function(){
        $.ajax({
            url: "modTestCase.action",
            data: $('#formModTestCase').serializeArray(),
            type:"post",
            dataType:"json",
            success: function (data) {
                if(data.mensajeDTO.tipo == "success"){

                    $('#myModal').modal('hide');
                    $.growlUI(data.mensajeDTO.texto);
                    setTimeout(function (){

                        $.ajax({
                            type: 'POST',
                            url: 'buscarTestCasexTarea2.action',
                            data: $('#formModTestCase').serializeArray(),
                            success: function(data){
                                $('#tablaTestCase').html("");
                                $('#tablaTestCase').html(data);
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




</script>
<div class="matter">

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Test case tarea id <span style="color: #008000; font-weight: bold"><s:property value="tareaId2"/></span></div>
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
                                    <table class="display table-collapse table-condensed table-responsive" cellpadding="0" cellspacing="0" border="0" width="100%"  style="margin-bottom: 10px;">
                                        <thead class="btn-default">
                                        <tr >
                                            <th>Enunciado</th>
                                            <th>Objetivo</th>
                                            <th>Dato Requerido</th>
                                            <th>Estado</th>
                                            <th>Usuario Creador</th>
                                            <th>Acciones</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listaTest">
                                            <tr>
                                                <td><s:property value="testEnun"/></td>
                                                <td><s:property value="testObj"/></td>
                                                <td><s:property value="testDato"/></td>
                                                <td><s:property value="testEstado"/></td>
                                                <td><s:property value="testUsuCre"/></td>
                                                <td>
                                                    <button class="btn btn-xs btn-warning" onclick="modificarTestCase(<s:property value="testId"/>)"> <span class="glyphicon glyphicon-pencil" ></span>Ejecutar o modificar</button>
                                                    <button class="btn btn-xs btn-danger btnChico" onclick="eliminarTestCase(<s:property value="testId"/>,<s:property value="tareaId"/> )"> <span class="glyphicon glyphicon-trash" ></span></button>

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

<!--MODAL -->
<div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Test Case</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="formModTestCase">
                    <div class="form-group" style="display: none">
                        <label class="control-label">id:</label>
                        <input type="text" class="form-control" name="tareaId2" id="tareaId2" readonly>
                    </div>
                    <div class="form-group" style="display: none">
                        <label class="control-label" >id:</label>
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
                    <div class="form-group">
                        <label class="control-label">Estado:</label>
                        <select name="testEstado" id="testEstado" class="form-control">
                            <option value="ingresado">Ingresado</option>
                            <option value="Aceptado">Aceptado</option>
                            <option value="Rechazado">Rechazado</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Resultado de Prueba:</label>
                        <textarea class="form-control" name="resultadoPrueba" id="resultadoPrueba" rows="5" style="resize: none; overflow-y: scroll;" ></textarea >
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnModificarTestCase">Modificar</button>
            </div>
        </div>
    </div>
</div>

