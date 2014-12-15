<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Daniel Valdebenito
  Date: 15/12/2014
  Time: 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>



<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div class="widget ">
                <div class="widget-head">
                    <div class="pull-left ">Datos Grupo: <span style="color: #008000; font-weight: bold;"><%=request.getParameter("nombre")%></span></div>
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
                                <table class="display" cellpadding="0" cellspacing="0" border="0"  width="100%">
                                    <thead class="btn-default">
                                    <tr >
                                        <th>Nombre</th>
                                        <th>descripción</th>
                                        <th>Fecha Fin</th>
                                        <th>Fecha Inicio</th>
                                        <th>Estado</th>
                                        <th>grupo</th>
                                        <th>ación</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="listaSprint">
                                            <tr>
                                                <td><s:property value="nombreSprint"/> </td>
                                                <td><s:property value="descripcionSprint"/> </td>
                                                <td><s:property value="fechaFin"/> </td>
                                                <td><s:property value="fechaCreacion"/> </td>
                                                <td><s:property value="estadoSprint"/> </td>
                                                <td><s:property value="nombreGrupo"/> </td>
                                                <td><button type="button" class="btn btn-warning btn-xs btnChico" onclick="javascript:onClickEditarSprint(<s:property value="sprintId"/>);"><span class="glyphicon glyphicon-edit" ></span></button> </td>
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

<div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Modificar Sprint</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="formModSprint">
                    <div class="form-group" >
                        <label class="control-label">id</label>
                        <input type="text" class="form-control" name="sprintId" id="sprintId" readonly>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Nombre</label>
                        <input type="text" class="form-control" name="nombreSprint" id="nombreSprint" readonly>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Descripción</label>
                        <input type="text" class="form-control" name="descripcionSprint" id="descripcionSprint">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Fecha Creación</label>
                        <input type="text" class="form-control" name="fechaCreacion" id="fechaCreacion" style="cursor:pointer; cursor: hand" readonly>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Fecha Fin</label>
                        <input type="text" class="form-control" name="fechaFin" id="fechaFin" style="cursor:pointer; cursor: hand" readonly>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Estado</label>
                        <select name="estadoSprint" id="estadoSprint" class="form-control">
                            <option value="En Proceso">En Proceso</option>
                            <option value="Finalizado">Finalizado</option>
                        </select>

                    </div>

                    <div class="form-group">
                        <label class="control-label">Usuario creador</label>
                        <input type="text" class="form-control" name="usuCreadorSprint" id="usuCreadorSprint" readonly>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardarModSprint">Guardar Cambios</button>
            </div>
        </div>
    </div>
</div>

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
<script>
    function onClickEditarSprint(id)
    {
        $.ajax({
            type : 'POST',
            url : 'buscarSprint.action',
            data : {'sprintId': id},
            success : function(data) {
                $('#sprintId').val(data.listaSprint[0].sprintId);
                $('#nombreSprint').val(data.listaSprint[0].nombreSprint);
                $('#descripcionSprint').val(data.listaSprint[0].descripcionSprint);
                $('#fechaFin').val(data.listaSprint[0].fechaFin);
                $('#fechaCreacion').val(data.listaSprint[0].fechaCreacion);
                $('#estadoSprint').val(data.listaSprint[0].estadoSprint);
                $('#usuCreadorSprint').val(data.listaSprint[0].usuCreadorSprint);
                $('#myModal').modal('show');
            },
            error : function(erro) {
                alert("error servidor");
            }
        });

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
        $.datepicker.regional['es'] =
        {
            closeText: "Cerrar",
            prevText: "Previo",
            nextText: "Próximo",
            monthNames: ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
            monthNamesShort: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
            monthStatus: "Ver otro mes", yearStatus: "Ver otro año",
            dayNames: ["Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"],
            dayNamesShort: ["Dom","Lun","Mar","Mie","Jue","Vie","Sáb"],
            dayNamesMin: ["Do","Lu","Ma","Mi","Ju","Vi","Sa"],
            dateFormat: "yy-mm-dd", firstDay: 0,
            initStatus: "Selecciona la fecha", isRTL: false};

        $( "#fechaCreacion" ).datepicker(

                {
            defaultDate: "+1w",
            changeMonth: false,
            numberOfMonths: 1,
                    closeText: "Cerrar",
                    prevText: "Previo",
                    nextText: "Próximo",
                    monthNames: ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
                    monthNamesShort: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
                    monthStatus: "Ver otro mes", yearStatus: "Ver otro año",
                    dayNames: ["Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"],
                    dayNamesShort: ["Dom","Lun","Mar","Mie","Jue","Vie","Sáb"],
                    dayNamesMin: ["Do","Lu","Ma","Mi","Ju","Vi","Sa"],
                    dateFormat: "yy-mm-dd", firstDay: 0,
                    initStatus: "Selecciona la fecha", isRTL: false,
            onClose: function( selectedDate ) {
                $( "#fechaFin" ).datepicker( "option", "minDate", selectedDate );

            }
        });
        $( "#fechaFin" ).datepicker(

                {
            defaultDate: "+1w",
            changeMonth: false,
            numberOfMonths: 1,
                    closeText: "Cerrar",
                    prevText: "Previo",
                    nextText: "Próximo",
                    monthNames: ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
                    monthNamesShort: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
                    monthStatus: "Ver otro mes", yearStatus: "Ver otro año",
                    dayNames: ["Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"],
                    dayNamesShort: ["Dom","Lun","Mar","Mie","Jue","Vie","Sáb"],
                    dayNamesMin: ["Do","Lu","Ma","Mi","Ju","Vi","Sa"],
                    dateFormat: "yy-mm-dd", firstDay: 0,
                    initStatus: "Selecciona la fecha", isRTL: false,
            onClose: function( selectedDate ) {
                $( "#fechaCreacion" ).datepicker( "option", "maxDate", selectedDate );
            }
        });

        $('#guardarModSprint').click(function(){
            $.ajax({
                url: "modSprint.action",
                data: $('#formModSprint').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensaje.tipo == "success"){

                        $('#myModal').modal('hide');
                        $.growlUI(data.mensaje.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listarSprintxGrupo.action?grupo.gruId=<%=request.getParameter("id")%>&nombre=<%=request.getParameter("nombre")%>',
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


    });
</script>

</body>
</html>
