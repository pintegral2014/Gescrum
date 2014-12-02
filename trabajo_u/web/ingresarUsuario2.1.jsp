<%-- 
    Document   : ingresarUsuario2
    Created on : 17-11-2014, 16:08:32
    Author     : Dvaldebenito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Historias</title>
        <!-- Stylesheets -->
  <link href="framework/macAdmincss/Style/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/font-awesome.min.css"> 
  <!-- jQuery UI -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/jquery-ui.css"> 
  <!-- Calendar -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/fullcalendar.css">
  <!-- prettyPhoto -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/prettyPhoto.css">  
  <!-- Star rating -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/rateit.css">
  <!-- Date picker -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/bootstrap-datetimepicker.min.css">
  <!-- CLEditor -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/jquery.cleditor.css"> 
  <!-- Data tables -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/jquery.dataTables.css"> 
  <!-- Bootstrap toggle -->
  <link rel="stylesheet" href="framework/macAdmincss/Style/css/jquery.onoff.css">
  <!-- Main stylesheet -->
  <link href="framework/macAdmincss/Style/css/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="framework/macAdmincss/Style/css/widgets.css" rel="stylesheet">   
  
  <script src="framework/macAdminStyle/js/respond.min.js"></script>
  <!--[if lt IE 9]>
  <script src="framework/macAdminStyle/js/html5shiv.js"></script>
  <![endif]--> 
  
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
        <!-- Matter -->

	    <div class="matter">
        <div class="container">

          <div class="row">

            <div class="col-md-12">


              <div class="widget wgreen">
                
                <div class="widget-head">
                  <div class="pull-left">Forms</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">

                    <br />
                    <!-- Form starts.  -->
                     <form class="form-horizontal" role="form">
                              
                                <div class="form-group">
                                  <label class="col-lg-2 control-label">Input Box</label>
                                  <div class="col-lg-5">
                                    <input type="text" class="form-control" placeholder="Input Box">
                                  </div>
                                </div>
                                
                                <div class="form-group">
                                  <label class="col-lg-2 control-label">Password</label>
                                  <div class="col-lg-5">
                                    <input type="password" class="form-control" placeholder="Password Box">
                                  </div>
                                </div>
                                
                                <div class="form-group">
                                  <label class="col-lg-2 control-label">Textarea</label>
                                  <div class="col-lg-5">
                                    <textarea class="form-control" rows="5" placeholder="Textarea"></textarea>
                                  </div>
                                </div>    
                                
                                <div class="form-group">
                                  <label class="col-lg-2 control-label">Checkbox</label>
                                  <div class="col-lg-5">
                                    <label class="checkbox-inline">
                                      <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
                                    </label>
                                  </div>
                                </div>

                                <div class="form-group">
                                  <label class="col-lg-2 control-label">Radio Box</label>
                                  <div class="col-lg-5">
                                    <div class="radio">
                                      <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                        Option one
                                      </label>
                                    </div>
                                    <div class="radio">
                                      <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                        Option two
                                      </label>
                                    </div>
                                  </div>
                                </div>
                                
                                <div class="form-group">
                                  <label class="col-lg-2 control-label">Select Box</label>
                                  <div class="col-lg-2">
                                    <select class="form-control">
                                      <option>1</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                      <option>5</option>
                                    </select>
                                  </div>
                                </div>     

                                <div class="form-group">
                                  <label class="col-lg-2 control-label">Select Box</label>
                                  <div class="col-lg-2">
                                    <select multiple class="form-control">
                                      <option>1</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                      <option>5</option>
                                    </select>
                                  </div>
                                </div>   

                                <div class="form-group">
                                  <label class="col-lg-2 control-label">CLEditor</label>
                                  <div class="col-lg-6">
                                    <textarea class="cleditor" name="input"></textarea>
                                  </div>
                                </div>                                 
                                
                                <div class="form-group">
                                  <div class="col-lg-offset-2 col-lg-6">
                                    <button type="button" class="btn btn-sm btn-default">Default</button>
                                    <button type="button" class="btn btn-sm btn-primary">Primary</button>
                                    <button type="button" class="btn btn-sm btn-success">Success</button>
                                    <button type="button" class="btn btn-sm btn-info">Info</button>
                                    <button type="button" class="btn btn-sm btn-warning">Warning</button>
                                    <button type="button" class="btn btn-sm btn-danger">Danger</button>
                                  </div>
                                </div>
                              </form>
                    
                    
                    
                    
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

		<!-- Matter ends -->
        
        
        <!-- JS -->
<script src="framework/macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
<script src="framework/macAdminStyle/js/bootstrap.min.js"></script> <!-- Bootstrap -->
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

    </body>
</html>
