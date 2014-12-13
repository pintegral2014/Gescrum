package dto;

import java.util.Date;

/**
 * Created by Daniel Valdebenito on 30/11/2014.
 */
public class HduSprintDTO {

    private int tbl_sprint_spr_id;
    private int ts_esfuerzo;
    private String ts_usuario_asignado;
    private String ts_estado;
    private Date ts_fecha_mod;
    private int tbl_tarea_tar_id;
    private int ts_iteracion;

    public HduSprintDTO() {
    }

    public HduSprintDTO(int tbl_sprint_spr_id, int ts_esfuerzo, String ts_usuario_asignado, String ts_estado, Date ts_fecha_mod, int tbl_tarea_tar_id, int ts_iteracion) {
        this.tbl_sprint_spr_id = tbl_sprint_spr_id;
        this.ts_esfuerzo = ts_esfuerzo;
        this.ts_usuario_asignado = ts_usuario_asignado;
        this.ts_estado = ts_estado;
        this.ts_fecha_mod = ts_fecha_mod;
        this.tbl_tarea_tar_id = tbl_tarea_tar_id;
        this.ts_iteracion = ts_iteracion;
    }

    public int getTbl_sprint_spr_id() {
        return tbl_sprint_spr_id;
    }

    public void setTbl_sprint_spr_id(int tbl_sprint_spr_id) {
        this.tbl_sprint_spr_id = tbl_sprint_spr_id;
    }

    public int getTs_esfuerzo() {
        return ts_esfuerzo;
    }

    public void setTs_esfuerzo(int ts_esfuerzo) {
        this.ts_esfuerzo = ts_esfuerzo;
    }

    public String getTs_usuario_asignado() {
        return ts_usuario_asignado;
    }

    public void setTs_usuario_asignado(String ts_usuario_asignado) {
        this.ts_usuario_asignado = ts_usuario_asignado;
    }

    public String getTs_estado() {
        return ts_estado;
    }

    public void setTs_estado(String ts_estado) {
        this.ts_estado = ts_estado;
    }

    public Date getTs_fecha_mod() {
        return ts_fecha_mod;
    }

    public void setTs_fecha_mod(Date ts_fecha_mod) {
        this.ts_fecha_mod = ts_fecha_mod;
    }

    public int getTbl_tarea_tar_id() {
        return tbl_tarea_tar_id;
    }

    public void setTbl_tarea_tar_id(int tbl_tarea_tar_id) {
        this.tbl_tarea_tar_id = tbl_tarea_tar_id;
    }

    public int getTs_iteracion() {
        return ts_iteracion;
    }

    public void setTs_iteracion(int ts_iteracion) {
        this.ts_iteracion = ts_iteracion;
    }
}