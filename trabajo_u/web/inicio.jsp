<%-- 
    Document   : inicio
    Created on : 15-nov-2014, 17:33:56
    Author     : Daniel Valdebenito
--%>
<!-- Control de sesión - Poner al inicio del documento -->
<% if (session.getAttribute("loginConexion")!=null){%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="framework/macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
    <style type="text/css">

    </style>
    <script type="text/javascript">
        $(function () {
            var esperado = "";
            var i = 180;
            j = 0;
            var cosa = new Array();
            while(i>0)
            {
                cosa[j] = i;
                i = i - 5;
                j++;
            }


            $('#grafico').highcharts({
                title: {
                    text: 'Gráfico de trabajo pendiente',
                    x: 0 //center
                },
                subtitle: {
                    text: '(Burndown charts)',
                    x: 0
                },
                xAxis: {
                    title: {
                        text: 'Días'
                    },
                    categories: ['1', '2', '3', '4', '5', '6',
                        '7', '8', '9', '10', '11', '12']
                },
                yAxis: {
                    min: 30,

                    title: {
                        text: 'Esfuerzo'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,

                        color: 'red'
                    }]
                },
                tooltip: {
                    valueSuffix: ''//texto explicativo
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 1
                },
                series: [{
                    name: 'Esfuerzo esperado',

                    data: cosa

                }, {
                    name: 'Esfuerzo real',
                    data: [30]
                }]
            });
        });
    </script>
</head>
<body>
<script src="framework/graficos/js/highcharts.js"></script>
<script src="framework/graficos/js/modules/exporting.js"></script>

<div id="grafico" style="min-width: 310px; height: 400px; margin: 50px 50px 0px 50px;">aa</div>
        

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

<br>
<!-- Matter ends -->

</div>

<!-- Mainbar ends -->
<div class="clearfix"></div>

</div>
<!-- Content ends -->



   </body>


</html>
<% }
else
{%>
<script>window.location = "login.jsp";</script>
<%}%>