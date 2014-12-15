package dao;

import action.Proyecto;
import connection.ConnectionDB;
import dto.ProyectoDTO;
import dto.UsuarioDTO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jordan on 25-11-2014.
 */
public class ProyectoDAO {

    public static List<ProyectoDTO> listaProyecto (){

        PreparedStatement p = null;
        List<ProyectoDTO> listaPro = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select p.pro_id, p.pro_nombre from tbl_proyecto p";
            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listaPro = new ArrayList<ProyectoDTO>();
            while (res.next()){
                ProyectoDTO pro = new ProyectoDTO();
                pro.setProId(res.getInt("pro_id"));
                pro.setProNombre(res.getString("pro_nombre"));
                listaPro.add(pro);
                           }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listaPro;
        }
    }
    public static List<ProyectoDTO> listaProyecto2 () {

        PreparedStatement p = null;
        List<ProyectoDTO> listaPro = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select p.pro_id, p.pro_nombre, p.pro_descripcion, p.pro_estado, u.usu_login_conexion from tbl_proyecto p, tbl_usuario u where p.tbl_usuario_usu_id = u.usu_id";
            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listaPro = new ArrayList<ProyectoDTO>();
            while (res.next()) {
                ProyectoDTO pro = new ProyectoDTO();
                pro.setProId(res.getInt("pro_id"));
                pro.setProNombre(res.getString("pro_nombre"));
                pro.setProDescripcion(res.getString("pro_descripcion"));
                pro.setEstado(res.getString("pro_estado"));
                UsuarioDTO usuarioDTO = new UsuarioDTO();
                usuarioDTO.setUsuLoginConexion(res.getString("usu_login_conexion"));
                pro.setUsuarioDTO(usuarioDTO);
                listaPro.add(pro);
            }
            p.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            interfaceConn.cerrarConexion();
            return listaPro;
        }
    }
    public static ProyectoDTO obtenerDataProyecto(int idPro) throws Exception{
        PreparedStatement preparedStatement = null;
        ProyectoDTO proyectoDTO = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "select p.pro_id, p.pro_nombre, p.pro_descripcion, p.pro_estado, u.usu_login_conexion " +
                    "from tbl_proyecto p, tbl_usuario u " +
                    "where p.tbl_usuario_usu_id = u.usu_id and p.pro_id = ? ";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1,idPro);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                proyectoDTO = new ProyectoDTO();
                proyectoDTO.setProId(resultSet.getInt("pro_id"));
                proyectoDTO.setProNombre(resultSet.getString("pro_nombre"));
                proyectoDTO.setProDescripcion(resultSet.getString("pro_descripcion"));
                proyectoDTO.setEstado(resultSet.getString("pro_estado"));
                UsuarioDTO usuarioDTO = new UsuarioDTO();
                usuarioDTO.setUsuLoginConexion(resultSet.getString("usu_login_conexion"));
                proyectoDTO.setUsuarioDTO(usuarioDTO);

            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return proyectoDTO;
        }
    } // fin metodo obtenerDataProyecto

    public static boolean updateProyecto (ProyectoDTO proyectoDTO){
        PreparedStatement preparedStatement = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_proyecto  set pro_nombre = ?, pro_estado = ?, pro_descripcion = ?  where pro_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, proyectoDTO.getProNombre());
            preparedStatement.setString(2, proyectoDTO.getEstado());
            preparedStatement.setString(3, proyectoDTO.getProDescripcion());
            preparedStatement.setInt(4, proyectoDTO.getProId());

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
    public static ProyectoDTO buscarProyecto (String nombrePro)throws Exception{
        PreparedStatement p = null;
        ProyectoDTO proyectoDTO = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select pp.pro_nombre from tbl_proyecto pp where pp.pro_nombre = ? limit 1";
            p = conn.prepareStatement(sql);
            p.setString(1,nombrePro);
            ResultSet res = p.executeQuery();
            if(res.next()){
                proyectoDTO = new ProyectoDTO();
                proyectoDTO.setProNombre(nombrePro);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return proyectoDTO;
        }

    }
    public static boolean insertProyecto(ProyectoDTO proyecto)throws Exception{
        PreparedStatement p = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "insert into tbl_proyecto (pro_nombre, pro_estado,pro_descripcion, tbl_usuario_usu_id,pro_fecha_creacion) values(?,?,?,(select usu_id from tbl_usuario where usu_login_conexion = ?),?)";
            p = conn.prepareStatement(sql);
            p.setString(1,proyecto.getProNombre());
            p.setString(2,proyecto.getEstado());
            p.setString(3,proyecto.getProDescripcion());
            p.setString(4,proyecto.getUsuCrea());
            p.setDate(5, getCurrentDate());


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
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }
}
