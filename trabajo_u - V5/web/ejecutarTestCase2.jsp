<%-- 
    Document   : ejecutarTestCase2
    Created on : 17-11-2014, 13:38:00
    Author     : Dvaldebenito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="framework/estilos/estilos2.css" rel="stylesheet">
    </head>
    <body>
        <div>
            <a type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" >Crear</a>
        </div>
        <div class="matter">
        <div class="container">
          <div class="row">
            <div class="col-md-12">

              <div class="widget ">
                <div class="widget-head">
                  <div class="pull-left ">Data Tables</div>
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
                                <table cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%">
            <thead class="btn-default">
                <tr >
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
            <tbody>
                <tr>
                    <td>Revicion problema correo</td>
                    <td>Media</td>
                    <td>correo</td>
                    <td>No se pueden enviar correos desde las casillas principales del sistema</td>
                    <td>Alguna dependencia</td>
                    <td>Resuelto</td>
                    <td>2014-11-14</td>
                    <td>elandskronc</td>
                    <td>Backlog Item A</td>
                </tr>
                <tr>
                    <td>Revicion problema cuenta usuario</td>
                    <td>Baja</td>
                    <td>cuenta</td>
                    <td>usuario no puede conectarse al sistema de ventas</td>
                    <td>Alguna dependencia</td>
                    <td>Resuelto</td>
                    <td>2014-11-14</td>
                    <td>elandskronc</td>
                    <td>Backlog Item C</td>
                </tr>
                <tr>
                    <td>Revicion problema Recepcion llamadas</td>
                    <td>Urgente</td>
                    <td>Recepcion</td>
                    <td>No se pueden recibir llamadas desde las oficinas centrales</td>
                    <td>sin dependencia</td>
                    <td>Resuelto</td>
                    <td>2014-11-14</td>
                    <td>elandskronc</td>
                    <td>Backlog Item B</td>
                </tr>
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
              <!-- -->
            </div>
        </div>
        
        <!-- Mainbar ends -->	    	
   <div class="clearfix"></div>
   




<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span> 
        <!-- JS -->
<script src="framework/macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
  <script src="framework/macAdminStyle/js/respond.min.js"></script>
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap -->
<script src="framework/macAdminStyle/js/jquery-ui.min.js"></script> <!-- jQuery UI -->
<script src="framework/macAdminStyle/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="framework/macAdminStyle/js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="framework/macAdminStyle/js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->
<script src="framework/macAdminStyle/js/jquery.slimscroll.min.js"></script> <!-- jQuery Slim Scroll -->
<script src="framework/datatable/jquery.dataTables2.js"></script> <!-- Data tables -->

<!-- jQuery Flot -->
<script src="framework/macAdminStyle/js/excanvas.min.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.resize.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.pie.js"></script>
<script src="framework/macAdminStyle/js/jquery.flot.stack.js"></script>

<!-- jQuery Notification - Noty -->
<script src="framework/macAdminStyle/js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="framework/macAdminStyle/js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="framework/macAdminStyle/js/sparklines.js"></script> <!-- Sparklines -->
<script src="framework/macAdminStyle/js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="framework/macAdminStyle/js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
<script src="framework/macAdminStyle/js/jquery.onoff.min.js"></script> <!-- Bootstrap Toggle -->
<script src="framework/macAdminStyle/js/filter.js"></script> <!-- Filter for support page -->
<!--<script src="framework/macAdminStyle/js/custom.js"></script>  Custom codes -->
<script src="framework/macAdminStyle/js/charts.js"></script> <!-- Charts & Graphs -->
<script>
    /* Data tables */

$(document).ready(function() {
	$('#data-table').dataTable({
	   "sPaginationType": "full_numbers"
	});
});

/* Widget minimize */

$('.wminimize').click(function(e){
	e.preventDefault();
	var $wcontent = $(this).parent().parent().next('.widget-content');
	if($wcontent.is(':visible')) 
	{
	  $(this).children('i').removeClass('fa fa-chevron-up');
	  $(this).children('i').addClass('fa fa-chevron-down');
	}
	else 
	{
	  $(this).children('i').removeClass('fa fa-chevron-down');
	  $(this).children('i').addClass('fa fa-chevron-up');
	}            
	$wcontent.toggle(500);
}); 
</script>
<script>
    $(document).ready(function() {
        $('#btnTestCase').click(function(){
            $.ajax({
                type:'GET',
                url:'tablasTestCase2.jsp',
                success: function(a){
                    $('#div-results').html(a);
                }
            });
        });
       } );
</script>
<div>
    <input type="button" class = "btn btn-default" name = "btnTestCase" id="btnTestCase" value="Cargar TestCase">
</div>
<br>
<div id="div-results"></div>
    </body>


    