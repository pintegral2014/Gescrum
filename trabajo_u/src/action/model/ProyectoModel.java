package action.model;

import dto.MensajeDTO;
import dto.ProyectoDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by Jordan on 29-11-2014.
 */
public class ProyectoModel {

    private int proId;
    private String proDescripcion;
    private String proNombre;
    private String estado;
    private String usuCrea;
    private int idUsuCrea;
    private Date fechaCrea;
    private List<ProyectoDTO> listPro;
    private ProyectoDTO proyectoDTO;
    private MensajeDTO mensajeDTO;

    public MensajeDTO getMensajeDTO() {
        return mensajeDTO;
    }

    public void setMensajeDTO(MensajeDTO mensajeDTO) {
        this.mensajeDTO = mensajeDTO;
    }

    public ProyectoDTO getProyectoDTO() {
        return proyectoDTO;
    }

    public void setProyectoDTO(ProyectoDTO proyectoDTO) {
        this.proyectoDTO = proyectoDTO;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public String getProDescripcion() {
        return proDescripcion;
    }

    public void setProDescripcion(String proDescripcion) {
        this.proDescripcion = proDescripcion;
    }

    public String getProNombre() {
        return proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getUsuCrea() {
        return usuCrea;
    }

    public void setUsuCrea(String usuCrea) {
        this.usuCrea = usuCrea;
    }

    public int getIdUsuCrea() {
        return idUsuCrea;
    }

    public void setIdUsuCrea(int idUsuCrea) {
        this.idUsuCrea = idUsuCrea;
    }

    public Date getFechaCrea() {
        return fechaCrea;
    }

    public void setFechaCrea(Date fechaCrea) {
        this.fechaCrea = fechaCrea;
    }

    public List<ProyectoDTO> getListPro() {
        return listPro;
    }

    public void setListPro(List<ProyectoDTO> listPro) {
        this.listPro = listPro;
    }
}
