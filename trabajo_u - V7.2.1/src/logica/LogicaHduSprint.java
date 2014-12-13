package logica;

import dao.HduSprintDAO;
import dto.HduSprintDTO;

import java.util.List;

/**
 * Created by Daniel Valdebenito on 30/11/2014.
 */
public class LogicaHduSprint {
    HduSprintDTO hduSprint = new HduSprintDTO(); //Crea objeto DTO

    public LogicaHduSprint() { //Crea constructor vacio
    }

    public LogicaHduSprint(HduSprintDTO hduSprint) {
        this.hduSprint = hduSprint;
    }  //Crea constructor del objeto DTO creado

    public List<HduSprintDTO> listaIteracionesHdu() throws Exception { //crea función de tipo lista con objeto DTO
        List<HduSprintDTO> listaIteraciones = HduSprintDAO.daoIteraciones(hduSprint.getTbl_sprint_spr_id()); //Crea una lista de tipo DTO de la función en DAO
        if(listaIteraciones != null)
        {
            return listaIteraciones;
        }
        else
        {
            return null;
        }
    }


}
