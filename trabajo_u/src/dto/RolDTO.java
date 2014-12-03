package dto;

import java.util.Date;

/**
 * Created by jordan on 06-07-2014.
 */
public class RolDTO {
    private int rolId;
    private String rol_descripcion;
    private String rol_estado;
    private Date rol_fecha_modificacion;

    public RolDTO() {
    }


    public RolDTO(int rolId, String rol_descripcion, String rol_estado, Date rol_fecha_modificacion) {
        this.rolId = rolId;
        this.rol_descripcion = rol_descripcion;
        this.rol_estado = rol_estado;
        this.rol_fecha_modificacion = rol_fecha_modificacion;
    }

    public int getRolId() {
        return rolId;
    }

    public void setRolId(int rolId) {
        this.rolId = rolId;
    }

    public String getRol_descripcion() {
        return rol_descripcion;
    }

    public void setRol_descripcion(String rol_descripcion) {
        this.rol_descripcion = rol_descripcion;
    }

    public String getRol_estado() {
        return rol_estado;
    }

    public void setRol_estado(String rol_estado) {
        this.rol_estado = rol_estado;
    }

    public Date getRol_fecha_modificacion() {
        return rol_fecha_modificacion;
    }

    public void setRol_fecha_modificacion(Date rol_fecha_modificacion) {
        this.rol_fecha_modificacion = rol_fecha_modificacion;
    }
}
