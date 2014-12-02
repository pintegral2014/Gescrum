<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="framework/DataTables-1.10.4/media/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.dataTables.js"></script>


<link data-turbolinks-track="true" href="framework/bootstrap/css/estilo.css" media="all" rel="stylesheet" />
<meta charset="UTF-8" />
<!-- Framework colorbox (cajas modales) -->
<link rel="stylesheet" href="framework/colorbox/example1/colorbox.css" />

<script src="framework/colorbox/jquery.colorbox.js"></script>

<script>
    $(document).ready(function() {


        var table2 = $('#tablaTestCase').dataTable( {
            lengthChange: false,
            ajax: "framework/testcase.txt",
            columns: [
                {data : "test_enunciado"},
                {data : "test_objetivo"},
                {data : "test_dato_requerido"},
                {data : "test_precondiciones"},
                {data : "test_fecha_creacion"},
                {data : "test_usuario_creador"}
            ]
        } );

        $('#tablaTestCase tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');

        } );
        $(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});
    } );
</script>

<table id="tablaTestCase" class="display" width="100%" cellspacing="0">
    <thead>
    <tr>
        <th>Enunciado</th>
        <th>Objetivo</th>
        <th>Dato Requerido</th>
        <th>Precondiciones</th>
        <th>Fecha de creacion</th>
        <th>Usuario Creador</th>
    </tr>
    </thead>

    <tfoot>
    <tr>
        <th>Enunciado</th>
        <th>Objetivo</th>
        <th>Dato Requerido</th>
        <th>Precondiciones</th>
        <th>Fecha de creacion</th>
        <th>Usuario Creador</th>
    </tr>
    </tfoot>
</table>

<div>

    <a class="iframe btn btn-primary" href="testCaseFrame.jsp">Ejecutar TestCase</a>
</div>

</br>