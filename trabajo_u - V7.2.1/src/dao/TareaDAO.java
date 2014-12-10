package dao;

import connection.ConnectionDB;
import dto.HistoriaDTO;
import dto.TareaDTO;

import javax.swing.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by EmilioCesar on 28-11-2014.
 */

public class TareaDAO {

    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }

    public static boolean ingresarTarea(TareaDTO tarea)throws Exception{
        PreparedStatement p = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        boolean exito=false;


        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "insert into tbl_tarea (tar_descripcion,tar_fecha_creacion,tar_usuario_creador,tbl_hdu_hdu_id) " +
                    "values(?,?,?,?);";
            p = conn.prepareStatement(sql);
            p.setString(1, tarea.getDescripcionTarea());
            p.setDate(2, getCurrentDate());
            p.setString(3, tarea.getUsuCreador());
            p.setInt(4, tarea.getHduTarID());
            int insertTarea = p.executeUpdate();

            if (insertTarea == 0) {
                exito = false;
                return exito;
            }
            else
                exito = true;

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return exito;
        }
    }

    public static List<TareaDTO> listaTareaHistoria (TareaDTO idHistoria)throws Exception{
        PreparedStatement p = null;
        List<TareaDTO> listatareas = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select * from tbl_tarea where tbl_hdu_hdu_id = ?";

            p = conn.prepareStatement(sql);
            p.setInt(1, idHistoria.getHduTarID());
            ResultSet res = p.executeQuery();
            listatareas = new ArrayList<TareaDTO>();
            while (res.next()){
                TareaDTO tarea = new TareaDTO();
                tarea.setIdTarea(res.getInt("tar_id"));
                tarea.setDescripcionTarea(res.getString("tar_descripcion"));
                tarea.setFechaCreacion(res.getDate("tar_fecha_creacion"));
                tarea.setUsuCreador(res.getString("tar_usuario_creador"));
                tarea.setHduTarID(res.getInt("tbl_hdu_hdu_id"));


               listatareas.add(tarea);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listatareas;
        }
    }

    public static boolean selectTareaXHdu (int hisId)throws Exception{
        PreparedStatement preparedStatement = null;
        boolean existe = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select * from tbl_tarea where tbl_hdu_hdu_id = ?";

            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, hisId);
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()){
                existe = true;
            }
            preparedStatement.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return existe;
        }

    }
}
