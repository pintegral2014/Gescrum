package action;

import action.model.HduSprintModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.HduSprintDTO;
import logica.LogicaHduSprint;

import java.util.List;

/**
 * Created by Daniel Valdebenito on 30/11/2014.
 */
public class HduSprint extends ActionSupport implements ModelDriven {
    HduSprintModel hduModel = new HduSprintModel();


    @Override
    public Object getModel() {
        return hduModel;
    }
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
    public String listarHduSprint() throws Exception {
        LogicaHduSprint logicaHdu = new LogicaHduSprint();
        List<HduSprintDTO> lista = logicaHdu.listaIteracionesHdu();

        if(lista.size()>=0){
            this.hduModel.setListHdu(lista);
            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }

}
