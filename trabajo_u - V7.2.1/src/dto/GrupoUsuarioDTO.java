package dto;

import java.sql.Date;

/**
 * Created by Ripcrow on 27-11-2014.
 */
public class GrupoUsuarioDTO {
    private int gruUsuId;
    private int gruGruId;
    private String gruNombre;
    private String usuCreador;
    private String estado;
    private Date fechaCre;
    private Date fechaMod;
    private String usuMod;
    private String usuNombre;
    private String usuApellido;
    private String usuLoginConexion;
    private String rolDescripcion;

    public GrupoUsuarioDTO() {
    }

    public GrupoUsuarioDTO(int gruUsuId, int gruGruId, String gruNombre, String usuCreador, String estado, Date fechaCre, Date fechaMod, String usuMod, String usuNombre, String usuApellido, String usuLoginConexion, String rolDescripcion) {
        this.gruUsuId = gruUsuId;
        this.gruGruId = gruGruId;
        this.gruNombre = gruNombre;
        this.usuCreador = usuCreador;
        this.estado = estado;
        this.fechaCre = fechaCre;
        this.fechaMod = fechaMod;
        this.usuMod = usuMod;
        this.usuNombre = usuNombre;
        this.usuApellido = usuApellido;
        this.usuLoginConexion = usuLoginConexion;
        this.rolDescripcion = rolDescripcion;
    }

    public int getGruUsuId() {
        return gruUsuId;
    }

    public void setGruUsuId(int gruUsuId) {
        this.gruUsuId = gruUsuId;
    }

    public int getGruGruId() {
        return gruGruId;
    }

    public void setGruGruId(int gruGruId) {
        this.gruGruId = gruGruId;
    }

    public String getGruNombre() {
        return gruNombre;
    }

    public void setGruNombre(String gruNombre) {
        this.gruNombre = gruNombre;
    }

    public String getUsuCreador() {
        return usuCreador;
    }

    public void setUsuCreador(String usuCreador) {
        this.usuCreador = usuCreador;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaCre() {
        return fechaCre;
    }

    public void setFechaCre(Date fechaCre) {
        this.fechaCre = fechaCre;
    }

    public Date getFechaMod() {
        return fechaMod;
    }

    public void setFechaMod(Date fechaMod) {
        this.fechaMod = fechaMod;
    }

    public String getUsuMod() {
        return usuMod;
    }

    public void setUsuMod(String usuMod) {
        this.usuMod = usuMod;
    }

    public String getUsuNombre() {
        return usuNombre;
    }

    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }

    public String getUsuApellido() {
        return usuApellido;
    }

    public void setUsuApellido(String usuApellido) {
        this.usuApellido = usuApellido;
    }

    public String getUsuLoginConexion() {
        return usuLoginConexion;
    }

    public void setUsuLoginConexion(String usuLoginConexion) {
        this.usuLoginConexion = usuLoginConexion;
    }

    public String getRolDescripcion() {
        return rolDescripcion;
    }

    public void setRolDescripcion(String rolDescripcion) {
        this.rolDescripcion = rolDescripcion;
    }
}
