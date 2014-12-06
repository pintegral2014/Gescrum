<%--
  Created by IntelliJ IDEA.
  User: Daniel Valdebenito
  Date: 01/12/2014
  Time: 16:58
  To change this template use File | Settings | File Templates.
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
            var chart;

            var esperado = "";
            var i = 180;
            j = 0;
            var cosa = new Array();
            var cosa2 = new Array();
            cosa2[0] = 180;
            cosa2[1] = 140;
            cosa2[2] = 110;
            cosa2[3] = 95;
            cosa2[4] = 60;
            cosa2[5] = 5;
            while(i>0)
            {
                cosa[j] = i;
                i = i - 30;
                j++;
            }




            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'grafico', 	// Le doy el nombre a la gráfica
                    defaultSeriesType: 'line'	// Pongo que tipo de gráfica es
                },
                title: {
                    text: 'Gráfico de trabajo pendiente'	// Titulo (Opcional)
                },
                subtitle: {
                    text: '(Burndown charts)'		// Subtitulo (Opcional)
                },
                // Pongo los datos en el eje de las 'X'
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
                // Doy formato al la "cajita" que sale al pasar el ratón por encima de la gráfica
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
                    data: cosa2
                }]
            });


        });
    </script>
</head>
<body>
<script src="framework/graficos/js/highcharts.js"></script>
<script src="framework/graficos/js/modules/exporting.js"></script>

<div id="grafico" style="min-width: 310px; height: 400px; margin: 50px 50px 0px 50px;"></div>


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