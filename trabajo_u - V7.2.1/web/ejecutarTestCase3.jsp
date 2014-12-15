<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
        $(document).ready(function(){
            $('#data-table').dataTable({
                destroy: true,
                sPaginationType: "full_numbers",
                paging: true,
                searching: true
            });
        }); // fin document ready

        function obtenerTareas(id) {

            $.ajax({
                type : 'POST',
                url : 'listaEjecutarTestCase.action?hduTarID='+id+'',
                success : function(data) {
                    $('#contenidoPagina').html(data);
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

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Historias</div>
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
                                            <th>Estado</th>
                                            <th>Ver Tareas</th>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listHistorias" >

                                            <tr>
                                                <td><s:property value="nombrehistoria"/></td>
                                                <td><s:property value="prioridad"/></td>
                                                <td><s:property value="estado"/></td>
                                                <td><button class="btn btn-xs btn-primary btnChico" onclick="obtenerTareas(<s:property value="hisId"/>)"> <span class="glyphicon glyphicon-eye-open" ></span></button></td>
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

    <div class="clearfix"></div>
    <!-- Mainbar ends -->
    <span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>
</div>
