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
public class Login extends ActionSupport implements ModelDriven, SessionAware{
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

        UsuarioDTO usuarioLogin = LogicaUsuario.validar_usuario(usuarioModel.getUsuLoginConexion(),usuarioModel.getUsuClave());
        if(usuarioLogin != null){

            session.put("loginConexion", usuarioLogin.getUsuLoginConexion());
            session.put("rol", usuarioLogin.getRol().getRol_descripcion());
            //ActionContext.getContext().getSession().put("loginConexion", usuarioModel.getUsuLoginConexion());

            // seteo el mensaje success al json para redireccionar al home
            usuarioModel.setMensaje(new MensajeDTO("success"));
            return SUCCESS;
        } else {
            // seteo el mensaje error al json para que muestre mensaje de error
            usuarioModel.setMensaje(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' style='color:red; text-align: " +
                    "left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> Usuario "+ usuarioModel.getUsuLoginConexion()+  " " +
                    "sin acceso al sistema, comuniquese con el administrador</span>" ));
            return ERROR;
        }
        }

        public String logout()
        {
            //ActionContext.getContext().getSession().clear();
            session.clear();
            return SUCCESS;
        }
}
