package dto;

import java.sql.Date;

/**
 * Created by Ripcrow on 26-11-2014.
 */
public class GrupoDTO {
    private int gruId;
    private String gruNombre;
    private String gruDescripcion;
    private String gruEstado;
    private String gruUsuCreador;
    private Date gruFechaCre;
    private Date gruFechaMod;

    public GrupoDTO() {
    }

    public GrupoDTO(int gruId, String gruNombre, String gruDescripcion, String gruEstado, String gruUsuCreador, Date gruFechaCre, Date gruFechaMod) {
        this.gruId = gruId;
        this.gruNombre = gruNombre;
        this.gruDescripcion = gruDescripcion;
        this.gruEstado = gruEstado;
        this.gruUsuCreador = gruUsuCreador;
        this.gruFechaCre = gruFechaCre;
        this.gruFechaMod = gruFechaMod;
    }

    public int getGruId() {
        return gruId;
    }

    public void setGruId(int gruId) {
        this.gruId = gruId;
    }

    public String getGruNombre() {
        return gruNombre;
    }

    public void setGruNombre(String gruNombre) {
        this.gruNombre = gruNombre;
    }

    public String getGruDescripcion() {
        return gruDescripcion;
    }

    public void setGruDescripcion(String gruDescripcion) {
        this.gruDescripcion = gruDescripcion;
    }

    public String getGruEstado() {
        return gruEstado;
    }

    public void setGruEstado(String gruEstado) {
        this.gruEstado = gruEstado;
    }

    public String getGruUsuCreador() {
        return gruUsuCreador;
    }

    public void setGruUsuCreador(String gruUsuCreador) {
        this.gruUsuCreador = gruUsuCreador;
    }

    public Date getGruFechaCre() {
        return gruFechaCre;
    }

    public void setGruFechaCre(Date gruFechaCre) {
        this.gruFechaCre = gruFechaCre;
    }

    public Date getGruFechaMod() {
        return gruFechaMod;
    }

    public void setGruFechaMod(Date gruFechaMod) {
        this.gruFechaMod = gruFechaMod;
    }
}
