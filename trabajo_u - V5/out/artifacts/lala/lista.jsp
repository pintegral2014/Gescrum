
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>

<html>
<head>
<sj:head jqueryui="true" jquerytheme="overcast"></sj:head>
</head>
<body>
        <s:url id="remoteurl" action="listadojson" namespace="/" />
        <sjg:grid
                id="listauser"
                caption="usuarios"
                href="%{remoteurl}"
                dataType="json"
                pager="true"
                gridModel="listauser"
                rowList="5,10,20"
                rowNum="10"
                navigator="true"
                navigatorEdit="true"
                navigatorView="true"
                navigatorAddOptions="{height:280,reloadAfterSubmit:true}"
                autowidth="true"
                multiselect="true"
                viewrecords="true"
                cellEdit="false"
                >
            <sjg:gridColumn name="id_usuario" index="id_usuario" title="ID" width="75"  align="center"></sjg:gridColumn>
            <sjg:gridColumn name="nombre_usuario" index="nombre_usuario" title="NOMBRE USUARIO" align="center"></sjg:gridColumn>
            <sjg:gridColumn name="apellido_p_usuario" index="apellido_p_usuario" title="APELLIDO PATERNO" align="center"></sjg:gridColumn>
            <sjg:gridColumn name="apellido_m_usuario" index="apellido_m_usuario" title="APELLIDO MATERNO" align="center"></sjg:gridColumn>
            <sjg:gridColumn name="correo_usuario" index="correo_usuario" title="CORREO" align="center"></sjg:gridColumn>
            <sjg:gridColumn name="clave_usuario" index="clave_usuario" title="CLAVE" align="center"></sjg:gridColumn>
        </sjg:grid>

</body>
</html>

