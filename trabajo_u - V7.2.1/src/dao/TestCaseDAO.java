package dao;
import dto.TestCaseDTO;

import connection.ConnectionDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
                         "test_usuario_creador, test_fecha_creacion, test_estado, tbl_tarea_tar_id,test_fecha_mod,test_usuario_mod) " +
                         "values(?,?,?,?,?,?,?,?,?,?)";
            p = conn.prepareStatement(sql);
            p.setString(1,testCase.getTestEnun());
            p.setString(2,testCase.getTestObj());
            p.setString(3,testCase.getTestDato());
            p.setString(4,testCase.getTestPrec());
            p.setString(5,testCase.getTestUsuCre());
            p.setDate(6,getCurrentDate());
            p.setString(7,"ingresado");
            p.setInt(8, testCase.getTareaDTO().getHduTarID());
            p.setDate(9, getCurrentDate());
            p.setString(10, testCase.getTestUsuCre());

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

    public static TestCaseDTO selectDataTestCase(int idTC)throws Exception{
        PreparedStatement preparedStatement = null;
        TestCaseDTO testCaseDTO = null;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select * from tbl_test_case t where t.test_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1,idTC);
            ResultSet res = preparedStatement.executeQuery();
            if(res.next()){
                testCaseDTO = new TestCaseDTO();
                testCaseDTO.setTestId(res.getInt("test_id"));
                testCaseDTO.setTestEnun(res.getString("test_enunciado"));
                testCaseDTO.setTestObj(res.getString("test_objetivo"));
                testCaseDTO.setTestDato(res.getString("test_dato_requerido"));
                testCaseDTO.setTestPrec(res.getString("test_precondiciones"));
                testCaseDTO.setTestEstado(res.getString("test_estado"));
                testCaseDTO.setTareaId(res.getInt("tbl_tarea_tar_id"));

            }
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            interfaceConn.cerrarConexion();
            return testCaseDTO;
        }

    }

    public static List<TestCaseDTO> listaTesCase(int idTarea)throws Exception{
        List<TestCaseDTO> listTestCase = null;
        PreparedStatement p = null;
        ConnectionDB interfaceConn = new ConnectionDB();

        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "select tc.* from tbl_test_case tc where tc.tbl_tarea_tar_id = ?";
            p = conn.prepareStatement(sql);
            p.setInt(1, idTarea);
            ResultSet res = p.executeQuery();
            listTestCase = new ArrayList<TestCaseDTO>();
            while(res.next()){
                TestCaseDTO testCaseDTO = new TestCaseDTO();
                testCaseDTO.setTestId(res.getInt("test_id"));
                testCaseDTO.setTestEnun(res.getString("test_enunciado"));
                testCaseDTO.setTestObj(res.getString("test_objetivo"));
                testCaseDTO.setTestDato(res.getString("test_dato_requerido"));
                testCaseDTO.setTestPrec(res.getString("test_precondiciones"));
                testCaseDTO.setTestEstado(res.getString("test_estado"));
                testCaseDTO.setTestUsuCre(res.getString("test_usuario_creador"));
                testCaseDTO.setTareaId(res.getInt("tbl_tarea_tar_id"));

                listTestCase.add(testCaseDTO);

            }
            p.close();

        }catch(Exception e){
            e.printStackTrace();
        }
        finally {
            interfaceConn.cerrarConexion();
            return listTestCase;
        }

    }
    public static boolean updateTestCase(TestCaseDTO testCaseDTO)throws Exception{
        PreparedStatement preparedStatement = null;
        boolean query = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try{
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "update tbl_test_case  set test_enunciado = ?, test_objetivo = ?, test_dato_requerido = ?, " +
                    "test_precondiciones = ?, test_fecha_mod = ?, test_usuario_mod = ?, test_estado = ?, test_resultado_ejecucion = ? where test_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, testCaseDTO.getTestEnun());
            preparedStatement.setString(2, testCaseDTO.getTestObj());
            preparedStatement.setString(3, testCaseDTO.getTestDato());
            preparedStatement.setString(4, testCaseDTO.getTestPrec());
            preparedStatement.setDate(5, getCurrentDate());
            preparedStatement.setString(6, testCaseDTO.getTestUsuMod());
            preparedStatement.setString(7, testCaseDTO.getTestEstado());
            preparedStatement.setString(8, testCaseDTO.getResultadoPrueba());
            preparedStatement.setInt(9, testCaseDTO.getTestId());
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
    public static boolean deleteTestCase (int idTC){
        PreparedStatement preparedStatement = null;
        int borrado = 0;
        boolean exito = false;
        ConnectionDB interfaceConn = new ConnectionDB();
        try {
            Connection conn = interfaceConn.getConnectionDB();
            String sql = "delete from tbl_test_case where test_id = ?";

            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, idTC);
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
