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
    int esfuerzoAcumulado = IteracionDAO.obtenerEsfuerzo(iteracion);
    String fechaUltimaIteracion = String.valueOf(IteracionDAO.obtenerFecha(iteracion));
    String fechaActual = String.valueOf(getCurrentDate());

    if(fechaActual.equals(fechaUltimaIteracion)){
        JOptionPane.showMessageDialog(null,"No se puede iterar la misma tarea un mismo dia");
        return false;
    }
    if(esfuerzoAcumulado == 0){
        JOptionPane.showMessageDialog(null,"La tarea esta finaizada no se puede iterar");
        return false;
    }
    if( esfuerzoAcumulado < iteracion.getIteracionEsfuerzo()) {
        JOptionPane.showMessageDialog(null, "La tarea no tiene sufuciente esfuerzo para ser asiganda esa cantidad");
        return false;
    }else{
        iteracion.setIteracionEsfuerzo(esfuerzoAcumulado - iteracion.getIteracionEsfuerzo());
        {
            if(iteracion.getIteracionEsfuerzo()== 0){
                iteracion.setIteracionEstado("Pendiente QA");
            }
        }
        boolean insertIteracion = IteracionDAO.insertIteracion(iteracion);

        return insertIteracion;

    }


}

    public boolean ingresaIteracion0()throws Exception {


            boolean insertIteracion = IteracionDAO.insertIteracion0(iteracion);

            return insertIteracion;

        }
    }



