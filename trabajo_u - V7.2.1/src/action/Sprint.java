package action;

import action.model.SprintModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.MensajeDTO;
import dto.SprintDTO;
import logica.LogicaSprint;

import java.util.List;

/**
 * Created by EmilioCesar on 30-11-2014.
 */
public class Sprint extends ActionSupport implements ModelDriven {

    SprintModel modelSprint = new SprintModel();

    @Override
    public Object getModel() {
        return modelSprint ;
    }

    @Override
    public String execute()  {return SUCCESS;}



    public String crearSprint() throws Exception {

        SprintDTO newSprint = new SprintDTO();


        newSprint.setNombreSprint(modelSprint.getNombreSprint());
        newSprint.setDescripcionSprint(modelSprint.getDescripcionSprint());
        newSprint.setUsuCreadorSprint(modelSprint.getUsuCreadorSprint());
        newSprint.setGruSprintId(modelSprint.getGruSprintId());


        LogicaSprint logicaSprint = new LogicaSprint(newSprint);
        boolean insert = logicaSprint.crearSprint();



        if (insert){

            modelSprint.setMensaje(new MensajeDTO("success", "<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Sprint " + modelSprint.getNombreSprint() + " creada con exito</span>"));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            modelSprint.setMensaje(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Sprint " + modelSprint.getNombreSprint() + " existente en registros</span>"));
            return ERROR;
        }
    } // fin metodo crearHistoria

    public String listarSprint() throws Exception {

        LogicaSprint logicaSprint = new LogicaSprint();
        List<SprintDTO> listaSprint = logicaSprint.listarSprint();
        /*LogicaRol logicaRol = new LogicaRol();
        List<RolDTO> listaRol = logicaRol.listRol();*/
        if(listaSprint.size() >= 0){
            this.modelSprint.setListaSprint(listaSprint);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }



}
