package logica;

import com.opensymphony.xwork2.ActionContext;
import com.sun.net.httpserver.Authenticator;
import dao.UsuarioDAO;
import dto.UsuarioDTO;
import dto.RolDTO;
import dao.RolDAO;
import javax.swing.*;
import java.util.List;

/**
 * Created by jecarrasco on 20-05-2014.
 */
public class LogicaUsuario {
    UsuarioDTO usuario = new UsuarioDTO();


    public LogicaUsuario(UsuarioDTO usuario) {
        this.usuario = usuario;
    }

    public LogicaUsuario() {
    }

    public static UsuarioDTO validar_usuario (String login, int clave) throws Exception {
        //UsuarioDTO usuarioLogin = null;
        UsuarioDTO usuarioLogin = UsuarioDAO.loginusuario(login,clave);
        // retorna true si el usuario es valido con la base de datos, de lo contrario retorna false
        if(usuarioLogin != null && usuarioLogin.getUsuLoginConexion() != null && usuarioLogin.getUsuClave() != 0 && !usuarioLogin.getUsuLoginConexion().equals("")
                && usuarioLogin.getUsuEstado().equals("vigente"))
            return usuarioLogin;

        else {
            return usuarioLogin;
        }

    }
    public boolean validar_creacionusuario() throws Exception{
        boolean exito = false;
        boolean usuInsert = false;
        UsuarioDTO usuario2 = UsuarioDAO.buscarUsuario(usuario.getUsuLoginConexion());
        if(usuario2 == null){
            usuInsert = UsuarioDAO.crearUsuario2(usuario);
            if(usuInsert == true){
                RolDAO.insertRolxUsuario(usuario.getRolId(),usuario.getUsuLoginConexion(),usuario.getUsuCreador());
                            }
            exito = true;
        }
        return exito;
    }




    public boolean validar_modificacionusuario() throws Exception{
        boolean exito = false;
        UsuarioDAO.modificarUsuario(usuario);
        exito = true;
        return exito;
    }

    public List<UsuarioDTO> listUser () throws Exception{
      List<UsuarioDTO> listaUsuarios = UsuarioDAO.listaUsuarios();
    if(listaUsuarios != null)
        {
             //retorna la lista de usuario
            return listaUsuarios;
        }else{
            return null;
        }


    }




}

