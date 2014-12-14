package action;

import action.model.TestCaseModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.MensajeDTO;
import dto.TareaDTO;
import dto.TestCaseDTO;
import logica.LogicaTestCase;


import javax.swing.*;
import java.util.Map;

/**
 * Created by Ripcrow on 08-12-2014.
 */
public class TestCase extends ActionSupport implements ModelDriven {
    TestCaseModel testCaseModel = new TestCaseModel();

    @Override
    public Object getModel() {
        return testCaseModel;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    public String crearTestCase() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String usuario = (String)session.get("loginConexion");
        TestCaseDTO testCase = new TestCaseDTO();
        testCase.setTestEnun(testCaseModel.getTestEnun());
        testCase.setTestObj(testCaseModel.getTestObj());
        testCase.setTestDato(testCaseModel.getTestDato());
        testCase.setTestPrec(testCaseModel.getTestPrec());
        testCase.setTareaId(testCaseModel.getTareaId());
        testCase.setTestUsuCre(usuario);

        TareaDTO tareaDTO = new TareaDTO();
        tareaDTO.setHduTarID(testCaseModel.getTareaDTO().getHduTarID());
        testCase.setTareaDTO(tareaDTO);
        JOptionPane.showMessageDialog(null, "action");
        LogicaTestCase logicaTestCase = new LogicaTestCase(testCase);
        boolean insert = logicaTestCase.crearTestCase();
        if (insert) {
            testCaseModel.setMensajeDTO(new MensajeDTO("success", "<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "TestCase creado con exito</span>"));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {

            testCaseModel.setMensajeDTO(new MensajeDTO("error", "<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "TestCase no pudo ser creado</span>"));
            return ERROR;
        }
    }
}
