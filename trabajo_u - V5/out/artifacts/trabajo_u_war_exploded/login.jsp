<%--
  Created by IntelliJ IDEA.
  User: jecarrasco
  Date: 20-05-2014
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="framework/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="framework/bootstrap/css/login.css" rel="stylesheet">
    <script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>
    <script  type="text/javascript">
        $(document).ready(function(){
            $('#formLogin').validate({
                highlight: function(element) {
                    $(element).closest('.control-group').removeClass('success').addClass('error');
                },
                success: function(element) {
                    element.addClass('valid').closest('.control-group').removeClass('error').addClass('success');
                },
                rules: {
                    'usuario': 'required',
                    'clave': 'required' ,
                },
                messages: {
                    'usuario': 'Debe ingresar un usuario',
                    'clave': 'Debe ingresar la clave del usuario',
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
                    document.formLogin.action = 'Login.action';
                    document.formLogin.submit();
                }
                return false;
            })
        });
    </script>
    <title>Login</title>
</head>
<body>

    <form action="Login.action" id="formLogin" class="recuadro1" method="post">

            <legend>Login de usuario</legend>
            <div class="control-group">
                <label class="control-label" for="usuario" >usuario</label>
                <div class="controls">
                    <s:textfield name="usuario"  id="usuario"  cssStyle="width: 270px" placeholder="Ingrese usuario"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="clave">clave</label>
                <div class="controls">
                    <s:password name="clave"  id="clave"  cssStyle="width: 270px" placeholder="Ingrese clave"/>
                </div>
            </div>

            <div class="control-group">
                <button type="submit" class="btn btn-warning" id="btnEnviar">Entrar</button>
                <button type="reset" class="btn btn-info">Limpiar</button>
            </div>

    </form>
</body>
</html>

