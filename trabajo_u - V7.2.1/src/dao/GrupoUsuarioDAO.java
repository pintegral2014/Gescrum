package dao;

import connection.ConnectionDB;

import dto.GrupoUsuarioDTO;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ripcrow on 27-11-2014.
 */
public class GrupoUsuarioDAO {
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }

    public static List<GrupoUsuarioDTO> listaGruUsu(GrupoUsuarioDTO idGru)throws Exception{
        PreparedStatement p = null;
        List<GrupoUsuarioDTO> listagruxusu = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select u.usu_nombre, u.usu_apellido_paterno, u.usu_login_conexion, r.rol_descripcion, g.gru_nombre " +
                    "from tbl_usuario u " +
                    "inner join tbl_rol_x_usuario ur " +
                    "on ur.tbl_usuario_usu_id = u.usu_id " +
                    "inner join tbl_rol r " +
                    "on ur.tbl_rol_rol_id = r.rol_id " +
                    "inner join  tbl_usuario_grupo ug " +
                    "on ug.tbl_usuario_usu_id = u.usu_id " +
                    "inner join tbl_grupo g " +
                    "on ug.tbl_grupo_gru_id = g.gru_id " +
                    "where g.gru_id = ?";

            p = conn.prepareStatement(sql);
            p.setInt(1, idGru.getGruGruId());
            ResultSet res = p.executeQuery();
            listagruxusu = new ArrayList<GrupoUsuarioDTO>();
            while (res.next()){
                GrupoUsuarioDTO usugru = new GrupoUsuarioDTO();
                usugru.setUsuNombre(res.getString("usu_nombre"));
                usugru.setUsuApellido(res.getString("usu_apellido_paterno"));
                usugru.setUsuLoginConexion(res.getString("usu_login_conexion"));
                usugru.setRolDescripcion(res.getString("rol_descripcion"));
                usugru.setGruNombre(res.getString("gru_nombre"));
                listagruxusu.add(usugru);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listagruxusu;
        }
    }

    public static List<GrupoUsuarioDTO> listaUsuSin(GrupoUsuarioDTO idGru)throws Exception{
        PreparedStatement p = null;
        List<GrupoUsuarioDTO> listaususingru = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select u.usu_nombre, u.usu_apellido_paterno, u.usu_login_conexion, r.rol_descripcion " +
                    "from tbl_usuario u " +
                    "inner join tbl_rol_x_usuario ur " +
                    "on ur.tbl_usuario_usu_id = u.usu_id " +
                    "inner join tbl_rol r " +
                    "on ur.tbl_rol_rol_id = r.rol_id " +
                    "where (u.usu_id not in (select ug.tbl_usuario_usu_id from tbl_usuario_grupo ug) " +
                    "or (r.rol_descripcion = 'Scrum Master' and u.usu_id not in (select ug.tbl_usuario_usu_id from tbl_usuario_grupo ug " +
                    "where ug.tbl_grupo_gru_id = ?)))";

            p = conn.prepareStatement(sql);
            p.setInt(1, idGru.getGruGruId());
            ResultSet res = p.executeQuery();
            listaususingru = new ArrayList<GrupoUsuarioDTO>();
            while (res.next()){
                GrupoUsuarioDTO ususingru = new GrupoUsuarioDTO();
                ususingru.setUsuNombre(res.getString("usu_nombre"));
                ususingru.setUsuApellido(res.getString("usu_apellido_paterno"));
                ususingru.setUsuLoginConexion(res.getString("usu_login_conexion"));
                ususingru.setRolDescripcion(res.getString("rol_descripcion"));
                listaususingru.add(ususingru);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listaususingru;
        }
    }

    public static boolean asociarUsuario (GrupoUsuarioDTO usugru){
        PreparedStatement p = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "insert into tbl_usuario_grupo (tbl_usuario_usu_id, tbl_grupo_gru_id, ug_usuario_creador, " +
                         "ug_fecha_creacion, ug_usuario_modificacion, ug_fecha_mod) " +
                         "values ((select usu_id from tbl_usuario where usu_login_conexion = ?),?,?,?,?,?)";
            p = conn.prepareStatement(sql);
            p.setString(1, usugru.getUsuLoginConexion());
            p.setInt(2, usugru.getGruGruId());
            p.setString(3, usugru.getUsuCreador());
            p.setDate(4, getCurrentDate());
            p.setString(5, usugru.getUsuCreador());
            p.setDate(6, getCurrentDate());
            int insert = p.executeUpdate();
            if (insert == 0) {
                return query;
            }
            else
                query = true;
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return query;
        }
    }

    public static boolean desasociarUsuario (GrupoUsuarioDTO usugru){
        PreparedStatement p = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "delete from tbl_usuario_grupo " +
                         "where tbl_usuario_grupo.tbl_usuario_usu_id = (select usu_id from tbl_usuario where usu_login_conexion = ?)" +
                         "and tbl_usuario_grupo.tbl_grupo_gru_id = ?;";
            p = conn.prepareStatement(sql);
            p.setString(1, usugru.getUsuLoginConexion());
            p.setInt(2, usugru.getGruGruId());
            int delete = p.executeUpdate();
            if (delete == 0) {
                return query;
            }
            else
                query = true;
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return query;
        }
    }
}
