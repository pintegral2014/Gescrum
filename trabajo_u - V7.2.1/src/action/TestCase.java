package action;

import action.model.TestCaseModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.HistoriaDTO;
import dto.MensajeDTO;
import dto.TareaDTO;
import dto.TestCaseDTO;
import logica.LogicaTestCase;
import org.apache.struts2.interceptor.SessionAware;


import javax.servlet.annotation.ServletSecurity;
import javax.swing.*;
import java.util.List;
import java.util.Map;

/**
 * Created by Ripcrow on 08-12-2014.
 */
public class TestCase extends ActionSupport implements ModelDriven, SessionAware {
    TestCaseModel testCaseModel = new TestCaseModel();
    private Map<String, Object> session;

    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

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
        testCase.setTestUsuCre(usuario);
        TareaDTO tareaDTO = new TareaDTO();
        tareaDTO.setHduTarID(testCaseModel.getTareaId());
        testCase.setTareaDTO(tareaDTO);

        LogicaTestCase logicaTestCase = new LogicaTestCase(testCase);
        boolean insert = logicaTestCase.crearTestCase(testCase);
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

    public String obtenerDataTestCase()throws Exception{

        TestCaseDTO testCaseDTO = LogicaTestCase.obtenerInfoTestCase(testCaseModel.getTestId());

        if(testCaseDTO != null)
        {
            testCaseModel.setTestCaseDTO(testCaseDTO);
            return "testcaseDataJSON";
        }
        return ERROR;
    }

    public String obtenerTestCasexTarea()throws Exception{
        List<TestCaseDTO> testCaseDTOList = LogicaTestCase.testcasexTarea(testCaseModel.getTareaId());

        if(testCaseDTOList.size() > 0){
            testCaseModel.setListaTest(testCaseDTOList);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
    public String obtenerTestCasexTarea2()throws Exception{
        List<TestCaseDTO> testCaseDTOList = LogicaTestCase.testcasexTarea(testCaseModel.getTareaId2());

        if(testCaseDTOList.size() > 0){
            testCaseModel.setListaTest(testCaseDTOList);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }

    public String modificarDataTestCase()throws Exception{
        String usuarioSession = (String) session.get("loginConexion");
        TestCaseDTO testCaseDTO = new TestCaseDTO();
        testCaseDTO.setTestId(testCaseModel.getTestId());
        testCaseDTO.setTestEnun(testCaseModel.getTestEnun());
        testCaseDTO.setTestDato(testCaseModel.getTestDato());
        testCaseDTO.setTestObj(testCaseModel.getTestObj());
        testCaseDTO.setTestPrec(testCaseModel.getTestPrec());
        testCaseDTO.setTestEstado(testCaseModel.getTestEstado());
        testCaseDTO.setResultadoPrueba(testCaseModel.getResultadoPrueba());
        testCaseDTO.setTareaId(testCaseModel.getTareaId2());
        testCaseDTO.setTestUsuMod(usuarioSession);

        boolean update = LogicaTestCase.modifDataTestCase(testCaseDTO);
        if(update){
            testCaseModel.setMensajeDTO(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "test case modificado con exito</span>" ));
            return SUCCESS;
        }else
        {
            testCaseModel.setMensajeDTO(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "No se ha podido mopdificar test Case</span>"));
            return ERROR;
        }

    }
    public String borrarTestcase()throws Exception{

        boolean delete = LogicaTestCase.eliminarTestCase(testCaseModel.getTestId());
        if(delete){
            testCaseModel.setMensajeDTO(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "test case eliminado con exito</span>" ));
            return SUCCESS;
        }else {
            testCaseModel.setMensajeDTO(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "No se ha podido eliminar el test case</span>" ));
            return ERROR;
        }

    }
    public String ejecutarTestCase()throws Exception{
        String usuarioSession = (String) session.get("loginConexion");
        TestCaseDTO testCaseDTO = new TestCaseDTO();
        testCaseDTO.setTestId(testCaseModel.getTestId());
        testCaseDTO.setTestEnun(testCaseModel.getTestEstado());
        testCaseDTO.setTestDato(testCaseModel.getTestDato());
        testCaseDTO.setTestObj(testCaseModel.getTestObj());
        testCaseDTO.setTestPrec(testCaseModel.getTestPrec());
        testCaseDTO.setTestUsuMod(usuarioSession);

        boolean update = LogicaTestCase.modifDataTestCase(testCaseDTO);
        if(update){
            testCaseModel.setMensajeDTO(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "test case modificado con exito</span>" ));
            return SUCCESS;
        }else
        {
            testCaseModel.setMensajeDTO(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "No se ha podido mopdificar test Case</span>"));
            return ERROR;
        }

    }

}
