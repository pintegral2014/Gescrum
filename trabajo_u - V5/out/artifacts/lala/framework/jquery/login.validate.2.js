$( document ).ready(function() {
    $('#formLogin').validate({
        rules: {
            'loginConexion': 'required',
            'clave': 'required'
        },
        messages: {
            'loginConexion': 'Debe ingresar el login usuario',
            'clave': 'Debe ingresar clave de usuario'
        },

        highlight: function(element) {
            var id_attr = "#" + $( element ).attr("id") + "1";
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            $(id_attr).removeClass('glyphicon-ok').addClass('glyphicon-remove');
        },
        unhighlight: function(element) {
            var id_attr = "#" + $( element ).attr("id") + "1";
            $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            $(id_attr).removeClass('glyphicon-remove').addClass('glyphicon-ok');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            if(element.length) {
                error.insertAfter(element);
            } else {
                error.insertAfter(element);
            }
        }

    });
    $("#clave").keydown(function(event) {
            if(event.shiftKey)
            {  event.preventDefault();}
            if (event.keyCode == 46 || event.keyCode == 8)    {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
    });
    $('#btnEnviar').click(function(){
        var validado = $('#formLogin').valid();
        if(validado){
            $.ajax({
                url: "Login.action",
                data: $('#formLogin').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensaje.tipo == "success"){

                        window.location = 'home.jsp';
                    }
                    else{
                        $.growlUI(data.mensaje.texto);
                    }
                }
            });
        }
        return false;
    })
});