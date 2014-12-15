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
    private String fechaCreacion;
    private String fechaFin;
    private String usuCreadorSprint;
    private int gruSprintId;
    private String nombreGrupo;
    private GrupoDTO grupoSprint;
    private int numeroDias;


    public SprintDTO() {
    }

    public SprintDTO(int sprintId, String nombreSprint, String descripcionSprint, String estadoSprint, String fechaCreacion, String fechaFin, String usuCreadorSprint, int gruSprintId, String nombreGrupo, GrupoDTO grupoSprint, int numeroDias) {
        this.sprintId = sprintId;
        this.nombreSprint = nombreSprint;
        this.descripcionSprint = descripcionSprint;
        this.estadoSprint = estadoSprint;
        this.fechaCreacion = fechaCreacion;
        this.fechaFin = fechaFin;
        this.usuCreadorSprint = usuCreadorSprint;
        this.gruSprintId = gruSprintId;
        this.nombreGrupo = nombreGrupo;
        this.grupoSprint = grupoSprint;
        this.numeroDias = numeroDias;
    }

    public int getSprintId() {
        return sprintId;
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

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
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

    public String getNombreGrupo() {
        return nombreGrupo;
    }

    public void setNombreGrupo(String nombreGrupo) {
        this.nombreGrupo = nombreGrupo;
    }

    public GrupoDTO getGrupoSprint() {
        return grupoSprint;
    }

    public void setGrupoSprint(GrupoDTO grupoSprint) {
        this.grupoSprint = grupoSprint;
    }

    public int getNumeroDias() {
        return numeroDias;
    }

    public void setNumeroDias(int numeroDias) {
        this.numeroDias = numeroDias;
    }
}
