<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title></title>

    <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="framework/macAdminStyle/css/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="framework/macAdminStyle/js/bootstrapValidator.min.js"> </script>
    <script src="framework/jquery/jquery.validate.js"></script>
    <script  src="framework/jquery/login.validate.2.js" type="text/javascript"></script>
    <!-- Bootstrap core CSS -->
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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

<body>
<div class="container">

    <div class="row">

        <div class="col-md-12">


            <div class="widget wgreen">

                <div class="widget-head">
                    <div class="pull-left">Ingreso de Proyecto</div>
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
                        <form class="form-horizontal" role="form" method="post"  name="formCreaProyecto" id="formCreaProyecto">


                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Nombre Proyecto</label>
                                <div class="col-lg-5">
                                    <s:textfield name="proNombre"  id="proNombre" cssClass="form-control" placeholder="Ingrese nombre proyecto"/>
                                    <span class="glyphicon form-control-feedback" id="proNombre1"></span>
                                </div>
                            </div>

                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Estado</label>
                                <div class="col-lg-5">
                                    <s:textfield name="estado"  id="estado" cssClass="form-control" value ="Ingresado" readonly="true"/>
                                    <span class="glyphicon form-control-feedback" id="estado1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Descripcion</label>
                                <div class="col-lg-5">
                                    <s:textarea name="proDescripcion"  id="proDescripcion" cssClass="form-control" placeholder="Ingrese Descripcion" />
                                    <span class="glyphicon form-control-feedback" id="proDescripcion1"></span>
                                </div>
                            </div>
                            <!-- buttons -->
                            <div class="col-lg-9 col-lg-offset-3">

                                <button type="button" id="btnCrearProyecto"   class="btn btn-warning btn-smt ">Guardar</button>
                                <button type="reset" class="btn btn-default btn-smt">Limpiar</button>
                                <button type="button" class="btn btn-danger btn-smt" id="volver" name="listarProyectos">Volver</button>
                            </div>
                            <div class="form-group">
                                <div class="col-md-9 col-md-offset-3">
                                    <div id="messages"></div>
                                </div>
                            </div>


                            <!--  <div class="form-group  has-feedback">
                                  <div class="col-lg-offset-2 col-lg-6">
                                      <button type="button" class="btn btn-sm btn-primary">Guardar</button>

                                  </div>
                              </div> -->

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
        $('#btnCrearProyecto').click(function() {

            $.ajax({
                url: "crearProyecto.action",
                data: $('#formCreaProyecto').serializeArray(),
                type: "post",
                dataType: "json",
                success: function (data) {

                    if (data.mensajeDTO.tipo == "success") {

                        $.growlUI(data.mensajeDTO.texto);
                        setTimeout(function () {

                            $.ajax({
                                url: 'listarProyectos.action',
                                success: function (data) {
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });

                        }, 4000);
                    }
                    else {

                        $.growlUI(data.mensajeDTO.texto);
                    }
                }
            });
        });
    });

</script>

</body>
