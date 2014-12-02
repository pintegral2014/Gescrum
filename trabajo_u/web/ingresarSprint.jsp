<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<link href="framework/bootstrap/css/bootstrap-datepicker.css" media="all" rel="stylesheet" />
<script  src="framework/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#btnguardar').click(function(){
            $('#formSprint').validate({
                errorClass: 'help-block',
                rules: {
                    'nombreSprint': 'required',
                    'descripcionSprint': 'required'



                },
                messages: {
                    'nombreSprint': 'Este campo es requerido no sea pao',
                    'descripcionSprint': 'Este campo es requerido no sea pao'


                },
                highlight: function(element) {
                    $(element).closest('.form-group').addClass('has-error has-feedback');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error');
                }
            });
            var formulario = $('#formSprint').valid();
            if(formulario){
                $.ajax({
                    url:'#.action',
                    data: $('#formSprint').serializeArray(),
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
    <form id="formSprint" class="form-horizontal" method="get" action="#" role="form">
        <fieldset>
            <legend>Ingresar Sprint</legend>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Nombre de Sprint:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="nombreSprint"  id="nombreSprint" cssClass="form-control" placeholder="Ingrese Nomnbre"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Descripcion:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textarea name="descripcionSprint"  id="descripcionSprint" cssClass="form-control" placeholder="Ingrese Descripcion"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Asigne un Grupo:</label>
                <div class="col-sm-10 col-md-8">
                    <select class="form-control" data-smart-select>
                        <option value="A">Grupo A</option>
                        <option value="B">Grupo B</option>
                        <option value="C">Grupo C</option>
                    </select> </div>
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