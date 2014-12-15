<%--
    Document   : asociarHistoria2
    Created on : 17-11-2014, 13:52:32
    Author     : NFuenzalida
--%>
<!-- Control de sesion - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

<%@ taglib prefix="s" uri="/struts-tags" %>

        <div class="matter">
        <div class="container">
          <div class="row">
            <div class="col-md-12">

              <div class="widget ">
                <div class="widget-head">
                  <div class="pull-left ">Grupos</div>
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
                                <table cellpadding="0" cellspacing="0" border="0" class="display table-collase table-condensed table-responsive" width="100%" style="margin-bottom: 10px;">
            <thead class="btn-default">
                <tr >
                    <th>ID</th>
                    <th>Grupo</th>
                    <th>Descripcion</th>
                    <th>Listar Usuarios</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="listagrupo">
                    <tr>
                        <td><s:property value="gruId"/></td>
                        <td><s:property value="gruNombre"/></td>
                        <td><s:property value="gruDescripcion"/></td>
                        <td>
                            <button type="button" class="btn btn-xs btn-warning mod" onclick="javascript:listar('<s:property value="gruId"></s:property>'); ">Lista</button>
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
                  <div id="div-results"></div>

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
        <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
        <script src="framework/datatable/jquery.dataTables2.js"></script>
<script>
    function listar(idGrupo)
    {
        $.ajax({
            url: 'listaGruposUsuario.action?gruId='+idGrupo,
            success: function(data){

                $('#contenidoPagina').html(data)
            }
        });
    }

$(document).ready(function() {
    $('table.display').dataTable({
        destroy: true,
        "sPaginationType": "full_numbers",
        paging: true,
        searching: true,
        "iDisplayLength": 5
    });
});

</script>

<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>
