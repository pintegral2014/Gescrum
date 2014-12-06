$( document ).ready(function() {
    /* Corresponde a login */
    $('#formLogin').validate({
        rules: {
            'usuLoginConexion': 'required',
            'usuClave': 'required'
        },
        messages: {
            'usuLoginConexion': 'Debe ingresar el login usuario',
            'usuClave': 'Debe ingresar clave de usuario'
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
    
    $("#clave, #prioridad, #eventum").keydown(function(event) {
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

                        window.location = "home.jsp";
                    }
                    else{
                        $.growlUI(data.mensaje.texto);
                    }
                }
            });
        }
        return false;
    });
    /* fin Corresponde a login */
    
    /* Crear usuario*/
     $('#formUsuario').validate({
        rules: {
            'usuNombre': 'required',
            'usuApellidoPaterno': 'required',
            'usuCorreo': 'required',
            'usuClave': 'required',
            'usuEstado': 'required',
            'usuLoginConexion': 'required',
            'rol_id': 'required'

            
        },
        messages: {
            'usuNombre': 'Debe ingresar un nombre',
            'usuApellidoPaterno': 'Debe ingresar apellido paterno',
            'usuCorreo': 'Debe ingresar correo',
            'usuClave': 'Debe ingresar clave',
            'usuEstado': 'Debe ingresar estado',
            'usuLoginConexion': 'Debe ingresar usuario',
            'rol_id': 'debe seleccionar un rol'

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
    $('#btnCrearUsuario ').click(function(){
        var validado = $('#formUsuario').valid();
        if(validado){
            $.ajax({
                url: "crearNewUsuario.action",
                data: $('#formUsuario').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensaje.tipo == "success"){

                        $.growlUI(data.mensaje.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listaUsuarios.action',
                                success: function(data){
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });

                        }, 2000);
                    }
                    else{

                        $.growlUI(data.mensaje.texto);
                    }
                }
            });
        }
        return false;
    });
    /* fin Crear usuario*/

    /* Crear historia*/
    $('#formHistoria').validate({
        rules: {

            'nombre': 'required',
            'prioridad': 'required',

            'descripcion': 'required',
            'aceptacion': 'required'

        },
        messages: {

            'nombre': 'Debe ingresar el nombre de la historia',
            'prioridad': 'Debe ingresar prioridad',

            'descripcion': 'Debe ingresar una descripción',
            'aceptacion': 'Debe ingresar el tipo de acepación'
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
    $('#btnCrearHistoria ').click(function(){

        var validado = $('#formHistoria').valid();

        if(validado){

            $.ajax({
                url: "ingresarHistoria.action",
                data: $('#formHistoria').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    if(data.mensaje.tipo == "success"){

                        $.growlUI(data.mensaje.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listarHistorias.action',
                                success: function(data){
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });


                        }, 2000);
                    }
                    else{

                        $.growlUI(data.mensaje.texto);
                    }
                }
            });
        }
        return false;
    });
    /* fin Crear historia*/

    /* Crear Ingresar Tarea*/
    $('#formTarea').validate({
        rules: {

            'descripcionTarea': 'required'

        },
        messages: {

            'descripcionTarea': 'Debe ingresar Descripción de tarea.'
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
    $('#btnCrearTareas').click(function(){

        var validado = $('#formTarea').valid();

        if(validado){

            $.ajax({
                url: "ingresaTarea.action",
                data: $('#formTarea').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {


                    if(data.mensaje.tipo == "success"){
                        var porId = document.getElementById("hduTarID").value;

                        $.growlUI(data.mensaje.texto);
                        setTimeout(function(){

                            $.ajax({
                                url: 'listaHduTarea.action?hduTarID='+porId,
                                success: function(data){
                                    $('#contenidoPagina').html("");
                                    $('#contenidoPagina').html(data);
                                }
                            });


                        }, 2000);
                    }
                    else{

                        $.growlUI(data.mensaje.texto);
                    }
                }
            });
        }
        return false;
    });
    /* fin Crear Ingresar Tarea*/
});