<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<link href="framework/bootstrap/css/bootstrap-datepicker.css" media="all" rel="stylesheet" />
<script  src="framework/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#btnguardar').click(function(){
            $('#formTestCase').validate({
                errorClass: 'help-block',
                rules: {
                    'enunciado': 'required',
                    'objetivo': 'required',
                    'requerido': 'required',
                    'Precondicion':'required'


                },
                messages: {
                    'enunciado': 'Este campo es requerido no sea pao',
                    'objetivo': 'Este campo es requerido no sea pao',
                    'requerido': 'Este campo es requerido no sea pao',
                    'Precondicion':'Este campo es requerido no sea pao'

                },
                highlight: function(element) {
                    $(element).closest('.form-group').addClass('has-error has-feedback');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error');
                }
            });
            var formulario = $('#formTestCase').valid();
            if(formulario){
                $.ajax({
                    url:'#.action',
                    data: $('#formTestCase').serializeArray(),
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
    <form id="formTestCase" class="form-horizontal" method="get" action="#" role="form">
        <fieldset>
            <legend>Datos Test Case</legend>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Enunciado:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="enunciado"  id="enunciado" cssClass="form-control" placeholder="Ingrese enunciado"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Objetivo:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="objetivo"  id="objetivo" cssClass="form-control" placeholder="Ingrese objetivo"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Dato requerido:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="requerido"  id="requerido" cssClass="form-control" placeholder="Ingrese dato"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Precondiciones:</label>
                <div class="col-sm-10 col-md-8">
                    <s:textfield name="Precondicion"  id="Precondicion" cssClass="form-control" placeholder="Ingrese precondiciones"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 control-label">Asigne una tarea:</label>
                <div class="col-sm-10 col-md-8">
                    <select class="form-control" data-smart-select>
                        <option value="1">tarea1</option>
                        <option value="2">tarea2</option>
                        <option value="3">tarea3</option>
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