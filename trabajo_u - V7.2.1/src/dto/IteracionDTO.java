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
    private String iteracionNombreSprint;
    private String iteracionNombreHistoria;
    private String iteracionEstado;
    private String mensajeAux;
    private Date iteracionFechaMod;
    private int idHistoria;
    private List<String> listaEsfuerzo;
    private List<String> listaIdTar;

    public IteracionDTO() {
    }

    public IteracionDTO(int iteracionIdSprint, int iteracionIdTarea, int iteracionEsfuerzo, String iteracionUsuarioAsignado, int iteracionCantidad, String iteracionNombreSprint, String iteracionNombreHistoria, String iteracionEstado, String mensajeAux, Date iteracionFechaMod, int idHistoria, List<String> listaEsfuerzo, List<String> listaIdTar) {
        this.iteracionIdSprint = iteracionIdSprint;
        this.iteracionIdTarea = iteracionIdTarea;
        this.iteracionEsfuerzo = iteracionEsfuerzo;
        this.iteracionUsuarioAsignado = iteracionUsuarioAsignado;
        this.iteracionCantidad = iteracionCantidad;
        this.iteracionNombreSprint = iteracionNombreSprint;
        this.iteracionNombreHistoria = iteracionNombreHistoria;
        this.iteracionEstado = iteracionEstado;
        this.mensajeAux = mensajeAux;
        this.iteracionFechaMod = iteracionFechaMod;
        this.idHistoria = idHistoria;
        this.listaEsfuerzo = listaEsfuerzo;
        this.listaIdTar = listaIdTar;
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

    public String getIteracionNombreSprint() {
        return iteracionNombreSprint;
    }

    public void setIteracionNombreSprint(String iteracionNombreSprint) {
        this.iteracionNombreSprint = iteracionNombreSprint;
    }

    public String getIteracionNombreHistoria() {
        return iteracionNombreHistoria;
    }

    public void setIteracionNombreHistoria(String iteracionNombreHistoria) {
        this.iteracionNombreHistoria = iteracionNombreHistoria;
    }

    public String getIteracionEstado() {
        return iteracionEstado;
    }

    public void setIteracionEstado(String iteracionEstado) {
        this.iteracionEstado = iteracionEstado;
    }

    public String getMensajeAux() {
        return mensajeAux;
    }

    public void setMensajeAux(String mensajeAux) {
        this.mensajeAux = mensajeAux;
    }

    public Date getIteracionFechaMod() {
        return iteracionFechaMod;
    }

    public void setIteracionFechaMod(Date iteracionFechaMod) {
        this.iteracionFechaMod = iteracionFechaMod;
    }

    public int getIdHistoria() {
        return idHistoria;
    }

    public void setIdHistoria(int idHistoria) {
        this.idHistoria = idHistoria;
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
}
