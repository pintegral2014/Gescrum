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

        $('#bntEliminarProyecto').click(function(){
            if (confirm("¿Esta seguro que desea eliminar el Proyecto ?")) {
                // Save it!
            } else {
                // Do nothing!
            }
        });
        var tableTestCase = $('#tablaProyectos').dataTable( {
            lengthChange: false,
            ajax: "framework/proyectos.txt",
            columns: [

                {data : "pro_nombre"},
                {data : "pro_descripcion"},
                {data : "pro_estado"},
                {data : "pro_usuario_creador"},
                {data : "fecha_creacion"},
                {data : "fecha_modificacion"}
            ]
        } );

        $(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});

        $('#tablaProyectos tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');

        } );
    } );
</script>
<div>
    <div>
        <a class="iframe btn btn-primary" href="ingresarProyecto2.jsp">Crear</a>
        <input type="button" class="btn btn-primary" name="bntEliminarProyecto" id="bntEliminarProyecto" value="Eliminar">
        <a class="iframe btn btn-primary" href="modificarTestcase.jsp">Modificar</a>
    </div>
    <table id="tablaProyectos" class="display" width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Proyecto</th>
            <th>Descripcion</th>
            <th>Estado</th>
            <th>Usuario Creador</th>
            <th>Fecha de creacion</th>
            <th>Fecha modificacion</th>
        </tr>
        </thead>

        <tfoot>
        <tr>
            <th>Proyecto</th>
            <th>Descripcion</th>
            <th>Estado</th>
            <th>Usuario Creador</th>
            <th>Fecha de creacion</th>
            <th>Fecha modificacion</th>
        </tr>
        </tfoot>
    </table>


</div>

