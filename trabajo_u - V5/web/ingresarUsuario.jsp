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
        $('#btnguardar').click(function(){
            $('#formUsuario').validate({
                errorClass: 'help-block',
                rules: {
                    'usuNombre': 'required',
                    'usuApePat': 'required',
                    'usuApeMat': 'required',
                    'usuClave': 'required',
                    'usuUser':'required',
                    'usuCorreo': {required: true, email:true}


                },
                messages: {
                    'usuNombre': 'Este campo es requerido',
                    'usuApePat': 'Este campo es requerido',
                    'usuApeMat': 'Este campo es requerido',
                    'usuClave': 'Este campo es requerido',
                    'usuUser': 'Este campo es requerido',
                    'usuCorreo': {required: 'Debe ingresar un email',
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

    <script>
        $(function() {
            $( "#accordion" ).accordion();
        });
    </script>


<div class="content-wrapper">
    <form action="pepito.action" class="form-horizontal" method="post" id="formUsuario">
        <fieldset>
            <legend>Datos Usuario</legend>




<div id="accordion">
    <h3>Datos Personales</h3>
    <div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Nombre:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="usuNombre"  id="usuNombre" cssClass="form-control" placeholder="Ingrese nombre"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Apellido Paterno:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="usuApePat"  id="usuApePat" cssClass="form-control" placeholder="Ingrese Apellido Paterno"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Apellido Materno:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="usuApeMat"  id="usuApeMat" cssClass="form-control" placeholder="Ingrese Apellido Materno"/>
            </div>
        </div>
    </div>



    <h3>Datos de Usuario</h3>
    <div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Correo:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="usuCorreo"  id="usuCorreo" cssClass="form-control" placeholder="Ingrese e-mail"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Contraseña:</label>
            <div class="col-sm-10 col-md-8">
                <s:password name="usuClave"  id="usuClave" cssClass="form-control" placeholder="Ingrese password"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Estado:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="usuEstado"  id="usuEstado" cssClass="form-control" placeholder="Ingrese Estado"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Usuario:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="usuUser"  id="usuUser" cssClass="form-control" placeholder="Ingrese usuario de conexion"/>
            </div>
        </div>
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
