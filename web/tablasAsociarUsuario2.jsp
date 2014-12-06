<%-- 
    Document   : tablasAsociarUsuario2
    Created on : 17-11-2014, 13:55:18
    Author     : Dvaldebenito
--%>
<!-- Control de sesi�n - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>

        <!-- Contenido de la p�gina -->
        <div class="matter">
            <div>
                <button type="button" style="margin-left:20px" class="btn btn-danger btn-smt" id="volver" name="listaGrupos">Volver</button>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="widget ">
                            <div class="widget-head">
                                <div class="pull-left ">Usuarios en Grupo</div>
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
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Usuario</th>
                                                    <th>Rol</th>
                                                    <th>Grupo</th>
                                                    <th>Desasociar</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <s:iterator value="listagruxusu">
                                                    <tr>
                                                        <td><s:property value="usuNombre"/></td>
                                                        <td><s:property value="usuApellido"/></td>
                                                        <td><s:property value="usuLoginConexion"/></td>
                                                        <td><s:property value="rolDescripcion"/></td>
                                                        <td><s:property value="gruNombre"/></td>
                                                        <td>
                                                            <button type="button" class="btn btn-xs btn-warning mod" onclick="javascript:desasociar('<s:property value="usuLoginConexion"></s:property>','<s:property value="gruId"></s:property>');">Dessociar</button>
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
        <div class="matter">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="widget ">
                            <div class="widget-head">
                                <div class="pull-left ">Usuarios sin Grupo</div>
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
                                            <table class="display" cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom: 10px;">
                                                <thead class="btn-default">
                                                <tr >
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Usuario</th>
                                                    <th>Rol</th>
                                                    <th>Asociar</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <s:iterator value="listaususingru">
                                                    <tr>
                                                        <td><s:property value="usuNombre"/></td>
                                                        <td><s:property value="usuApellido"/></td>
                                                        <td><s:property value="usuLoginConexion"/></td>
                                                        <td><s:property value="rolDescripcion"/></td>
                                                        <td>
                                                            <button type="button" class="btn btn-xs btn-warning mod" onclick="javascript:asociar('<s:property value="usuLoginConexion"></s:property>','<s:property value="gruId"></s:property>','<%=session.getAttribute("loginConexion")%>');">Asociar</button>
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
    </div>

    <!-- Mainbar ends -->
    <div class="clearfix"></div>

</div>
<!-- Content ends -->




<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a style="cursor:pointer;"><i class="fa fa-chevron-up"></i></a></span>



<!-- fin Contenido de la p�gina -->
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
<script src="framework/datatable/jquery.dataTables2.js"></script>

<script>
function asociar(login,grupo,creador)
{
    $.ajax({
        url: 'asociarUsuario.action?gruId='+grupo+'&loginConexion='+login+'&usuCreador='+creador,
        success: function(data){

            $('#contenidoPagina').html(data)
        }
    });
}
function desasociar(login,grupo) {
    $.ajax({
        url: 'desasociarUsuario.action?gruId=' + grupo + '&loginConexion=' + login,
        success: function (data) {

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