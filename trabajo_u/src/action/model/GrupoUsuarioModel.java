package action.model;

import dto.GrupoUsuarioDTO;

import java.util.List;

/**
 * Created by Ripcrow on 27-11-2014.
 */
public class GrupoUsuarioModel {
    private String usuCreador;
    private String usuMod;
    private String nombreUsu;
    private String nombreGru;
    private String apellido;
    private String loginConexion;
    private String rol;
    private int gruId;
    private List<GrupoUsuarioDTO>listagruxusu;
    private List<GrupoUsuarioDTO>listaususingru;


    public GrupoUsuarioModel() {
    }

    public GrupoUsuarioModel(String usuCreador, String usuMod, String estado, String nombreUsu, String nombreGru, String apellido, String loginConexion, String rol, int gruId, int usuId, List<GrupoUsuarioDTO> listagruxusu, List<GrupoUsuarioDTO> listaususingru) {
        this.usuCreador = usuCreador;
        this.usuMod = usuMod;
        this.nombreUsu = nombreUsu;
        this.nombreGru = nombreGru;
        this.apellido = apellido;
        this.loginConexion = loginConexion;
        this.rol = rol;
        this.gruId = gruId;
        this.listagruxusu = listagruxusu;
        this.listaususingru = listaususingru;
    }

    public String getUsuCreador() {
        return usuCreador;
    }

    public void setUsuCreador(String usuCreador) {
        this.usuCreador = usuCreador;
    }

    public String getUsuMod() {
        return usuMod;
    }

    public void setUsuMod(String usuMod) {
        this.usuMod = usuMod;
    }

    public String getNombreUsu() {
        return nombreUsu;
    }

    public void setNombreUsu(String nombreUsu) {
        this.nombreUsu = nombreUsu;
    }

    public String getNombreGru() {
        return nombreGru;
    }

    public void setNombreGru(String nombreGru) {
        this.nombreGru = nombreGru;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getLoginConexion() {
        return loginConexion;
    }

    public void setLoginConexion(String loginConexion) {
        this.loginConexion = loginConexion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public int getGruId() {
        return gruId;
    }

    public void setGruId(int gruId) {
        this.gruId = gruId;
    }

    public List<GrupoUsuarioDTO> getListagruxusu() {
        return listagruxusu;
    }

    public void setListagruxusu(List<GrupoUsuarioDTO> listagruxusu) {
        this.listagruxusu = listagruxusu;
    }

    public List<GrupoUsuarioDTO> getListaususingru() {
        return listaususingru;
    }

    public void setListaususingru(List<GrupoUsuarioDTO> listaususingru) {
        this.listaususingru = listaususingru;
    }
}
