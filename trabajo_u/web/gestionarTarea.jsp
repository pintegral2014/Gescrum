<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 28-11-2014
  Time: 4:51
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>
<% String proID =  request.getParameter("proyecto.proId");
    String proyecto =  request.getParameter("nombreProyecto");
%>
        <!-- Matter -->


        <div class="matter" id="contenido">
            <div>
                <a type="button" class="crear btn btn-default"  style="margin-left: 20px;">Crear</a>
                <button type="button" style="margin-left: 30px;" id="volvert" name="listarHduFiltro" class="btn btn-default">Volver</button>
            </div>
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
                                            <table cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%">
                                                <thead class="btn-default">
                                                <tr style ="font-size: 12px">
                                                    <th >Id</th>
                                                    <th>Descripcion</th>
                                                    <th>Fecha de creacion</th>
                                                    <th>Usuario Creador</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <s:iterator value="listaTarea" >

                                                    <tr style ="font-size: 12px">
                                                        <td><s:property value="idTarea"/></td>
                                                        <td><s:property value="descripcionTarea"/></td>
                                                        <td><s:property value="fechaCreacion"/></td>
                                                        <td><s:property value="usuCreador"/></td>
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

            <div id="contenidoIngresarTarea" style="margin-left: -200px">

            </div>
        </div>



<script>
    $(document).ready(function(){

        $('#data-table').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true
        });

        $('.crear').click(function(){
            $.ajax({
                url: 'ingresarTarea.jsp?sih=<%=request.getParameter("hduTarID")%>',
                success: function(data){
                    $('#contenidoIngresarTarea').html(data);

                }
            });

        });
        $('#volvert').click(function(){

            var volver = this.name;
            alert(volver);
            $.ajax({
                url: volver +'.action?proyecto.proId=<%=proID%>'+'&nombreProyecto=<%=proyecto%>',
                success: function(data){
                    $('#contenidoPagina').html(data)
                }
            });
        });
        /*$(".action").click(function(){
            var action = this.id;
            $.ajax({
                url: action +'.action',
                success: function(data){


                    $('#contenido').html(data);


                }
            });

        });

        */

    });

</script>
</body>
</html>





<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>

