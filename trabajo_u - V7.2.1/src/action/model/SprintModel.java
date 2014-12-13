package action.model;

import dto.GrupoDTO;
import dto.MensajeDTO;
import dto.SprintDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by EmilioCesar on 30-11-2014.
 */
public class SprintModel {
    private int sprintId;
    private String nombreSprint;
    private String descripcionSprint;
    private String estadoSprint;
    private Date fechaCreacion;
    private String usuCreadorSprint;
    private int gruSprintId;
    private String nombreGrupo;
    private List<SprintDTO> listaSprint;
    private MensajeDTO mensaje;



    public SprintModel() {
    }


    public String getNombreGrupo() {
        return nombreGrupo;
    }

    public void setNombreGrupo(String nombreGrupo) {
        this.nombreGrupo = nombreGrupo;
    }
    public MensajeDTO getMensaje() {
        return mensaje;
    }

    public void setMensaje(MensajeDTO mensaje) {
        this.mensaje = mensaje;
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

    public List<SprintDTO> getListaSprint() {
        return listaSprint;
    }

    public void setListaSprint(List<SprintDTO> listaSprint) {
        this.listaSprint = listaSprint;
    }
}
