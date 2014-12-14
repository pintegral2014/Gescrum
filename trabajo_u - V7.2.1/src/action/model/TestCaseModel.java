package action.model;

import dto.MensajeDTO;
import dto.TareaDTO;
import dto.TestCaseDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by Ripcrow on 08-12-2014.
 */
public class TestCaseModel {

    private int testId;
    private String testEnun;
    private String testObj;
    private String testDato;
    private String testPrec;
    private String testEstado;
    private Date testFechaCre;
    private String testUsuCre;
    private int tareaId;
    private int tareaId2;
    private List<TestCaseDTO> listaTest;
    private TestCaseDTO testCaseDTO;
    private MensajeDTO mensajeDTO;
    private TareaDTO tareaDTO;
    private String testUsuMod;
    private Date testFechaMod;

    public TestCaseModel() {
    }

    public int getTareaId2() {
        return tareaId2;
    }

    public void setTareaId2(int tareaId2) {
        this.tareaId2 = tareaId2;
    }

    public String getTestUsuMod() {
        return testUsuMod;
    }

    public void setTestUsuMod(String testUsuMod) {
        this.testUsuMod = testUsuMod;
    }

    public Date getTestFechaMod() {
        return testFechaMod;
    }

    public void setTestFechaMod(Date testFechaMod) {
        this.testFechaMod = testFechaMod;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public String getTestEnun() {
        return testEnun;
    }

    public void setTestEnun(String testEnun) {
        this.testEnun = testEnun;
    }

    public String getTestObj() {
        return testObj;
    }

    public void setTestObj(String testObj) {
        this.testObj = testObj;
    }

    public String getTestDato() {
        return testDato;
    }

    public void setTestDato(String testDato) {
        this.testDato = testDato;
    }

    public String getTestPrec() {
        return testPrec;
    }

    public void setTestPrec(String testPrec) {
        this.testPrec = testPrec;
    }

    public Date getTestFechaCre() {
        return testFechaCre;
    }

    public void setTestFechaCre(Date testFechaCre) {
        this.testFechaCre = testFechaCre;
    }

    public String getTestUsuCre() {
        return testUsuCre;
    }

    public void setTestUsuCre(String testUsuCre) {
        this.testUsuCre = testUsuCre;
    }

    public int getTareaId() {
        return tareaId;
    }

    public void setTareaId(int tareaId) {
        this.tareaId = tareaId;
    }

    public List<TestCaseDTO> getListaTest() {
        return listaTest;
    }

    public void setListaTest(List<TestCaseDTO> listaTest) {
        this.listaTest = listaTest;
    }

    public TestCaseDTO getTestCaseDTO() {
        return testCaseDTO;
    }

    public void setTestCaseDTO(TestCaseDTO testCaseDTO) {
        this.testCaseDTO = testCaseDTO;
    }

    public MensajeDTO getMensajeDTO() {
        return mensajeDTO;
    }

    public void setMensajeDTO(MensajeDTO mensajeDTO) {
        this.mensajeDTO = mensajeDTO;
    }

    public String getTestEstado() {
        return testEstado;
    }

    public void setTestEstado(String testEstado) {
        this.testEstado = testEstado;
    }

    public TareaDTO getTareaDTO() {
        return tareaDTO;
    }

    public void setTareaDTO(TareaDTO tareaDTO) {
        this.tareaDTO = tareaDTO;
    }
}
