<%-- 
    Document   : gestionarTestCase2
    Created on : 17-11-2014, 13:21:10
    Author     : Dvaldebenito
--%>
<!-- Control de sesión - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar TestCase</title>
</head>
<body>
        <!-- Matter -->
        <div class="matter" id="contenido">
        <span class="titulos">Gestionar TestCase</span>
        <div  class="limiteSuperior">
            <a type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" style="margin-left: 20px;">Crear</a>
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
                    <th>Enunciado</th>
                    <th>Objetivo</th>
                    <th>Dato Requerido</th>
                    <th>Precondiciones</th>
                    <th>Fecha de creacion</th>
                    <th>Usuario Creador</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Prueba a eventums 1 al 10</td>
                    <td>Obtener todos los puntos ok</td>
                    <td>Success</td>
                    <td>sin precondiciones</td>
                    <td>2014-11-14</td>
                    <td>elandskronc</td>
                </tr>
                <tr>
                    <td>Prueba al sistema telefonico0</td>
                    <td>Obtener todos los puntos ok</td>
                    <td>Success</td>
                    <td>sin precondiciones</td>
                    <td>2014-11-14</td>
                    <td>elandskronc</td>
                </tr>
                <tr>
                    <td>Prueba de sistema avanzado</td>
                    <td>Obtener todos los puntos ok</td>
                    <td>Success</td>
                    <td>sin precondiciones</td>
                    <td>2014-11-14</td>
                    <td>elandskronc</td>
                </tr>
                <tr>
                    <td>Pruebas al sistema de correo</td>
                    <td>Obtener todos los puntos ok</td>
                    <td>Success</td>
                    <td>sin precondiciones</td>
                    <td>2014-11-14</td>
                    <td>elandskronc</td>
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
<br>
<!-- Matter ends -->

</div>

<!-- Mainbar ends -->
<div class="clearfix"></div>

</div>
<!-- Content ends -->
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
</body>
</html>
<!-- Control de sesión - Poner al final del documento -->
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>