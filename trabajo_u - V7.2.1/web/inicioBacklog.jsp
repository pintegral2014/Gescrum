<%--
  Created by IntelliJ IDEA.
  User: Jordan
  Date: 06-12-2014
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<script>

    $(document).ready(function(){
     /*  $('#cargarBacklog').click(function(){

           $.ajax({
               url: 'buscarHistPro.action',
               data: $('#formBack').serializeArray(),
               type: "post",
               success: function(data){
                   $('#contenidoPagina').html(data);
               }
           });
       });
*/
        $('#cargarBacklog').click(function(){
            var posicion=document.getElementById('proyecto').options.selectedIndex; //posicion
            var id = document.getElementById('proyecto').options[posicion].value;
            var nombre = document.getElementById('proyecto').options[posicion].text;
            if(id >= 0){
                $.ajax({
                    url: 'buscarHistPro.action',
                    data: $('#formBack').serializeArray(),
                    type: "post",
                    success: function(data){
                        $('#contenidoPagina').html(data);
                    }
                });
            }

        });





    });


</script>

<div class="container">

    <div class="row">

        <div class="col-md-12">


            <div class="widget wgreen">

                <div class="widget-head">
                    <div class="pull-left">Backlog</div>
                    <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                    <div class="padd">

                        <br />
                        <!-- Form starts.  -->
                        <form class="form-horizontal" role="form" method="post"  name="formBack" id="formBack">

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Proyecto</label>
                                <div class="col-lg-5">
                                    <s:select
                                            name="proyecto.proId"
                                            id="proyecto"
                                            headerKey="-1"
                                            headerValue="-- seleccionar proyecto --"
                                            list="listPro"
                                            listKey="proId"
                                            listValue="proNombre"
                                            cssClass="form-control"
                                            />
                                </div>
                            </div>
                            <!-- buttons -->
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="button" id="cargarBacklog"  name="Cargar"  class="btn btn-warning btn-smt ">Cargar</button>
                            </div>
                            <div class="form-group">
                                <div class="col-md-9 col-md-offset-3">
                                    <div id="messages"></div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="widget-foot">
                    <!-- Footer goes here -->
                </div>
            </div>

        </div>

    </div>

</div>