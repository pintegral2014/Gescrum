
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="framework/DataTables-1.10.4/media/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.dataTables.js"></script>

<link data-turbolinks-track="true" href="framework/bootstrap/css/estilo.css" media="all" rel="stylesheet" />
<!-- Framework colorbox (cajas modales) -->
<link rel="stylesheet" href="framework/colorbox/example1/colorbox.css" />

<script src="framework/colorbox/jquery.colorbox.js"></script>



<script>
    $(document).ready(function() {
        $('#btnTestCase').click(function(){
            $.ajax({
                type:'GET',
                url:'tablasTestCase.jsp',
                success: function(a){
                    $('#div-results').html(a);
                }
            });
        });
        var table = $('#tablaHistorias').DataTable({

            lengthChange: false,
            ajax: "framework/historias.txt",
            columns: [

                { data: "hdu_nombre" },
                { data: "hdu_prioridad" },
                { data: "hdu_eventum" },
                { data: "hdu_descripcion" },
                { data: "hdu_dependencia" },
                { data: "hdu_criterios_aceptacion" },
                { data: "hdu_fecha_creacion" },
                { data: "hdu_usuario_creador" },
                { data: "tbl_backlog_blog_id" }

            ]
        } );

        $('#btnTestCase').click(function (){


        });



        $('#tablaHistorias tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');

        } );


        $('#button').click( function () {
            alert( table.rows('.selected').data().length +' row(s) selected' );
        } );



    } );




</script>

<table id="tablaHistorias" class="display" width="100%" cellspacing="0">
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Prioridad</th>
        <th>Eventum</th>
        <th>Descripcion</th>
        <th>Dependencia</th>
        <th>Criterios de aceptacion</th>
        <th>Fecha de creacion</th>
        <th>Usuario Creador</th>
        <th>Backlog</th>
    </tr>
    </thead>

    <tfoot>
    <tr>
        <th>Nombre</th>
        <th>Prioridad</th>
        <th>Eventum</th>
        <th>Descripcion</th>
        <th>Dependencia</th>
        <th>Criterios de aceptacion</th>
        <th>Fecha de creacion</th>
        <th>Usuario Creador</th>
        <th>Backlog</th>
    </tr>
    </tfoot>
</table>

</br>
<div>
    <input type="button" class = "btn btn-primary" name = "btnTestCase" id="btnTestCase" value="Cargar TestCase">
</div>
</br>
<div id="div-results">

</div>