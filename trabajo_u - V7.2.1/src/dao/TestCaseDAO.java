package dao;
import dto.TestCaseDTO;

import connection.ConnectionDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

/**
 * Created by Ripcrow on 08-12-2014.
 */
public class TestCaseDAO {
    public static boolean insertTestCase(TestCaseDTO testCase)throws Exception{
        PreparedStatement p = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();

            String sql = "insert into tbl_test_case (test_enunciado, test_objetivo, test_dato_requerido, test_precondiciones, " +
                         "test_usuario_creador, test_fecha_creacion, test_estado, tbl_tarea_tar_id) " +
                         "values(?,?,?,?,?,?,?,?)";
            p = conn.prepareStatement(sql);
            p.setString(1,testCase.getTestEnun());
            p.setString(2,testCase.getTestObj());
            p.setString(3,testCase.getTestDato());
            p.setString(4,testCase.getTestPrec());
            p.setString(5,testCase.getTestUsuCre());
            p.setDate(6,getCurrentDate());
            p.setString(7,testCase.getTestEstado());
            p.setInt(8, testCase.getTareaId());

            int insertTestCase = p.executeUpdate();

            if (insertTestCase == 0) {
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
