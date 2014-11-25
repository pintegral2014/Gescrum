package dao;

import connection.ConnectionDB;
import dto.RolDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jordan on 06-07-2014.
 */
public class CargoDAO {

    public static List<RolDTO> listaCargo()throws Exception{
        PreparedStatement p = null;
        List<RolDTO> listacargo = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select c_id, c_nombre from tbl_cargo";
            p = conn.prepareStatement(sql);
            ResultSet res = p.executeQuery();
            listacargo = new ArrayList<RolDTO>();
            while (res.next()){
                RolDTO cargo = new RolDTO();
                cargo.setRol_id(res.getInt("c_id"));
                cargo.setRol_descripcion(res.getString("c_nombre"));
                listacargo.add(cargo);
            }
            p.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return listacargo;
        }
    }
}
