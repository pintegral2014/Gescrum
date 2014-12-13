<%@ page import="java.util.Iterator" %>
<%@ page import="dto.HduSprintDTO" %>
<%@ page import="action.model.HduSprintModel" %>
<%@ page import="action.HduSprint" %>
<%@ page import="dao.HduSprintDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.struts2.views.freemarker.tags.IteratorModel" %>
<%@ page import="javax.swing.*" %>
<%@ page import="jdk.nashorn.internal.runtime.arrays.IteratorAction" %>
<%@ page import="logica.LogicaHduSprint" %>
<%--
  Created by IntelliJ IDEA.
  User: Daniel Valdebenito
  Date: 28/11/2014
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
    <title></title>
    <script src="framework/macAdminStyle/js/jquery.js"></script> <!-- jQuery -->
    <script src="framework/graficos/js/highcharts.js"></script>
    <script src="framework/graficos/js/modules/exporting.js"></script>
    <script>
        function onlyUnique(value, index, self) {
            return self.indexOf(value) === index;
        }
        $(document).ready(function() {



                $.ajax({
                    url: "listarHduSprint.action",
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        var i = 0;
                        var j = 0;
                        var g = 0;
                        var maxTarea = 0;
                        var totalEsperado = 0;
                        var cantidadEsperado = 0;
                        var puntosEsperado = 0;
                        var esfuerzo = new Array();
                        var tareas = new Array();
                        var trabajo = new Array();
                        var trabajoReal=0;
                        var controlar;

                        //Este suma el total de los esfuerzos
                        for(i = 0;i<data.listHdu.length;i++)
                        {
                            tareas[i] = data.listHdu[i].tbl_tarea_tar_id; //recoje el id de las tareas
                            if(data.listHdu[i].ts_iteracion == 0)
                            {
                                cantidadEsperado++;
                                totalEsperado = totalEsperado + data.listHdu[i].ts_esfuerzo;
                            }
                        }


                        totalEsperado = totalEsperado / (cantidadEsperado );
                        puntosEsperado = totalEsperado / (cantidadEsperado );
                        cantidadEsperado--;
                        for(i=0 ; i<=cantidadEsperado;i++)
                        {
                            esfuerzo[i] = Math.ceil(totalEsperado);

                            totalEsperado = totalEsperado - puntosEsperado;
                        }


                        tareas = tareas.filter( onlyUnique ); //quita valores repetidos en arreglo tareas id
                        for(j=0;j<(tareas.length);j++)
                        {

                            for(i = 0;i<data.listHdu.length;i++)
                            {
                                if((data.listHdu[i].tbl_tarea_tar_id == (j+1))&&(data.listHdu[i].ts_iteracion!=0))
                                {
                                    controlar = data.listHdu[i].ts_esfuerzo;
                                    //alert(data.listHdu[i].tbl_tarea_tar_id);
                                    trabajoReal = trabajoReal +  data.listHdu[i].ts_esfuerzo;

                                }

                            }


                            trabajo[j]= trabajoReal;
                            g++;
                            trabajoReal = 0;
                            //alert(trabajo[j]);

                        }

                        // alert(trabajo[0]);





                        var chart;
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
                                min:'0',
                                title: {
                                    text: 'Días'
                                },
                                categories: ['1', '2', '3', '4', '5', '6',
                                    '7', '8', '9', '10', '11', '12']
                            },
                            yAxis: {
                                min: 0,

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

                                data: esfuerzo

                            }, {
                                name: 'Esfuerzo real',
                                data: [0]
                            }]
                        });





                    }
                });
                return false;


        });
    </script>
</head>
<body>
    <div id="grafico" style="min-width: 310px; height: 400px; margin: 0px 50px 0px 50px;"></div>
</body>



</body>
</html>
