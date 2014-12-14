package logica;

import dto.TestCaseDTO;
import dao.TestCaseDAO;

import javax.swing.*;

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

    public boolean crearTestCase()throws Exception{
        JOptionPane.showMessageDialog(null, "OK");
        boolean exito = false;
        boolean insert = false;
        insert = TestCaseDAO.insertTestCase(testCaseDTO);
        if(insert){
            exito = true;
        }
        return exito;
    }
}
