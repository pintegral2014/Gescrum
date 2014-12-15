package dto;

import java.util.Date;

/**
 * Created by Ripcrow on 08-12-2014.
 */
public class TestCaseDTO {
    private int testId;
    private String testEnun;
    private String testObj;
    private String testDato;
    private String testPrec;
    private String testEstado;
    private Date testFechaCre;
    private String testUsuCre;
    private int tareaId;
    private TareaDTO tareaDTO;
    private String testUsuMod;
    private Date testFechaMod;
    private String resultadoPrueba;

    public TestCaseDTO() {
    }

    public TestCaseDTO(int testId, String testEnun, String testObj, String testDato,
                       String testPrec, String testEstado, Date testFechaCre, String testUsuCre,
                       int tareaId, TareaDTO tareaDTO, String testUsuMod, Date testFechaMod, String resultadoPrueba) {
        this.testId = testId;
        this.testEnun = testEnun;
        this.testObj = testObj;
        this.testDato = testDato;
        this.testPrec = testPrec;
        this.testEstado = testEstado;
        this.testFechaCre = testFechaCre;
        this.testUsuCre = testUsuCre;
        this.tareaId = tareaId;
        this.tareaDTO = tareaDTO;
        this.testUsuMod = testUsuMod;
        this.testFechaMod = testFechaMod;
        this.resultadoPrueba = resultadoPrueba;
    }

    public String getResultadoPrueba() {
        return resultadoPrueba;
    }

    public void setResultadoPrueba(String resultadoPrueba) {
        this.resultadoPrueba = resultadoPrueba;
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

    public String getTestEstado() {
        return testEstado;
    }

    public void setTestEstado(String testEstado) {
        this.testEstado = testEstado;
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

    public TareaDTO getTareaDTO() {
        return tareaDTO;
    }

    public void setTareaDTO(TareaDTO tareaDTO) {
        this.tareaDTO = tareaDTO;
    }
}
