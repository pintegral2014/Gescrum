package logica;

import dao.SprintDAO;
import dto.SprintDTO;

import java.util.List;

/**
 * Created by EmilioCesar on 30-11-2014.
 */
public class LogicaSprint {

    SprintDTO sprint = new SprintDTO();

    public LogicaSprint() {
    }

    public LogicaSprint(SprintDTO sprint) {
        this.sprint = sprint;
    }


    public boolean crearSprint()throws Exception{
        boolean exito = false;

            SprintDAO.insertSprint(sprint);
            exito = true;

        return exito;


    }

    public List<SprintDTO> listarSprint() throws  Exception{
        List<SprintDTO> listaSprint = SprintDAO.listaSprintGrupo();


        if(listaSprint != null)
        {
            //retorna la lista de grupos
            return listaSprint;
        }else{
            return null;
        }
    }

    public int obtenerDias(int numeroDiass) throws  Exception{
       int numeroDias = SprintDAO.obtenerDias(numeroDiass);

        if(numeroDias != -1)
        {
            return numeroDias;
        }else{
            return -1;
        }
    }

}
