<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Gescrum</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link data-turbolinks-track="true" href="framework/bootstrap/css/estilo.css" media="all" rel="stylesheet" />
    <script data-turbolinks-track="true" src="framework/jquery/java.js"></script>
    <script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.prueba').click(function(){
                var nameJSP = this.name;
                $.ajax({
                    url: nameJSP+'.jsp',
                    success: function(data){
                        $('#contenido').html(data);
                        $('#contenido').slideDown(1000);
                    }
                })
            });
            $(".prueba").click(function(){
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

</head>
<body id="dashboard">

<div id="wrapper">

    <div id="sidebar-default" class="main-sidebar fix-scroll">
        <div class="current-user">
            <a href="#" class="name">
                <img alt="1" class="avatar" src="#" />
        <span>
        <%= session.getAttribute("loginConexion")%>
          <i class="fa fa-chevron-down"></i>
        </span>
            </a>
            <ul class="menu">
                <li>
                    <a href="#">Ajustes</a>
                </li>

                <li>
                    <a href="#">Sign out</a>
                </li>
            </ul>
        </div>
        <div class="menu-section">
            <h3>General</h3>
            <ul>
                <li class="option">
                    <a href="#" class="active">
                        <i class="ion-android-earth"></i>
                        <span>Home</span>
                    </a>
                </li>

                <li class="option">
                    <a href="#" data-toggle="sidebar">
                        <i class="ion-stats-bars"></i> <span>Reportes</span>
                        <i class="fa fa-chevron-down"></i>
                    </a>
                    <ul class="submenu">
                        <li><a href="#">Reportes General</a></li>
                        <li><a href="#">Reporte Sprint</a></li>
                    </ul>
                </li>
                <li class="option">
                    <a href="#" data-toggle="sidebar">
                        <i class="ion-pricetags"></i> <span>Mantenedores</span>
                        <i class="fa fa-chevron-down"></i>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="#" data-toggle="sidebar">
                                <i class="ion-person-stalker"></i> <span>Usuarios</span>
                                <i class="fa fa-chevron-down"></i>
                            </a>
                            <ul class="submenu">
                                <li><a href="#" class="prueba"  id="select">Ingresar</a></li>
                                <li><a href="#" class="prueba" id="grilla">Listar</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" data-toggle="sidebar">
                                <i class="ion-person-stalker"></i> <span>Historia</span>
                                <i class="fa fa-chevron-down"></i>
                            </a>
                            <ul class="submenu">
                                <li><a href="#" class="prueba"  name="IngresarHistoria">Ingresar</a></li>
                                <li><a href="#" class="prueba" id="lll">Listar</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>

    <div id="content">
        <div class="menubar">
            <div class="sidebar-toggler visible-xs">
                <i class="ion-navicon"></i>
            </div>
            <div class="page-title">
                Gescrum
            </div>
        </div>
        <div id="contenido">

        </div>
    </div>



</div>
</body>
</html>