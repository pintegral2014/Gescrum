package dao;

import connection.ConnectionDB;
import dto.HduSprintDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Daniel Valdebenito on 30/11/2014.
 */
public class HduSprintDAO {
    public  static List<HduSprintDTO> daoIteraciones(HduSprintDTO hduSprint) throws Exception { //Crea función para listar iteraciones
        PreparedStatement p = null; //Declara preparedStatement como null
        List<HduSprintDTO> listIteraciones = null; //Declara la lista de tipo DTO como null
        ConnectionDB interfaceConn = new ConnectionDB(); //Interfaz de conexión a base de datos
        try{
            Connection conn = interfaceConn.getConnectionDB(); //Obtiene la conexión de la capa conección
            String sql = "select * from tbl_hdu_x_sprint where tbl_sprint_spr_id = ?;"; //Query a la base de datos
            p = conn.prepareStatement(sql); //pasa a la variable p la conexión
            p.setInt(1,1); //Reemplaza ? por un valor, en este caso un 1, luego se camviará por la consulta
            ResultSet res = p.executeQuery(); //Ejecuta la Query y la guarda en un arreglo Resulset
            listIteraciones = new ArrayList<HduSprintDTO>(); //Declara el arreclo en el que se cargarán los datos
            while(res.next()) //Recorre la Query y llena el arreglo
            {
                HduSprintDTO hduSprint2 = new HduSprintDTO(); //Crea un objeto para setear los valores
                hduSprint2.setTbl_sprint_spr_id(res.getInt("tbl_sprint_spr_id"));
                hduSprint2.setTbl_tarea_tar_id(res.getInt("tbl_tarea_tar_id"));
                hduSprint2.setTs_fecha_mod(res.getDate("ts_fecha_mod"));
                hduSprint2.setTs_esfuerzo(res.getInt("ts_esfuerzo"));
                hduSprint2.setTs_usuario_asignado(res.getString("ts_usuario_asignado"));
                listIteraciones.add(hduSprint2);
            }

        }catch (Exception e){
            e.printStackTrace(); //En caso de un error
        }finally {
            interfaceConn.cerrarConexion(); //Cierro la conexión a la base de datos
            return listIteraciones; //Retorno la lista
        }

    }
}
