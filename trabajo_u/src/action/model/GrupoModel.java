package action.model;

import dto.GrupoDTO;
import dto.MensajeDTO;
import dto.ProyectoDTO;

import java.sql.Date;
import java.util.List;

/**
 * Created by Ripcrow on 26-11-2014.
 */
public class GrupoModel {
    private int gruId;
    private String gruNombre;
    private String gruDescripcion;
    private String gruEstado;
    private String gruUsuCreador;
    private Date gruFechaCre;
    private Date gruFechaMod;
    private List<GrupoDTO> listagrupo;
    private GrupoDTO grupoDTO;
    private MensajeDTO mensajeDTO;

    public int getGruId() {
        return gruId;
    }

    public void setGruId(int gruId) {
        this.gruId = gruId;
    }

    public String getGruNombre() {
        return gruNombre;
    }

    public void setGruNombre(String gruNombre) {
        this.gruNombre = gruNombre;
    }

    public String getGruDescripcion() {
        return gruDescripcion;
    }

    public void setGruDescripcion(String gruDescripcion) {
        this.gruDescripcion = gruDescripcion;
    }

    public String getGruEstado() {
        return gruEstado;
    }

    public void setGruEstado(String gruEstado) {
        this.gruEstado = gruEstado;
    }

    public String getGruUsuCreador() {
        return gruUsuCreador;
    }

    public void setGruUsuCreador(String gruUsuCreador) {
        this.gruUsuCreador = gruUsuCreador;
    }

    public Date getGruFechaCre() {
        return gruFechaCre;
    }

    public void setGruFechaCre(Date gruFechaCre) {
        this.gruFechaCre = gruFechaCre;
    }

    public Date getGruFechaMod() {
        return gruFechaMod;
    }

    public void setGruFechaMod(Date gruFechaMod) {
        this.gruFechaMod = gruFechaMod;
    }

    public List<GrupoDTO> getListagrupo() {
        return listagrupo;
    }

    public void setListagrupo(List<GrupoDTO> listagrupo) {
        this.listagrupo = listagrupo;
    }

    public GrupoDTO getGrupoDTO() {
        return grupoDTO;
    }

    public void setGrupoDTO(GrupoDTO grupoDTO) {
        this.grupoDTO = grupoDTO;
    }

    public MensajeDTO getMensajeDTO() {
        return mensajeDTO;
    }

    public void setMensajeDTO(MensajeDTO mensajeDTO) {
        this.mensajeDTO = mensajeDTO;
    }
}
