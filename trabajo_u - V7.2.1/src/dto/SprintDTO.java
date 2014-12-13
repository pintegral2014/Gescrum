package dto;

import java.util.Date;
import java.util.List;

/**
 * Created by EmilioCesar on 30-11-2014.
 */
public class SprintDTO {
    private int sprintId;
    private String nombreSprint;
    private String descripcionSprint;
    private String estadoSprint;
    private Date fechaCreacion;
    private String usuCreadorSprint;
    private int gruSprintId;
    private String nombreGrupo;
    private GrupoDTO grupoSprint;


    public SprintDTO() {
    }

    public SprintDTO(int sprintId, String nombreSprint, String descripcionSprint, String estadoSprint, Date fechaCreacion, String usuCreadorSprint, int gruSprintId, GrupoDTO grupoSprint,String nombreGrupo) {
        this.sprintId = sprintId;
        this.nombreSprint = nombreSprint;
        this.descripcionSprint = descripcionSprint;
        this.estadoSprint = estadoSprint;
        this.fechaCreacion = fechaCreacion;
        this.usuCreadorSprint = usuCreadorSprint;
        this.gruSprintId = gruSprintId;
        this.grupoSprint = grupoSprint;
        this.nombreGrupo = nombreGrupo;
    }

    public int getSprintId() {
        return sprintId;
    }

    public String getNombreGrupo() {
        return nombreGrupo;
    }

    public void setNombreGrupo(String nombreGrupo) {
        this.nombreGrupo = nombreGrupo;
    }

    public void setSprintId(int sprintId) {
        this.sprintId = sprintId;
    }

    public String getNombreSprint() {
        return nombreSprint;
    }

    public void setNombreSprint(String nombreSprint) {
        this.nombreSprint = nombreSprint;
    }

    public String getDescripcionSprint() {
        return descripcionSprint;
    }

    public void setDescripcionSprint(String descripcionSprint) {
        this.descripcionSprint = descripcionSprint;
    }

    public String getEstadoSprint() {
        return estadoSprint;
    }

    public void setEstadoSprint(String estadoSprint) {
        this.estadoSprint = estadoSprint;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getUsuCreadorSprint() {
        return usuCreadorSprint;
    }

    public void setUsuCreadorSprint(String usuCreadorSprint) {
        this.usuCreadorSprint = usuCreadorSprint;
    }

    public int getGruSprintId() {
        return gruSprintId;
    }

    public void setGruSprintId(int gruSprintId) {
        this.gruSprintId = gruSprintId;
    }

    public GrupoDTO getGrupoSprint() {
        return grupoSprint;
    }

    public void setGrupoSprint(GrupoDTO grupoSprint) {
        this.grupoSprint = grupoSprint;
    }
}
