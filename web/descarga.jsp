<%--
  Created by IntelliJ IDEA.
  User: EmilioCesar
  Date: 27-11-2014
  Time: 2:11
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Hojas de estilo -->
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
    <!-- Favicon -->
    <link rel="shortcut icon" href="imagenes/favicon.ico" type="image/x-icon">
    <link rel="icon" href="imagenes/favicon.ico" type="image/x-icon">

</head>
<body>
<!-- Barra de men� fija horizontal -->
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

            <!-- Links, si se quiere se pueden agregar para un men� -->
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown pull-right">
                    <a data-toggle="dropdown" class="dropdown-toggle" style="cursor:pointer;">
                        <i class="fa fa-user"></i> <%=session.getAttribute("loginConexion")%><b class="caret"></b> <!-- impresi�n del usuario -->
                    </a>

                    <!-- Dropdown men�, es un men� desplegable, en este caso para el logout -->
                    <ul class="dropdown-menu" role="menu">

                        <li><a href="logout"><i class="fa fa-sign-out"></i> Logout</a></li> <!-- logout, quitar sesi�n al sistema -->
                    </ul>
                </li>

            </ul>

        </div><!--/.nav-collapse -->
    </div>
</div>
<!-- Fin de men� fijo horizontal -->

<!-- Inicio del contenedor de men� lateral -->

<div class="content" style="margin-top:30px;">

    <!-- Sidebar, barra de lateral de men� -->
    <div class="sidebar">
        <div class="sidebar-dropdown"><a style="cursor:pointer;">Navigation</a></div>

        <!--- Sidebar navigation, barra lateral de navegaci�n -->
        <!-- Si es necesaria una sub-navegaci�n, agregar la class "has_sub" a "li" del la barra de navegaci�n (ver dise�o). -->
        <ul id="nav">
            <!-- Barra de men� con iconos (Estos no son los de bootstrap) -->
            <li class=""><a style="cursor:pointer;" href="inicio.jsp"><i class="fa fa-home"></i> Inicio</a></li> <!-- Al poner class='open' cuando se cargue esa p�gina, quedar� ese men� abierto -->
            <li class="has_sub">
                <a style="cursor:pointer;"><i class="fa fa-list-alt"></i> Reportes <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                    <li><a style="cursor:pointer;" href="reporteGeneral.jsp">Reportes Generales</a></li>
                    <li><a style="cursor:pointer;" href="reporteSprint.jsp">Reporte Sprint</a></li>

                </ul>
            </li>
            <li class="has_sub open">
                <a style="cursor:pointer;"><i class="fa fa-pencil"></i> Mantenedores <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                    <li ><a style="cursor:pointer;" href="listaUsuarios.action"> Gestionar Usuario</a></li>
                    <li ><a style="cursor:pointer;" href="gestionarHistoria2.jsp">Gestionar Historia</a></li>
                    <li><a style="cursor:pointer;" href="gestionarTestCase2.jsp">Gestionar TestCase</a></li>
                    <li><a style="cursor:pointer;" href="gestionarSprint2.jsp">Gestionar Sprint</a></li>
                    <li><a style="cursor:pointer;" href="gestionarProyecto2.jsp">Gestionar Proyecto</a></li>
                </ul>
            </li>
            <li class="has_sub">
                <a style="cursor:pointer;"><i class="fa fa-terminal"></i> Ejecuci�n <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                    <li><a style="cursor:pointer;" href="ejecutarTestCase2.jsp">Ejecutar TestCase</a></li>
                </ul>
            </li>
            <li class="has_sub">
                <a style="cursor:pointer;"><i class="fa fa-user"></i></span> Grupo de Trabajo <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                <ul>
                    <li><a style="cursor:pointer;" href="asociarHistoria2.jsp">Asociar Usuario</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- Fin de barra lateral de men� -->

    <!-- Barra horrizontal 2 (es la que muestra 'Gescrum' con el �cono de la casa) -->
    <div class="mainbar">

        <!-- Encabezado superior izquierdo de la barra horrizontal 2 -->
        <div class="page-head">
            <h2 class="pull-left"><i class="fa fa-home"></i> <span id="tituloPagina">Gescrum</span></h2>

            <!-- inicio -->
            <div class="bread-crumb pull-right">
                <a style="cursor:pointer;" class="jsp" name="inicio"><i class="fa fa-home"></i> Inicio</a>
                <!-- divisor -->
                <span class="divider">/</span>
                <a style="cursor:pointer;" class="bread-current" name="inicio"><span id="arbol">Gescrum</span></a>
            </div>

            <div class="clearfix"></div>

        </div>
        <!-- fin de encabezado -->
        <!-- Contenido de la p�gina -->



        <!-- Matter -->


        <div class="matter" id="contenido">
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
                                        <div class="">
                                            <table class="table table-collase table-condensed table-responsive" cellpadding="0" cellspacing="0" border="0" id="data-table" width="100%" id="tablaDescarga">
                                                <thead class="btn-default">
                                                <tr style="font-size: 12px">
                                                    <th >Nombre Archivo</th>
                                                    <th>Descripcion</th>
                                                    <th>Fecha Upload</th>
                                                    <th>Descarga</th>

                                                </tr>
                                                </thead>
                                                <tbody>
                                                <s:iterator value="listarepositorio">
                                                    <tr style="font-size: 12px">
                                                        <td><s:property value="archivoFileName"/></td>
                                                        <td><s:property value="descripcionRepo"/></td>
                                                        <td><s:property value="fechaCreacion"/></td>
                                                        <td><a href='http://localhost:8084/repositorio/<s:property value='archivoFileName'/>' download=""> <s:property value="archivoFileName"/> </a></td>
                                                    </tr>
                                                </s:iterator>
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

        <br>
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
                <p class="copy">Copyright &copy; 2014 | <a style="cursor:pointer;">Gescrum - Gesti�n de Scrum</a> </p>
            </div>
        </div>
    </div>
</footer>

<!-- Footer ends -->

<!-- Scroll to top -->

<!-- fin Contenido de la página -->
<!-- Librerías JS para el tema macadmin -->
<script src="framework/datatable/jquery.dataTables2.js"></script>
<script src="framework/bootstrap-3.2.0/dist/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="framework/bootstrap-3.2.0/docs/assets/js/ie-emulation-modes-warning.js"></script>
<script src="framework/bootstrap-3.2.0/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="framework/macAdminStyle/js/respond.min.js"></script>
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap-->
<!-- fin  Librerías para el tema macadmin -->

<script>
    $(document).ready(function(){


        var bootstrapButton = $.fn.button.noConflict();
        $.fn.bootstrapBtn = bootstrapButton;

        $('#crear').click(function(){


            $.ajax({
                url: 'ingresarUsuario2.jsp',
                success: function(data){
                    $('#contenido').html(data);



                }
            });
        });
        $(".action").click(function(){
            var action = this.id;
            $.ajax({
                url: action +'.action',
                success: function(data){


                    $('#contenido').html(data);


                }
            })

        })

    });

</script>
</body>
</html>
<!-- Control de sesi�n - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>
