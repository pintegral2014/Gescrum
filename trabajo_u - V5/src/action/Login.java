package action;

import action.model.RolModel;
import action.model.UsuarioModel;
import com.opensymphony.xwork2.ModelDriven;
import dto.RolDTO;
import dto.MensajeDTO;
import dto.UsuarioDTO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import logica.LogicaRol;
import logica.LogicaUsuario;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import javax.swing.*;
import java.util.List;

/**
 * Created by jecarrasco on 20-05-2014.
 */
public class Login extends ActionSupport implements ModelDriven{
    UsuarioModel usuarioModel= new UsuarioModel();
    Integer idUsuario= null;
    private Map<String, Object> session;

    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public Object getModel() {
        return usuarioModel;
    }

    @Override
        public String execute() throws Exception {

        UsuarioDTO usuarioLogin = LogicaUsuario.validar_usuario(usuarioModel.getLoginConexion(),usuarioModel.getClave());
        if(usuarioLogin != null){
            ActionContext.getContext().getSession().put("loginConexion", usuarioModel.getLoginConexion());
            // seteo el mensaje success al json para redireccionar al home
            usuarioModel.setMensaje(new MensajeDTO("success"));
            return SUCCESS;
        } else {
            // seteo el mensaje error al json para que muestre mensaje de error
            usuarioModel.setMensaje(new MensajeDTO("error","Usuario "+ usuarioModel.getLoginConexion()+  " sin acceso al sistema, comuniquese con el administrador" ));
            return ERROR;
        }
        }
}
