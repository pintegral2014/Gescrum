<%--
Created by IntelliJ IDEA.
User: jecarrasco
Date: 20-05-2014
Time: 8:54
To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="framework/macAdminStyle/css/font-awesome.min.css"  rel="stylesheet" />
    <link href="framework/macAdminStyle/css/style.css"  rel="stylesheet" />
    <script src="framework/macAdminStylejs/respond.min.js"></script>
    <!-- Favicon -->
    <link rel="shortcut icon" href="framework/macAdminStyle/img/favicon/favicon.png">

    <!--
    <script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="framework/jquery/jquery.validate.js" type="text/javascript"></script>
    <script  src="framework/jquery/validate_form.js" type="text/javascript"></script>
    -->
    <!--<script type="text/javascript" src="framework/macAdminStyle/js/jquery-1.10.2.js"></script>-->
    <script src="framework/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="framework/bootstrap-3.2.0/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="framework/macAdminStyle/css/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="framework/macAdminStyle/js/bootstrapValidator.min.js"> </script>
    <script src="framework/jquery/jquery.validate.js"></script>
    <script  src="framework/jquery/login.validate.2.js" type="text/javascript"></script>
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

    <script  src="framework/jquery/jquery.blockUI.js" type="text/javascript"></script>
    <script  src="framework/jquery/jquery-ui.min.js" type="text/javascript"></script>
    <style type="text/css">
        div.growlUI{
            background: black no-repeat 10px 10px;
        }
        div.growlUI h3, div.growlUI h4{
            color: #ffffff;padding: 5px 5px 75px;text-align: left;
        }
    </style>
    <script>


    </script>

    <title>Login</title>
</head>
<body id="signin">
<!-- Form area -->
<div class="admin-form">
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <!-- Widget starts -->
                <div class="widget worange">
                    <!-- Widget head -->
                    <div class="widget-head">
                        <i class="fa fa-lock"></i> Login
                    </div>

                    <div class="widget-content">
                        <div class="padd">
                            <!-- Login form -->
                            <form class="form-horizontal" action="Login.action" id="formLogin" method="post">
                                <!-- Login  -->
                                <div class="form-group has-feedback">
                                    <label class="col-md-3 control-label" for="loginConexion">Login</label>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <s:textfield name="loginConexion"  id="loginConexion" cssClass="form-control" placeholder="Ingrese login usuario"/>
                                            <span class="glyphicon glyphicon form-control-feedback" id="loginConexion1"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Password -->
                                <div class="form-group has-feedback">
                                    <label class="col-md-3 control-label" for="clave">Clave</label>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <s:password name="clave"  id="clave"  cssClass="form-control" placeholder="Ingrese clave"/>
                                            <span class="glyphicon form-control-feedback" id="clave1"></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- buttons -->
                                <div class="col-lg-9 col-lg-offset-3">

                                    <button type="button" class="btn btn-info btn-smt" id="btnEnviar">Entrar</button>
                                    <button type="reset" class="btn btn-default btn-smt">Limpiar</button>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-9 col-md-offset-3">
                                        <div id="messages"></div>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>
                    <div class="widget-foot">
                        <a href="#">Sistema GESCRUM</a>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

