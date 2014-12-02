package action.model;

import dto.MensajeDTO;
import dto.TareaDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by EmilioCesar on 28-11-2014.
 */
public class TareaModel {

    private int idTarea;
    private String descripcionTarea;
    private Date fechaCreacion;
    private String usuCreador;
    private int hduTarID;
    private List<TareaDTO> listaTarea;
    private MensajeDTO mensaje;

    public TareaModel() {
    }

    public MensajeDTO getMensaje() {
        return mensaje;
    }

    public void setMensaje(MensajeDTO mensaje) {
        this.mensaje = mensaje;
    }

    public int getIdTarea() {
        return idTarea;
    }

    public void setIdTarea(int idTarea) {
        this.idTarea = idTarea;
    }

    public String getDescripcionTarea() {
        return descripcionTarea;
    }

    public void setDescripcionTarea(String descripcionTarea) {
        this.descripcionTarea = descripcionTarea;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getUsuCreador() {
        return usuCreador;
    }

    public void setUsuCreador(String usuCreador) {
        this.usuCreador = usuCreador;
    }

    public int getHduTarID() {
        return hduTarID;
    }

    public void setHduTarID(int hduTarID) {
        this.hduTarID = hduTarID;
    }

    public List<TareaDTO> getListaTarea() {
        return listaTarea;
    }

    public void setListaTarea(List<TareaDTO> listaTarea) {
        this.listaTarea = listaTarea;
    }
}
