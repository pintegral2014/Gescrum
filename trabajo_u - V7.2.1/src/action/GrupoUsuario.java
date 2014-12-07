package action;

import action.model.GrupoUsuarioModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.GrupoUsuarioDTO;
import logica.LogicaGrupoUsuario;

import javax.swing.*;
import java.util.List;

/**
 * Created by Ripcrow on 27-11-2014.
 */
public class GrupoUsuario extends ActionSupport implements ModelDriven {

    GrupoUsuarioModel grupoUsuarioModel = new GrupoUsuarioModel();

    @Override
    public Object getModel(){
        return grupoUsuarioModel;
    }
    private int param;

    public int getParam() {
        return param;
    }

    public void setParam(int param) {
        this.param = param;
    }

    public String listargrupousuario() throws Exception {
        GrupoUsuarioDTO grupo = new GrupoUsuarioDTO();
        grupo.setGruGruId(this.grupoUsuarioModel.getGruId());
        LogicaGrupoUsuario logicaGrupoUsuario = new LogicaGrupoUsuario(grupo);
        List<GrupoUsuarioDTO> listaGrupoUsuario = logicaGrupoUsuario.listaGrupoUsuario();
        List<GrupoUsuarioDTO> listaUsuarioSinGrupo = logicaGrupoUsuario.listaUsuarioSinGrupo();
        if(grupo.getGruGruId() > 0){
            this.grupoUsuarioModel.setListagruxusu(listaGrupoUsuario);
            this.grupoUsuarioModel.setListaususingru(listaUsuarioSinGrupo);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }

    public String asociarusuario() throws Exception{
        GrupoUsuarioDTO asociado = new GrupoUsuarioDTO();
        asociado.setGruGruId(grupoUsuarioModel.getGruId());
        asociado.setUsuLoginConexion(grupoUsuarioModel.getLoginConexion());
        asociado.setUsuCreador(grupoUsuarioModel.getUsuCreador());
        LogicaGrupoUsuario logicaGrupoUsuario = new LogicaGrupoUsuario(asociado);
        boolean prueba = logicaGrupoUsuario.asociarusuario();
        if(prueba){
            this.param = asociado.getGruGruId();
            return SUCCESS;
        }
        else
            return ERROR;
    }

    public String desasociarusuario() throws Exception{
        GrupoUsuarioDTO desasociar = new GrupoUsuarioDTO();
        desasociar.setGruGruId(grupoUsuarioModel.getGruId());
        desasociar.setUsuLoginConexion(grupoUsuarioModel.getLoginConexion());
        LogicaGrupoUsuario logicaGrupoUsuario = new LogicaGrupoUsuario(desasociar);
        boolean prueba = logicaGrupoUsuario.desasociarusuario();
        if(prueba){
            this.param = desasociar.getGruGruId();
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
}
