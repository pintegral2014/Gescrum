<%--
    Document   : ingresarUsuario2
    Created on : 30-11-2014, 16:08:32
    Author     : jcarrasco
--%>
<%@taglib uri="/struts-tags" prefix="s" %>


<!--<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>-->
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="framework/macAdminStyle/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="framework/macAdminStyle/js/bootstrapValidator.min.js"> </script>
<script src="framework/jquery/jquery.validate.js"></script>
<script  src="framework/jquery/login.validate.2.js" type="text/javascript"></script>

<script src="framework/bootstrap-3.2.0/docs/assets/js/ie-emulation-modes-warning.js"></script>


<script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
<script  src="framework/jquery/jquery-ui.min.js" type="text/javascript"></script>
<style type="text/css">
    div.growlUI{
        background: black;
        position: absolute;
    }
    div.growlUI{
        color: #ffffff;
        padding: 10px;
    }
</style>
<script>
    $(document).ready(function(){


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

</script>
<body>
<div class="container">

    <div class="row">

        <div class="col-md-12">


            <div class="widget wgreen">

                <div class="widget-head">
                    <div class="pull-left">Ingreso de usuario</div>
                    <div class="widget-icons pull-right">
                        <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                    <div class="padd">

                        <br />
                        <!-- Form starts.  -->
                        <form class="form-horizontal" action="ingresaNewUsuario.action" id="formUsuario" name="formUsuario">


                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Nombre:</label>
                                <div class="col-lg-5">
                                    <input type="text" name="usuNombre" id="usuNombre" class="form-control" placeholder="">
                                    <span class="glyphicon form-control-feedback" id="usuNombre1"></span>
                                </div>
                            </div>

                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Ap. Paterno:</label>
                                <div class="col-lg-5">
                                    <input type="text" name="usuApellidoPaterno" id="usuApellidoPaterno" class="form-control" placeholder="">
                                    <span class="glyphicon form-control-feedback" id="usuApellidoPaterno1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Ap. Materno:</label>
                                <div class="col-lg-5">
                                    <input type="text" name="usuApellidoMaterno" id="usuApellidoMaterno" class="form-control" placeholder="">
                                    <span class="glyphicon form-control-feedback" id="usuApellidoMaterno1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Correo:</label>
                                <div class="col-lg-5">
                                    <input type="email" name="usuCorreo" id="usuCorreo" class="form-control" placeholder="usuario@correo.cl">
                                    <span class="glyphicon form-control-feedback" id="usuCorreo1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Clave:</label>
                                <div class="col-lg-5">
                                    <input type="password" name="usuClave" id="usuClave" class="form-control" placeholder="">
                                    <span class="glyphicon form-control-feedback" id="usuClave1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Estado:</label>
                                <div class="col-lg-5">
                                    <input type="text" name="usuEstado" id="usuEstado" class="form-control" value="vigente" readonly>
                                    <span class="glyphicon form-control-feedback" id="usuEstado1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Login:</label>
                                <div class="col-lg-5">
                                    <input type="text" name="usuLoginConexion" id="usuLoginConexion" class="form-control" placeholder="">
                                    <span class="glyphicon form-control-feedback" id="usuLoginConexion1"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Rol</label>
                                <div class="col-lg-5">
                                    <s:select
                                            name="rol.rolId"
                                            id="rol"
                                            headerKey="-1"
                                            headerValue="-- seleccionar rol --"
                                            list="listarol"
                                            listKey="rolId"
                                            listValue="rol_descripcion"
                                            cssClass="form-control"
                                            />
                                </div>
                            </div>


                            <!-- buttons -->
                            <div class="col-lg-9 col-lg-offset-3">

                                <button type="button" id="btnCrearUsuario" name="Enviar"  class="btn btn-warning btn-smt ">Guardar</button>
                                <button type="reset" class="btn btn-default btn-smt">Limpiar</button>
                                <button type="button" class="btn btn-danger btn-smt" id="volver"  name="listaUsuarios" >Volver</button>
                            </div>
                            <div class="form-group">
                                <div class="col-md-9 col-md-offset-3">
                                    <div id="messages"></div>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
                <div class="widget-foot">
                    <!-- Footer goes here -->
                </div>
            </div>

        </div>

    </div>

</div>



<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

</body>
