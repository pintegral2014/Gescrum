package dao;

import connection.ConnectionDB;
import dto.HduSprintDTO;

import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Daniel Valdebenito on 30/11/2014.
 */
public class HduSprintDAO {
    public  static List<HduSprintDTO> daoIteraciones(int hduSprint) throws Exception { //Crea función para listar iteraciones

        PreparedStatement p = null; //Declara preparedStatement como null
        List<HduSprintDTO> listIteraciones = null; //Declara la lista de tipo DTO como null
        ConnectionDB interfaceConn = new ConnectionDB(); //Interfaz de conexión a base de datos
        try{
            Connection conn = interfaceConn.getConnectionDB(); //Obtiene la conexión de la capa conección
            String sql = "select * from tbl_hdu_x_sprint where tbl_sprint_spr_id = ?;"; //Query a la base de datos
            p = conn.prepareStatement(sql); //pasa a la variable p la conexión
            p.setInt(1,hduSprint); //Reemplaza ? por un valor, en este caso un 1, luego se camviará por la consulta

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
                hduSprint2.setTs_iteracion(res.getInt("ts_iteracion"));
                hduSprint2.setTs_estado(res.getString("ts_estado"));
                listIteraciones.add(hduSprint2);



            }

        }catch (Exception e){
            e.printStackTrace(); //En caso de un error
        }finally {
            interfaceConn.cerrarConexion(); //Cierro la conexión a la base de datos
            return listIteraciones; //Retorno la lista
        }

    }
    public  static int obtenerDifDias(int difDias) throws Exception { //Crea función para listar iteraciones

        PreparedStatement p = null; //Declara preparedStatement como null

        int difDiass = -1;

        ConnectionDB interfaceConn = new ConnectionDB(); //Interfaz de conexión a base de datos
        try{
            Connection conn = interfaceConn.getConnectionDB(); //Obtiene la conexión de la capa conección
            String sql = "select  distinct(datediff((select max(ts_fecha_mod) from tbl_hdu_x_sprint where tbl_sprint_spr_id = sp.tbl_sprint_spr_id),\n" +
                    "(select min(ts_fecha_mod) from tbl_hdu_x_sprint where tbl_sprint_spr_id = sp.tbl_sprint_spr_id )))  from tbl_hdu_x_sprint sp where sp.tbl_sprint_spr_id = ?;"; //Query a la base de datos
            p = conn.prepareStatement(sql); //pasa a la variable p la conexión
            p.setInt(1,difDias); //Reemplaza ? por un valor, en este caso un 1, luego se camviará por la consulta

            ResultSet res = p.executeQuery(); //Ejecuta la Query y la guarda en un arreglo Resulset



            while(res.next()) //Recorre la Query y llena el arreglo
            {
                difDiass = res.getInt("(datediff((select max(ts_fecha_mod) from tbl_hdu_x_sprint where tbl_sprint_spr_id = sp.tbl_sprint_spr_id),\n" +
                        "(select min(ts_fecha_mod) from tbl_hdu_x_sprint where tbl_sprint_spr_id = sp.tbl_sprint_spr_id )))");

            }

        }catch (Exception e){
            e.printStackTrace(); //En caso de un error
        }finally {
            interfaceConn.cerrarConexion(); //Cierro la conexión a la base de datos
            return difDiass; //Retorno la lista
        }

    }

    public  static int maxEsfuerzo(int dias, int idSprint) throws Exception { //Crea función para listar iteraciones

        PreparedStatement p = null; //Declara preparedStatement como null

        int esfuerzo = -1;

        ConnectionDB interfaceConn = new ConnectionDB(); //Interfaz de conexión a base de datos
        try{
            Connection conn = interfaceConn.getConnectionDB(); //Obtiene la conexión de la capa conección
            String sql = "select sum(hs.ts_esfuerzo)\n" +
                    "from tbl_hdu_x_sprint hs\n" +
                    "where hs.ts_fecha_mod = (select date_add((select min(ts_fecha_mod) from tbl_hdu_x_sprint where tbl_sprint_spr_id = hs.tbl_sprint_spr_id ), interval ? day))\n" +
                    "and hs.tbl_sprint_spr_id = ?\n" +

                    "and ts_fecha_mod between (select min(ts_fecha_mod) from tbl_hdu_x_sprint where tbl_sprint_spr_id = hs.tbl_sprint_spr_id ) and (select max(ts_fecha_mod) from tbl_hdu_x_sprint where tbl_sprint_spr_id = hs.tbl_sprint_spr_id)\n" +
                    "group by hs.ts_fecha_mod;"; //Query a la base de datos
            p = conn.prepareStatement(sql); //pasa a la variable p la conexión
            p.setInt(1,dias); //Reemplaza ? por un valor, en este caso un 1, luego se camviará por la consulta
            p.setInt(2,idSprint); //Reemplaza ? por un valor, en este caso un 1, luego se camviará por la consulta

            ResultSet res = p.executeQuery(); //Ejecuta la Query y la guarda en un arreglo Resulset



            while(res.next()) //Recorre la Query y llena el arreglo
            {
                esfuerzo = res.getInt("sum(hs.ts_esfuerzo)");

            }

        }catch (Exception e){
            e.printStackTrace(); //En caso de un error
        }finally {
            interfaceConn.cerrarConexion(); //Cierro la conexión a la base de datos
            return esfuerzo; //Retorno la lista
        }

    }
}
