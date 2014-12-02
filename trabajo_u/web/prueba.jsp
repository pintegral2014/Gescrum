<%@ page import="java.util.Iterator" %>
<%@ page import="dto.HduSprintDTO" %>
<%@ page import="action.model.HduSprintModel" %>
<%@ page import="action.HduSprint" %>
<%@ page import="dao.HduSprintDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.struts2.views.freemarker.tags.IteratorModel" %>
<%@ page import="javax.swing.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Daniel Valdebenito
  Date: 28/11/2014
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title></title>

</head>
<body>
    <h3>Datos de prueba para el gráfico</h3>
    <s:iterator value="listHdu">
        <s:property value="ts_fecha_mod"/> - <s:property value="ts_esfuerzo"/>
    </s:iterator>

</body>
</html>
