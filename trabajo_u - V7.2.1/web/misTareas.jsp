<% if (session.getAttribute("loginConexion")!=null){%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 14-12-2014
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="matter">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Mis Tareas</div>
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
                                    <table class="table table-collase table-condensed table-responsive" cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%">
                                        <thead class="btn-default">
                                        <tr >
                                            <th>Codigo Tarea</th>
                                            <th>Usuario Asignado</th>
                                            <th>Estado Tarea</th>
                                            <th>Ultima fecha de Modificacion</th>
                                            <th>Nº de iteraciones</th>
                                            <th>Esfuerzo Restante</th>
                                            <th>Historia Procedente</th>
                                            <th>Asignado al Sprint</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listaiteracion">
                                            <tr>
                                                <td><s:property value="iteracionIdTarea" /></td>
                                                <td><s:property value="iteracionUsuarioAsignado" /></td>
                                                <td><s:property value="iteracionEstado" /></td>
                                                <td><s:property value="iteracionFechaMod" /></td>
                                                <td><s:property value="iteracionCantidad" /></td>
                                                <td><s:property value="iteracionEsfuerzo" /></td>
                                                <td><s:property value="iteracionNombreHistoria" /></td>
                                                <td><s:property value="iteracionNombreSprint" /></td>
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

    }); // fin document ready




</script>
<br>


<!--ver funciones propias de cada p�gina -->
</div>


<% }
    else
    {%>
<script>window.location = "login.jsp";</script>
<%}%>