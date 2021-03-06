package logica;

import dao.HistoriaDAO;
import dao.TareaDAO;
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
        String estadoActual = testCaseDTO.getTestEstado();
        boolean update = TestCaseDAO.updateTestCase(testCaseDTO);
        boolean updateTarea = false;

        if(update){
            if(estadoActual.equals("Aceptado")){
                updateTarea = TareaDAO.updateTareaxTestCase(testCaseDTO.getTareaId(), testCaseDTO.getTestEstado());
                /*if(updateTarea){
                    HistoriaDAO.updateHduxTestCase(testCaseDTO.getTareaId(), testCaseDTO.getTestEstado());
                }*/
            }else if(estadoActual.equals("Rechazado")){
                    updateTarea = TareaDAO.updateTareaxTestCase(testCaseDTO.getTareaId(), testCaseDTO.getTestEstado());
                    /*if(updateTarea){
                        HistoriaDAO.updateHduxTestCase(testCaseDTO.getTareaId(), testCaseDTO.getTestEstado());
                    }*/
                  }
            exito = true;
        }
        else
        { exito = false;}
        return exito;
    }

    public static boolean eliminarTestCase (int idTest)throws Exception{
        boolean borrar = TestCaseDAO.deleteTestCase(idTest);
        if (borrar){
            return true;
        }else{
            return false;
        }

    }
}
