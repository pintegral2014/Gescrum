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
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>

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
                    <div class="pull-left">Ingreso de TestCase</div>
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
                        <form class="form-horizontal" role="form" method="post" action = 'crearTestCase' name="formCreaTestCase" id="formCreaTestCase">


                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Enunciado</label>
                                <div class="col-lg-5">
                                    <s:textfield name="testEnun" id="testEnun" cssClass="form-control" placeholder="Ingrese Enunciado"/>
                                    <span class="glyphicon form-control-feedback" id="testEnun1"></span>
                                </div>
                            </div>

                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Objetivo</label>
                                <div class="col-lg-5">
                                    <s:textfield name="testObj"  id="testObj" cssClass="form-control" placeholder="Ingrese Objetivo"/>
                                    <span class="glyphicon form-control-feedback" id="testObj1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Dato Requerido</label>
                                <div class="col-lg-5">
                                    <s:textarea name="testDato"  id="testDato" cssClass="form-control" placeholder="Ingrese Dato Requerido" />
                                    <span class="glyphicon form-control-feedback" id="testDato1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Precondiciones</label>
                                <div class="col-lg-5">
                                    <s:textarea name="testPrec"  id="testPrec" cssClass="form-control" placeholder="Ingrese Precondiciones" />
                                    <span class="glyphicon form-control-feedback" id="testPrec1"></span>
                                </div>
                            </div>
                            <!-- buttons -->
                            <div class="col-lg-9 col-lg-offset-3">

                                <button type="button" id="btnCrearTestCase" class="btn btn-warning btn-smt ">Guardar</button>
                                <button type="reset" class="btn btn-default btn-smt">Limpiar</button>
                                <button type="button" class="btn btn-danger btn-smt" id="volver" name="listaTareaTestCase">Volver</button>
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
<script>
    $(document).ready(function(){
        $('.modal').appendTo($('body'));
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

    $('#btnCrearTestCase').click(function(){

            $.ajax({
                url: "crearTestCase.action",
                data: $('#formCreaTestCase').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {


                    if(data.mensaje.tipo == "success"){

                        $.growlUI(data.mensaje.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listaTareaTestCase.action',
                                success: function(data){
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });


                        }, 2000);
                    }
                    else{
                        $('#myModal').modal('hide');
                        $.growlUI(data.mensaje.texto);
                    }
                }
            });
        });


</script>