package dto;

import java.util.Date;

/**
 * Created by Jordan on 25-11-2014.
 */
public class ProyectoDTO {
    private int proId;
    private String proDescripcion;
    private String proNombre;
    private String estado;
    private String usuCrea;

    private Date fechaCrea;
    private UsuarioDTO usuarioDTO;

    public ProyectoDTO() {
    }

    public ProyectoDTO(int proId, String proDescripcion, String proNombre, String estado, String usuCrea, Date fechaCrea, UsuarioDTO usuarioDTO) {
        this.proId = proId;
        this.proDescripcion = proDescripcion;
        this.proNombre = proNombre;
        this.estado = estado;
        this.usuCrea = usuCrea;
        this.fechaCrea = fechaCrea;
        this.usuarioDTO = usuarioDTO;
    }

    public UsuarioDTO getUsuarioDTO() {
        return usuarioDTO;
    }

    public void setUsuarioDTO(UsuarioDTO usuarioDTO) {
        this.usuarioDTO = usuarioDTO;
    }

    public String getProNombre() {
        return proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
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



    public Date getFechaCrea() {
        return fechaCrea;
    }

    public void setFechaCrea(Date fechaCrea) {
        this.fechaCrea = fechaCrea;
    }
}
