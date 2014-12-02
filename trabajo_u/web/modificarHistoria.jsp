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
        $('#bntModificarHistoria').click(function(){
            $('#formModHis').validate({
                errorClass: 'help-block',
                rules: {
                    'modHisNom': 'required',

                    'modHisPri': 'required'

                },
                messages: {
                    'modHisNom': 'Este campo es requerido',

                    'modHisPri': 'Este campo es requerido'

                },
                highlight: function(element) {
                    $(element).closest('.form-group').addClass('has-error has-feedback');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error');
                }
            });
            var formulariohis = $('#formModHis').valid();
            if(ormulariohis){
                $.ajax({
                    url:'pepito.action',
                    data: $('#formModHis').serializeArray(),
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


<div>
    <form name="formModHis" id="formModHis" action="#" method="POST">
    <div>
        Nuevo Nombre: <input type="text" name="modHisNom" id="modHisNom" placeholder="Ingrese nuevo Nombre">
    </div>

    <div>
        Prioridad: <input type="text" name="modHisPri" id="modHisPri" placeholder="Seleccione nueva prioridad">
    </div>
        <div>
            <input type = "submit" class="btn btn-primary" name="bntModificarHistoria" id="bntModificarHistoria" value="Modificar">
        </div>
    </form>
</div>