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

import java.util.List;
import java.util.Map;


/**
 * Created by EmilioCesar on 19-11-2014.
 */
public class Usuario extends ActionSupport implements ModelDriven {

    UsuarioModel usuarioModel= new UsuarioModel();



    @Override
    public Object getModel() {
        return usuarioModel;
    }

    public String crearUsuario()throws Exception{
        Map session = ActionContext.getContext().getSession();
        String usuarioSession = (String) session.get("loginConexion");
        UsuarioDTO newUsuario= new UsuarioDTO();
        newUsuario.setUsuNombre(usuarioModel.getUsuNombre());
        newUsuario.setUsuApellidoPaterno(usuarioModel.getUsuApellidoPaterno());
        newUsuario.setUsuApellidoMaterno(usuarioModel.getUsuApellidoMaterno());
        newUsuario.setUsuCorreo(usuarioModel.getUsuCorreo());
        newUsuario.setUsuClave(usuarioModel.getUsuClave());
        newUsuario.setUsuEstado(usuarioModel.getUsuEstado());
        newUsuario.setUsuLoginConexion(usuarioModel.getUsuLoginConexion());
        //newUsuario.setRolId(usuarioModel.getIdRol());
        newUsuario.setUsuCreador(usuarioSession);
        newUsuario.setUsuModificadoPor(usuarioSession);
        RolDTO rolDTO = new RolDTO();
        rolDTO.setRolId(usuarioModel.getRol().getRolId());
        newUsuario.setRol(rolDTO);

        LogicaUsuario pruebaUsuario = new LogicaUsuario(newUsuario);
        boolean prueba = pruebaUsuario.validar_creacionusuario();
        if(prueba){

            usuarioModel.setMensaje(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: " +
                    "18px; text-align: center;'> Usuario "+ usuarioModel.getUsuLoginConexion()+  " creado con exito</span>" ));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            usuarioModel.setMensaje(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' style='color:red; " +
                    "text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Usuario " + usuarioModel.getUsuLoginConexion() + " existente en registros</span>"));
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


    public String buscarDataUsuario()throws Exception{
        this.usuarioModel.setListarol( new LogicaRol().listRol());
        UsuarioDTO usuarioDTO = LogicaUsuario.traerDataUsuario(this.usuarioModel.getUsuId());

        if(usuarioDTO != null){
            usuarioModel.setUsuarioDTO(usuarioDTO);
            return "usuarioDataJSON";
        }
        else{
            return ERROR;
        }
    }

    public String modifDataUsuario() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String usuarioSession = (String) session.get("loginConexion");

        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setUsuId(usuarioModel.getUsuId());
        usuarioDTO.setUsuNombre(usuarioModel.getUsuNombre());
        usuarioDTO.setUsuApellidoPaterno(usuarioModel.getUsuApellidoPaterno());
        usuarioDTO.setUsuApellidoMaterno(usuarioModel.getUsuApellidoMaterno());
        usuarioDTO.setUsuClave(usuarioModel.getUsuClave());
        usuarioDTO.setUsuCorreo(usuarioModel.getUsuCorreo());
        usuarioDTO.setUsuLoginConexion(usuarioModel.getUsuLoginConexion());
        usuarioDTO.setUsuModificadoPor(usuarioSession);
        RolDTO rolDTO = new RolDTO();
        rolDTO.setRolId(usuarioModel.getRol().getRolId());
        usuarioDTO.setRol(rolDTO);

        LogicaUsuario logicaUsuario = new LogicaUsuario();
        boolean update = logicaUsuario.modDataUsuario(usuarioDTO);
        if (update) {
            usuarioModel.setMensaje(new MensajeDTO("success", "<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Historia " + usuarioModel.getUsuLoginConexion() + " creado con exito</span>"));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {

            usuarioModel.setMensaje(new MensajeDTO("error", "<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Historia " + usuarioModel.getUsuLoginConexion() + " existente en registros</span>"));
            return ERROR;
        }
    }
    public String bloqUsuario()throws Exception{
        Map session = ActionContext.getContext().getSession();
        String usuarioSession = (String) session.get("loginConexion");

        LogicaUsuario logicaUsuario = new LogicaUsuario();
        boolean update = logicaUsuario.bloquearUsuario(usuarioModel.getUsuId(), usuarioModel.getUsuEstado());

        return null;
    }
}
