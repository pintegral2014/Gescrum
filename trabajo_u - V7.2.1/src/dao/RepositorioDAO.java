package dao;
import connection.ConnectionDB;
import dto.RepositorioDTO;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by EmilioCesar on 26-11-2014.
 */
public class RepositorioDAO {


    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }


    public static boolean ingresarRepositorio (RepositorioDTO repositorio){
        PreparedStatement p = null;

        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "insert into tbl_repositorio (rep_nombre,rep_descripcion,rep_fecha_creacion,tbl_hdu_hdu_id)\n" +
                    "values (?,?,?,?);";
            p = conn.prepareStatement(sql);

            p.setString(1, repositorio.getArchivoFileName());
            p.setString(2, repositorio.getDescripcionRepo());
            p.setDate(3, getCurrentDate());
            p.setInt(4, repositorio.getIdHdu());

            int insertRepo = p.executeUpdate();

            if (insertRepo == 0) {
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

    public static List<RepositorioDTO> listarRepositorio(RepositorioDTO hdu){
        PreparedStatement p = null;
        List<RepositorioDTO> listarepo = null;
        ConnectionDB interfaceConn = new ConnectionDB();

        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select rep_nombre,rep_descripcion,rep_fecha_creacion from tbl_repositorio where tbl_hdu_hdu_id = ?";
            p = conn.prepareStatement(sql);

            p.setInt(1,hdu.getIdHdu());

            ResultSet res = p.executeQuery();
            listarepo = new ArrayList<RepositorioDTO>();
            while (res.next()){
                RepositorioDTO repo = new RepositorioDTO();
                repo.setArchivoFileName(res.getString("rep_nombre"));
                repo.setDescripcionRepo(res.getString("rep_descripcion"));
                repo.setFechaCreacion(res.getDate("rep_fecha_creacion"));


                listarepo.add(repo);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listarepo;
        }
    }

    public static boolean selectRepoHdu(int idHdu){
        PreparedStatement preparedStatement = null;
        boolean existe = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select * from tbl_repositorio where tbl_hdu_hdu_id = ?";

            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, idHdu);
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

    public static boolean deleteRepo (int hdu){
        PreparedStatement preparedStatement = null;
        int borrado = 0;
        boolean exito = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "delete * from tbl_repositorio where tbl_hdu_hdu_id = ?";

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
