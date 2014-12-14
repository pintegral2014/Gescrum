package logica;

import dto.TestCaseDTO;
import dao.TestCaseDAO;

import javax.swing.*;
import java.util.List;

/**
 * Created by Ripcrow on 13-12-2014.
 */
public class LogicaTestCase {

    TestCaseDTO testCaseDTO = new TestCaseDTO();

    public LogicaTestCase() {
    }

    public LogicaTestCase(TestCaseDTO testCaseDTO) {
        this.testCaseDTO = testCaseDTO;
    }

    public boolean crearTestCase(TestCaseDTO testCaseDTO)throws Exception{

        boolean exito = false;
        boolean insert = false;
        insert = TestCaseDAO.insertTestCase(testCaseDTO);
        if(insert){
            exito = true;
        }
        return exito;
    }

    public static List<TestCaseDTO> testcasexTarea(int idTarea) throws Exception{

        List<TestCaseDTO> testCaseDTOList = TestCaseDAO.listaTesCase(idTarea);
        if(testCaseDTOList != null)
        {
            //retorna la lista de historia
            return testCaseDTOList;
        }else{
            return null;
        }

    }

    public static TestCaseDTO obtenerInfoTestCase(int idTest)throws Exception{
        TestCaseDTO testCaseDTO1 = TestCaseDAO.selectDataTestCase(idTest);
        if(testCaseDTO1 != null){
            return testCaseDTO1;
        }else
        {
            return null;
        }

    }
    public static boolean modifDataTestCase (TestCaseDTO testCaseDTO)throws Exception{

        boolean exito = false;
        boolean update = TestCaseDAO.updateTestCase(testCaseDTO);
        if(update){
            exito = true;
        }
        else
        { exito = false;}
        return exito;
    }
}
