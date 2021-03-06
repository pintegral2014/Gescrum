package action.model;

import dto.HduSprintDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by Daniel Valdebenito on 30/11/2014.
 */
public class HduSprintModel {
    private int sprId;
    private int esfuerzo;
    private String usuAsignado;
    private String estado;
    private Date fechaMod;
    private int tarId;
    private int iteracion;
    private List<HduSprintDTO> listHdu;
    private int numeroDias;
    private List<Integer> listaEsfuerzoReal;

    public List<Integer> getListaEsfuerzoReal() {
        return listaEsfuerzoReal;
    }

    public void setListaEsfuerzoReal(List<Integer> listaEsfuerzoReal) {
        this.listaEsfuerzoReal = listaEsfuerzoReal;
    }

    public int getSprId() {
        return sprId;
    }

    public void setSprId(int sprId) {
        this.sprId = sprId;
    }

    public int getEsfuerzo() {
        return esfuerzo;
    }

    public void setEsfuerzo(int esfuerzo) {
        this.esfuerzo = esfuerzo;
    }

    public String getUsuAsignado() {
        return usuAsignado;
    }

    public void setUsuAsignado(String usuAsignado) {
        this.usuAsignado = usuAsignado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaMod() {
        return fechaMod;
    }

    public void setFechaMod(Date fechaMod) {
        this.fechaMod = fechaMod;
    }

    public int getTarId() {
        return tarId;
    }

    public void setTarId(int tarId) {
        this.tarId = tarId;
    }

    public int getIteracion() {
        return iteracion;
    }

    public void setIteracion(int iteracion) {
        this.iteracion = iteracion;
    }

    public List<HduSprintDTO> getListHdu() {
        return listHdu;
    }

    public void setListHdu(List<HduSprintDTO> listHdu) {
        this.listHdu = listHdu;
    }

    public int getNumeroDias() {
        return numeroDias;
    }

    public void setNumeroDias(int numeroDias) {
        this.numeroDias = numeroDias;
    }
}