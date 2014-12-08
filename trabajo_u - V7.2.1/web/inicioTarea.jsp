<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 28-11-2014
  Time: 2:00
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>
<%@taglib uri="/struts-tags" prefix="s" %>
        <br/><h3 style="margin-left: 20px;">Seleccione proyecto</h3> <br/> <br/>

        <div class="form-group  has-feedback">
            <label class="col-lg-2 control-label">Proyecto</label>
            <form name = "frmListarHdu" id=frmListarHdu" method="POST" action="listarHduFiltro.action">
            <div class="col-lg-5">

                <s:select
                        name="proyecto.proId"
                        id="proyecto"
                        headerKey="-1"
                        headerValue="-- seleccionar proyecto --"
                        list="listPro"
                        listKey="proId"
                        listValue="proNombre"
                        cssClass="form-control"

                        />
                <span class="glyphicon form-control-feedback" id="proyecto1"></span>
            </div>
                <div>
                    <button type="button" class ="btn btn-info"  id="cargarHistorias">Cargar Historias</button>
                </div>
            </form>
        </div>

<script>


    $(document).ready(function(){
        $('#cargarHistorias').click(function(){
            var posicion=document.getElementById('proyecto').options.selectedIndex; //posicion
            var id = document.getElementById('proyecto').options[posicion].value;
            var nombre = document.getElementById('proyecto').options[posicion].text;
            if(id >= 0){
            $.ajax({
                url: 'listarHduFiltro.action?proyecto.proId='+id+'&nombreProyecto='+nombre,
                success: function(data){

                    $('#contenidoPagina').html(data)
                }
            });
            }

        });


    });

</script>
<script src="framework/macAdminStyle/js/jquery.js"></script>

<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>

<script src="framework/macAdminStyle/js/respond.min.js"></script>

<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>
