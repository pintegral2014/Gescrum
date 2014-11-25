package action.model;

import dao.RolDAO;
import dto.RolDTO;
import java.util.Date;
import java.util.List;

/**
 * Created by Ripcrow on 21-11-2014.
 */
public class RolModel {
    private int rol_id;
    private String rol;
    private String estado;
    private Date fecha_modificacion;
    private List<RolDTO> listarol;
    private RolDAO rolDAO;

    public RolModel() {
    }

    public int getRol_id() {
        return rol_id;
    }

    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }

    public List<RolDTO> getListarol() {
        return listarol;
    }

    public void setListarol(List<RolDTO> listarol) {
        this.listarol = listarol;
    }

    public RolDAO getRolDAO() {
        return rolDAO;
    }

    public void setRolDAO(RolDAO rolDAO) {
        this.rolDAO = rolDAO;
    }
}
