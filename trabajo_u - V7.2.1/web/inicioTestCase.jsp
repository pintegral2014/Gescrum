
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<script>

    $(document).ready(function(){
        $('#cargar').click(function(){
            $.ajax({
                url: 'inicioTestCase2.action',
                data: $('#formBack').serializeArray(),
                type: "post",
                success: function(data){
                    $('#contenidoPagina').html(data);
                }
            });
        });
    });

</script>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="widget wgreen">
                <div class="widget-head">
                    <div class="pull-left">Seleccionar Proyecto</div>
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
                                            headerValue="-- Seleccionar Proyecto --"
                                            list="listPro"
                                            listKey="proId"
                                            listValue="proNombre"
                                            cssClass="form-control"
                                            />
                                </div>
                            </div>
                            <!-- buttons -->
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="button" id="cargar" name="Cargar" class="btn btn-warning btn-smt ">Cargar</button>
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