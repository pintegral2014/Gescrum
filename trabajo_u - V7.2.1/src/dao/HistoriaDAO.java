package dao;

import connection.ConnectionDB;
import dto.HistoriaDTO;
import dto.ProyectoDTO;

import javax.swing.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jordan on 06-07-2014.
 */
public class HistoriaDAO {

    public static HistoriaDTO obtenerData(int idHistoria) throws Exception{
        PreparedStatement preparedStatement = null;
        HistoriaDTO historiaDTO = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select * from tbl_hdu h where h.hdu_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1,idHistoria);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                historiaDTO = new HistoriaDTO();
                historiaDTO.setHisId(resultSet.getInt("hdu_id"));
                historiaDTO.setNombrehistoria(resultSet.getString("hdu_nombre"));
                historiaDTO.setPrioridad(resultSet.getInt("hdu_prioridad"));
                historiaDTO.setEventum(resultSet.getInt("hdu_eventum"));
                historiaDTO.setDependencia(resultSet.getString("hdu_dependencia"));
                historiaDTO.setDescripcion(resultSet.getString("hdu_descripcion"));
                historiaDTO.setCriAceptacion(resultSet.getString("hdu_criterios_aceptacion"));

            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return historiaDTO;
        }

    }

    public static HistoriaDTO buscarHistoria(String nombreHistoria)throws Exception {

        PreparedStatement p = null;
        HistoriaDTO historia = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select h.hdu_nombre from tbl_hdu h where h.hdu_nombre = ? limit 1";
            p = conn.prepareStatement(sql);
            p.setString(1,nombreHistoria);
            ResultSet res = p.executeQuery();
            if(res.next()){
                historia = new HistoriaDTO();
                historia.setNombrehistoria(nombreHistoria);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return historia;
        }

    }
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }
    public static boolean insertHistoria(HistoriaDTO historiaDTO)throws Exception{
        PreparedStatement preparedStatement = null;
        boolean query = false;

        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "INSERT INTO gescrum.tbl_hdu " +
                         "(hdu_nombre," +
                         "hdu_prioridad," +
                         "hdu_eventum," +
                         "hdu_descripcion," +
                         "hdu_dependencia," +
                         "hdu_criterios_aceptacion," +
                         "hdu_fecha_creacion," +
                         "hdu_usuario_creador," +
                         "hdu_estado," +
                         "hdu_solicitado_por," +
                         "tbl_proyecto_pro_id) " +
                         "VALUES(?,?,?,?,?,?,?,?,?,?,?)";

            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, historiaDTO.getNombrehistoria());
            preparedStatement.setInt(2, historiaDTO.getPrioridad());
            preparedStatement.setInt(3, historiaDTO.getEventum());
            preparedStatement.setString(4, historiaDTO.getDescripcion());
            preparedStatement.setString(5, historiaDTO.getDependencia());
            preparedStatement.setString(6, historiaDTO.getCriAceptacion());
            preparedStatement.setDate(7, getCurrentDate());
            preparedStatement.setString(8, historiaDTO.getUsuariocrea());
            preparedStatement.setString(9, "ingresada");
            preparedStatement.setString(10, historiaDTO.getSolicitadoPor());
            preparedStatement.setInt(11, historiaDTO.getProyectoDTO().getProId());


            int insertHist = preparedStatement.executeUpdate();

            if (insertHist == 0) {
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

    public static List<HistoriaDTO> selectHistoria ()throws Exception{
        List<HistoriaDTO> listHistoria = null;
        PreparedStatement p = null;
        ConnectionDB interfaceConn = new ConnectionDB();

        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select h.*,p.pro_nombre, p.pro_id from gescrum.tbl_hdu h, gescrum.tbl_proyecto p where h.tbl_proyecto_pro_id = p.pro_id";
            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listHistoria = new ArrayList<HistoriaDTO>();
            while(res.next()){
                HistoriaDTO historia = new HistoriaDTO();
                historia.setHisId(res.getInt("hdu_id"));
                historia.setNombrehistoria(res.getString("hdu_nombre"));
                historia.setPrioridad(res.getInt("hdu_prioridad"));
                historia.setDescripcion(res.getString("hdu_descripcion"));
                ProyectoDTO proyecto = new ProyectoDTO();
                proyecto.setProId(res.getInt("pro_id"));
                proyecto.setProNombre(res.getString("pro_nombre"));
                historia.setProyectoDTO(proyecto);
                listHistoria.add(historia);

            }
            p.close();

        }catch(Exception e){
            e.printStackTrace();
        }
        finally {
            interfaceConn.cerrarConexion();
            return listHistoria;
        }

    }
    public static List<HistoriaDTO> proyectoHistoriaList(HistoriaDTO proyecto)throws Exception{
        PreparedStatement p = null;
        List<HistoriaDTO> listhistory = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select hdu_id,hdu_nombre,hdu_prioridad,hdu_eventum,hdu_descripcion," +
                    "hdu_dependencia,hdu_criterios_aceptacion,hdu_fecha_creacion,hdu_usuario_creador from tbl_hdu where tbl_proyecto_pro_id = ?;";

            p = conn.prepareStatement(sql);
            p.setInt(1, proyecto.getProyectoDTO().getProId());
            ResultSet res = p.executeQuery();
            listhistory = new ArrayList<HistoriaDTO>();
            while (res.next()){
                HistoriaDTO historia = new HistoriaDTO();
                historia.setHisId(res.getInt("hdu_id"));
                historia.setNombrehistoria(res.getString("hdu_nombre"));
                historia.setPrioridad(res.getInt("hdu_prioridad"));
                historia.setEventum(res.getInt("hdu_eventum"));
                historia.setDescripcion(res.getString("hdu_descripcion"));
                historia.setDependencia(res.getString("hdu_dependencia"));
                historia.setCriAceptacion(res.getString("hdu_criterios_aceptacion"));
                historia.setFechaCrea(res.getDate("hdu_fecha_creacion"));
                historia.setUsuariocrea(res.getString("hdu_usuario_creador"));

                listhistory.add(historia);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listhistory;
        }
    }
    public static List<HistoriaDTO> proyectoHistoriaList2(int proyecto)throws Exception{
        PreparedStatement p = null;
        List<HistoriaDTO> listhistory = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select hdu_id,hdu_nombre,hdu_prioridad,hdu_eventum,hdu_descripcion," +
                    "hdu_dependencia,hdu_criterios_aceptacion,hdu_fecha_creacion,hdu_usuario_creador from tbl_hdu where tbl_proyecto_pro_id = ? order by hdu_prioridad desc";

            p = conn.prepareStatement(sql);
            p.setInt(1, proyecto);
            ResultSet res = p.executeQuery();
            listhistory = new ArrayList<HistoriaDTO>();
            while (res.next()){
                HistoriaDTO historia = new HistoriaDTO();
                historia.setHisId(res.getInt("hdu_id"));
                historia.setNombrehistoria(res.getString("hdu_nombre"));
                historia.setPrioridad(res.getInt("hdu_prioridad"));
                historia.setEventum(res.getInt("hdu_eventum"));
                historia.setDescripcion(res.getString("hdu_descripcion"));
                historia.setDependencia(res.getString("hdu_dependencia"));
                historia.setCriAceptacion(res.getString("hdu_criterios_aceptacion"));
                historia.setFechaCrea(res.getDate("hdu_fecha_creacion"));
                historia.setUsuariocrea(res.getString("hdu_usuario_creador"));

                listhistory.add(historia);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listhistory;
        }
    }

    public static boolean updateHistoria(HistoriaDTO historiaDTO)throws Exception{
        PreparedStatement preparedStatement = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_hdu  set hdu_prioridad = ?, hdu_eventum = ?, hdu_descripcion = ?, " +
                         "hdu_dependencia = ?, hdu_criterios_aceptacion = ?  where hdu_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, historiaDTO.getPrioridad());
            preparedStatement.setInt(2, historiaDTO.getEventum());
            preparedStatement.setString(3, historiaDTO.getDescripcion());
            preparedStatement.setString(4, historiaDTO.getDependencia());
            preparedStatement.setString(5, historiaDTO.getCriAceptacion());
            preparedStatement.setInt(6, historiaDTO.getHisId());
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
    public static boolean deleteHdu (int hdu){
        PreparedStatement preparedStatement = null;
        int borrado = 0;
        boolean exito = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "delete from tbl_hdu where hdu_id = ?";

            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, hdu);
            borrado = preparedStatement.executeUpdate();
            if(borrado == 1){
                exito = true;
            }else
            {
                exito = false;
            }
            preparedStatement.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
        }
        return exito;
    }
}
