<%-- 
    Document   : ingresarTestCase2
    Created on : 17-11-2014, 16:17:10
    Author     : Dvaldebenito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            @import "framework/estilos/estilos2.css";
        </style>
        
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

    </head>
    <body>
      <div class="container-fluid centradovertical"> <div class="row"><div class="col-lg-8">
                  <form method="post" action="" name="form">
<table class="table table-condensed table-bordered largotabla">
    
            
            <tr><th class="titulotabla largotitulos">Enunciado:</th>
            <td class="largocampos"><input class="borde  largocampos" type="text" placeholder=""  value="" required></td></tr>
            <tr><th class="titulotabla largotitulos">Objetivo:</th>
            <td  class="largocampos"><input class="borde largocampos" type="text"   value="" required></td></tr>
            <tr><th class="titulotabla largotitulos">Dato requerido:</th>
            <td  class="largocampos"><input class="borde largocampos" type="text"    value="" required></td></tr>
            <tr><th class="titulotabla largotitulos">Precondiciones</th>
            <td  class="largocampos"><input class="borde largocampos" type="text"    value="" required></td>
            </tr>
            <tr><th class="titulotabla largotitulos">Asigne una tarea:</th>
                <td>
                <div class="col-sm-10 col-md-8">
                    <select class="form-control" data-smart-select>
                        <option value="1">tarea1</option>
                        <option value="2">tarea2</option>
                        <option value="3">tarea3</option>
                    </select> </div>
                </td>   </tr>
                 
       
</table>
                  <button name="button" type="button" onclick="javascript:parent.jQuery.colorbox.close();" class="btn btn-success">Cancelar</button> 
                  <button type="submit" name="Insertar"  class="btn btn-warning">Insertar</button>
                  </form>
                 
              </div>
          </div>
          </div> 
    </body>
</html>
