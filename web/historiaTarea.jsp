<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 28-11-2014
  Time: 3:37
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>
<% String proyecto = request.getParameter("nombreProyecto");
    String proId =  request.getParameter("proyecto.proId");
%>
<button type="button" style="margin-left: 30px;" id="volver" name="listaGestionTarea" class="btn btn-default">Volver</button>
<h5 style="margin-left: 30px;">Seleccione historia de usuario para asignar tarea</h5>
        <!-- Matter -->


        <div class="matter" id="contenido">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="widget ">
                            <div class="widget-head">
                                <div class="pull-left ">Historias de usuario pertenecientes al proyecto <label style="color: green;"> <%= proyecto%></label></div>
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
                                                    <th >Nombre</th>
                                                    <th>Prioridad</th>
                                                    <th>Eventum</th>
                                                    <th>Descripcion</th>
                                                    <th>Dependencia</th>
                                                    <th>C. aceptacion</th>
                                                    <th>F. creacion</th>
                                                    <th>U. Creador</th>
                                                    <th>Tareas</th>


                                                </tr>
                                                </thead>
                                                <tbody>
                                                <s:iterator value="listHistorias" >

                                                    <tr style ="font-size: 12px">
                                                        <td><s:property value="nombrehistoria"/></td>
                                                        <td><s:property value="prioridad"/></td>
                                                        <td><s:property value="eventum"/></td>
                                                        <td><s:property value="descripcion"/></td>
                                                        <td><s:property value="dependencia"/></td>
                                                        <td><s:property value="criAceptacion"/></td>
                                                        <td><s:property value="fechaCrea"/></td>
                                                        <td><s:property value="usuariocrea"/></td>
                                                        <td><!--<form  id="listaHduTarea" name="listaHduTarea"action="" method="POST">
                                                            <input type="hidden" name="hduTarID" id="hduTarID" value="<s:property value="hisId"/>"> -->
                                                           <button class = "btn btn-info" onclick="javascript:cargaTareas('<s:property value="hisId"/>')" name="cargaTarea">Lista</button>
                                                        <!--</form>-->
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
        $('#data-table').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true
        });
        $('#volver').click(function(){
            var volver = this.name;
            $.ajax({
                url: volver +'.action',
                success: function(data){
                    $('#contenidoPagina').html(data)
                }
            });
        });
    });

    function cargaTareas(id)
    {
        $.ajax({
            url: 'listaHduTarea.action?hduTarID='+id+'&proyecto.proId=<%=proId%>'+'&nombreProyecto=<%=proyecto%>',
            success: function(data){
                $('#contenidoPagina').html(data)
            }
        });
    }

</script>
</body>
</html>





<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>
