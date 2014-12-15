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
                                                <td><s:property value="gruSprintId"/> </td>
                                                <td><button type="button" class="btn btn-warning btn-xs btnChico"><span class="glyphicon glyphicon-eye-open" ></span></button> </td>
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
        $('table.display').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true,
            "iDisplayLength": 5
        });

    });
</script>

</body>
</html>
