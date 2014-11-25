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
        $('#btnGrupoUsu').click(function(){
            $.ajax({
               type:'GET',
                    url:'tablasAsociarUsuario.jsp',
                success: function(a){
                    $('#div-results').html(a);
                }
            });
        });
        var table = $('#tablaGrupos').dataTable( {
            lengthChange: false,
            ajax: "framework/grupos.txt",
            columns: [


                {data : "gru_nombre"},
                {data : "gru_descripcion"}
        ]
        } );

        $('#btnGrupoUsu').click(function (){


        });



        $('#tablaGrupos tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');

        } );


        $('#button').click( function () {
            alert( table.rows('.selected').data().length +' row(s) selected' );
        } );



    } );




</script>
<div>
    Grupos
</div>
<table id="tablaGrupos" class="display" width="100%" cellspacing="0">
    <thead>
    <tr>
        <th>Grupo</th>
        <th>Descripcion</th>


    </tr>
    </thead>

    <tfoot>
    <tr>
        <th>Grupo</th>
        <th>Descripcion</th>

    </tr>
    </tfoot>
</table>

</br>
<div>
    <input type="button" class = "btn btn-primary" name = "btnGrupoUsu" id="btnGrupoUsu" value="Cargar Usuarios">
</div>
</br>
<div id="div-results">

</div>



