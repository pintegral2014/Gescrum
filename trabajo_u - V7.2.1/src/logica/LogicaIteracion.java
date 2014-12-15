package logica;

import action.Iteracion;
import dao.IteracionDAO;
import dto.IteracionDTO;

import javax.swing.*;
import java.util.Date;

/**
 * Created by EmilioCesar on 08-12-2014.
 */
public class LogicaIteracion {
    private static java.sql.Date getCurrentDate() {
        Date today = new Date();
        return new java.sql.Date(today.getTime());
    }
    IteracionDTO iteracion = new IteracionDTO();

    public LogicaIteracion() {
    }

    public LogicaIteracion(IteracionDTO iteracion) {
        this.iteracion = iteracion;
    }


    public boolean ingresaIteracion()throws Exception{
        boolean exito = false;
        String submensaje = "";

        int esfuerzoAcumulado = IteracionDAO.obtenerEsfuerzo(iteracion);
        int iteracionMaxTarea = IteracionDAO.obtenerIteracion(iteracion);
        iteracion.setIteracionCantidad(iteracionMaxTarea);
        String fechaUltimaIteracion = String.valueOf(IteracionDAO.obtenerFecha(iteracion));
        String fechaActual = String.valueOf(getCurrentDate());
        // JOptionPane.showMessageDialog(null,esfuerzoAcumulado);
        // JOptionPane.showMessageDialog(null,iteracion.getIteracionEsfuerzo());

        if(fechaActual.equals(fechaUltimaIteracion)){
           iteracion.setMensajeAux("<span class='glyphicon glyphicon-remove' " +
                   "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                   "No se puede iterrar el mismo día</span>");
            return false;
        }
        if(esfuerzoAcumulado == 0){
            iteracion.setMensajeAux("<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "La tarea esta finaizada no se puede iterar</span>");

            return false;
        }
        if( esfuerzoAcumulado < iteracion.getIteracionEsfuerzo()) {
            iteracion.setMensajeAux("<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "La tarea no tiene sufuciente esfuerzo para ser asiganda esa cantidad</span>");

            return false;
        }else{
            iteracion.setIteracionEsfuerzo(esfuerzoAcumulado - iteracion.getIteracionEsfuerzo());
            {
                if(iteracion.getIteracionEsfuerzo()== 0){
                    iteracion.setIteracionEstado("Pendiente QA");
                    submensaje  = "tarea cambió de estado a 'Pendiente QA' ";
                }
            }
            boolean insertIteracion =IteracionDAO.insertIteracion(iteracion);

            iteracion.setMensajeAux("<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    submensaje+"<br>Iteración ingresada con éxito </span>");

            return insertIteracion;

        }


    }

    public boolean ingresaIteracion0()throws Exception {


        boolean insertIteracion = IteracionDAO.insertIteracion0(iteracion);

        return insertIteracion;

    }
}



