<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 01-12-2014
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>

<!-- Contenido de la p�gina -->
<div class="matter">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Historias de Usuarios Asignadas al Sprint</div>
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
                                    <table class="display" cellpadding="0" cellspacing="0" border="0" width="100%"  style="margin-bottom: 10px;">
                                        <thead class="btn-default">
                                        <tr >
                                            <th>Nombre Historia</th>
                                            <th>Prioridad</th>
                                            <th>Descripcion</th>
                                            <th>Dependencia</th>
                                            <th>Fecha de creacion</th>
                                            <th>Proyecto</th>
                                            <th>Iterar Historia</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listHistorias">
                                            <tr>
                                                <td><s:property value="nombrehistoria"/></td>
                                                <td><s:property value="prioridad"/></td>
                                                <td><s:property value="descripcion"/></td>
                                                <td><s:property value="dependencia"/></td>
                                                <td><s:property value="fechaCrea"/></td>
                                                <td><s:property value="nombreProyecto"/></td>
                                                <td>
                                                    <button type="button" class="btn btn-xs btn-info" onclick="javascript:listarTareasXHdu(<s:property value="hisId" />,<%=request.getParameter("sprint")%>)">Listar Tareas</button>
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


<!-- Mainbar ends -->
<div class="clearfix"></div>

</div>
<!-- Content ends -->




<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a style="cursor:pointer;"><i class="fa fa-chevron-up"></i></a></span>



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
<!-- fin  Librer�as para el tema macadmin -->
<script>
    function listarTareasXHdu(hisId,idSprint)
    {

        $.ajax({

            url: 'listaTareasIteracion.action?hduTarID='+hisId+'&sprint='+idSprint,
            success: function(data){

                $('#contenidoPagina').html(data)
            }
        });
    }


    $(document).ready(function(){

        $('#volver').click(function(){
            var volver = this.name;

            $.ajax({
                url: volver +'.action',
                success: function(data){
                    $('#contenidoPagina').html("");
                    $('#contenidoPagina').html(data);
                }
            });

        });

        $('table.display').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true,
            "iDisplayLength": 5
        });

        $('#crear').click(function(){
            $.ajax({
                url: 'ingresarUsuario2.jsp',
                success: function(data){
                    $('#contenido').html(data);
                }
            });
        });
        $(".action").click(function(){
            var action = this.id;
            $.ajax({
                url: action +'.action',
                success: function(data){
                    $('#contenido').html(data);
                }
            })

        })
        //DataTable.fnUpdate

    });
</script>

<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>
