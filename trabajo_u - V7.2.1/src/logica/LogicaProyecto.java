package logica;


import dao.ProyectoDAO;
import dto.ProyectoDTO;

import java.util.List;

/**
 * Created by Jordan on 25-11-2014.
 *
 */
public class LogicaProyecto {

    public List<ProyectoDTO> listaProyectos()throws Exception{
        List<ProyectoDTO> listaPro = ProyectoDAO.listaProyecto();

        return listaPro;

    }
    public List<ProyectoDTO> listaProyectos2()throws Exception{
        List<ProyectoDTO> listaPro = ProyectoDAO.listaProyecto2();
        return listaPro;

    }

    public ProyectoDTO traerDataProyecto(int idPro)throws Exception{
        ProyectoDTO proyectoDTO = ProyectoDAO.obtenerDataProyecto(idPro);
        if(proyectoDTO != null){
            return proyectoDTO;
        }
        return null;
    }

    public static boolean modDataProyecto (ProyectoDTO proyectoDTO)throws Exception{

        boolean exito = false;
        boolean update = ProyectoDAO.updateProyecto(proyectoDTO);
        if(update == true){
            exito = true;
        }
        return exito;

    }
    public boolean crearProyecto(ProyectoDTO proyectoDTO)throws Exception{
        boolean exito = false;
        boolean insert = false;
        ProyectoDTO proyectoDTO1 = ProyectoDAO.buscarProyecto(proyectoDTO.getProNombre());
        if(proyectoDTO1 == null){
            insert = ProyectoDAO.insertProyecto(proyectoDTO);
            if(insert == true){
                exito = true;
            }
        }
        return exito;
    }
}
