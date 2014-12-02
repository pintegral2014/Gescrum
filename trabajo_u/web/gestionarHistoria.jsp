<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<link href="framework/bootstrap/css/bootstrap-datepicker.css" media="all" rel="stylesheet" />
<script  src="framework/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="framework/DataTables-1.10.4/media/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="framework/DataTables-1.10.4/media/js/jquery.dataTables.js"></script>


<link rel="stylesheet" href="framework/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" media="screen" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

<!-- production -->
<script type="text/javascript" src="framework/plupload-2.1.2/js/plupload.full.min.js"></script>
<script type="text/javascript" src="framework/plupload-2.1.2/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>


<link rel="stylesheet" href="framework/colorbox/example1/colorbox.css" />

<script src="framework/colorbox/jquery.colorbox.js"></script>


<script>
$(document).ready(function() {


    var tableHistoria = $('#tablaHistorias').dataTable( {
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
    $(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});

    $('#tablaHistorias tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');

    } );
} );
</script>

<script type="text/javascript">
    // Initialize the widget when the DOM is ready
    $(function() {
        // Setup html5 version
        $("#uploader").pluploadQueue({
            // General settings
            runtimes : 'html5,flash,silverlight,html4',
            url : "framework/plupload-2.1.2/examples/upload.php",

            chunk_size : '1mb',
            rename : true,
            dragdrop: true,

            filters : {
                // Maximum file size
                max_file_size : '10mb',
                // Specify what files to browse for
                mime_types: [
                    {title : "Image files", extensions : "jpg,gif,png"},
                    {title : "Zip files", extensions : "zip"}
                ]
            },

            // Resize images on clientside if we can
            resize: {
                width : 200,
                height : 200,
                quality : 90,
                crop: true // crop to exact dimensions
            },


            // Flash settings
            flash_swf_url : 'framework/plupload-2.1.2/js/Moxie.swf',

            // Silverlight settings
            silverlight_xap_url : 'framework/plupload-2.1.2/js/Moxie.xap'
        });
    });
</script>
<div>
    <div>
        <a class="iframe btn btn-primary" href="IngresarHistoria.jsp">Crear</a>
        <input type="button" class="btn btn-primary" name="bntEliminarHis" id="bntEliminarHis" value="Eliminar">
        <a class="iframe btn btn-primary" href="modificarHistoria.jsp">Modificar</a>
    </div>
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

            </tr>
    </tfoot>
    </table>

 </div>

 <div class="form-group">
     <label class="col-sm-2 col-md-2 control-label">Adjuntar archivos</label>
 </div>
</br></br>
     <div id="uploader">

     </div>



 </div>

