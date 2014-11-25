<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>
<script  src="framework/jquery/validate_form.js" type="text/javascript"></script>
<script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
<script  src="framework/jquery/jquery-ui.min.js" type="text/javascript"></script>
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
        $('#btnguardar').click(function(){
            $('#formUsuario').validate({
                errorClass: 'help-block',
                rules: {
                    'nombre': 'required',
                    'apaterno': 'required',
                    'amaterno': 'required',
                    'clave': 'required',
                    'correo': {required: true, email:true}

                },
                messages: {
                    'nombre': 'Este campo es requerido',
                    'apaterno': 'Este campo es requerido',
                    'amaterno': 'Este campo es requerido',
                    'clave': 'Este campo es requerido',
                    'correo': {required: 'Debe ingresar un email',
                               email:'Debe ingresar un E-mail con formato correcto. Por ejemplo: user@grupogtd.com'}
                },
                highlight: function(element) {
                    $(element).closest('.form-group').addClass('has-error has-feedback');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error');
                }
            });
            var formulario = $('#formUsuario').valid();
            if(formulario){
                $.ajax({
                    url:'pepito.action',
                    data: $('#formUsuario').serializeArray(),
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
<div class="content-wrapper">
    <form action="pepito.action" class="form-horizontal" method="post" id="formUsuario">
        <fieldset>
            <legend>Datos Usuario</legend>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">cargo:</label>
                <div class="col-sm-10 col-md-8">
                    <s:select name="cargo.idCargo"
                              headerKey="-1"
                              headerValue="-- seleccionar cargo --"
                              list="listaCargo"
                              listKey="idCargo"
                              listValue="nombreCargo"
                              cssClass="form-control"
                            />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Nombre:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="nombre"  id="nombre" cssClass="form-control" placeholder="Ingrese nombre"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Apellido Paterno:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="apaterno"  id="apeterno" cssClass="form-control" placeholder="Ingrese Apellido Paterno"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Apellido Materno:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="amaterno"  id="amaterno" cssClass="form-control" placeholder="Ingrese Apellido Materno"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Correo:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="correo"  id="correo" cssClass="form-control" placeholder="Ingrese e-mail"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Contraseña:</label>
                <div class="col-sm-10 col-md-8">
                    <s:password name="clave"  id="clave" cssClass="form-control" placeholder="Ingrese password"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Estado:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="estado"  id="estado" cssClass="form-control" placeholder="Ingrese Estado"/>
                </div>
            </div>
            <div class="form-group form-actions">
            <div class="col-sm-offset-2 col-sm-10" align="rigth">
                <button type="reset" class="btn btn-default">Limpiar</button>
                <button  class="btn btn-success" id="btnguardar">Guardar</button>
            </div>
        </div>
        </fieldset>
    </form>
</div>

