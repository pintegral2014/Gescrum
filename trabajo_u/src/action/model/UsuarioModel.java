package action.model;


import dto.RolDTO;
import dto.MensajeDTO;
import dto.UsuarioDTO;

import java.util.List;

/**
 * Created by jordan on 27-05-2014.
 */
public class UsuarioModel {
    private int usuId;
    private String usuNombre;
    private String usuLoginConexion;
    private RolDTO rol;
    private String usuApellidoPaterno;
    private String usuApellidoMaterno;
    private String usuCorreo;
    private int usuClave;
    private String usuEstado;
    private List<UsuarioDTO> listauser;
    private List<RolDTO> listarol;
    private MensajeDTO mensaje;
    private String usuCreador;
    private UsuarioDTO usuarioDTO;


    public UsuarioModel() {
    }

    public int getUsuId() {
        return usuId;
    }

    public void setUsuId(int usuId) {
        this.usuId = usuId;
    }

    public String getUsuNombre() {
        return usuNombre;
    }

    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }

    public String getUsuLoginConexion() {
        return usuLoginConexion;
    }

    public void setUsuLoginConexion(String usuLoginConexion) {
        this.usuLoginConexion = usuLoginConexion;
    }

    public RolDTO getRol() {
        return rol;
    }

    public void setRol(RolDTO rol) {
        this.rol = rol;
    }

    public String getUsuApellidoPaterno() {
        return usuApellidoPaterno;
    }

    public void setUsuApellidoPaterno(String usuApellidoPaterno) {
        this.usuApellidoPaterno = usuApellidoPaterno;
    }

    public String getUsuApellidoMaterno() {
        return usuApellidoMaterno;
    }

    public void setUsuApellidoMaterno(String usuApellidoMaterno) {
        this.usuApellidoMaterno = usuApellidoMaterno;
    }

    public String getUsuCorreo() {
        return usuCorreo;
    }

    public void setUsuCorreo(String usuCorreo) {
        this.usuCorreo = usuCorreo;
    }

    public int getUsuClave() {
        return usuClave;
    }

    public void setUsuClave(int usuClave) {
        this.usuClave = usuClave;
    }

    public String getUsuEstado() {
        return usuEstado;
    }

    public void setUsuEstado(String usuEstado) {
        this.usuEstado = usuEstado;
    }

    public List<UsuarioDTO> getListauser() {
        return listauser;
    }

    public void setListauser(List<UsuarioDTO> listauser) {
        this.listauser = listauser;
    }

    public List<RolDTO> getListarol() {
        return listarol;
    }

    public void setListarol(List<RolDTO> listarol) {
        this.listarol = listarol;
    }

    public MensajeDTO getMensaje() {
        return mensaje;
    }

    public void setMensaje(MensajeDTO mensaje) {
        this.mensaje = mensaje;
    }

    public String getUsuCreador() {
        return usuCreador;
    }

    public void setUsuCreador(String usuCreador) {
        this.usuCreador = usuCreador;
    }

    public UsuarioDTO getUsuarioDTO() {
        return usuarioDTO;
    }

    public void setUsuarioDTO(UsuarioDTO usuarioDTO) {
        this.usuarioDTO = usuarioDTO;
    }
}