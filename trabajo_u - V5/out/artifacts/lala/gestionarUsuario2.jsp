<%-- 
    Document   : gestionarUsuario2
    Created on : 17-11-2014, 13:14:02
    Author     : Dvaldebenito
--%>
<%@taglib uri="/struts-tags" prefix="s" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="framework/estilos/estilos2.css" rel="stylesheet">

    </head>
    <body>



        <div>
            <a type="button" class="action btn btn-default" id="listaRoles" >Crear</a>
        </div>
        <div class="matter">
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
                                <table cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%" id="tablausuarios">
                                    <thead class="btn-default">
                                        <tr >
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Ap. Paterno</th>
                                            <th>Ap. Materno</th>
                                            <th>Correo</th>
                                            <th>usuario</th>
                                            <th>Estado</th>
                                            <th>accion</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <s:iterator value="listauser" >

                                        <tr id="usuario-tr-<s:property value="usuId"/>">
                                            <td><s:property value="usuId"/></td>
                                            <td><s:property value="usuNombre"/></td>
                                            <td><s:property value="usuApellidoPaterno"/></td>
                                            <td><s:property value="usuApellidoMaterno"/></td>
                                            <td><s:property value="usuCorreo"/></td>
                                            <td><s:property value="usuLoginConexion"/></td>
                                            <td><s:property value="usuEstado"/></td>
                                            <td><button class="btn btn-xs btn-warning mod" onclick="javascript:prueba('<s:property value="usuId"/>','<s:property value="usuNombre"/>',
                                                 '<s:property value="usuApellidoPaterno"/>','<s:property value="usuApellidoMaterno"/>','<s:property value="usuCorreo"/>','<s:property value="usuLoginConexion"/>',
                                                 '<s:property value="usuEstado"/>','<s:property value="usuClave"/>','<s:property value="rolId"/>');">
                                                    <span class="glyphicon glyphicon-edit" ></span></button></td>

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
   



<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span> 
        <!-- JS -->
<script src="framework/macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
<!--  <script src="framework/macAdminStyle/js/respond.min.js"></script>-->
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap -->
<!--<script src="framework/macAdminStyle/js/jquery-ui.min.js"></script>  jQuery UI -->
<!--<script src="framework/macAdminStyle/js/fullcalendar.min.js"></script>  Full Google Calendar - Calendar -->
<!--<script src="framework/macAdminStyle/js/jquery.rateit.min.js"></script>  RateIt - Star rating -->
<!--<script src="framework/macAdminStyle/js/jquery.prettyPhoto.js"></script>  prettyPhoto -->
<!--<script src="framework/macAdminStyle/js/jquery.slimscroll.min.js"></script>  jQuery Slim Scroll -->
<script src="framework/datatable/jquery.dataTables2.js"></script> <!-- Data tables -->

<!-- jQuery Flot -->
<!--<script src="framework/macAdminStyle/js/excanvas.min.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.resize.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.pie.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.stack.js"></script>-->

<!-- jQuery Notification - Noty -->
<!--<script src="framework/macAdminStyle/js/jquery.noty.js"></script>  jQuery Notify -->
<!--<script src="framework/macAdminStyle/js/themes/default.js"></script>  jQuery Notify -->
<!--<script src="framework/macAdminStyle/js/layouts/bottom.js"></script>  jQuery Notify -->
<!--<script src="framework/macAdminStyle/js/layouts/topRight.js"></script>  jQuery Notify -->
<!--<script src="framework/macAdminStyle/js/layouts/top.js"></script>  jQuery Notify -->
<!-- jQuery Notification ends -->

<!--<script src="framework/macAdminStyle/js/sparklines.js"></script>  Sparklines -->
<!--<script src="framework/macAdminStyle/js/jquery.cleditor.min.js"></script>  CLEditor -->
<!--<script src="framework/macAdminStyle/js/bootstrap-datetimepicker.min.js"></script>  Date picker -->
<!--<script src="framework/macAdminStyle/js/jquery.onoff.min.js"></script>  Bootstrap Toggle -->
<!-- <script src="framework/macAdminStyle/js/filter.js"></script> Filter for support page -->

<!--<script src="framework/macAdminStyle/js/custom.js"></script>  Custom codes -->

<!--<script src="framework/macAdminStyle/js/charts.js"></script>  Charts & Graphs -->


<script src="framework/bootstrap-3.2.0/dist/js/bootstrap-modal.js"></script>

<script>
$('.modal').appendTo($('body'));
$(document).ready(function(){


    /*var bootstrapButton = $.fn.button.noConflict();
    $.fn.bootstrapBtn = bootstrapButton;*/

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
            

    
    
    /* Data tables */


    
        var table =$('#data-table').dataTable({
            "sPaginationType": "full_numbers"
        });
        
        $('#cerrar').click(function(){
            $('.conte').hide();
        });
        
});
function prueba(id,nombre,paterno,materno,correo,usuario,estado,contrasena,rolId)
{
        $('#id').val(id);
        $('#nombre').val(nombre);
        $('#paterno').val(paterno);
        $('#materno').val(materno);
        $('#correo').val(correo);
        $('#usuario').val(usuario);
        $('#estado').val(estado);
        $('#contrasena').val(contrasena);
       // $('#idRol').form(rolId);
        document.formModificarUsu.idRol.selectedIndex=rolId-1;
        $('.conte').show();

        $('#myModal').modal('show')
}



/* Widget minimize */

$('.wminimize').click(function(e){
	e.preventDefault();
	var $wcontent = $(this).parent().parent().next('.widget-content');
	if($wcontent.is(':visible')) 
	{
	  $(this).children('i').removeClass('fa fa-chevron-up');
	  $(this).children('i').addClass('fa fa-chevron-down');
	}
	else 
	{
	  $(this).children('i').removeClass('fa fa-chevron-down');
	  $(this).children('i').addClass('fa fa-chevron-up');
	}            
	$wcontent.toggle(500);
}); 
</script>
<br>




<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Modificar Usuario</h4>
            </div>
            <div class="modal-body">
                  <form method="post" action="#" name="formModificarUsu">
                        
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Nombre</label>
                        <div class="col-lg-5">
                          <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Juanito">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Apellido Paterno</label>
                        <div class="col-lg-5">
                          <input type="text" name="paterno" id="paterno" class="form-control" placeholder="Perez">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Apellido Materno</label>
                        <div class="col-lg-5">
                          <input type="text" name="materno" id="materno" class="form-control" placeholder="Gonz�lez">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Correo</label>
                        <div class="col-lg-5">
                          <input type="email" name="correo" id="correo" class="form-control" placeholder="usuario@correo.cl">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Contrasena</label>
                        <div class="col-lg-5">
                          <input type="password" name="contrasena" id="contrasena" class="form-control" placeholder="******">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Estado</label>
                        <div class="col-lg-5">
                          <input type="text" name="estado" id="estado" class="form-control" placeholder="vigente">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Usuario</label>
                        <div class="col-lg-5">
                          <input type="text" name="usuario" id="usuario" class="form-control" placeholder="usuario">
                        </div><br>
                    </div>
                      <div class="form-group">
                          <label class="col-lg-2 control-label">Rol</label>
                          <div class="col-lg-5">
                              <select name="idRol" id="idRol" class="form-control">
                                  <s:iterator value="listarol">
                                      <option value="<s:property value="rol_id"/>"><s:property value="rol_descripcion"/></option>
                                  </s:iterator>
                              </select>
                          </div>
                      </div>
                  </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Guardar Cambios</button>
            </div>
        </div>
    </div>
</div>

</body>

