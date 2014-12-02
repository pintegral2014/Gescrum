$(document).ready(function(){

    $('#formLogin').validate({

        rules: {
            'loginConexion': 'required',
            'clave': 'required'
        },
        messages: {
            'loginConexion': 'Debe ingresar el login usuario',
            'clave': 'Debe ingresar la clave del usuario'
        },
        highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            if(element.parent('.input-group').length) {
                error.insertAfter(element.parent());
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
    }
    );
    $('#btnEnviar').click(function(){
        var validado = $('#formLogin').valid();
        if(validado){
            document.formLogin.action = 'Login.action';
            document.formLogin.submit();
        }
        return false;
    })
});
