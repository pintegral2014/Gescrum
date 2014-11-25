package action;
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
        UsuarioDTO newUsuario= new UsuarioDTO();
        newUsuario.setUsuNombre(usuarioModel.getNombre());
        newUsuario.setUsuApellidoPaterno(usuarioModel.getApaterno());
        newUsuario.setUsuApellidoMaterno(usuarioModel.getAmaterno());
        newUsuario.setUsuCorreo(usuarioModel.getCorreo());
        newUsuario.setUsuClave(usuarioModel.getClave());
        newUsuario.setUsuEstado(usuarioModel.getEstado());
        newUsuario.setUsuLoginConexion(usuarioModel.getLoginConexion());
        newUsuario.setRolId(usuarioModel.getIdRol());
        newUsuario.setUsuCreador(usuarioModel.getUsuCreador());
        LogicaUsuario pruebaUsuario = new LogicaUsuario(newUsuario);
        boolean prueba = pruebaUsuario.validar_creacionusuario();
        if(prueba){

            usuarioModel.setMensaje(new MensajeDTO("success","Usuario "+ usuarioModel.getCorreo()+  " creado con exito" ));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            usuarioModel.setMensaje(new MensajeDTO("error","Usuario " + usuarioModel.getCorreo() + " existente en registros"));
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

}
