package action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.MensajeDTO;
import dto.RolDTO;
import dto.UsuarioDTO;
import logica.LogicaRol;
import logica.LogicaUsuario;
import action.model.UsuarioModel;

import javax.swing.*;
import java.util.List;
import java.util.Map;


/**
 * Created by EmilioCesar on 19-11-2014.
 */
public class Usuario extends ActionSupport implements ModelDriven {

    UsuarioModel usuarioModel= new UsuarioModel();

    Integer idUsuario= null;



    @Override
    public Object getModel() {
        return usuarioModel;
    }

    public String crearUsuario()throws Exception{
        Map session = ActionContext.getContext().getSession();
        String usuarioSession = (String) session.get("loginConexion");
        UsuarioDTO newUsuario= new UsuarioDTO();
        newUsuario.setUsuNombre(usuarioModel.getNombre());
        newUsuario.setUsuApellidoPaterno(usuarioModel.getApaterno());
        newUsuario.setUsuApellidoMaterno(usuarioModel.getAmaterno());
        newUsuario.setUsuCorreo(usuarioModel.getCorreo());
        newUsuario.setUsuClave(usuarioModel.getClave());
        newUsuario.setUsuEstado(usuarioModel.getEstado());
        newUsuario.setUsuLoginConexion(usuarioModel.getLoginConexion());
        //newUsuario.setRolId(usuarioModel.getIdRol());
        newUsuario.setUsuCreador(usuarioSession);
        RolDTO rolDTO = new RolDTO();
        rolDTO.setRol_id(usuarioModel.getRol().getRol_id());
        newUsuario.setRol(rolDTO);

        LogicaUsuario pruebaUsuario = new LogicaUsuario(newUsuario);
        boolean prueba = pruebaUsuario.validar_creacionusuario();
        if(prueba){

            usuarioModel.setMensaje(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> Usuario "+ usuarioModel.getLoginConexion()+  " creado con exito</span>" ));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            usuarioModel.setMensaje(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> Usuario " + usuarioModel.getLoginConexion() + " existente en registros</span>"));
            return ERROR;
        }
    }




    /*public String listaruser() throws Exception {

        LogicaUsuario logicaUsuario = new LogicaUsuario();
        List<UsuarioDTO> lista = logicaUsuario.listUser();

        if(lista.size() >= 1 && lista != null){
            this.usuarioModel.setListauser(lista);
            return SUCCESS;
        }
        else {
            return ERROR;
    }
    }
*/
    public String listaruser() throws Exception {

        LogicaUsuario logicaUsuario = new LogicaUsuario();
        List<UsuarioDTO> listaUsuario = logicaUsuario.listUser();
        LogicaRol logicaRol = new LogicaRol();
        List<RolDTO> listaRol = logicaRol.listRol();

        if(listaUsuario.size() >= 1 && listaRol.size() >=1){
            this.usuarioModel.setListauser(listaUsuario);
            this.usuarioModel.setListarol(listaRol);

            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
    public String getJSON() throws Exception {
        return listaruser();
    }

    public String buscarDataUsuario()throws Exception{
        UsuarioDTO usuarioDTO = LogicaUsuario.traerDataUsuario(this.usuarioModel.getIdUsuario());

        if(usuarioDTO != null){
            usuarioModel.setUsuarioDTO(usuarioDTO);
            return "usuarioDataJSON";
        }
        else{
            return ERROR;
        }


    }

    public String modificarDataUsuario(){
        Map session = ActionContext.getContext().getSession();
        String usuarioSession = (String) session.get("loginConexion");

        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setUsuNombre(usuarioModel.getNombre());
        usuarioDTO.setUsuApellidoPaterno(usuarioModel.getApaterno());
        usuarioDTO.setUsuApellidoMaterno(usuarioModel.getAmaterno());
        usuarioDTO.setUsuClave(usuarioModel.getClave());
        usuarioDTO.setUsuCorreo(usuarioModel.getCorreo());
        usuarioDTO.setUsuLoginConexion(usuarioModel.getLoginConexion());
        usuarioDTO.setUsuModificadoPor(usuarioSession);
        RolDTO rolDTO = new RolDTO();
        rolDTO.setRol_id(usuarioModel.getRol().getRol_id());
        usuarioDTO.setRol(rolDTO);

        LogicaUsuario logicaUsuario = new LogicaUsuario();

        return SUCCESS;
    }
}
