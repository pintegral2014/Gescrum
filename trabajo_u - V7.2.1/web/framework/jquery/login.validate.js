$(document).ready(function() {
    $('#formLogin').bootstrapValidator({
        container: '#messages',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            loginConexion: {
                validators: {
                    notEmpty: {
                        message: 'The full name is required and cannot be empty'
                    }
                }
            },
            clave: {
                validators: {
                    notEmpty: {
                        message: 'The full name is required and cannot be empty'
                    }
                }
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
