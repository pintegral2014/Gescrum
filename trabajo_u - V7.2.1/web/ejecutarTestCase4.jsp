<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>

<script src="framework/datatable/jquery.dataTables2.js"></script>
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap-->
<script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
<style type="text/css">
    div.growlUI{
        background: black no-repeat 10px 10px;
        position: absolute;
    }
    div.growlUI{
        color: #ffffff;
        padding: 10px;
    }
</style>

<div class="matter" id="contenido">

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="widget ">
                    <div class="widget-head">
                        <div class="pull-left ">Test Case</div>
                        <div class="widget-icons pull-right">
                            <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
                            <!--<a href="#" class="wclose"><i class="fa fa-times"></i></a>-->
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="widget-content">
                        <div class="padd">

                            <!-- Table Page -->
                            <div class="page-tables">
                                <!-- Table -->
                                <div class="table-responsive">
                                    <table cellpadding="0" cellspacing="0" border="0" class="display table-collapse table-condensed table-responsive" width="100%">
                                        <thead class="btn-default">
                                        <tr style ="font-size: 12px">
                                            <th >Id</th>
                                            <th>Descripcion</th>
                                            <th>Fecha de creacion</th>
                                            <th>Usuario Creador</th>
                                            <th>Acciones</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listaTarea">
                                            <tr style ="font-size: 12px">
                                                <td><s:property value="idTarea"/></td>
                                                <td><s:property value="descripcionTarea"/></td>
                                                <td><s:property value="fechaCreacion"/></td>
                                                <td><s:property value="usuCreador"/></td>
                                                <td>
                                                    <button class="btn btn-primary" onclick="listarTestCase(<s:property value="idTarea"/>)">Lista Testcase</button>
                                                </td>
                                            </tr>
                                        </s:iterator>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="widget-foot">
                    <!-- Footer goes here -->
                </div>
            </div>
        </div>
    </div>

</div>

<div id="tablaTestCase">

</div>


<script>
    $(document).ready(function(){
        $('.modal').appendTo($('body'));
        $('table.display').dataTable({
            destroy: true,
            "sPaginationType": "full_numbers",
            paging: true,
            searching: true,
            "iDisplayLength": 5
        });
    });

    function listarTestCase(id2){

        $.ajax({
            type : 'POST',
            url : 'buscarTestCasexTarea3.action',
            data : {'tareaId': id2},
            success : function(data) {
                $('#tablaTestCase').html(data)
            }
        });
    }


</script>

<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>
