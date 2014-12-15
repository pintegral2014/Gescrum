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

    public List<SprintDTO> listarSprintxGrupo(int idGrupo) throws  Exception{
        List<SprintDTO> listaSprint = SprintDAO.listaSprintXGrupo(idGrupo);


        if(listaSprint != null)
        {
            //retorna la lista de grupos
            return listaSprint;
        }else{
            return null;
        }
    }

    public List<SprintDTO> traerSprint(int idSprint)throws Exception{
        List<SprintDTO> Sprint = SprintDAO.buscarSprint(idSprint);

        if(Sprint != null){
            return Sprint;
        }
        return null;
    }

    public static Boolean modSprint (SprintDTO sprintDTO)throws Exception{

        boolean exito = false;
        boolean update = SprintDAO.updateSprint(sprintDTO);

        if(update){
            exito = true;
        }
        else
        { exito = false;}
        return exito;
    }

}
