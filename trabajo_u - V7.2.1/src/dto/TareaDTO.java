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
    private String nombreHistoria;
    private int hduTarID;

    public TareaDTO() {
    }

    public TareaDTO(int idTarea, String descripcionTarea, Date fechaCreacion,String nombreHistoria, String usuCreador, int hduTarID) {
        this.idTarea = idTarea;
        this.descripcionTarea = descripcionTarea;
        this.fechaCreacion = fechaCreacion;
        this.usuCreador = usuCreador;
        this.hduTarID = hduTarID;
        this.nombreHistoria =nombreHistoria;
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
