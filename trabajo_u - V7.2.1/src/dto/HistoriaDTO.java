package dto;

import java.util.Date;

/**
 * Created by jordan on 06-07-2014.
 */
public class HistoriaDTO {
    private int  hisId;
    private int prioridad;
    private String usuariocrea;
    private String estado;
    private String descripcion;
    private String nombrehistoria;
    private String dependencia;
    private String criAceptacion;
    private int eventum;
    private int sprint;
    private Date fechaCrea;
    private int idPro;
    private String nombreProyecto;
    private ProyectoDTO proyectoDTO;
    private String solicitadoPor;

    public HistoriaDTO() {
    }

    public HistoriaDTO(int hisId, int prioridad, String usuariocrea, String estado,
                       String descripcion, String nombrehistoria, String dependencia,
                       String criAceptacion, int eventum, int sprint, Date fechaCrea, int idPro, String nombreProyecto, ProyectoDTO proyectoDTO, String solicitadoPor) {
        this.hisId = hisId;
        this.prioridad = prioridad;
        this.usuariocrea = usuariocrea;
        this.estado = estado;
        this.descripcion = descripcion;
        this.nombrehistoria = nombrehistoria;
        this.dependencia = dependencia;
        this.criAceptacion = criAceptacion;
        this.eventum = eventum;
        this.sprint = sprint;
        this.fechaCrea = fechaCrea;
        this.idPro = idPro;
        this.nombreProyecto = nombreProyecto;
        this.proyectoDTO = proyectoDTO;
        this.solicitadoPor = solicitadoPor;
    }

    public int getHisId() {
        return hisId;
    }

    public void setHisId(int hisId) {
        this.hisId = hisId;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public String getUsuariocrea() {
        return usuariocrea;
    }

    public void setUsuariocrea(String usuariocrea) {
        this.usuariocrea = usuariocrea;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombrehistoria() {
        return nombrehistoria;
    }

    public void setNombrehistoria(String nombrehistoria) {
        this.nombrehistoria = nombrehistoria;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public String getCriAceptacion() {
        return criAceptacion;
    }

    public void setCriAceptacion(String criAceptacion) {
        this.criAceptacion = criAceptacion;
    }

    public int getEventum() {
        return eventum;
    }

    public void setEventum(int eventum) {
        this.eventum = eventum;
    }

    public int getSprint() {
        return sprint;
    }

    public void setSprint(int sprint) {
        this.sprint = sprint;
    }

    public Date getFechaCrea() {
        return fechaCrea;
    }

    public void setFechaCrea(Date fechaCrea) {
        this.fechaCrea = fechaCrea;
    }

    public int getIdPro() {
        return idPro;
    }

    public void setIdPro(int idPro) {
        this.idPro = idPro;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public ProyectoDTO getProyectoDTO() {
        return proyectoDTO;
    }

    public void setProyectoDTO(ProyectoDTO proyectoDTO) {
        this.proyectoDTO = proyectoDTO;
    }

    public String getSolicitadoPor() {
        return solicitadoPor;
    }

    public void setSolicitadoPor(String solicitadoPor) {
        this.solicitadoPor = solicitadoPor;
    }
}
