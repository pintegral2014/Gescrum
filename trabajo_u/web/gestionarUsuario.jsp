<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="framework/DataTables-1.10.4/media/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.dataTables.js"></script>


<link rel="stylesheet" href="framework/colorbox/example1/colorbox.css" />

<script src="framework/colorbox/jquery.colorbox.js"></script>


<script>


    $(document).ready(function() {
        $('#bntEliminarUsu').click(function(){
            if (confirm("¿Esta seguro que desea eliminar al usuario ?")) {
                // Save it!
            } else {
                // Do nothing!
            }
        });
        var table = $('#tablaUsuarios').dataTable( {
            lengthChange: false,
            ajax: "framework/usuarios.txt",
            columns: [

                { data: "usu_nombre" },
                { data: null, render: function ( data, type, row ) {
                    // Combine the first and last names into a single table field
                    return data.usu_apellido_paterno+' '+data.usu_apellido_materno;
                } },

                { data: "usu_correo" },
                { data: "usu_login_conexion" },
                { data: "usu_fecha_inicio" }
               /* { data: "salary",render: $.fn.dataTable.render.number( ',', '.', 0, '$' )  }*/

            ]
        } );

        $(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});

        $('#tablaUsuarios tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');

        } );
    } );
</script>


<div>
    <div>
        <a class="iframe btn btn-primary" href="ingresarUsuario.jsp">Crear</a>
        <input type="button" class="btn btn-primary" name="bntEliminarUsu" id="bntEliminarUsu" value="Eliminar">
        <a class="iframe btn btn-primary" href="modificarUsuario.jsp">Modificar</a>
    </div>

    <table id="tablaUsuarios" class="display" width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Usuario</th>
            <th>fecha de registro</th>

        </tr>
        </thead>

        <tfoot>
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Usuario</th>
            <th>fecha de registro</th>
        </tr>
        </tfoot>
    </table>


</div>
