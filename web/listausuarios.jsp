<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="framework/jquery/jquery.dataTables.js" type="text/javascript"></script>
<link href="framework/bootstrap/css/dataTables.jqueryui.css"  rel="stylesheet" />


<script type="text/javascript">
    var data;
    $(document).ready(function() {

        var table =$('#tablausuarios').dataTable({
            "scrollY": 200,
            "scrollCollapse": true,
            "jQueryUI": true
        });

        table.$('tr').click( function () {
            if($(this).hasClass('selected')){
                $(this).removeClass('selected');
            }
            else{
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected')
            }
            data = table.fnGetData(this);


        });
        $('#hola').click(function(){

            obtenerDatos(data);
        });
        $('#eliminar').click(function(){

            eliminar(data);
        });
    } );

    function obtenerDatos(data){
        console.log(data);
        var id_usuario = data[0];
        var idCargo = data[7];
        var nombre_usuario = data[2];
        var apellido = data[3];
        var apellido_m_usuario = data[4];
        var correo_usuario = data[5];
        var clave_usuario = data[6];
        // seteo los valores de la fila seleccionada a los campos del modal
        $('#cargo').val(idCargo);
        $('#nombre').val(nombre_usuario);
        $('#apellidopaterno').val(apellido);
        $('#amaterno').val(apellido_m_usuario);
        $('#correo').val(correo_usuario);
        $('#clave').val(clave_usuario);

    }
    function eliminar(data){
        $.ajax({
            url: 'eliminar.action',
            data: {
              'idUsuario': data[0]
            }

        })
    }

</script>

<div>
    <fieldset>
        <legend>Lista de Usuarios</legend>
        <div class="table-responsive">
        <table class="display" id="tablausuarios">
            <thead>
            <tr>

                <%--<td>ID</td>--%>
                <%--<td >CARGO</td>--%>
               <td>NOMBRE</td>
               <td >A. PATERNO</td>
               <td>A. MATERNO</td>
               <td>CORREO</td>
               <td>LOGIN</td>
               <td>ESTADO</td>
           </tr>
           </thead>
           <tbody>
           <s:iterator value="listauser" >

               <tr>

                   <%--<td><s:property value="id_usuario"/></td>--%>
                    <%--<td><s:property value="cargo.nombreCargo"/></td>--%>
                    <td><s:property value="usu_nombre"/></td>
                    <td><s:property value="usu_apellido_paterno"/></td>
                    <td><s:property value="usu_apellido_materno"/></td>
                    <td><s:property value="usu_correo"/></td>
                    <td><s:property value="usu_login_conexion"/></td>
                    <td><s:property value="usu_estado"/></td>
                    <%--<td style="display: none"><s:property value="cargo.idCargo" /></td>--%>
                    <%--<s:hidden name="cargo.idCargo" id="idCargo-%{id_usuario}"/>--%>
                </tr>
            </s:iterator>
            </tbody>
        </table>
        </div>
    </fieldset>
</div>
<div>
    <br/>
    <button type="button" id="hola" class="btn btn-success" data-toggle="modal" data-target="#myModal">Modificar</button>

    <button type="button" class="btn btn-danger">Eliminar</button>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Datos usuario</h4>
            </div>
            <div class="modal-body">
                <form action="pepito.action" class="form-horizontal" method="post" id="formUsuario">

                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">cargo:</label>
                            <div class="col-sm-10 col-md-8">
                                <s:select name="cargo.idCargo"
                                          id="cargo"
                                          headerKey="-1"
                                          headerValue="-- seleccionar cargo --"
                                          list="listaCargo"
                                          listKey="idCargo"
                                          listValue="nombreCargo"
                                          cssClass="form-control"
                                        />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Nombre:</label>
                            <div class="col-sm-10 col-md-8">
                                <s:textfield name="nombre"  id="nombre" cssClass="form-control" placeholder="Ingrese nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Apellido Paterno:</label>
                            <div class="col-sm-10 col-md-8">
                                <s:textfield name="apellidopaterno"  id="apellidopaterno" cssClass="form-control" placeholder="Ingrese Apellido Paterno"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Apellido Materno:</label>
                            <div class="col-sm-10 col-md-8">
                                <s:textfield name="amaterno"  id="amaterno" cssClass="form-control" placeholder="Ingrese Apellido Materno"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Correo:</label>
                            <div class="col-sm-10 col-md-8">
                                <s:textfield name="correo"  id="correo" cssClass="form-control" placeholder="Ingrese e-mail"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">Contraseña:</label>
                            <div class="col-sm-10 col-md-8">
                                <s:password name="clave"  id="clave" cssClass="form-control" placeholder="Ingrese password"/>
                            </div>
                        </div>
                        <!--<div class="form-group form-actions">
                            <div class="col-sm-offset-2 col-sm-10" align="rigth">
                                <button type="reset" class="btn btn-default">Limpiar</button>
                                <button  class="btn btn-success" id="btnguardar" data-toggle="modal" data-target="#myModal">Guardar</button>
                            </div>
                        </div>-->

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
