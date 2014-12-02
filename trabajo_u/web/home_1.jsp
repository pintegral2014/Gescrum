<%-- 
    Document   : home
    Created on : 15-nov-2014, 17:06:36
    Author     : Daniel Valdebenito
--%>
<% if (session.getAttribute("loginConexion")!=null){%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from responsivewebinc.com/premium/mac5/macAdminStyle/ by HTTrack Website Copier/3.x [XR&CO'2010], Fri, 14 Nov 2014 01:32:21 GMT -->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Gescrum - Gestión de Scrum</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">


  <!-- Stylesheets -->
  <link href="framework/macAdminStyle/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/font-awesome.min.css">
  <!-- jQuery UI -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/jquery-ui.css">
  <!-- Calendar -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/fullcalendar.css">
  <!-- prettyPhoto -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/prettyPhoto.css">
  <!-- Star rating -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/rateit.css">
  <!-- Date picker -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/bootstrap-datetimepicker.min.css">
  <!-- CLEditor -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/jquery.cleditor.css">
  <!-- Data tables -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/jquery.dataTables.css">
  <!-- Bootstrap toggle -->
  <link rel="stylesheet" href="framework/macAdminStyle/css/jquery.onoff.css">
  <!-- Main stylesheet -->
  <link href="framework/macAdminStyle/css/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="framework/macAdminStyle/css/widgets.css" rel="stylesheet">
  
  <!-- Bootstrap core CSS -->
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 

  
  <script src="framework/macAdminStyle/js/respond.min.js"></script>
  <!--[if lt IE 9]>
  <script src="framework/macAdminStyle/js/html5shiv.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="framework/favicon/Gescrum Gs.png">



  <script src="framework/macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="framework/macAdminStyle/js/jquery-ui.min.js"></script> <!-- jQuery UI -->

  <script type="text/javascript">
   $(document).ready(function(){
                  $('.jsp').click(function(){
                      var nameJSP = this.name;
                      $.ajax({
                          url: nameJSP+'.jsp',
                          success: function(data){
                              $('#contenido').html(data);
                              $('#contenido').slideDown(1000);
                          }
                      })
                  });
                  $(".action").click(function(){
                      var action = this.id;
                      $.ajax({
                          url: action +'.action',
                          success: function(data){
                              $('#contenido').html(data);
                              $('#contenido').slideDown(1000);
                          }
                      })
                  })
              });
  </script>
  <style>
      .cosa
      {
          float: none;
         //position: fixed;
      }
      .Tprimero
      {
          font-size: 24px;
          color: black;
      }
      .Tsegundo
      {
          font-size: 26px;
          color: black;
      }
      .logo
      {
          padding: 5px;
          margin-top: -13px;
          border: 1px solid #999999;
          border-top-left-radius: 10px;
          border-bottom-right-radius: 10px;
      }
  </style>
</head>

<body>
<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a class="navbar-brand" style="cursor:pointer;"><div class="logo"><label class="Tprimero">Ge</label><label class="Tsegundo">scrum</label></div></a>
        </div>
        <div class="navbar-collapse collapse">
          
          <!-- Links -->
        <ul class="nav navbar-nav pull-right">
          <li class="dropdown pull-right">            
            <a data-toggle="dropdown" class="dropdown-toggle" style="cursor:pointer;">
              <i class="fa fa-user"></i> <%=session.getAttribute("loginConexion")%><b class="caret"></b>              
            </a>
            
            <!-- Dropdown menu -->
            <ul class="dropdown-menu" role="menu">
              <li><a style="cursor:pointer;"><i class="fa fa-user"></i> Profile</a></li>
              <li><a style="cursor:pointer;"><i class="fa fa-cogs"></i> Settings</a></li>
              <li><a href="logout"><i class="fa fa-sign-out"></i> Logout</a></li>
            </ul>
          </li>
          
        </ul>
            
        </div><!--/.nav-collapse -->
      </div>
    </div>



<!-- Header ends -->

<!-- Main content starts -->

<div class="content" style="margin-top:30px;">

  	<!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-dropdown"><a style="cursor:pointer;">Navigation</a></div>

        <!--- Sidebar navigation -->
        <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
        <ul id="nav">
          <!-- Main menu with font awesome icon -->
          <li class="open"><a style="cursor:pointer;" class="jsp" name="inicio"><i class="fa fa-home"></i> Inicio</a></li>
          <li class="has_sub">
		<a style="cursor:pointer;"><i class="fa fa-list-alt"></i> Reportes <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
                <li><a style="cursor:pointer;" class="jsp" name="reporteGeneral" id="Reportes Generales" >Reportes Generales</a></li>
              <li><a style="cursor:pointer;" class="jsp" name="reporteSprint" id="Reporte Sprint">Reporte Sprint</a></li>
              
            </ul>
          </li>  
          <li class="has_sub">
		<a style="cursor:pointer;"><i class="fa fa-pencil"></i> Mantenedores <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li ><a style="cursor:pointer;" class="action" name="gestionarUsuario2" id="listarusuarios"> Gestionar Usuario</a></li>
              <li ><a style="cursor:pointer;" class="jsp" name="gestionarHistoria2"id="Gestionar Historia">Gestionar Historia</a></li>
              <li><a style="cursor:pointer;" class="jsp" name="gestionarTestCase2" id="Gestionar TestCase">Gestionar TestCase</a></li>
              <li><a style="cursor:pointer;" class="jsp" name="gestionarSprint2" id="Gestionar Sprint">Gestionar Sprint</a></li>
              <li><a style="cursor:pointer;" class="jsp" name="gestionarProyecto2" id="Gestionar Proyecto">Gestionar Proyecto</a></li>
            </ul>
          </li> 
          <li class="has_sub">
		<a style="cursor:pointer;"><i class="fa fa-terminal"></i> Ejecución <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
                <li><a style="cursor:pointer;" class="jsp" name="ejecutarTestCase2" id="Ejecutar TestCase"><span class=""></span>Ejecutar TestCase</a></li>
            </ul>
          </li>
          <li class="has_sub">
              <a style="cursor:pointer;"><i class="fa fa-user"></i></span> Grupo de Trabajo <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
                <li><a style="cursor:pointer;" class="jsp" name="asociarHistoria2" id="Asociar Usuario"><span class=""></span>Asociar Usuario</a></li>
            </ul>
          </li>
        </ul>
    </div>

    <!-- Sidebar ends -->

  	  	<!-- Main bar -->
  	<div class="mainbar">
      
	    <!-- Page heading -->
	    <div class="page-head">
                <h2 class="pull-left"><i class="fa fa-home"></i> <span id="tituloPagina">Gescrum<</span></h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a style="cursor:pointer;" class="jsp" name="inicio"><i class="fa fa-home"></i> Inicio</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a style="cursor:pointer;" class="bread-current jsp" name="inicio"><span id="arbol">Gescrum</span></a>
        </div>

        <div class="clearfix"></div>

	    </div>
	    <!-- Page heading ends -->



	    <!-- Matter -->

	    <div class="matter">
        <div class="container">
         <!-- Editar aquí -->
         <div id='contenido'></div>
         
         
         
        </div>
		  </div>

		<!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>
<!-- Content ends -->

<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2014 | <a style="cursor:pointer;">Gescrum - Gestión de Scrum</a> </p>
      </div>
    </div>
  </div>
</footer> 	

<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a style="cursor:pointer;"><i class="fa fa-chevron-up"></i></a></span> 

 <!-- JS -->
<script src=framework/"macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
<!-- <script src="framework/macAdminStyle/js/bootstrap.min.js"></script>  Bootstrap -->
<script src="framework/macAdminStyle/js/jquery-ui.min.js"></script> <!-- jQuery UI -->
<script src="framework/macAdminStyle/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="framework/macAdminStyle/js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="framework/macAdminStyle/js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->
<script src="framework/macAdminStyle/js/jquery.slimscroll.min.js"></script> <!-- jQuery Slim Scroll -->
<script src="framework/macAdminStyle/js/jquery.dataTables.min.js"></script> <!-- Data tables -->


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
<script src="framework/macAdminStyle/js/custom.js"></script> <!-- Custom codes -->
<script src="framework/macAdminStyle/js/charts.js"></script> <!-- Charts & Graphs -->

<!-- Script for this page -->
<script type="text/javascript">
$(function () {

    /* Bar Chart starts */

    var d1 = [];
    for (var i = 0; i <= 20; i += 1)
        d1.push([i, parseInt(Math.random() * 30)]);

    var d2 = [];
    for (var i = 0; i <= 20; i += 1)
        d2.push([i, parseInt(Math.random() * 30)]);


    var stack = 0, bars = true, lines = false, steps = false;
    
    function plotWithOptions() {
        $.plot($("#bar-chart"), [ d1, d2 ], {
            series: {
                stack: stack,
                lines: { show: lines, fill: true, steps: steps },
                bars: { show: bars, barWidth: 0.8 }
            },
            grid: {
                borderWidth: 0, hoverable: true, color: "#777"
            },
            colors: ["#ff6c24", "#ff2424"],
            bars: {
                  show: true,
                  lineWidth: 0,
                  fill: true,
                  fillColor: { colors: [ { opacity: 0.9 }, { opacity: 0.8 } ] }
            }
        });
    }

    plotWithOptions();
    
    $(".stackControls input").click(function (e) {
        e.preventDefault();
        stack = $(this).val() == "With stacking" ? true : null;
        plotWithOptions();
    });
    $(".graphControls input").click(function (e) {
        e.preventDefault();
        bars = $(this).val().indexOf("Bars") != -1;
        lines = $(this).val().indexOf("Lines") != -1;
        steps = $(this).val().indexOf("steps") != -1;
        plotWithOptions();
    });

    /* Bar chart ends */

});


/* Curve chart starts */

$(function () {
    var sin = [], cos = [];
    for (var i = 0; i < 14; i += 0.5) {
        sin.push([i, Math.sin(i)]);
        cos.push([i, Math.cos(i)]);
    }

    var plot = $.plot($("#curve-chart"),
           [ { data: sin, label: "sin(x)"}, { data: cos, label: "cos(x)" } ], {
               series: {
                   lines: { show: true, fill: true},
                   points: { show: true }
               },
               grid: { hoverable: true, clickable: true, borderWidth:0 },
               yaxis: { min: -1.2, max: 1.2 },
               colors: ["#1eafed", "#1eafed"]
             });

    function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #000',
            padding: '2px 8px',
            color: '#ccc',
            'background-color': '#000',
            opacity: 0.9
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;
    $("#curve-chart").bind("plothover", function (event, pos, item) {
        $("#x").text(pos.x.toFixed(2));
        $("#y").text(pos.y.toFixed(2));

        if ($("#enableTooltip:checked").length > 0) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    
                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);
                    
                    showTooltip(item.pageX, item.pageY, 
                                item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;            
            }
        }
    }); 

    $("#curve-chart").bind("plotclick", function (event, pos, item) {
        if (item) {
            $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
            plot.highlight(item.series, item.datapoint);
        }
    });

});

/* Curve chart ends */
</script>

</body>

<!-- Mirrored from responsivewebinc.com/premium/mac5/macAdminStyle/ by HTTrack Website Copier/3.x [XR&CO'2010], Fri, 14 Nov 2014 01:33:08 GMT -->
</html>
<% }
else
{%>
<script>
    window.location = "login.jsp";
</script>
<% }%>