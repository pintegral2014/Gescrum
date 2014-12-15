package dto;

import java.util.Date;
import java.util.List;

/**
 * Created by EmilioCesar on 08-12-2014.
 */
public class IteracionDTO {

    private int iteracionIdSprint;
    private int iteracionIdTarea;
    private int iteracionEsfuerzo;
    private String iteracionUsuarioAsignado;
    private int iteracionCantidad;
    private String iteracionEstado;
    private Date iteracionFechaMod;
    private List<String> listaEsfuerzo;
    private List<String> listaIdTar;
    private String mensajeAux;

    public IteracionDTO() {
    }

    public IteracionDTO(int iteracionIdSprint, int iteracionIdTarea, int iteracionEsfuerzo, String iteracionUsuarioAsignado, int iteracionCantidad, String iteracionEstado, Date iteracionFechaMod, List<String> listaEsfuerzo, List<String> listaIdTar, String mensajeAux) {
        this.iteracionIdSprint = iteracionIdSprint;
        this.iteracionIdTarea = iteracionIdTarea;
        this.iteracionEsfuerzo = iteracionEsfuerzo;
        this.iteracionUsuarioAsignado = iteracionUsuarioAsignado;
        this.iteracionCantidad = iteracionCantidad;
        this.iteracionEstado = iteracionEstado;
        this.iteracionFechaMod = iteracionFechaMod;
        this.listaEsfuerzo = listaEsfuerzo;
        this.listaIdTar = listaIdTar;
        this.mensajeAux = mensajeAux;
    }

    public int getIteracionIdSprint() {
        return iteracionIdSprint;
    }

    public void setIteracionIdSprint(int iteracionIdSprint) {
        this.iteracionIdSprint = iteracionIdSprint;
    }

    public int getIteracionIdTarea() {
        return iteracionIdTarea;
    }

    public void setIteracionIdTarea(int iteracionIdTarea) {
        this.iteracionIdTarea = iteracionIdTarea;
    }

    public int getIteracionEsfuerzo() {
        return iteracionEsfuerzo;
    }

    public void setIteracionEsfuerzo(int iteracionEsfuerzo) {
        this.iteracionEsfuerzo = iteracionEsfuerzo;
    }

    public String getIteracionUsuarioAsignado() {
        return iteracionUsuarioAsignado;
    }

    public void setIteracionUsuarioAsignado(String iteracionUsuarioAsignado) {
        this.iteracionUsuarioAsignado = iteracionUsuarioAsignado;
    }

    public int getIteracionCantidad() {
        return iteracionCantidad;
    }

    public void setIteracionCantidad(int iteracionCantidad) {
        this.iteracionCantidad = iteracionCantidad;
    }

    public String getIteracionEstado() {
        return iteracionEstado;
    }

    public void setIteracionEstado(String iteracionEstado) {
        this.iteracionEstado = iteracionEstado;
    }

    public Date getIteracionFechaMod() {
        return iteracionFechaMod;
    }

    public void setIteracionFechaMod(Date iteracionFechaMod) {
        this.iteracionFechaMod = iteracionFechaMod;
    }

    public List<String> getListaEsfuerzo() {
        return listaEsfuerzo;
    }

    public void setListaEsfuerzo(List<String> listaEsfuerzo) {
        this.listaEsfuerzo = listaEsfuerzo;
    }

    public List<String> getListaIdTar() {
        return listaIdTar;
    }

    public void setListaIdTar(List<String> listaIdTar) {
        this.listaIdTar = listaIdTar;
    }

    public String getMensajeAux() {
        return mensajeAux;
    }

    public void setMensajeAux(String mensajeAux) {
        this.mensajeAux = mensajeAux;
    }
}
