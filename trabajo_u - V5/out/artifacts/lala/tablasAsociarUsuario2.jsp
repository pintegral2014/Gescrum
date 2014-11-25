<%-- 
    Document   : tablasAsociarUsuario2
    Created on : 17-11-2014, 13:55:18
    Author     : Dvaldebenito
--%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="framework/estilos/estilos2.css" rel="stylesheet">
    </head>
    <body>
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
                                <table cellpadding="0" cellspacing="0" border="0" id="data-table2" width="100%">
            <thead class="btn-default">
                <tr >
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Correo</th>
                    <th>Usuario</th>
                    <th>fecha de registro</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Daniel</td>
                    <td>Valdebenito Gonzalez</td>
                    <td>D_V@hotmail.com</td>
                    <td>dvaldebenitov</td>
                    <td>10-11-2014</td>
                </tr>
                <tr>
                    <td>Jordan</td>
                    <td>Carrasco Donoso</td>
                    <td>Jorda.Chico@hotmail.com</td>
                    <td>jcarrascoD</td>
                    <td>10-11-2014</td>
                </tr>
                <tr>
                    <td>Nicolas</td>
                    <td>Fuenzalida Fuenzalida</td>
                    <td>N_F@hotmail.com</td>
                    <td>nfuenzalidaf</td>
                    <td>10-11-2014</td>
                </tr>
                <tr>
                    <td>Emilio</td>
                    <td>Landskron Cid</td>
                    <td>emiliolandskron@hotmail.com</td>
                    <td>elandskronc</td>
                    <td>10-11-2014</td>
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
	$('#data-table2').dataTable({
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

 <div>
    <input type="button" class="btn btn-default" name = "btnDesasociar" id="btnDesasociar" value="Desasociar usuario">
</div>
        <br>
<div>
    <a class="iframe btn btn-default" href="asociarUsarioFrame.jsp">Asociar nuevo usuario</a>
</div>





    </body>

