<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Jordan
  Date: 07-12-2014
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar usuarios</title>
    <!-- Librerías JS para el tema macadmin -->
    <script src="framework/datatable/jquery.dataTables2.js"></script>
    <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap-->
    <!-- fin  Librerías para el tema macadmin -->
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


    </script>
    <script>
        $(document).ready(function(){
            $('.modal').appendTo($('body'));
            $('#data-table').dataTable({
                destroy: true,
                sPaginationType: "full_numbers",
                paging: true,
                searching: true
            });
            $('#crear').click(function(){
                $.ajax({
                    url: 'ingresarProyecto2.jsp',
                    success: function(data){
                        $('#contenidoPagina').html(data);
                    }
                });
            });


        }); // fin document ready

        function obtenerDataHdu(id) {
            //alert("La historia que seleccionaste es la :"+id);

            $.ajax({
                type : 'POST',
                url : 'buscarData.action',
                data : {'idHis': id},
                success : function(data) {
                    $('#nombrehistoria').val(data.historiaDTO.nombrehistoria);
                    $('#prioridad').val(data.historiaDTO.prioridad);
                    $('#eventum').val(data.historiaDTO.eventum);
                    $('#dependencia').val(data.historiaDTO.dependencia);
                    $('#descripcion').val(data.historiaDTO.descripcion);
                    $('#criAceptacion').val(data.historiaDTO.criAceptacion);
                    $('#myModal').modal('show');

                },
                error : function(erro) {
                    alert("error servidor");
                }
            });


        }
    </script>
</head>
<body>

<!-- Matter -->
<div class="matter" id="contenido">

    <!--<div>
        <a type="button" class="action btn btn-default" id="crear" style="margin-left: 20px;" >Crear</a>

    </div>
    -->
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
                                            <th>Nombre Historia</th>
                                            <th>Prioridad</th>
                                            <th>Eventum</th>
                                            <th>Dependencia</th>
                                            <th>Visualizar</th>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listHistorias" >

                                            <tr>
                                                <td><s:property value="nombrehistoria"/></td>
                                                <td><s:property value="prioridad"/></td>
                                                <td><s:property value="eventum"/></td>
                                                <td><s:property value="dependencia"/></td>
                                                <td><button class="btn btn-xs btn-primary btnChico" onclick="obtenerDataHdu(<s:property value="hisId"/>)"> <span class="glyphicon glyphicon-eye-open" ></span></button></td>
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
    <!-- Scroll to top -->
    <span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>
    <!-- modal 2 -->
    <div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Visualización Historia</h4>
                </div>
                <div class="modal-body">
                    <form role="form" id="formModPro">

                        <div class="form-group">
                            <label class="control-label">Historia:</label>
                            <input type="text" class="form-control" name="nombrehistoria" id="nombrehistoria" readonly>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Prioridad:</label>
                            <input type="text" class="form-control" name="prioridad" id="prioridad" readonly>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Eventum:</label>
                            <input type="text" class="form-control" name="eventum" id="eventum" readonly>
                        </div>
                        <div class="form-group">
                            <label class="control-label">dependencia:</label>
                            <input type="text" class="form-control" name="dependencia" id="dependencia" readonly>
                        </div>
                        <div class="form-group">
                            <label class="control-label">descripcion:</label>
                            <textarea class="form-control" name="descripcion" id="descripcion" rows="3" style="resize: none; overflow-y: scroll;" readonly></textarea >
                        </div>
                        <div class="form-group">
                            <label class="control-label">criAceptacion:</label>
                            <textarea class="form-control" name="criAceptacion" id="criAceptacion" rows="3" style="resize: none; overflow-y: scroll;" readonly></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


<!-- Mainbar ends -->
<div class="clearfix"></div>
<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

<br>
<!-- Matter ends -->
</div>
<!-- Mainbar ends -->
<div class="clearfix"></div>

</div>
</div>
<!-- Content ends -->
<!-- Scroll to top -->
<span class="totop"><a style="cursor:pointer;"><i class="fa fa-chevron-up"></i></a></span>

</body>
