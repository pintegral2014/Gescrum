<%-- 
    Document   : gestionarUsuario2
    Created on : 17-11-2014, 13:14:02
    Author     : Dvaldebenito
--%>
<!-- Control de sesión - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar usuarios</title>
    </head>
<body>

        <!-- Matter -->
        <div class="matter" id="contenido">

        <div class="">
            <a type="button" class="crearusuario btn btn-default" id="listaRoles" style="margin-left: 20px;" >Crear</a>
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
                        <div class="">
                            <table class="table table-collase table-condensed table-responsive" cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%" id="tablausuarios">
                                    <thead class="btn-default">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Ap. Paterno</th>
                                            <th>Ap. Materno</th>
                                            <th>Correo</th>
                                            <th>usuario</th>
                                            <th>Estado</th>
                                            <th>Rol Asignado</th>
                                            <th>accion</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <s:iterator value="listauser" >

                                        <tr >
                                            <td><s:property value="usuId"/></td>
                                            <td><s:property value="usuNombre"/></td>
                                            <td><s:property value="usuApellidoPaterno"/></td>
                                            <td><s:property value="usuApellidoMaterno"/></td>
                                            <td><s:property value="usuCorreo"/></td>
                                            <td><s:property value="usuLoginConexion"/></td>
                                            <td><s:property value="usuEstado"/></td>
                                            <td><s:property value="rol.rol_descripcion"/></td>
                                            <td><button class="btn btn-xs btnChico btn-warning mod" onclick="onClickEditarUsuario('<s:property value="usuId"/>')">
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

<br>
<!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>
</div>
<!-- Content ends -->



<!-- Scroll to top -->
<span class="totop"><a style="cursor:pointer;"><i class="fa fa-chevron-up"></i></a></span> 



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Modificar Usuario</h4>
            </div>
            <div class="modal-body" style="min-height: 300px;">
                  <form method="post" action="#" name="formModificarUsu">
                        
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Nombre</label>
                        <div class="col-lg-5">
                          <input type="text" name="nombre" id="nombre" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Apellido Paterno</label>
                        <div class="col-lg-5">
                          <input type="text" name="paterno" id="paterno" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Apellido Materno</label>
                        <div class="col-lg-5">
                          <input type="text" name="materno" id="materno" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Correo</label>
                        <div class="col-lg-5">
                          <input type="email" name="correo" id="correo" class="form-control" placeholder="">
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
                          <input type="text" name="estado" id="estado" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Usuario</label>
                        <div class="col-lg-5">
                          <input type="text" name="usuario" id="usuario" class="form-control" placeholder="">
                        </div><br>
                    </div>
                      
                      <div class="form-group">
                          <label class="col-lg-4 control-label">Rol</label>
                          <div class="col-lg-5">
                              <select name="idRol" id="idRol" class="form-control ">
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
                "sPaginationType": "full_numbers",
                paging: true,
                searching: true
            });

                $('#crear').click(function(){


                    $.ajax({
                        url: 'ingresarUsuario2.jsp',
                        success: function(data){
                           $('#contenido').html(data);

                        }
                    });
                });
                $(".crearusuario").click(function(){
                    var action = this.id;
                    $.ajax({
                        url: action +'.action',
                        success: function(data){


                                $('#contenido').html(data);


                        }
                    })

                })

    });
        function onClickEditarUsuario(id) {
            // alert("La historia que seleccionaste es la :"+id);

            $.ajax({
                type : 'POST',
                url : 'buscarDataUsuario.action',
                data : {'usuarioModel.idUsuario': id},
                success : function(data) {
                    $('#nombrehistoria').val(data.historiaDTO.nombrehistoria);
                    $('#myModal').modal('show');
                },
                error : function(erro) {
                    alert("error servidor");
                }
            });


        }
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
       // document.formModificarUsu.idRol.selectedIndex=rolId-1;
        $('.conte').show();

        $('#myModal').modal('show')
}
</script>
</body>
</html>
<!-- Control de sesión - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>