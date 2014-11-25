package dto;

import java.util.Date;

/**
 * Created by jecarrasco on 20-05-2014.
 */
public class UsuarioDTO {
    private int usuId;
    private RolDTO rol;
    private String usuNombre;
    private String usuApellidoPaterno;
    private String usuApellidoMaterno;
    private String usuCorreo;
    private int usuClave;
    private String usuEstado;
    private String usuLoginConexion;
    private Date usuFechaInicio;
    private Date usuFechaModificacion;
    private int rolId;
    private String usuCreador;



    public UsuarioDTO() {

    }

    public UsuarioDTO(int usuId, RolDTO rol, String usuNombre, String usuApellidoPaterno,
                      String usuApellidoMaterno, String usuCorreo, int usuClave, String usuEstado,
                      String usuLoginConexion, Date usuFechaInicio, Date usuFechaModificacion, int rolId,String usuCreador) {
        this.usuId = usuId;
        this.rol = rol;
        this.usuNombre = usuNombre;
        this.usuApellidoPaterno = usuApellidoPaterno;
        this.usuApellidoMaterno = usuApellidoMaterno;
        this.usuCorreo = usuCorreo;
        this.usuClave = usuClave;
        this.usuEstado = usuEstado;
        this.usuLoginConexion = usuLoginConexion;
        this.usuFechaInicio = usuFechaInicio;
        this.usuFechaModificacion = usuFechaModificacion;
        this.rolId = rolId;
        this.usuCreador = usuCreador;

    }

    public String getUsuCreador() {
        return usuCreador;
    }

    public void setUsuCreador(String usuCreador) {
        this.usuCreador = usuCreador;
    }

    public int getUsuId() {
        return usuId;
    }

    public void setUsuId(int usuId) {
        this.usuId = usuId;
    }

    public RolDTO getRol() {
        return rol;
    }

    public void setRol(RolDTO rol) {
        this.rol = rol;
    }

    public String getUsuNombre() {
        return usuNombre;
    }

    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
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

    public String getUsuLoginConexion() {
        return usuLoginConexion;
    }

    public void setUsuLoginConexion(String usuLoginConexion) {
        this.usuLoginConexion = usuLoginConexion;
    }

    public Date getUsuFechaInicio() {
        return usuFechaInicio;
    }

    public void setUsuFechaInicio(Date usuFechaInicio) {
        this.usuFechaInicio = usuFechaInicio;
    }

    public Date getUsuFechaModificacion() {
        return usuFechaModificacion;
    }

    public void setUsuFechaModificacion(Date usuFechaModificacion) {
        this.usuFechaModificacion = usuFechaModificacion;
    }

    public int getRolId() {
        return rolId;
    }

    public void setRolId(int rolId) {
        this.rolId = rolId;
    }
}
