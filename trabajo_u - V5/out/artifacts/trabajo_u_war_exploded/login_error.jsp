<%--
  Created by IntelliJ IDEA.
  User: jecarrasco
  Date: 20-05-2014
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="framework/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="framework/bootstrap/css/login.css" rel="stylesheet">
    <script language="JavaScript" type="text/javascript">

        function volverLogin(){

            window.location.href = 'http://localhost:8084/ejemplo1/';
        }

    </script>
    <title>Login Error</title>
</head>
<body>
<div class="recuadro1">
    <h3 class="text-center text-error">Usuario "<s:property value="usuario" />" No existe en sistema </h3>
    <center>
        <div>
            <button type="submit" class="btn btn-warning" onclick="volverLogin();">Volver</button>
        </div>
    </center>
</div>
</body>
</html>

