package dao;

import connection.ConnectionDB;
import dto.IteracionDTO;

import javax.swing.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
            String sql = "select sp.ts_fecha_mod from tbl_hdu_x_sprint sp \n" +
                    "where sp.tbl_sprint_spr_id = ? and sp.ts_iteracion = (select max(ts_iteracion) from tbl_hdu_x_sprint where tbl_tarea_tar_id = ?)and tbl_tarea_tar_id=?";
            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIteracionIdSprint());
            p.setInt(2, iteracion.getIteracionIdTarea());
            p.setInt(3, iteracion.getIteracionIdTarea());
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



    public static List<IteracionDTO> misTareas (String usuario)throws Exception{

        PreparedStatement p = null;
        List<IteracionDTO> listaIteracion = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select tbl_sprint_spr_id,ts_usuario_asignado,ts_estado,ts_fecha_mod,tbl_tarea_tar_id,ts_esfuerzo,ts_iteracion,hdu_nombre,spr_nombre from tbl_hdu_x_sprint sp\n" +
                    " inner join tbl_tarea t on sp.tbl_tarea_tar_id = t.tar_id \n" +
                    "  inner join tbl_hdu h on t.tbl_hdu_hdu_id = h.hdu_id \n" +
                    "  inner join tbl_sprint s on s.spr_id = sp.tbl_sprint_spr_id \n" +
                    "where sp.ts_usuario_asignado = ? and (select max(ts_fecha_mod) from tbl_hdu_x_sprint where sp.tbl_tarea_tar_id = tbl_tarea_tar_id) = ts_fecha_mod  order by sp.tbl_tarea_tar_id;";

            p = conn.prepareStatement(sql);
            p.setString(1, usuario);
            ResultSet res = p.executeQuery();
            listaIteracion = new ArrayList<IteracionDTO>();
            while (res.next()){
                IteracionDTO tarea = new IteracionDTO();
                tarea.setIteracionIdSprint(res.getInt("tbl_sprint_spr_id"));
                tarea.setIteracionUsuarioAsignado(res.getString("ts_usuario_asignado"));
                tarea.setIteracionEstado(res.getString("ts_estado"));
                tarea.setIteracionFechaMod(res.getDate("ts_fecha_mod"));
                tarea.setIteracionIdTarea(res.getInt("tbl_tarea_tar_id"));
                tarea.setIteracionCantidad(res.getInt("ts_iteracion"));
                tarea.setIteracionEsfuerzo(res.getInt("ts_esfuerzo"));
                tarea.setIteracionNombreHistoria(res.getString("hdu_nombre"));
                tarea.setIteracionNombreSprint(res.getString("spr_nombre"));

                listaIteracion.add(tarea);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listaIteracion;
        }
    }



    public static boolean dropearHistoria(IteracionDTO historia) throws Exception{
        PreparedStatement p = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_hdu_x_sprint set ts_estado = 'Caida' where tbl_tarea_tar_id in (select tar_id from tbl_tarea where tbl_hdu_hdu_id=?)";
            p = conn.prepareStatement(sql);
            p.setInt(1, historia.getIdHistoria());

            int updateIt = p.executeUpdate();
            if (updateIt == 0) {
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

    public static int obtenerCantTareas(IteracionDTO iteracion)throws Exception{
        PreparedStatement p = null;
        int cantidad = -1;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select count(tar_id) from tbl_tarea where tbl_hdu_hdu_id = ?";
            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIdHistoria());

            ResultSet res = p.executeQuery();
            if (res.next()) {
               cantidad=res.getInt("count(tar_id)");
                return cantidad;
            }
            else
               return cantidad;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return cantidad;
        }

    }

    public static  List<Integer> obtenerIdTarea(IteracionDTO iteracion)throws Exception{
        PreparedStatement p = null;
        List<Integer> listaIdtarea= new ArrayList<Integer>();
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select distinct tar_id from tbl_hdu_x_sprint hs\n" +
                    "inner join tbl_tarea t on t.tar_id = hs.tbl_tarea_tar_id\n" +
                    "inner join tbl_hdu h on h.hdu_id = t.tbl_hdu_hdu_id\n" +
                    "  where hdu_id=?;";
            p = conn.prepareStatement(sql);
            p.setInt(1, iteracion.getIdHistoria());

            ResultSet res = p.executeQuery();
            if (res.next()) {

                int idtarea=res.getInt("tar_id");

                listaIdtarea.add(idtarea);
            }
            else
                return listaIdtarea;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return listaIdtarea;
        }

    }

}
