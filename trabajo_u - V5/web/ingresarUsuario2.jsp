<%--
    Document   : ingresarUsuario2
    Created on : 17-11-2014, 16:08:32
    Author     : Dvaldebenito
--%>
<%@taglib uri="/struts-tags" prefix="s" %>

<script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
<script  src="framework/jquery/jquery-ui.min.js" type="text/javascript"></script>
<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<style type="text/css">
    div.growlUI{
        background: black no-repeat 10px 10px;
    }
    div.growlUI h3, div.growlUI h4{
        color: #ffffff;padding: 5px 5px 75px;text-align: left;
    }
</style>
<script type="text/javascript">
    $(document).ready(function(){

        $('#btnenviar').click(function(){

              $.ajax({
                    url:'ingresaNewUsuario.action',
                    type: 'post',
                    data: $('#formUsuario').serializeArray(),
                    success:function(data){
                        $.growlUI(data.mensaje.texto);
                    }
                });


        });

    });
</script>
    <body>
         <div class="container-fluid centradovertical"> <div class="row"><div class="col-lg-8">
             <form method="POST" action="ingresaNewUsuario.action" id="formUsuario" name="formUsuario">
                      
                    <div class="form-group">
                        <label class="col-lg-2 control-label">Nombre</label>
                        <div class="col-lg-5">
                          <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Juanito">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">Ap. Paterno</label>
                        <div class="col-lg-5">
                          <input type="text" name="apaterno" id="apaterno" class="form-control" placeholder="Perez">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">Ap. Materno</label>
                        <div class="col-lg-5">
                          <input type="text" name="amaterno" id="amaterno" class="form-control" placeholder="Gonzalez">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">Correo</label>
                        <div class="col-lg-5">
                          <input type="email" name="correo" id="correo" class="form-control" placeholder="usuario@correo.cl">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">Contrasena</label>
                        <div class="col-lg-5">
                          <input type="password" name="clave" id="clave" class="form-control" placeholder="******">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">Estado</label>
                        <div class="col-lg-5">
                          <input type="text" name="estado" id="estado" class="form-control" placeholder="vigente">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">Usuario</label>
                        <div class="col-lg-5">
                          <input type="text" name="loginConexion" id="loginConexion" class="form-control" placeholder="usuario">
                        </div><br>
                    </div>
                     <div class="form-group">
                         <label class="col-lg-2 control-label">Rol</label>
                         <div class="col-lg-5">
                             <select name="idRol" id="idRol">
                                 <s:iterator value="listarol" >
                                     <option value="<s:property value="rol_id"/>"><s:property value="rol_descripcion"/></option>
                                 </s:iterator>
                             </select>
                        </div>

                         <input type="hidden" name="usuCreador" id="usuCreador" class="form-control" value="<%=session.getAttribute("loginConexion")%>">
                          </div>
             <button type="button" id="btnenviar" name="Enviar"  class="btn btn-warning">Enviar</button>
             </form>
          </div>
          </div>
          </div>
        
<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span> 
        <!-- JS -->
<script src="framework/macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
  <script src="framework/macAdminStyle/js/respond.min.js"></script>
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap -->
<script src="framework/macAdminStyle/js/jquery-ui.min.js"></script> <!-- jQuery UI -->
<script src="framework/macAdminStyle/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="framework/macAdminStyle/js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="framework/macAdminStyle/js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->
<script src="framework/macAdminStyle/js/jquery.slimscroll.min.js"></script> <!-- jQuery Slim Scroll -->
<script src="framework/datatable/jquery.dataTables2.js"></script> <!-- Data tables -->

<!-- jQuery Flot -->
<script src="framework/macAdminStyle/js/excanvas.min.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.resize.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.pie.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.stack.js"></script>

<!-- jQuery Notification - Noty -->
<script src="framework/macAdminStyle/js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="framework/macAdminStyle/js/sparklines.js"></script> <!-- Sparklines -->
<script src="framework/macAdminStyle/js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="framework/macAdminStyle/js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
<script src="framework/macAdminStyle/js/jquery.onoff.min.js"></script> <!-- Bootstrap Toggle -->
<script src="framework/macAdminStyle/js/filter.js"></script> <!-- Filter for support page -->
<!--<script src="framework/macAdminStyle/js/custom.js"></script>  Custom codes -->
<script src="framework/macAdminStyle/js/charts.js"></script> <!-- Charts & Graphs -->
     
<!-- <script>
$(document).ready(function() {
        $('#ejecutar').click(function(){
                 
         //document.form1.submit();
         
         var nombre = document.getElementsByName("nombre")[0].value;
         var apaterno = document.getElementsByName("apaterno")[0].value;
         var amaterno = document.getElementsByName("amaterno")[0].value;
         var correo = document.getElementsByName("correo")[0].value;
         var clave = document.getElementsByName("clave")[0].value;
         var estado = document.getElementsByName("estado")[0].value;
         var loginConexion = document.getElementsByName("loginConexion")[0].value;
         
         $.ajax({
                    url: 'validarFormulario.jsp?tipo=crearusuario&nombre='+nombre+'&apaterno='+apaterno+'&amaterno='+amaterno+'&correo='+correo+'&clave='+clave+'&estado='+estado+'&loginConexion='+loginConexion,
                    success: function(data){

                        $('#contenido').html(data);
                        
                    }
                })

        });
});
</script> -->
