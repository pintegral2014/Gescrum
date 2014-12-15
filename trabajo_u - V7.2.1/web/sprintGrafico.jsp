<%--
  Created by IntelliJ IDEA.
  User: Daniel Valdebenito
  Date: 28/11/2014
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="s" uri="/struts-tags"%>

<script src="framework/graficos/js/highcharts.js"></script>
<script src="framework/graficos/js/modules/exporting.js"></script>

<style>
    .mostrarGrafico
    {
        display: none;

    }
    .nombreSprint
    {
        color: green;
        font-weight: bold;
    }
</style>
<div class="container">

    <div class="row">

        <div class="col-md-12">
<div class="widget wgreen">

    <div class="widget-head">
        <div class="pull-left">Seleccione Sprint</div>
        <div class="widget-icons pull-right">
            <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="widget-content">
        <div class="padd">



            <!-- ---------------->
    <div class="row"> <!-- -->
        <div class="col-sm-3"><!-- -->

            <s:select
                    name="sprint.sprintId"
                    id="sprint"
                    headerKey="-1"
                    headerValue="-- seleccionar Sprint --"
                    list="listaSprint"
                    listKey="sprintId"
                    listValue="nombreSprint"
                    cssClass="form-control"

                    />
            <span class="glyphicon form-control-feedback" id="proyecto1"></span>
        </div>
        <div class="col-sm-3"> <!-- -->
            <button type="button" class ="btn btn-info"  id="cargarSprint">Cargar Burndown charts</button>
        </div></div>

            <!-- ---------------->

</div></div></div></div></div></div>


<div class="container mostrarGrafico">

    <div class="row">

        <div class="col-md-12">
            <div class="widget wgreen">

                <div class="widget-head">
                    <div class="pull-left">Gráfica - Burndown charts - <span class="nombreSprint"></span></div>
                    <div class="widget-icons pull-right">
                        <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                    <div class="padd">

                        <div id="grafico" style="min-width: 310px; height: 400px; margin: 0px 50px 0px 50px;">
                           <center> <img src="imagenes/cargando.gif" style="width: 300px; height: 300px; margin-top: 40px;"/> </center></div>

</div></div></div></div></div></div>



<script>
    function redondeo(numero, decimales)
    {
        var flotante = parseFloat(numero);
        var resultado = Math.round(flotante*Math.pow(10,decimales))/Math.pow(10,decimales);
        return resultado;
    }

    $(document).ready(function(){

        /* Widget close */
        $('.wclose').click(function(e){
            e.preventDefault();
            var $wbox = $(this).parent().parent().parent();
            $wbox.hide(100);
        });

        /* Widget minimize */
        $('.wminimize').click(function(e){
            e.preventDefault();
            var $wcontent = $(this).parent().parent().next('.widget-content');
            if($wcontent.is(':visible'))
            {
                $(this).children('i').removeClass('fa fa-chevron-up');
                $(this).children('i').addClass('fa fa-chevron-down');
            }
            else
            {
                $(this).children('i').removeClass('fa fa-chevron-down');
                $(this).children('i').addClass('fa fa-chevron-up');
            }
            $wcontent.toggle(500);
        });

        $('#cargarSprint').click(function(e){

            e.preventDefault();
            var $wbox = $('.wclose').parent().parent().parent();
            $wbox.show(100);

            var posicion=document.getElementById('sprint').options.selectedIndex; //posicion
            var id = document.getElementById('sprint').options[posicion].value;
            var nombre = document.getElementById('sprint').options[posicion].text;
            if (id < 0) {
            } else {

                $('.mostrarGrafico').show();
                $('.nombreSprint').html(nombre);

                $.ajax({
                    url: "listarHduSprint.action?sprId=" + id,
                    type: "post",
                    dataType: "json",
                    success: function (data) {


                        var i;
                        var diasSprint = data.numeroDias;
                        var sumaEsperado = 0;
                        var esfuerzo = new Array();
                        var divSumaEsperado = 0;



                        for (i = 0; i < data.listHdu.length; i++) /* Suma los esfuerzos de la iteración 0 */
                        {
                            if (data.listHdu[i].ts_iteracion == 0) {
                                sumaEsperado += data.listHdu[i].ts_esfuerzo;
                            }
                        }
                        divSumaEsperado = sumaEsperado / diasSprint;

                        i = 0;
                        while (sumaEsperado > 0) /* crea los valores de la linea esfuerzo esperado */
                        {

                            esfuerzo[i] = redondeo(sumaEsperado,0);

                            sumaEsperado = sumaEsperado - divSumaEsperado;
                            if(sumaEsperado<=0){esfuerzo[i+1]=0}
                            i++;
                        }


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
                                min: '0',
                                title: {
                                    text: 'Días'
                                }

                            },
                            yAxis: {
                                min: 0,

                                title: {
                                    text: 'Esfuerzo'
                                },
                                plotLines: [
                                    {
                                        value: 0,
                                        width: 1,

                                        color: 'red'
                                    }
                                ]
                            },
                            plotOptions: {
                                line: {
                                    dataLabels: {
                                        enabled: true
                                    },
                                    enableMouseTracking: true
                                }
                            },
                            // Doy formato al la "cajita" que sale al pasar el ratón por encima de la gráfica
                            tooltip: {
                                valueSuffix: ' '//texto explicativo
                            },
                            legend: {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 1
                            },
                            series: [
                                {
                                    name: 'Esfuerzo esperado',
                                    data: esfuerzo
                                },
                                {
                                    name: 'Esfuerzo real',
                                    data: data.listaEsfuerzoReal
                                }
                            ]
                        });
                    }
                });
            }
        });
    });

</script>