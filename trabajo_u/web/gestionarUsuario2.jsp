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
                  <form role="form" id="formModUsu">
                      <div class="form-group" style="display: none;">
                          <label class="col-lg-4 control-label">usuId</label>
                          <div class="col-lg-5">
                              <input type="text" name="usuId" id="usuId" class="form-control" placeholder="">
                          </div><br>
                      </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Nombre</label>
                        <div class="col-lg-5">
                          <input type="text" name="usuNombre" id="usuNombre" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Apellido Paterno</label>
                        <div class="col-lg-5">
                          <input type="text" name="usuApellidoPaterno" id="usuApellidoPaterno" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Apellido Materno</label>
                        <div class="col-lg-5">
                          <input type="text" name="usuApellidoMaterno" id="usuApellidoMaterno" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Correo</label>
                        <div class="col-lg-5">
                          <input type="email" name="usuCorreo" id="usuCorreo" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Contrasena</label>
                        <div class="col-lg-5">
                          <input type="password" name="usuClave" id="usuClave" class="form-control" placeholder="******">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Estado</label>
                        <div class="col-lg-5">
                          <input type="text" name="usuEstado" id="usuEstado" class="form-control" placeholder="">
                        </div><br>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Usuario</label>
                        <div class="col-lg-5">
                          <input type="text" name="usuLoginConexion" id="usuLoginConexion" class="form-control" readonly>
                        </div><br>
                    </div>
                      
                      <div class="form-group">
                          <label class="col-lg-4 control-label">Rol</label>
                          <div class="col-lg-5">
                              <s:select
                                      name="rol.rol_id"
                                      id="rol_id"
                                      headerKey="-1"
                                      headerValue="-- seleccionar rol --"
                                      list="listarol"
                                      listKey="rol_id"
                                      listValue="rol_descripcion"
                                      cssClass="form-control"
                                      />
                          </div>
                      </div>
                      
                  </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnModUsu">Guardar Cambios</button>
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

            $.ajax({
                type : 'POST',
                url : 'buscarDataUsuario.action',
                data : {'usuarioId': id},
                success : function(data) {
                    $('#usuId').val(data.usuarioDTO.usuId);
                    $('#usuNombre').val(data.usuarioDTO.usuNombre);
                    $('#usuApellidoPaterno').val(data.usuarioDTO.usuApellidoPaterno);
                    $('#usuApellidoMaterno').val(data.usuarioDTO.usuApellidoMaterno);
                    $('#usuCorreo').val(data.usuarioDTO.usuCorreo);
                    $('#usuClave').val(data.usuarioDTO.usuClave)
                    $('#usuEstado').val(data.usuarioDTO.usuEstado)
                    $('#usuLoginConexion').val(data.usuarioDTO.usuLoginConexion)
                    $('#rol_id').val(data.usuarioDTO.rol.rol_id)
                    $('#myModal').modal('show');
                },
                error : function(erro) {
                    alert("error servidor");
                }
            });


        };

        $('#btnModUsu').click(function(){

            $.ajax({
                url: "modDataUsu.action",
                data: $('#formModUsu').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensaje.tipo == "success"){

                        $('#myModal').modal('hide');
                        $.growlUI(data.mensaje.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listaUsuarios.action',
                                success: function(data){
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });

                        }, 2000);
                    }
                    else{
                        $('#myModal').modal('hide');
                        $.growlUI(data.mensajeDTO.texto);
                    }
                }
            });
        });
</script>
</body>
</html>
<!-- Control de sesión - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>