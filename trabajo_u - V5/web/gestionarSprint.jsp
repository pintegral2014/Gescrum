<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="framework/DataTables-1.10.4/media/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.dataTables.js"></script>


<link rel="stylesheet" href="framework/colorbox/example1/colorbox.css" />

<script src="framework/colorbox/jquery.colorbox.js"></script>


<script>
    $(document).ready(function(){
        $('#bntEliminarSprint').click(function(){
            if (confirm("¿Esta seguro que desea eliminar el Sprint ?")) {
                // Save it!
            } else {
                // Do nothing!
            }
        });
        var table = $('#tablaSprint').dataTable( {
            lengthChange: false,
            ajax: "framework/Sprint.txt",
            columns: [

                {data : "spr_nombre"},
                {data : "spr_descripcion"},
                {data : "spr_fecha_creacion"},
                {data : "spr_usuario_creador"},
                {data : "spr_grupo"}
            ]
        } );
        $(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});

        $('#tablaSprint tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');

        } );

    } );
</script>
<div>
    <div>
        <a class="iframe btn btn-primary" href="ingresarSprint.jsp">Crear</a>
        <input type="button" class="btn btn-primary" name="bntEliminarSprint" id="bntEliminarSprint" value="Eliminar">
        <a class="iframe btn btn-primary" href="modificarSprint.jsp">Modificar</a>
    </div>
    <table id="tablaSprint" class="display" width="100%" cellspacing="0">
        <thead>
        <tr>

            <th>Nombre Sprint</th>
            <th>Descripcion</th>
            <th>Fecha de creacion</th>
            <th>Usuario</th>
            <th>Grupo</th>

        </tr>
        </thead>

        <tfoot>
        <tr>

            <th>Nombre Sprint</th>
            <th>Descripcion</th>
            <th>Fecha de creacion</th>
            <th>Usuario</th>
            <th>Grupo</th>
        </tr>
        </tfoot>
    </table>


</div>