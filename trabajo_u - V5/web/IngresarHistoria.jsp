<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<link href="framework/bootstrap/css/bootstrap-datepicker.css" media="all" rel="stylesheet" />
<script  src="framework/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#btnguardar').click(function(){
            $('#formHistoria').validate({
                errorClass: 'help-block',
                rules: {
                    'nombre': 'required',
                    'prioridad': 'required',
                    'descripcion': 'required'

                },
                messages: {
                    'nombre': 'Este campo es requerido',
                    'prioridad': 'Este campo es requerido',
                    'descripcion': 'Este campo es requerido'

                },
                highlight: function(element) {
                    $(element).closest('.form-group').addClass('has-error has-feedback');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error');
                }
            });
            var formulario = $('#formHistoria').valid();
            if(formulario){
                $.ajax({
                    url:'#.action',
                    data: $('#formHistoria').serializeArray(),
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
    <form id="formHistoria" class="form-horizontal" method="get" action="#" role="form">
        <fieldset>
            <legend>Datos Usuario</legend>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Prioridad:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="prioridad"  id="prioridad" cssClass="form-control" placeholder="Ingrese prioridad"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Nombre:</label>
            <div class="col-sm-10 col-md-8">
                <s:textfield name="nombre"  id="nombre" cssClass="form-control" placeholder="Ingrese nombre"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Estado:</label>
            <div class="col-sm-10 col-md-8">
                <select class="form-control" data-smart-select>
                    <option value="1">Ingresado</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-md-2 control-label">Descripcion</label>
            <div class="col-sm-10 col-md-8">
                <s:textarea name="descripcion" id="descripcion" cssClass="form-control" rows="3"/>

            </div>
        </div>

        <div class="form-group form-actions">
            <div class="col-sm-offset-2 col-sm-10 col-md-offset-2 col-md-10">
                <button type="reset" class="btn btn-default">Limpiar</button>
                <button  class="btn btn-success" id="btnguardar">Guardar</button>
            </div>
        </div>
        </fieldset>
    </form>
</div>