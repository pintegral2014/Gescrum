<%-- 
    Document   : IngresarHistoria2
    Created on : 17-11-2014, 16:31:09
    Author     : Dvaldebenito
--%>
    <script src="framework/macAdminStyle/js/jquery.js"></script>

    <script  src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script  src="framework/jquery/jquery-ui.min.js" type="text/javascript"></script>
    <script src="framework/jquery/jquery.validate.js"></script>
    <script  src="framework/jquery/login.validate.2.js" type="text/javascript"></script>
    <script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
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

         <div class="container-fluid "> <div class="row"><div class="col-lg-8">
                  <form class="form-horizontal" method="post" action="" name="formHistoria" id="formHistoria">
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Nombre</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="nombre" id="nombre" class="form-control" placeholder="" autofocus>
                          <span class="glyphicon form-control-feedback" id="nombre1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Prioridad</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="prioridad" id="prioridad" class="form-control" placeholder="">
                          <span class="glyphicon form-control-feedback" id="prioridad1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Eventum</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="eventum" id="eventum" class="form-control" placeholder="">
                          <span class="glyphicon form-control-feedback" id="eventum1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Descripción</label>
                        <div class="col-md-6">
                          <div class="input-group">
                              <textarea type="text" name="descripcion" id="descripcion" class="form-control" placeholder=""></textarea>
                          <span class="glyphicon form-control-feedback" id="descripcion1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Dependencia</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="dependencia" id="dependencia" class="form-control" placeholder="">
                          <span class="glyphicon form-control-feedback" id="dependencia1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Cód. Aceptación</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="aceptacion" id="aceptacion" class="form-control" placeholder="">
                          <span class="glyphicon form-control-feedback" id="aceptacion1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Fec. Creación</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="creacion" id="creacion" class="form-control" placeholder="">
                          <span class="glyphicon form-control-feedback" id="creacion1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Usuario Creador</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="creador" id="creador" class="form-control" placeholder="">
                          <span class="glyphicon form-control-feedback" id="creador1"></span>
                          </div>
                        </div>
                    </div>
                      <div class="form-group has-feedback">
                        <label class="col-md-3 control-label">Backlog</label>
                        <div class="col-md-6">
                          <div class="input-group">
                          <input type="text" name="backlog" id="backlog" class="form-control" placeholder="">
                          <span class="glyphicon form-control-feedback" id="backlog1"></span>
                          </div>
                        </div>
                    </div>
                      <!-- buttons -->
                    <div class="col-lg-9 col-lg-offset-3">

                        <button type="button" id="btnCrearHistoria" name="Enviar"  class="btn btn-warning btn-smt ">Enviar</button>
                        <button type="reset" class="btn btn-default btn-smt">Limpiar</button>
                        <button type="button" class="btn btn-danger btn-smt " onclick="javascript:window.location = 'gestionarHistoria2.jsp' ">Volver</button>
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
                      
                  
                  </form>
                 
              </div>
          </div>
          </div>



