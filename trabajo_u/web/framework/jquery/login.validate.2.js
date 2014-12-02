$( document ).ready(function() {
    /* Corresponde a login */
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
            'nombre': 'required',
            'apaterno': 'required',
            'correo': 'required',
            'clave': 'required',
            'estado': 'required',
            'loginConexion': 'required',
            'idRol': 'required',
            'usuCreador': 'required'
            
        },
        messages: {
            'nombre': 'Debe ingresar un nombre',
            'apaterno': 'Debe ingresar apellido paterno',
            'correo': 'Debe ingresar correo',
            'clave': 'Debe ingresar clave',
            'estado': 'Debe ingresar estado',
            'loginConexion': 'Debe ingresar usuario',
            'idRol': '',
            'usuCreador': ''
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
                url: "ingresaNewUsuario.action",
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