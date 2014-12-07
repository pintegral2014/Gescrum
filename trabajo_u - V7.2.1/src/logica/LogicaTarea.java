package logica;

import dao.TareaDAO;
import dto.TareaDTO;

import javax.swing.*;
import java.util.List;

/**
 * Created by EmilioCesar on 28-11-2014.
 */
public class LogicaTarea {
    TareaDTO tarea = new TareaDTO();

    public LogicaTarea() {
    }

    public LogicaTarea(TareaDTO tarea) {
        this.tarea = tarea;
    }

    public List<TareaDTO> listaTareaFil() throws Exception{
        List<TareaDTO> listaTarea = TareaDAO.listaTareaHistoria(tarea);

        if(listaTarea.size() >= 0) {
            return listaTarea;

        }else{
            return null;
        }
    }

    public boolean crearTarea() throws Exception{

        boolean exito = TareaDAO.ingresarTarea(tarea);
       if(exito)
       {
        return true;
       } else{
           return false;
            }
    }

}
