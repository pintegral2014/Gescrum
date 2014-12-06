<%-- 
    Document   : inicio
    Created on : 15-nov-2014, 17:33:56
    Author     : Daniel Valdebenito
--%>
<!-- Control de sesión - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<head>

</head>
<body>
<h3 style="text-align: center; margin-top: 30px;"><img src="imagenes/logo.png"></h3>
<p></p>
</body>


</html>
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>