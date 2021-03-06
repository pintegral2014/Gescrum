package action.model;

import dto.IteracionDTO;
import dto.MensajeDTO;
import dto.UsuarioDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by EmilioCesar on 08-12-2014.
 */
public class IteracionModel {

    private int iteracionIdSprint;
    private int iteracionIdTarea;
    private int iteracionEsfuerzo;
    private UsuarioDTO iteracionUsuarioAsignado;
    private int iteracionCantidad;
    private int idHistoriaIteracion;
    private List<UsuarioDTO> listaUsuarios;
    private String iteracionEstado;
    private List<IteracionDTO> listaiteracion;
    private List<String> listaEsfuerzo;
    private String mensajeAux;
    private List<String> listaIdTar;
    private Date iteracionFechaMod;
    private MensajeDTO mensaje;

    public IteracionModel() {
    }

    public int getIdHistoriaIteracion() {
        return idHistoriaIteracion;
    }

    public void setIdHistoriaIteracion(int idHistoriaIteracion) {
        this.idHistoriaIteracion = idHistoriaIteracion;
    }

    public List<IteracionDTO> getListaiteracion() {
        return listaiteracion;
    }

    public void setListaiteracion(List<IteracionDTO> listaiteracion) {
        this.listaiteracion = listaiteracion;
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

    public UsuarioDTO getIteracionUsuarioAsignado() {
        return iteracionUsuarioAsignado;
    }

    public void setIteracionUsuarioAsignado(UsuarioDTO iteracionUsuarioAsignado) {
        this.iteracionUsuarioAsignado = iteracionUsuarioAsignado;
    }

    public int getIteracionCantidad() {
        return iteracionCantidad;
    }

    public void setIteracionCantidad(int iteracionCantidad) {
        this.iteracionCantidad = iteracionCantidad;
    }

    public List<UsuarioDTO> getListaUsuarios() {
        return listaUsuarios;
    }

    public void setListaUsuarios(List<UsuarioDTO> listaUsuarios) {
        this.listaUsuarios = listaUsuarios;
    }

    public String getIteracionEstado() {
        return iteracionEstado;
    }

    public void setIteracionEstado(String iteracionEstado) {
        this.iteracionEstado = iteracionEstado;
    }

    public List<String> getListaEsfuerzo() {
        return listaEsfuerzo;
    }

    public void setListaEsfuerzo(List<String> listaEsfuerzo) {
        this.listaEsfuerzo = listaEsfuerzo;
    }

    public String getMensajeAux() {
        return mensajeAux;
    }

    public void setMensajeAux(String mensajeAux) {
        this.mensajeAux = mensajeAux;
    }

    public List<String> getListaIdTar() {
        return listaIdTar;
    }

    public void setListaIdTar(List<String> listaIdTar) {
        this.listaIdTar = listaIdTar;
    }

    public Date getIteracionFechaMod() {
        return iteracionFechaMod;
    }

    public void setIteracionFechaMod(Date iteracionFechaMod) {
        this.iteracionFechaMod = iteracionFechaMod;
    }

    public MensajeDTO getMensaje() {
        return mensaje;
    }

    public void setMensaje(MensajeDTO mensaje) {
        this.mensaje = mensaje;
    }
}