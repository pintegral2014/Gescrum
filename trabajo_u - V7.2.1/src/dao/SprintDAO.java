package dao;

import connection.ConnectionDB;
import dto.SprintDTO;

import javax.swing.*;
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
            p.setDate(3, Date.valueOf(sprint.getFechaFin()));
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
            String sql = "select spr_id,spr_nombre,spr_descripcion,spr_estado,spr_fecha_creacion, spr_fecha_fin, spr_usuario_creador,gru_nombre,gru_id from tbl_sprint,tbl_grupo where tbl_grupo_gru_id=gru_id and spr_estado not in('Finalizado')";

            p = conn.prepareStatement(sql);

            ResultSet res = p.executeQuery();
            listaSprint = new ArrayList<SprintDTO>();
            while (res.next()){
                SprintDTO sprint = new SprintDTO();
                sprint.setSprintId(res.getInt("spr_id"));
                sprint.setNombreSprint(res.getString("spr_nombre"));
                sprint.setDescripcionSprint(res.getString("spr_descripcion"));
                sprint.setEstadoSprint(res.getString("spr_estado"));
                sprint.setFechaCreacion(res.getString("spr_fecha_creacion"));
                sprint.setFechaFin(res.getString("spr_fecha_fin"));
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


    public static int obtenerDias(int numeroDiass)throws Exception{
        PreparedStatement p = null;
        int numeroDias = -1;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select  datediff(spr_fecha_fin,spr_fecha_creacion) from tbl_sprint where spr_id = ?;";

            p = conn.prepareStatement(sql);
            p.setInt(1, numeroDiass);

            ResultSet res = p.executeQuery();

            while (res.next()){
                    numeroDias = res.getInt("datediff(spr_fecha_fin,spr_fecha_creacion)");
            }

            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return numeroDias;
        }
    }

    public static List<SprintDTO> listaSprintXGrupo(int idGrupo)throws Exception{
        PreparedStatement p = null;
        List<SprintDTO> listaSprint2 = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select spr_id,spr_nombre,spr_descripcion,spr_estado,spr_fecha_creacion, spr_fecha_fin, spr_usuario_creador,gru_nombre,gru_id from tbl_sprint,tbl_grupo where tbl_grupo_gru_id=gru_id and tbl_grupo_gru_id = ? ";

            p = conn.prepareStatement(sql);
            p.setInt(1,idGrupo);
            ResultSet res = p.executeQuery();
            listaSprint2 = new ArrayList<SprintDTO>();
            while (res.next()){
                SprintDTO sprint = new SprintDTO();
                sprint.setSprintId(res.getInt("spr_id"));
                sprint.setNombreSprint(res.getString("spr_nombre"));
                sprint.setDescripcionSprint(res.getString("spr_descripcion"));
                sprint.setEstadoSprint(res.getString("spr_estado"));
                sprint.setFechaCreacion(res.getString("spr_fecha_creacion"));
                sprint.setFechaFin(res.getString("spr_fecha_fin"));
                sprint.setUsuCreadorSprint(res.getString("spr_usuario_creador"));
                sprint.setNombreGrupo(res.getString("gru_nombre"));
                sprint.setGruSprintId(res.getInt("gru_id"));
                listaSprint2.add(sprint);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listaSprint2;
        }
    }

    public static List<SprintDTO> buscarSprint(int idSprint)throws Exception {

        PreparedStatement p = null;
        List<SprintDTO> listaSprint3 = null;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select * from tbl_sprint where spr_id = ?";
            p = conn.prepareStatement(sql);
            p.setInt(1, idSprint);
            ResultSet res = p.executeQuery();
            listaSprint3 = new ArrayList<SprintDTO>();
            if (res.next()){
                SprintDTO Sprint = new SprintDTO();
                Sprint.setSprintId(res.getInt("spr_id"));
                Sprint.setNombreSprint(res.getString("spr_nombre"));
                Sprint.setDescripcionSprint(res.getString("spr_descripcion"));
                Sprint.setFechaFin(res.getString("spr_fecha_fin"));
                Sprint.setFechaCreacion(res.getString("spr_fecha_creacion"));
                Sprint.setEstadoSprint(res.getString("spr_estado"));
                Sprint.setUsuCreadorSprint(res.getString("spr_usuario_creador"));
                Sprint.setGruSprintId(res.getInt("tbl_grupo_gru_id"));
                listaSprint3.add(Sprint);

            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listaSprint3;
        }
    }

    public static boolean updateSprint(SprintDTO sprintDTO)throws Exception{
        PreparedStatement preparedStatement = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_sprint set spr_nombre = ?, spr_descripcion = ?, spr_fecha_fin = ?, spr_fecha_creacion = ?, spr_estado = ?, spr_usuario_creador = ?" +
                    " where spr_id = ?";
            preparedStatement = conn.prepareStatement(sql);

            preparedStatement.setString(1, sprintDTO.getNombreSprint());
            preparedStatement.setString(2,sprintDTO.getDescripcionSprint());
            preparedStatement.setString(3,sprintDTO.getFechaFin());
            preparedStatement.setString(4, sprintDTO.getFechaCreacion());
            preparedStatement.setString(5, sprintDTO.getEstadoSprint());
            preparedStatement.setString(6, sprintDTO.getUsuCreadorSprint());
            preparedStatement.setInt(7, sprintDTO.getSprintId());

            int update = preparedStatement.executeUpdate();

            if(update != 0){
                query = true;
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return query;
        }

    }

}
