<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>
<script  src="framework/jquery/validate_form.js" type="text/javascript"></script>
<script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
<script  src="framework/jquery/jquery-ui.min.js" type="text/javascript"></script>

<link href="framework/jquery-ui-1.11.2.custom/jquery-ui.css" rel="stylesheet">



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
        $('#btnModNombre').click(function(){

            $('#formModNombre').validate({
                errorClass: 'help-block',
                rules: {
                    'usuNewNombre': 'required',
                    'confNombre': 'required'

                },
                messages: {
                    'usuNewNombre': 'Este campo es requerido',
                    'confNombre': 'Este campo es requerido'
                         },
                highlight: function(element) {
                    $(element).closest('.form-group').addClass('has-error has-feedback');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error');
                }
            });
            var formModNombreVal = $('#formModNombre').valid();
            if(formModNombreVal){
                $.ajax({
                    url:'pepito.action',
                    data: $('#formModNombre').serializeArray(),
                    success:function(data){
                        //alert(data.mensaje.texto);
                        //$('#mensaje').html(data.mensaje.texto);
                        //$('#myModal').show();
                        $.growlUI(data.mensaje.texto);
                    }
                });
            }
            return false;
        });

    });

</script>

<script>
    $(function() {
        $( "#accordion" ).accordion();
    });
</script>


<div class="content-wrapper">

        <fieldset>
            <legend>Datos Usuario</legend>


            <div id="accordion">
                <h3>Modificar Nombre</h3>
                <div>
                    <form name="formModNombre" id="formModNombre" method="POST" action="pepito.action">
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Nuevo Nombre:</label>
                            <div class="col-sm-10 col-md-8">
                                <input type="text" name="usuNewNombre"  id="usuNewNombre" cssClass="form-control" placeholder="Ingrese nuevo nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Confirme con clave de cuenta de usuario:</label>
                            <div class="col-sm-10 col-md-8">
                                <input type="password" name="confNombre"  id="confNombre" cssClass="form-control" placeholder="Ingrese clave de usuario"/>
                            </div>
                        </div>
                        <div>
                            <input type="submit" name="btnModNombre" class="btn btn-primary" value="Modificar">
                        </div>
                    </form>

                </div>

                <h3>Modificar Clave</h3>
                <div>
                    <form name="formModClave" id="formModClave" action="#" method="POST">
                    <div class="form-group">
                        <label class="col-sm-2 col-md-2 control-label">Nueva Clave:</label>
                        <div class="col-sm-10 col-md-8">
                            <input type="password" name="usuNewClave"  id="usuNewClave" cssClass="form-control" placeholder="Ingrese nueva clave"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-md-2 control-label">Confirme Clave:</label>
                        <div class="col-sm-10 col-md-8">
                            <input type="password" name="usuConfClave"  id="usuConfClave" cssClass="form-control" placeholder="Reingrese clave"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-md-2 control-label">Clave antigua:</label>
                        <div class="col-sm-10 col-md-8">
                            <input type="text" name="usuOldClave"  id="usuOldClave" cssClass="form-control" placeholder="Ingrese Clave antigua"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" name="btnModClave" id="btnModClave" value="confirmar">
                    </div>
                    </form>
                </div>

                <h3>Modificar Correo Electronico</h3>
                <div>
                    <form name="formModClave" id="formModCorreo" action="#" method="POST">
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Correo Nuevo:</label>
                            <div class="col-sm-10 col-md-8">
                                <input type="text" name="usuNewCorreo"  id="usuNewCorreo" cssClass="form-control" placeholder="Ingrese nuevo correo"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Correo Antiguo:</label>
                            <div class="col-sm-10 col-md-8">
                                <input type="text" name="usuConfCorreo"  id="usuConfCorreo" cssClass="form-control" placeholder="Reingrese clave"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Clave:</label>
                            <div class="col-sm-10 col-md-8">
                                <input type="password" name="usuConfClaveCorreo"  id="usuConfClaveCorreo" cssClass="form-control" placeholder="Ingrese Clave antigua"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" name="btnModCorreo" id="btnModCorreo" value="Confirmar">
                        </div>
                    </form>
                </div>
            </div>

        </fieldset>

</div>
