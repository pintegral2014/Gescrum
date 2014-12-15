package action;

import action.model.HduSprintModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dao.HduSprintDAO;
import dto.HduSprintDTO;
import logica.LogicaHduSprint;
import logica.LogicaSprint;

import javax.swing.*;
import java.util.ArrayList;
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
        HduSprintDTO select = new HduSprintDTO();
        select.setTbl_sprint_spr_id(this.hduModel.getSprId());

        LogicaHduSprint logicaHdu = new LogicaHduSprint(select);
        List<HduSprintDTO> lista = logicaHdu.listaIteracionesHdu();

        LogicaSprint logicaSprint = new LogicaSprint();
        int numeroDias = logicaSprint.obtenerDias(select.getTbl_sprint_spr_id());

        int difDias = logicaHdu.traerDifDias(select.getTbl_sprint_spr_id());

        List<Integer> intList = new ArrayList<Integer>();


        for (int i = 0; i <= difDias; i++)
        {
            intList.add(HduSprintDAO.maxEsfuerzo(i,select.getTbl_sprint_spr_id()));
        }


        if(lista.size()>=0){
            this.hduModel.setListHdu(lista);
            this.hduModel.setNumeroDias(numeroDias);
            this.hduModel.setListaEsfuerzoReal(intList);

            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }

}
