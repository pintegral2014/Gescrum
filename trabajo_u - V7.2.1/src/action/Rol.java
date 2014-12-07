package action;

import action.model.RolModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.RolDTO;
import logica.LogicaRol;

import javax.swing.*;
import java.util.List;

/**
 * Created by Ripcrow on 22-11-2014.
 */
public class Rol extends ActionSupport implements ModelDriven {

    RolModel rolModel = new RolModel();

    @Override
    public Object getModel(){
        return rolModel;
    }

    public String listarol() throws Exception {

        LogicaRol logicaRol= new LogicaRol();
        List<RolDTO> lista = logicaRol.listRol();
        if(lista.size() >= 1 && lista != null){
            this.rolModel.setListarol(lista);
            return SUCCESS;
        }
        else {
            return ERROR;
        }

    }

   /*public String getJSON(){
        return listarol();
    }*/

}
