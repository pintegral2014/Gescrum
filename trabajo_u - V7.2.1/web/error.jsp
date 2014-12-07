<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from responsivewebinc.com/premium/mac5/macadmin/error.html by HTTrack Website Copier/3.x [XR&CO'2010], Fri, 14 Nov 2014 01:33:59 GMT -->
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!-- Title and other stuffs -->
  <title>Error - Gescrum</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">

  <!-- Stylesheets -->
  <link href="framework/macAdminStyle/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link href="framework/macAdminStyle/css/style.css" rel="stylesheet">
  
  <script src="framework/macAdminStyle/js/respond.min.js"></script>
  <!--[if lt IE 9]>
  <script src="framework/macAdminStyle/js/html5shiv.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="imagenes/favicon.png">
</head>

<body>
<h3 style="text-align: center; margin-top: -30px;"><img src="imagenes/logo.png"></h3>
<!-- Form area -->
<div class="error-page" style="margin-top: -30px;">
  <div class="container">

    <div class="row">
      <div class="col-md-12">
        <!-- Widget starts -->
            <div class="widget">
              <!-- Widget head -->
              <div class="widget-head">
                <i class="fa fa-question-circle"></i> Error 
              </div>

              <div class="widget-content">
                <div class="padd error">
                  
                  <h1>La página ingresada no existe</h1>
                  <p>Para mayor información, comuníquese con el administrador.</p>
                    <br />
                    <br />


                 <div class="horizontal-links">
                     <p>Volviendo al inicio en <label class="cuenta" style='color:blue; font-size: 12px;'> 5 </label></p>
                     <!--<button class="btn btn-warning" onclick="javascript:window.location = 'Login.jsp'">Ir a inicio</button>-->

                 </div>

                </div>
                <div class="widget-foot">
                  <!-- Footer goes here -->
                </div>
              </div>
            </div>  
      </div>
    </div>
  </div> 
</div>
	
		

<!-- JS -->
<script src="framework/macAdminStyle/js/jquery.js"></script>
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        setTimeout(function(){$('.cuenta').html("<label style='color:blue; font-size: 16px;'>1</label>");}, 4000);
        setTimeout(function(){$('.cuenta').html("<label style='color:blue; font-size: 15px;'>2</label>");}, 3000);
        setTimeout(function(){$('.cuenta').html("<label style='color:blue; font-size: 14px;'>3</label>");}, 2000);
        setTimeout(function(){$('.cuenta').html("<label style='color:blue; font-size: 13px;'>4</label>");}, 1000);
        setTimeout(function(){$('.cuenta').html("<label style='color:blue; font-size: 17px;'>0... </label>"); window.location="login.jsp"}, 5000);
    });

</script>
</body>


</html>