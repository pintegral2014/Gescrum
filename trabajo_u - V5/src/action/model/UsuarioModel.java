package action.model;

import dao.UsuarioDAO;
import dto.RolDTO;
import dto.MensajeDTO;
import dto.UsuarioDTO;

import java.util.List;

/**
 * Created by jordan on 27-05-2014.
 */
public class UsuarioModel {
    private String nombre;
    private String loginConexion;
    private RolDTO rol;
    private String apaterno;
    private String amaterno;
    private String correo;
    private int clave;
    private String estado;
    private List<UsuarioDTO> listauser;
    private List<RolDTO> listarol;
    private MensajeDTO mensaje;
    private UsuarioDAO usuarioDAO;
    private int idRol;
    private String usuCreador;


    public UsuarioModel() {
    }

    public List<RolDTO> getListarol() {
        return listarol;
    }

    public void setListarol(List<RolDTO> listarol) {
        this.listarol = listarol;
    }

    public String getUsuCreador() {
        return usuCreador;
    }

    public void setUsuCreador(String usuCreador) {
        this.usuCreador = usuCreador;
    }

    public String getNombre() {
        return nombre;
    }

    public String getLoginConexion() {
        return loginConexion;
    }

    public RolDTO getRol() {
        return rol;
    }

    public String getApaterno() {
        return apaterno;
    }

    public String getAmaterno() {
        return amaterno;
    }

    public String getCorreo() {
        return correo;
    }

    public int getClave() {
        return clave;
    }

    public String getEstado() {
        return estado;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setLoginConexion(String loginConexion) {
        this.loginConexion = loginConexion;
    }

    public void setRol(RolDTO rol) {
        this.rol = rol;
    }

    public void setApaterno(String apaterno) {
        this.apaterno = apaterno;
    }

    public void setAmaterno(String amaterno) {
        this.amaterno = amaterno;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<UsuarioDTO> getListauser() {
        return listauser;
    }

    public void setListauser(List<UsuarioDTO> listauser) {
        this.listauser = listauser;
    }

    public MensajeDTO getMensaje() {
        return mensaje;
    }

    public void setMensaje(MensajeDTO mensaje) {
        this.mensaje = mensaje;
    }

    public UsuarioDAO getUsuarioDAO() {
        return usuarioDAO;
    }

    public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }
}