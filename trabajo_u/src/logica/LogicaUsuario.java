package logica;

import dao.UsuarioDAO;
import dto.UsuarioDTO;
import dao.RolDAO;

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

    public static UsuarioDTO validar_usuario(String login, int clave) throws Exception {
        //UsuarioDTO usuarioLogin = null;
        UsuarioDTO usuarioLogin = UsuarioDAO.loginusuario(login, clave);
        // retorna true si el usuario es valido con la base de datos, de lo contrario retorna false
        if (usuarioLogin != null && usuarioLogin.getUsuLoginConexion() != null && usuarioLogin.getUsuClave() != 0 && !usuarioLogin.getUsuLoginConexion().equals("")
                && usuarioLogin.getUsuEstado().equals("vigente"))
            return usuarioLogin;

        else {
            return usuarioLogin;
        }

    }

    public boolean validar_creacionusuario() throws Exception {
        boolean exito = false;
        boolean usuInsert = false;
        UsuarioDTO usuario2 = UsuarioDAO.buscarUsuario(usuario.getUsuLoginConexion());
        if (usuario2 == null) {
            usuInsert = UsuarioDAO.crearUsuario2(usuario);
            if (usuInsert == true) {
                RolDAO.insertRolxUsuario(usuario.getRol().getRolId(), usuario.getUsuLoginConexion(), usuario.getUsuCreador());
            }else{
                exito = false;
            }
            exito = true;
        }
        else {
            exito = false;
        }
        return exito;
    }




    /*public boolean validar_modificacionusuario() throws Exception{
        boolean exito = false;
        UsuarioDAO.modificarUsuario(usuario);
        exito = true;
        return exito;
    }*/

    public List<UsuarioDTO> listUser() throws Exception {
        List<UsuarioDTO> listaUsuarios = UsuarioDAO.listaUsuarios();
        if (listaUsuarios != null) {
            //retorna la lista de usuario
            return listaUsuarios;
        } else {
            return null;
        }
    }

    public boolean modDataUsuario(UsuarioDTO usuarioDTO) throws Exception {
        boolean exito = false;
        boolean updateUsuario = false;
        int rolUsuario;
        //UsuarioDTO usuarioDTO1 = UsuarioDAO.buscarUsuario(usuarioDTO.getUsuLoginConexion());
        // realiza el update de todos los datos del usuario excepto rol  y login conexion
        updateUsuario = UsuarioDAO.updateDataUsuario(usuarioDTO);
        if (updateUsuario == true) {
            // obtengo el rol del usuario
            rolUsuario = RolDAO.selectRolUsuario(usuarioDTO.getUsuId());
            if (rolUsuario != usuarioDTO.getRol().getRolId()) {
                // si el rol del usuario es distinto al de la bd realiza el update de rol
                RolDAO.updateRolXUsuario(usuarioDTO.getRol().getRolId(), usuarioDTO.getUsuId());
            }
            exito = true;
        }

        return exito;
    }

    public static UsuarioDTO traerDataUsuario(int idUsuario) throws Exception {
        UsuarioDTO usuarioDTO = UsuarioDAO.obtenerDataUsuario(idUsuario);
        if (usuarioDTO != null) {
            return usuarioDTO;
        }
        return null;
    }

    public boolean bloquearUsuario(int idUsu, String estado)throws Exception{
        return true;
    }
}


