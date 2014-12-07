package action;

import action.model.GrupoModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.GrupoDTO;
import dto.MensajeDTO;
import logica.LogicaGrupo;

import javax.swing.*;
import java.util.List;

/**
 * Created by Ripcrow on 26-11-2014.
 */
public class Grupo extends ActionSupport implements ModelDriven {

    GrupoModel grupoModel = new GrupoModel();

    private int idGru;

    public int getIdGru() {
        return idGru;
    }

    public void setIdGru(int idGru) {
        this.idGru = idGru;
    }

    @Override
    public Object getModel(){
        return grupoModel;
    }
    public String listargrupo() throws Exception {

        LogicaGrupo logicaGrupo = new LogicaGrupo();
        List<GrupoDTO> listaGrupo = logicaGrupo.listaGrupo();
        if(listaGrupo.size() >= 1){
            this.grupoModel.setListagrupo(listaGrupo);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }

    public String buscarInfoGrupo()throws Exception{
        LogicaGrupo logicaGrupo = new LogicaGrupo();
        GrupoDTO grupoDTO = logicaGrupo.traerDataGrupo(this.idGru);

        if(grupoDTO != null)
        {
            grupoModel.setGrupoDTO(grupoDTO);
            return "grupoDataJSON";
        }
        return ERROR;
    }

    public String modificarDataGrupo() throws Exception {
        GrupoDTO grupoDTO = new GrupoDTO();
        grupoDTO.setGruId(grupoModel.getGruId());
        grupoDTO.setGruNombre(grupoModel.getGruNombre());
        grupoDTO.setGruDescripcion(grupoModel.getGruDescripcion());
        grupoDTO.setGruEstado(grupoModel.getGruEstado());

        boolean exito = LogicaGrupo.modDataGrupo(grupoDTO);

        if(exito == true){
            grupoModel.setMensajeDTO(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> Grupo "+
                    grupoModel.getGruNombre()+  " modificado con exito</span>" ));
            return SUCCESS;
        }
        grupoModel.setMensajeDTO(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' style='color:red; text-align: left; font-size: 40px;'></span> &nbsp; " +
                "<span style='font-size: 18px; text-align: center;'> Grupo " +
                grupoModel.getGruNombre() + " no se ha podido modificar</span>"));
        return ERROR;
    }
}
