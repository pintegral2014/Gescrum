package action.model;

import dto.HistoriaDTO;
import dto.MensajeDTO;
import dto.ProyectoDTO;

import java.util.List;

/**
 * Created by jordan on 06-07-2014.
 */
public class HistoriaModel {
    private int  hisId;
    private int prioridad;
    private String usuarioCrea;
    private String estado;
    private String descripcion;
    private String nombrehistoria;
    private int eventum;
    private String dependencia;
    private String criAceptacion;
    private MensajeDTO mensaje;
    private int idPro;
    private List<ProyectoDTO> listPro;
    private List<HistoriaDTO> listHistorias;
    private ProyectoDTO proyecto;
    private HistoriaDTO historiaDTO;

    public int getIdPro() {
        return idPro;
    }

    public void setIdPro(int idPro) {
        this.idPro = idPro;
    }

    public HistoriaDTO getHistoriaDTO() {
        return historiaDTO;
    }

    public void setHistoriaDTO(HistoriaDTO historiaDTO) {
        this.historiaDTO = historiaDTO;
    }

    public List<HistoriaDTO> getListHistorias() {
        return listHistorias;
    }

    public void setListHistorias(List<HistoriaDTO> listHistorias) {
        this.listHistorias = listHistorias;
    }

    public MensajeDTO getMensaje() {
        return mensaje;
    }

    public void setMensaje(MensajeDTO mensaje) {
        this.mensaje = mensaje;
    }

    public int getHisId() {
        return hisId;
    }

    public void setHisId(int hisId) {
        this.hisId = hisId;
    }

    public String getCriAceptacion() {
        return criAceptacion;
    }

    public void setCriAceptacion(String criAceptacion) {
        this.criAceptacion = criAceptacion;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public int getEventum() {
        return eventum;
    }

    public void setEventum(int eventum) {
        this.eventum = eventum;
    }

    public ProyectoDTO getProyecto() {
        return proyecto;
    }

    public void setProyecto(ProyectoDTO proyecto) {
        this.proyecto = proyecto;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public String getUsuarioCrea() {
        return usuarioCrea;
    }

    public void setUsuarioCrea(String usuarioCrea) {
        this.usuarioCrea = usuarioCrea;
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

    public List<ProyectoDTO> getListPro() {
        return listPro;
    }

    public void setListPro(List<ProyectoDTO> listPro) {
        this.listPro = listPro;
    }

}
