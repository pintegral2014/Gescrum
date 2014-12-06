<%--
  Created by IntelliJ IDEA.
  User: Daniel Valdebenito
  Date: 29/11/2014
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestión de Scrum</title>
    <!-- Contiene las librerías CSS básicas necesarias para el proyecto -->
    <!-- Font awesome icon -->
    <link rel="stylesheet" href="framework/macAdminStyle/css/font-awesome.min.css">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="framework/jquery/css/jquery-ui.css">
    <!-- Data tables -->
    <link rel="stylesheet" href="framework/macAdminStyle/css/jquery.dataTables.css">
    <!-- Main stylesheet -->
    <link href="framework/macAdminStyle/css/style.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="framework/bootstrap-3.2.0/dist/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Estilos del archivo -->
    <link href="framework/estilos/estilos2.css" rel="stylesheet">

    <!-- Favicon -->
    <link rel="shortcut icon" href="imagenes/favicon.ico">
</head>
<body>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<!--
    Este archivo contiene la estructura del menú para Mantenedores. Es necesaria una estructura para cada menú general, inicio, reportes, mantenedores, ejecución y grupo de trabajo, ya que
    se necesita poner la clase open en el código de menú, según sea el caso (y me da flojera buscar otra forma xD)
-->



<!-- Barra de menú fija horizontal -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="cursor:pointer;"><img src="imagenes/logo.png" style="max-width: 150px; max-height: 150px; margin-top: -20px;"></a>
        </div>
        <div class="navbar-collapse collapse">



            <!-- Links, si se quiere se pueden agregar para un menú -->
            <ul class="nav navbar-nav pull-right">
                <li>
                    <a><i class="fa fa-user"></i> <%=session.getAttribute("loginConexion")%></a><!-- impresión del usuario -->
                </li>
                <li class="pull-right"><a href="logout"><i class="fa fa-sign-out"></i> Logout</a></li> <!-- logout, quitar sesión al sistema -->
            </ul>

        </div><!--/.nav-collapse -->
    </div>
</div>
<!-- Fin de menú fijo horizontal -->

<!-- Inicio del contenedor de menú lateral -->

<div class="content" style="margin-top:15px;">

    <!-- Sidebar, barra de lateral de menú -->
    <div class="sidebar">
        <div class="sidebar-dropdown"><a style="cursor:pointer;">Navigación</a></div>

        <!--- Sidebar navigation, barra lateral de navegación -->
        <!-- Si es necesaria una sub-navegación, agregar la class "has_sub" a "li" del la barra de navegación (ver diseño). -->
        <ul id="nav">
            <!-- Barra de menú con iconos (Estos no son los de bootstrap) -->
            <li class="open"><a style="cursor:pointer;"  class="jsp" name="Inicio" id="inicio"><i class="fa fa-home"></i><span class="tituloMenu"> Inicio</span></a></li> <!-- Al poner class='open' cuando se cargue esa página, quedará ese menú abierto -->
            <li class="has_sub">
                <a style="cursor:pointer;"><i class="fa fa-list-alt" class="tituloMenu"></i><span class="tituloMenu"> Reportes </span><span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                   <!-- <li><a style="cursor:pointer;"  class="action" name="Reportes Generales" id="reporteGeneral">Reportes Generales</a></li>
                    <li><a style="cursor:pointer;"  class="action" name="Reporte Sprint" id="reporteSprint">Reporte Sprint</a></li> -->
                    <li><a style="cursor:pointer;"  class="jsp" name="Reporte Sprint" id="graficoesfuerzo">Gráfico de esfuerzo</a></li>

                </ul>
            </li>
            <li class="has_sub">
                <a style="cursor:pointer;"><i class="fa fa-pencil"></i><span class="tituloMenu"> Mantenedores </span><span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                    <li ><a style="cursor:pointer;"  class="action" name="Gestionar Usuario" id="listaUsuarios">Gestionar Usuario</a></li>
                    <li ><a style="cursor:pointer;"  class="action" name="Gestionar Historia" id="listarHistorias">Gestionar Historia</a></li>
                    <li><a style="cursor:pointer;"  class="action" name="Gestionar TestCase" id="gestionarTestCase2">Gestionar TestCase</a></li>
                    <li><a style="cursor:pointer;"  class="action" name="Gestionar Sprint" id="gestionarSprint2">Gestionar Sprint</a></li>
                    <li><a style="cursor:pointer;"  class="action" name="Gestionar Proyecto" id="listarProyectos">Gestionar Proyecto</a></li>
                    <li><a style="cursor:pointer;"  class="action" name="Gestionar Grupo" id="listaGrupos2">Gestionar Grupos</a></li>
                </ul>
            </li>
            <li class="has_sub">
                <a style="cursor:pointer;"><i class="fa fa-terminal"></i><span class="tituloMenu"> Ejecución</span><span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                    <li><a style="cursor:pointer;"  class="action" name="Ejecutar TestCase" id="ejecutarTestCase2">Ejecutar TestCase</a></li>
                    <li><a style="cursor:pointer;"  class="action" name="Asociar Tarea" id="listaGestionTarea">Asignar Tareas</a></li>
                    <li><a style="cursor:pointer;"  class="action" name="prueba" id="listarHduSprint">Prueba</a></li>
                </ul>
            </li>
            <li class="has_sub">
                <a style="cursor:pointer;"><i class="fa fa-user"></i><span class="tituloMenu"> Grupo de Trabajo </span><span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                    <li><a style="cursor:pointer;"  class="action" name="Asociar Usuario" id="listaGrupos">Asociar Usuario</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- Fin de barra lateral de menú -->

    <!-- Barra horrizontal 2 (es la que muestra 'Gescrum' con el ícono de la casa) -->
    <div class="mainbar">

        <!-- Encabezado superior izquierdo de la barra horrizontal 2 -->
        <div class="page-head">
            <h2 class="pull-left"><i class="fa fa-home"></i> <span id="cambiarTitulos" >Inicio</span></h2>

            <!-- inicio -->
            <div class="bread-crumb pull-right">
                <a style="cursor:pointer;" class="jsp" id="inicio"><i class="fa fa-home"></i> Inicio</a>
            </div>

            <div class="clearfix"></div>

        </div>



        <!-- fin de encabezado -->



        <!-- Contenido -->
        <div id="contenidoPagina"></div>
        <!-- Contenido -->


        <!-- Este archivo contiene las librerías necesarias para el funcionamiento básico JS-->



        <!-- Librerías JS para el tema macadmin -->
        <!-- JS -->
        <script src="framework/macAdminStyle/js/jquery.js"></script>

        <script  src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script  src="framework/jquery/jquery-ui.min.js" type="text/javascript"></script>

        <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
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
            <!-- fin  Librerías para el tema macadmin -->
        <script>

            $(document).ready(function(){


                $.ajax({
                    url: 'inicio.jsp',
                    success: function(data){


                        $('#contenidoPagina').html(data);


                    }
                });

                $(".action").click(function(){
                    var action = this.id;
                    $.ajax({
                        url: action +'.action',
                        success: function(data){
                            $('#contenidoPagina').html(data);
                        }
                    });

                });
                $(".jsp").click(function(){
                    var action = this.id;
                    $.ajax({
                        url: action +'.jsp',
                                success: function(data){
                            $('#contenidoPagina').html(data);
                        }
                    });

                });
                $(".action, .jsp").click(function(){
                    var titulo = this.name;
                            $('#cambiarTitulos').html(titulo);
                });



                $(window).resize(function()
                {
                    if($(window).width() >= 765){
                        $(".sidebar #nav").slideDown(350);
                    }
                    else{
                        $(".sidebar #nav").slideUp(350);
                    }
                });

                $(".has_sub > a").click(function(e){
                    e.preventDefault();
                    var menu_li = $(this).parent("li");
                    var menu_ul = $(this).next("ul");

                    if(menu_li.hasClass("open")){
                        menu_ul.slideUp(350);
                        menu_li.removeClass("open")
                    }
                    else{
                        $("#nav > li > ul").slideUp(350);
                        $("#nav > li").removeClass("open");
                        menu_ul.slideDown(350);
                        menu_li.addClass("open");
                    }
                });

                $(".sidebar-dropdown a").on('click',function(e){
                    e.preventDefault();

                    if(!$(this).hasClass("open")) {
                        // hide any open menus and remove all other classes
                        $(".sidebar #nav").slideUp(350);
                        $(".sidebar-dropdown a").removeClass("open");

                        // open our new menu and add the open class
                        $(".sidebar #nav").slideDown(350);
                        $(this).addClass("open");
                    }

                    else if($(this).hasClass("open")) {
                        $(this).removeClass("open");
                        $(".sidebar #nav").slideUp(350);
                    }
                });
                $('.wclose').click(function(e){
                    e.preventDefault();
                    var $wbox = $(this).parent().parent().parent();
                    $wbox.hide(100);
                });
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
            }); // fin document ready


        </script>
        </div>
</div>
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
</body>
</html>
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>