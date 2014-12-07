<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Jordan
  Date: 25-11-2014
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <link rel="stylesheet" href="framework/macAdminStyle/css/bootstrapValidator.min.css"/>
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap-theme.min.css" rel="stylesheet">


    <script src="framework/jquery/jquery.validate.js"></script>
    <script src="framework/jquery/login.validate.2.js" type="text/javascript"></script>
    <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
    <script src="framework/datatable/jquery.dataTables2.js"></script>
    <script src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
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
</head>
<body>
<div class="container">

    <div class="row">

        <div class="col-md-12">


            <div class="widget wgreen">

                <div class="widget-head">
                    <div class="pull-left">Ingreso de HDU</div>
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
                        <form class="form-horizontal" action = "ingresarHistoria.action" role="form" method="post" action="" name="formHistoria" id="formHistoria">

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Proyecto</label>
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
                                </div>
                            </div>
							<input type="hidden" name="usuarioCrea" value="<%=session.getAttribute("loginConexion")%>">

                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Nombre HDU</label>
                                <div class="col-lg-5">
                                    <input type="text" name="nombrehistoria" id="nombrehistoria" class="form-control" placeholder="Input Box">
                                    <span class="glyphicon form-control-feedback" id="nombre1"></span>
                                </div>
                            </div>

                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Prioridad</label>
                                <div class="col-lg-5">
                                    <input type="text" name="prioridad" id="prioridad" class="form-control">
                                    <span class="glyphicon form-control-feedback" id="prioridad1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Eventum</label>
                                <div class="col-lg-5">
                                    <input type="text" name="eventum" id="eventum" class="form-control" placeholder="Ingrese n° eventum">
                                    <span class="glyphicon form-control-feedback" id="eventum1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Dependencia</label>
                                <div class="col-lg-5">
                                    <input type="text" name="dependencia" id="dependencia" class="form-control">
                                    <span class="glyphicon form-control-feedback" id="dependencia1"></span>
                                </div>
                            </div>

                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Descripcion</label>
                                <div class="col-lg-5">
                                    <textarea class="form-control" name="descripcion" id="descripcion" rows="20" placeholder="Ingrese descripcion de historia"></textarea>
                                    <span class="glyphicon form-control-feedback" id="descripcion1"></span>
                                </div>
                            </div>
                            <div class="form-group  has-feedback">
                                <label class="col-lg-2 control-label">Criterios de aceptacion</label>
                                <div class="col-lg-5">
                                    <textarea class="form-control" name="criAceptacion" id="criAceptacion" rows="5" placeholder="Ingrese detalles"></textarea>
                                    <span class="glyphicon form-control-feedback" id="aceptacion1"></span>
                                </div>
                            </div>



                            <!-- buttons -->
                            <div class="col-lg-9 col-lg-offset-3">

                                <button type="button" id="btnCrearHistoria" name="Enviar"  class="btn btn-warning btn-smt ">Enviar</button>
                                <button type="reset" class="btn btn-default btn-smt">Limpiar</button>
                                <button type="button" class="btn btn-danger btn-smt" id="volver" name="listarHistorias">Volver</button>
                            </div>
                            <div class="form-group">
                                <div class="col-md-9 col-md-offset-3">
                                    <div id="messages"></div>
                                </div>
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
    });

</script>


</body>
</html>
