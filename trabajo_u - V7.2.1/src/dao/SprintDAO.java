package dao;

import connection.ConnectionDB;
import dto.SprintDTO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by EmilioCesar on 30-11-2014.
 */
public class SprintDAO {
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }
    public static boolean insertSprint(SprintDTO sprint)throws Exception{
        PreparedStatement p = null;
        boolean query = false;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{

            Connection conn = interfaceConn.getConnectionDB();

            String sql = "insert into tbl_sprint (spr_nombre, spr_descripcion, spr_fecha_fin, spr_fecha_creacion, spr_estado, spr_usuario_creador, tbl_grupo_gru_id)" +
                    "values(?,?,?,?,'En Proceso',?,?)";

            p = conn.prepareStatement(sql);
            p.setString(1, sprint.getNombreSprint());
            p.setString(2, sprint.getDescripcionSprint());
            p.setDate(3, getCurrentDate());
            p.setDate(4, getCurrentDate());
            p.setString(5, sprint.getUsuCreadorSprint());
            p.setInt(6, sprint.getGruSprintId());
            int insertSprint = p.executeUpdate();
            if (insertSprint == 0) {
                query = false;
                return query;
            }
            else
                query = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return query;
        }

    }
    public static List<SprintDTO> listaSprintGrupo()throws Exception{
        PreparedStatement p = null;
        List<SprintDTO> listaSprint = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select spr_id,spr_nombre,spr_descripcion,spr_estado,spr_fecha_creacion,spr_usuario_creador,gru_nombre,gru_id from tbl_sprint,tbl_grupo where tbl_grupo_gru_id=gru_id and spr_estado not in('Finalizado')";

            p = conn.prepareStatement(sql);

            ResultSet res = p.executeQuery();
            listaSprint = new ArrayList<SprintDTO>();
            while (res.next()){
                SprintDTO sprint = new SprintDTO();
                sprint.setSprintId(res.getInt("spr_id"));
                sprint.setNombreSprint(res.getString("spr_nombre"));
                sprint.setDescripcionSprint(res.getString("spr_descripcion"));
                sprint.setEstadoSprint(res.getString("spr_estado"));
                sprint.setFechaCreacion(res.getDate("spr_fecha_creacion"));
                sprint.setUsuCreadorSprint(res.getString("spr_usuario_creador"));
                sprint.setNombreGrupo(res.getString("gru_nombre"));
                sprint.setGruSprintId(res.getInt("gru_id"));
                listaSprint.add(sprint);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listaSprint;
        }
    }
}