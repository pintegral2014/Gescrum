package dao;

import dto.RolDTO;
import connection.ConnectionDB;
import dto.UsuarioDTO;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by Nicolas on 21-11-2014.
 */
public class RolDAO {

    public static List<RolDTO> listaRoles()throws Exception{
        PreparedStatement p = null;
        List<RolDTO> listarol = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select r.rol_id, r.rol_descripcion, r.rol_estado from tbl_rol r";
            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listarol = new ArrayList<RolDTO>();
            while (res.next()){
                RolDTO rol = new RolDTO();
                rol.setRol_id(res.getInt("rol_id"));
                rol.setRol_descripcion(res.getString("rol_descripcion"));
                rol.setRol_estado(res.getString("rol_estado"));
                listarol.add(rol);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listarol;
        }
    }
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }

    public static boolean insertRolxUsuario(int rol, String login, String usuarioCrea)throws Exception{
        PreparedStatement p = null;
        boolean query = true;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "insert into tbl_rol_x_usuario (tbl_rol_rol_id, tbl_usuario_usu_id,ro_usuario_creador,ro_estado," +
                    "ro_fecha_creacion,ro_usuario_modificacion,ro_fecha_mod) values (?,(select usu_id from tbl_usuario " +
                    "where usu_login_conexion = ?),?,'vigente',?,?,?);";
            p = conn.prepareStatement(sql);

            p.setInt(1, rol);
            p.setString(2, login);
            p.setString(3, usuarioCrea);
            p.setDate(4, getCurrentDate());
            p.setString(5, usuarioCrea);
            p.setDate(6, getCurrentDate());

            int insertRU = p.executeUpdate();
            if(insertRU == 0){
                    query = false;
                    return query;
                }
               p.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return query;
        }
    }
    public static int selectRolUsuario (int idUsuario){
        PreparedStatement p = null;
        RolDTO rolDTO = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select ru.tbl_rol_rol_id from  tbl_rol_x_usuario ru where ru.tbl_usuario_usu_id = ? limit 1";
            p = conn.prepareStatement(sql);
            p.setInt(1, idUsuario);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                rolDTO = new RolDTO();
                rolDTO.setRol_id(idUsuario);

            }
            p.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return idUsuario;
        }

    }
    public static boolean updateRolXUsuario (int idRol, int idUsuario)throws Exception{
        PreparedStatement preparedStatement = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_rol_x_usuario  set tbl_rol_rol_id = ?, ro_fecha_mod = ?,  where tbl_usuario_usu_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, idRol);
            preparedStatement.setDate(2, getCurrentDate());
            preparedStatement.setInt(3, idUsuario);

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
