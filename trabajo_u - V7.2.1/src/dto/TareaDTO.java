package dto;

import java.util.Date;

/**
 * Created by EmilioCesar on 28-11-2014.
 */
public class TareaDTO {
    private int idTarea;
    private String descripcionTarea;
    private Date fechaCreacion;
    private String usuCreador;
    private int esfuerzo;
    private Date ultimaFechaMod;
    private String nombreHistoria;
    private int hduTarID;

    public TareaDTO() {
    }

    public TareaDTO(int idTarea, String descripcionTarea, Date fechaCreacion, String usuCreador, int esfuerzo, Date ultimaFechaMod, String nombreHistoria, int hduTarID) {
        this.idTarea = idTarea;
        this.descripcionTarea = descripcionTarea;
        this.fechaCreacion = fechaCreacion;
        this.usuCreador = usuCreador;
        this.esfuerzo = esfuerzo;
        this.ultimaFechaMod = ultimaFechaMod;
        this.nombreHistoria = nombreHistoria;
        this.hduTarID = hduTarID;
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

    public int getEsfuerzo() {
        return esfuerzo;
    }

    public void setEsfuerzo(int esfuerzo) {
        this.esfuerzo = esfuerzo;
    }

    public Date getUltimaFechaMod() {
        return ultimaFechaMod;
    }

    public void setUltimaFechaMod(Date ultimaFechaMod) {
        this.ultimaFechaMod = ultimaFechaMod;
    }

    public String getNombreHistoria() {
        return nombreHistoria;
    }

    public void setNombreHistoria(String nombreHistoria) {
        this.nombreHistoria = nombreHistoria;
    }

    public int getHduTarID() {
        return hduTarID;
    }

    public void setHduTarID(int hduTarID) {
        this.hduTarID = hduTarID;
    }
}
