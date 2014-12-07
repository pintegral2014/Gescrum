<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 29-11-2014
  Time: 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String proID =  request.getParameter("proyecto.proId");
    String proyecto =  request.getParameter("nombreProyecto");
%>

<script src="framework/jquery/jquery.validate.js"></script>
<script  src="framework/jquery/login.validate.2.js" type="text/javascript"></script>

<script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>

<style type="text/css">
    div.growlUI{
        background: black;
        position: absolute;
    }
    div.growlUI{
        color: #ffffff;
        padding: 10px;
    }
</style>

<div>
    <form class="form-horizontal" role="form" method="post" id="formTarea" name="formTarea" action="ingresaTarea.action">

        <div class="form-group  has-feedback">
            <label class="col-lg-3 control-label">Descripcion</label>
            <div class="col-lg-6">
                <textarea class="form-control" name="descripcionTarea" id="descripcionTarea" rows="5" placeholder="Ingrese detalles"></textarea>
                <span class="glyphicon form-control-feedback" id="descripcionTarea1"></span>
            </div>
        </div>

            <input type="hidden" name="usuCreador" id="usuCreador"  value="<%=session.getAttribute("loginConexion")%>">
            <input type="hidden" name="hduTarID" id="hduTarID" value="<%=request.getParameter("sih")%>">
            <input type="hidden" name="proyecto.proId" id="proyecto.proId" value="<%=proID%>">
            <input type="hidden" name="nombreProyecto" id="nombreProyecto" value="<%=proyecto%>">


        <!-- buttons -->
        <div class="col-lg-9 col-lg-offset-3">

            <button type="button" id="btnCrearTareas"  class="btn btn-warning btn-smt ">Ingresar</button>
            <button type="reset" class="btn btn-default btn-smt">Limpiar</button>
            <button type="reset"  class="cerrar btn btn-danger btn-smt ">Cancelar</button>
        </div>
        <div class="form-group">
            <div class="col-md-9 col-md-offset-3">
                <div id="messages"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-9 col-md-offset-3">
                <div id="messages"></div>
            </div>
        </div>



    </form>

    <script>
        $(document).ready(function(){
            $('.cerrar').click(function(){
                $('#contenidoIngresarTarea').hide();
            });

         });
    </script>
</div>
