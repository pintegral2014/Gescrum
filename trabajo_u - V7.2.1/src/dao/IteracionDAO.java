package dao;

import connection.ConnectionDB;
import dto.IteracionDTO;

import javax.swing.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by EmilioCesar on 08-12-2014.
 */
public class IteracionDAO {
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }


    public static boolean insertIteracion(IteracionDTO iteracion)throws Exception{
        PreparedStatement p = null;
        boolean query = false;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "insert into tbl_hdu_x_sprint (tbl_sprint_spr_id, ts_esfuerzo, ts_usuario_asignado, ts_iteracion, ts_estado, ts_fecha_mod, tbl_tarea_tar_id) \n" +
                    "values (?,?,?,?,?,?,?)";

            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIteracionIdSprint());
            p.setInt(2, iteracion.getIteracionEsfuerzo());
            p.setString(3, iteracion.getIteracionUsuarioAsignado());
            p.setInt(4, iteracion.getIteracionCantidad());
            p.setString(5, iteracion.getIteracionEstado());
            p.setDate(6, getCurrentDate());
            p.setInt(7, iteracion.getIteracionIdTarea());
            int insertIt = p.executeUpdate();

            if (insertIt == 0) {
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


    public static int obtenerEsfuerzo(IteracionDTO iteracion) throws Exception{
        PreparedStatement p = null;
        int esfuerzo = -1;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select sp.ts_esfuerzo from tbl_hdu_x_sprint sp where sp.tbl_sprint_spr_id = ? and sp.ts_iteracion = (select max(ts_iteracion) from tbl_hdu_x_sprint where tbl_sprint_spr_id=? and tbl_tarea_tar_id = ?) and  sp.tbl_tarea_tar_id = ?";
            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIteracionIdSprint());
            p.setInt(2, iteracion.getIteracionIdSprint());
            p.setInt(3, iteracion.getIteracionIdTarea());
            p.setInt(4, iteracion.getIteracionIdTarea());
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                esfuerzo = resultSet.getInt("ts_esfuerzo");
                return esfuerzo;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return esfuerzo;
        }

    }

    public static Date obtenerFecha(IteracionDTO iteracion) throws Exception{
        PreparedStatement p = null;
        Date fecha = null;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select sp.ts_fecha_mod from tbl_hdu_x_sprint sp where sp.tbl_sprint_spr_id = ? and sp.ts_iteracion = (select max(ts_iteracion) from tbl_hdu_x_sprint where sp.tbl_sprint_spr_id = tbl_sprint_spr_id) and  sp.tbl_tarea_tar_id = ?";
            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIteracionIdSprint());
            p.setInt(2, iteracion.getIteracionIdTarea());
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                fecha = resultSet.getDate("ts_fecha_mod");
                return fecha;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return fecha;
        }

    }

    public static boolean insertIteracion0(IteracionDTO iteracion)throws Exception{
        PreparedStatement p = null;
        boolean query = false;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "insert into tbl_hdu_x_sprint(tbl_sprint_spr_id, ts_esfuerzo, ts_usuario_asignado, ts_iteracion, ts_estado, ts_fecha_mod, tbl_tarea_tar_id)\n" +
                    "    values(?,?,'Usuario No Asignado',0,?,?,?)";

            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIteracionIdSprint());
            p.setInt(2, iteracion.getIteracionEsfuerzo());
            p.setString(3, iteracion.getIteracionEstado());
            p.setDate(4, getCurrentDate());
            p.setInt(5, iteracion.getIteracionIdTarea());
            int insertIt = p.executeUpdate();

            if (insertIt == 0) {
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


    public static int obtenerIteracion(IteracionDTO iteracion) throws Exception{
        PreparedStatement p = null;
        int iteracionmax = -1;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select count(ts_iteracion) from tbl_hdu_x_sprint where tbl_sprint_spr_id= ? and tbl_tarea_tar_id = ?";
            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIteracionIdSprint());
            p.setInt(2 ,iteracion.getIteracionIdTarea());
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                iteracionmax = resultSet.getInt("count(ts_iteracion)");
                return iteracionmax;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return iteracionmax;
        }

    }

}
