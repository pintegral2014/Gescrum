package dao;

import dto.RolDTO;
import dto.UsuarioDTO;
import connection.ConnectionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jecarrasco on 20-05-2014.
 */
public class UsuarioDAO {

    public static UsuarioDTO loginusuario(String login, int clave) {
        PreparedStatement p = null;
        UsuarioDTO usuario = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select usu_login_conexion , usu_clave, usu_estado from  tbl_usuario where usu_login_conexion = ? and usu_clave = ?  LIMIT 1";
            p = conn.prepareStatement(sql);
            p.setString(1, login);
            p.setInt(2, clave);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                usuario = new UsuarioDTO();
                usuario.setUsuLoginConexion(login);
                usuario.setUsuClave(clave);
                usuario.setUsuEstado(rs.getString("usu_estado"));

            }
            p.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return usuario;
        }
    }


    public static UsuarioDTO buscarUsuario(String login){
        PreparedStatement p = null;
        UsuarioDTO user = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select usu_login_conexion from tbl_usuario where usu_login_conexion = ? limit 1";
            p = conn.prepareStatement(sql);
            p.setString(1,login);
            ResultSet res = p.executeQuery();
            if(res.next()){
                user = new UsuarioDTO();
                user.setUsuLoginConexion(login);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return user;
        }


    }
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }

    public static boolean crearUsuario2 (UsuarioDTO usuario){
        PreparedStatement p = null;
        PreparedStatement q = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "insert into tbl_usuario (usu_nombre,usu_login_conexion,usu_apellido_paterno,usu_apellido_materno,"+
                    "usu_correo,usu_clave,usu_estado,usu_fecha_inicio,usu_fecha_modificacion, usu_creado_por) values (?,?,?,?,?,?,?,?,?,?);";
            p = conn.prepareStatement(sql);
            p.setString(1, usuario.getUsuNombre());
            p.setString(2, usuario.getUsuLoginConexion());
            p.setString(3, usuario.getUsuApellidoPaterno());
            p.setString(4, usuario.getUsuApellidoMaterno());
            p.setString(5, usuario.getUsuCorreo());
            p.setInt(6, usuario.getUsuClave());
            p.setString(7,usuario.getUsuEstado());
            p.setDate(8,getCurrentDate());
            p.setDate(9,getCurrentDate());
            p.setString(10, usuario.getUsuCreador());

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

    /*public static boolean crearUsuario(UsuarioDTO user){
        PreparedStatement p = null;
        PreparedStatement q = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "insert into tbl_usuario (usu_nombre,usu_login_conexion,usu_apellido_paterno,usu_apellido_materno,"+
                         "usu_correo,usu_clave,usu_estado,usu_fecha_inicio,usu_fecha_modificacion) values (?,?,?,?,?,?,?,?,?);";
            String sql2 = "insert into tbl_rol_x_usuario (tbl_rol_rol_id, tbl_usuario_usu_id,ro_usuario_creador,ro_estado," +
                          "ro_fecha_creacion,ro_usuario_modificacion,ro_fecha_mod) values (?,(select usu_id from tbl_usuario " +
                          "where usu_login_conexion = ?),?,'vigente',?,?,?);";
            p = conn.prepareStatement(sql);
            p.setString(1, user.getUsuNombre());
            p.setString(2, user.getUsuLoginConexion());
            p.setString(3, user.getUsuApellidoPaterno());
            p.setString(4, user.getUsuApellidoMaterno());
            p.setString(5, user.getUsuCorreo());
            p.setInt(6, user.getUsuClave());
            p.setString(7,user.getUsuEstado());
            p.setDate(8,getCurrentDate());
            p.setDate(9,getCurrentDate());

            int insertUsuario = p.executeUpdate();

            if (insertUsuario == 0) {
               return query;
            }
            // insertUsuario = 1
            else {
                q = conn.prepareStatement(sql2);
                q.setInt(1, user.getRolId());
                q.setString(2, user.getUsuLoginConexion());
                q.setString(3, user.getUsuCreador());
                q.setDate(4, getCurrentDate());
                q.setString(5, user.getUsuCreador());
                q.setDate(6, getCurrentDate());

                int insertRU = q.executeUpdate();
                if(insertRU == 0){
                    return query;
                }
                else {
                    query = true;

                }
            }
            p.close();
            q.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return query;
        }
    }*/
    public static UsuarioDTO obtenerDataUsuario(int idUsuario)throws Exception{
        PreparedStatement preparedStatement = null;
        UsuarioDTO usuarioDTO = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "select u.usu_id, u.usu_nombre, u.usu_apellido_paterno, u.usu_apellido_materno, u.usu_correo, u.usu_clave, " +
                         "u.usu_estado, u.usu_login_conexion, r.rol_id, r.rol_descripcion " +
                         "from gescrum.tbl_usuario u, gescrum.tbl_rol r, gescrum.tbl_rol_x_usuario ru  " +
                         "where u.usu_id = ru.tbl_usuario_usu_id  and r.rol_id = ru.tbl_rol_rol_id and u.usu_id = ? ";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1,idUsuario);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                usuarioDTO = new UsuarioDTO();
                usuarioDTO.setUsuId(resultSet.getInt("usu_id"));
                usuarioDTO.setUsuNombre(resultSet.getString("usu_nombre"));
                usuarioDTO.setUsuApellidoPaterno(resultSet.getString(("usu_apellido_paterno")));
                usuarioDTO.setUsuApellidoMaterno(resultSet.getString("usu_apellido_materno"));
                usuarioDTO.setUsuCorreo(resultSet.getString("usu_correo"));
                usuarioDTO.setUsuClave(resultSet.getInt("usu_clave"));
                usuarioDTO.setUsuEstado(resultSet.getString("usu_estado"));
                usuarioDTO.setUsuLoginConexion(resultSet.getString("usu_login_conexion"));
                RolDTO rolDTO = new RolDTO();
                rolDTO.setRolId(resultSet.getInt("rol_id"));
                rolDTO.setRol_descripcion(resultSet.getString("rol_descripcion"));
                usuarioDTO.setRol(rolDTO);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return usuarioDTO;
        }

    }


    public static List<UsuarioDTO> listaUsuarios()throws Exception{
        PreparedStatement p = null;
        List<UsuarioDTO> listauser = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select u.usu_id, u.usu_nombre, u.usu_apellido_paterno, u.usu_apellido_materno,u.usu_correo, " +
                    "u.usu_login_conexion,u.usu_estado, u.usu_clave, rol.rol_descripcion from tbl_usuario u,tbl_rol_x_usuario r, tbl_rol rol " +
                    "where  u.usu_id = r.tbl_usuario_usu_id and r.tbl_rol_rol_id = rol.rol_id and r.ro_estado = 'vigente'";

            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listauser = new ArrayList<UsuarioDTO>();
            while (res.next()){
                UsuarioDTO usuario = new UsuarioDTO();
                usuario.setUsuId(res.getInt("usu_id"));
                usuario.setUsuNombre(res.getString("usu_nombre"));
                usuario.setUsuApellidoPaterno(res.getString("usu_apellido_paterno"));
                usuario.setUsuApellidoMaterno(res.getString("usu_apellido_materno"));
                usuario.setUsuCorreo(res.getString("usu_correo"));
                usuario.setUsuLoginConexion(res.getString("usu_login_conexion"));
                usuario.setUsuEstado(res.getString("usu_estado"));
                usuario.setUsuClave(res.getInt("usu_clave"));
                RolDTO rolDTO = new RolDTO();
                rolDTO.setRol_descripcion(res.getString("rol_descripcion"));
                usuario.setRol(rolDTO);

                listauser.add(usuario);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listauser;
        }
    }

    /*public static boolean modificarUsuario(UsuarioDTO user){
        PreparedStatement p = null;
        PreparedStatement q = null;
        boolean exito = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_usuario set usu_nombre = ?,usu_login_conexion = ?,usu_apellido_paterno = ?,usu_apellido_materno = ?,"+
                    "usu_correo = ?,usu_clave = ?,usu_estado = ?,usu_fecha_modificacion = ?;";
            String sql2 = "update tbl_rol_has_tbl_usuario set tbl_rol_rol_id = ? where tbl_usuario_usu_id == ?;";
            p = conn.prepareStatement(sql);
            p.setString(1, user.getUsuNombre());
            p.setString(2, user.getUsuLoginConexion());
            p.setString(3, user.getUsuApellidoPaterno());
            p.setString(4, user.getUsuApellidoMaterno());
            p.setString(5, user.getUsuCorreo());
            p.setInt(6, user.getUsuClave());
            p.setString(7,user.getUsuEstado());
            p.setDate(8,getCurrentDate());

            q = conn.prepareStatement(sql2);
            //q.setInt(1, user.getRolId());
            q.setInt(2, user.getUsuId());

            int ads = p.executeUpdate();
            int ads2 = q.executeUpdate();
            if (ads != 0 && ads2 !=0) {
                exito = true;
            }
            p.close();
            q.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return exito;
        }
    }

    public int count(){
        int count = 0;
        ConnectionDB interfaceConn = new ConnectionDB();
        PreparedStatement p = null;
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "SELECT COUNT(*) FROM USUARIO  ";
            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            while (res.next()){
                count = res.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            interfaceConn.cerrarConexion();
            return count;
        }
    }*/

    public static boolean updateDataUsuario(UsuarioDTO usuarioDTO){
        PreparedStatement preparedStatement = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_usuario  set usu_nombre = ?, usu_apellido_paterno = ?, usu_apellido_materno = ?, usu_correo = ?, usu_clave = ?, " +
                    "usu_fecha_modificacion = ?, usu_modificado_por = ? where usu_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, usuarioDTO.getUsuNombre());
            preparedStatement.setString(2, usuarioDTO.getUsuApellidoPaterno());
            preparedStatement.setString(3, usuarioDTO.getUsuApellidoMaterno());
            preparedStatement.setString(4, usuarioDTO.getUsuCorreo());
            preparedStatement.setInt(5, usuarioDTO.getUsuClave());
            preparedStatement.setDate(6, getCurrentDate());
            preparedStatement.setString(7, usuarioDTO.getUsuModificadoPor());
            preparedStatement.setInt(8, usuarioDTO.getUsuId());

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
