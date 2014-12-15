<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 01-12-2014
  Time: 5:43
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
                        <div class="pull-left ">Tablas de Sprints Pendientes</div>
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
                                            <th>Sprint</th>
                                            <th>Descripcion</th>
                                            <th>Fecha de Creacion</th>
                                            <th>Fecha de Fin</th>
                                            <th>Estado</th>
                                            <th>Creador</th>
                                            <th>Grupo Asociado</th>
                                            <th>Historias con iteraciones</th>
                                            <th>Historias sin iteraciones</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listaSprint">
                                            <tr>
                                                <td><s:property value="nombreSprint"/></td>
                                                <td><s:property value="descripcionSprint"/></td>
                                                <td><s:property value="fechaCreacion"/></td>
                                                <td><s:property value="fechaFin"/></td>
                                                <td><s:property value="estadoSprint"/></td>
                                                <td><s:property value="usuCreadorSprint"/></td>
                                                <td><s:property value="nombreGrupo"/></td>
                                                <td><button class="btn btn-info" onclick="javascript:listarHdu(<s:property value="sprintId" />);">Listar</button></td>
                                                <td><button class="btn btn-info" onclick="javascript:listarHduSin(<s:property value="sprintId" />);">Listar</button></td>
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





<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>


<!-- fin Contenido de la p�gina -->
<!-- Librerías JS para el tema macadmin -->
<script src="framework/jquery/jquery-1.11.1.min.js"></script>
<script src="framework/datatable/jquery.dataTables2.js"></script>

<!-- fin  Librerías para el tema macadmin -->
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

    }); // fin document ready

    function listarHdu(idSprint)
    {
        $.ajax({
            url: 'listaHduFiltros.action?sprint='+idSprint,
            success: function(data){

                $('#contenidoPagina').html(data)
            }
        });
    }

    function listarHduSin(idSprint)
    {

        $.ajax({
            url: 'listaHduSin.action?sprint='+idSprint,
            success: function(data){

                $('#contenidoPagina').html(data)
            }
        });
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