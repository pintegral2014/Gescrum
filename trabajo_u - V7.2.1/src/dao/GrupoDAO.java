package dao;

import connection.ConnectionDB;

import dto.GrupoDTO;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ripcrow on 26-11-2014.
 */
public class GrupoDAO {

    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }
    public static boolean insertGrupo(GrupoDTO grupoDTO)throws Exception{
        PreparedStatement p = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "INSERT INTO gescrum.tbl_grupo " +
                        "(gru_nombre, " +
                        "gru_descripcion, " +
                        "gru_estado, " +
                        "gru_usu_creador, " +
                        "gru_fecha_creacion, " +
                        "gru_fecha_modificacion) " +
                        "VALUES (?,?,?,?,?,?)" ;
            p = conn.prepareStatement(sql);
            p.setString(1,grupoDTO.getGruNombre());
            p.setString(2,grupoDTO.getGruDescripcion());
            p.setString(3,"Vigente");
            p.setString(4,grupoDTO.getGruUsuCreador());
            p.setDate(5, getCurrentDate());
            p.setDate(6, getCurrentDate());

            int insertUsuario = p.executeUpdate();

            if (insertUsuario == 0) {
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
    public static List<GrupoDTO> listaGrupos()throws Exception{
        PreparedStatement p = null;
        List<GrupoDTO> listagrupo = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select gru_id, gru_nombre, gru_descripcion, gru_estado, gru_usu_creador, gru_fecha_creacion, gru_fecha_modificacion " +
                         "from tbl_grupo;";

            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listagrupo = new ArrayList<GrupoDTO>();
            while (res.next()){
                GrupoDTO grupo = new GrupoDTO();
                grupo.setGruId(res.getInt("gru_id"));
                grupo.setGruNombre(res.getString("gru_nombre"));
                grupo.setGruDescripcion(res.getString("gru_descripcion"));
                grupo.setGruEstado(res.getString("gru_estado"));
                grupo.setGruUsuCreador(res.getString("gru_usu_creador"));
                grupo.setGruFechaCre(res.getDate("gru_fecha_creacion"));
                grupo.setGruFechaMod(res.getDate("gru_fecha_modificacion"));
                listagrupo.add(grupo);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listagrupo;
        }
    }

    public static GrupoDTO obtenerDataGrupo(int idGru) throws Exception{
        PreparedStatement p = null;
        GrupoDTO grupoDTO = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "select g.gru_id, g.gru_nombre, g.gru_descripcion, g.gru_estado from tbl_grupo g where g.gru_id = ? ";
            p = conn.prepareStatement(sql);
            p.setInt(1,idGru);
            ResultSet res = p.executeQuery();
            if(res.next()){
                grupoDTO = new GrupoDTO();
                grupoDTO.setGruId(res.getInt("gru_id"));
                grupoDTO.setGruNombre(res.getString("gru_nombre"));
                grupoDTO.setGruDescripcion(res.getString("gru_descripcion"));
                grupoDTO.setGruEstado(res.getString("gru_estado"));
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return grupoDTO;
        }
    }

    public static boolean updateGrupo (GrupoDTO grupoDTO){
        PreparedStatement p = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_grupo set gru_nombre = ?, gru_estado = ?, gru_descripcion = ? where gru_id = ?";
            p = conn.prepareStatement(sql);
            p.setString(1, grupoDTO.getGruNombre());
            p.setString(2, grupoDTO.getGruEstado());
            p.setString(3, grupoDTO.getGruDescripcion());
            p.setInt(4, grupoDTO.getGruId());
            int update = p.executeUpdate();

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
    public static List<GrupoDTO> listaGruposValidos()throws Exception{
        PreparedStatement p = null;
        List<GrupoDTO> listagrupo = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select * from tbl_grupo where gru_id not in (select tbl_grupo_gru_id from tbl_sprint where spr_estado = 'En proceso');";

            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listagrupo = new ArrayList<GrupoDTO>();
            while (res.next()){
                GrupoDTO grupo = new GrupoDTO();
                grupo.setGruId(res.getInt("gru_id"));
                grupo.setGruNombre(res.getString("gru_nombre"));
                grupo.setGruDescripcion(res.getString("gru_descripcion"));
                listagrupo.add(grupo);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listagrupo;
        }
    }
}
