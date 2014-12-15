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
    <!-- Librerías JS para el tema macadmin -->
    <script src="framework/datatable/jquery.dataTables2.js"></script>
    <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap-->
    <!-- fin  Librerías para el tema macadmin -->
    <script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>

    <style type="text/css">
        div.growlUI{
            background: black no-repeat 10px 10px;
            position: absolute;
        }
        div.growlUI{
            color: #ffffff;
            padding: 10px;
        }

    </style>
    <script>


    </script>
    <script>
        $(document).ready(function(){
            $('.modal').appendTo($('body'));
            $('#data-table').dataTable({
                destroy: true,
                sPaginationType: "full_numbers",
                paging: true,
                searching: true
            });
            $('#crear').click(function(){
                $.ajax({
                    url: 'ingresarProyecto2.jsp',
                    success: function(data){
                        $('#contenidoPagina').html(data);
                    }
                });
            });
            $('#guardarModPro').click(function(){
                $.ajax({
                    url: "modDataPro.action",
                    data: $('#formModPro').serializeArray(),
                    type:"post",
                    dataType:"json",
                    success: function (data) {

                        if(data.mensajeDTO.tipo == "success"){

                            $('#myModal').modal('hide');
                            $.growlUI(data.mensajeDTO.texto);
                            setTimeout(function(){

                                $.ajax({
                                    url: 'listarProyectos.action',
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


        }); // fin document ready

        function onClickEditarProyecto(id) {
            //alert("La historia que seleccionaste es la :"+id);

            $.ajax({
                type : 'POST',
                url : 'DataProyecto.action',
                data : {'idPro': id},
                success : function(data) {
                    $('#proId').val(data.proyectoDTO.proId);
                    $('#proNombre').val(data.proyectoDTO.proNombre);
                    $('#proDescripcion').val(data.proyectoDTO.proDescripcion);
                    $('#estado').val(data.proyectoDTO.estado);
                    $('#usuLoginConexion').val(data.proyectoDTO.usuarioDTO.usuLoginConexion);
                    $('#myModal').modal('show');
                },
                error : function(erro) {
                    alert("error servidor");
                }
            });


        }


    </script>
</head>
<body>

<!-- Matter -->
<div class="matter" id="contenido">

    <div>
        <a type="button" class="action btn btn-default" id="crear" style="margin-left: 20px;" >Crear</a>

    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Proyectos</div>
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
                                    <!-- aqui comienza el data table-->
                                    <table class="table table-collase table-condensed table-responsive" cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%">
                                        <thead class="btn-default">
                                        <tr >
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Descripcion</th>
                                            <th>Estado</th>
                                            <th>Usuario Creador</th>
                                            <th>Modificar Proyecto</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listPro" >

                                            <tr>
                                                <td><s:property value="proId"/></td>
                                                <td><s:property value="proNombre"/></td>
                                                <td><s:property value="proDescripcion"/></td>
                                                <td><s:property value="estado"/></td>
                                                <td><s:property value="usuarioDTO.usuLoginConexion"/></td>
                                                <td><button class="btn btn-xs btn-warning mod btnChico" onclick="onClickEditarProyecto('<s:property value="proId"/>')"> <span class="glyphicon glyphicon-edit" ></span></button></td>
                                            </tr>
                                        </s:iterator>
                                        </tbody>

                                    </table>
                                    <div class="clearfix"></div>
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
    <!-- Scroll to top -->
    <span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>


    <!-- modal 2 -->
    <div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Modificar Proyecto</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="formModPro">
                    <div class="form-group" style="display: none;">
                        <label class="control-label">ID Proyecto:</label>
                        <input type="text" class="form-control" name="proId" id="proId">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nombre Proyecto:</label>
                        <input type="text" class="form-control" name="proNombre" id="proNombre">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Estado:</label>
                        <select class="form-control" name="estado" id="estado">
                            <option value="en progreso">en progreso</option>
                            <option value="finalizado">finalizado</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Usuario Creador:</label>
                        <input type="text" class="form-control" name="usuLoginConexion" id="usuLoginConexion" readonly>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Descripcion:</label>
                        <textarea class="form-control"  name="proDescripcion" id="proDescripcion" rows="9"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardarModPro">Guardar Cambios</button>
            </div>
        </div>
    </div>
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

</body>
</html>
<!-- Control de sesión - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>