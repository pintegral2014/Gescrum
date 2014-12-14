package action;

import action.model.HistoriaModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dao.HistoriaDAO;
import dto.HistoriaDTO;
import dto.MensajeDTO;
import dto.ProyectoDTO;
import logica.LogicaHistoria;
import logica.LogicaProyecto;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;

import java.util.List;

/**
 * Created by jordan on 06-07-2014.
 */
public class Historia extends ActionSupport implements ModelDriven{
    HistoriaModel historiaModel = new HistoriaModel();

    private String idHis;

    public String getIdHis() {
        return idHis;
    }

    public void setIdHis(String idHis) {
        this.idHis = idHis;
    }



    @Override
    public Object getModel() {
        return historiaModel;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    public String listaProyectos() throws Exception {

        LogicaProyecto logicaProyecto = new LogicaProyecto();
        List<ProyectoDTO> listaPro = logicaProyecto.listaProyectos();

        if (listaPro.size() >= 1) {
            this.historiaModel.setListPro(listaPro);
            return SUCCESS;
        }
        else
            return ERROR;

    }
    public String proyectoListaHistoria() throws Exception {

        HistoriaDTO proyecto = new HistoriaDTO();
        proyecto.setProyectoDTO(this.historiaModel.getProyecto());

        LogicaHistoria logicaHistoria = new LogicaHistoria(proyecto);
        List<HistoriaDTO> listaHistoria = logicaHistoria.listaHistoriaProyecto();

        if(listaHistoria.size() > 0 ){

            this.historiaModel.setListHistorias(listaHistoria);

            return SUCCESS;

        }
        else {


            return ERROR;
        }
    }
    public String crearHistoria() throws Exception {

        HistoriaDTO newHistoria = new HistoriaDTO();


        newHistoria.setNombrehistoria(historiaModel.getNombrehistoria());
        newHistoria.setPrioridad(historiaModel.getPrioridad());
        newHistoria.setEventum(historiaModel.getEventum());
        newHistoria.setDependencia(historiaModel.getDependencia());
        newHistoria.setDescripcion(historiaModel.getDescripcion());
        newHistoria.setCriAceptacion(historiaModel.getCriAceptacion());
        newHistoria.setUsuariocrea(historiaModel.getUsuarioCrea());
        newHistoria.setSolicitadoPor(historiaModel.getSolicitadoPor());

        ProyectoDTO proyectoDTO = new ProyectoDTO();
        proyectoDTO.setProId(historiaModel.getProyecto().getProId());
        newHistoria.setProyectoDTO(proyectoDTO);
        // para cargar nuevamente la lista de proyectos
        this.historiaModel.setListPro( new LogicaProyecto().listaProyectos());
        LogicaHistoria logicaHistoria = new LogicaHistoria(newHistoria);
        boolean insert = logicaHistoria.creaHistoria();



        if (insert){

            historiaModel.setMensaje(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Historia "+ historiaModel.getNombrehistoria()+  " creada con exito</span>" ));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            historiaModel.setMensaje(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Historia " + historiaModel.getNombrehistoria() + " existente en registros</span>"));
            return ERROR;
        }
    } // fin metodo crearHistoria

    public String listarHDU() throws Exception {

        LogicaHistoria logicaHistoria = new LogicaHistoria();
        List<HistoriaDTO> lista = logicaHistoria.listaHistoria();

        if(lista.size() >= 0 ){
            this.historiaModel.setListHistorias(lista);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }

    public String buscarDataHistoria()throws Exception{
        LogicaHistoria logicaHistoria = new LogicaHistoria();
        //this.historiaR = logicaHistoria.traerDataHistoria(Integer.parseInt(this.idHis));
        HistoriaDTO historiaDTO = logicaHistoria.traerDataHistoria(Integer.parseInt(this.idHis));

        if(historiaDTO != null)
        {
            historiaModel.setHistoriaDTO(historiaDTO);
            return "historiaDataJSON";
        }
        return ERROR;
    }

    public String buscarHduProyecto()throws Exception{
        LogicaHistoria logicaHistoria = new LogicaHistoria();
        int pro = historiaModel.getProyecto().getProId();
        List<HistoriaDTO> historiaDTOList = logicaHistoria.listaHduProyecto(pro);

        if(historiaDTOList != null){
            this.historiaModel.setListHistorias(historiaDTOList);
            return SUCCESS;
        }
        else {
            return ERROR;
        }

    }

    public String modificarDataHistoria ()throws Exception{
        HistoriaDTO historiaDTO = new HistoriaDTO();
        historiaDTO.setHisId(historiaModel.getHisId());
        historiaDTO.setCriAceptacion(historiaModel.getCriAceptacion());
        historiaDTO.setEventum(historiaModel.getEventum());
        historiaDTO.setDescripcion(historiaModel.getDescripcion());
        historiaDTO.setPrioridad(historiaModel.getPrioridad());
        historiaDTO.setDependencia(historiaModel.getDependencia());

        boolean update = LogicaHistoria.modHistoria(historiaDTO);
        if(update){
            historiaModel.setMensaje(new MensajeDTO("success", "<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> Historia " +
                    historiaModel.getNombrehistoria() + " modificada con exito</span>"));
            return SUCCESS;
        }else {
            historiaModel.setMensaje(new MensajeDTO("error", "<span class='glyphicon glyphicon-remove' style='color:red; text-align: left; font-size: 40px;'></span> &nbsp; " +
                    "<span style='font-size: 18px; text-align: center;'> Historia " +
                    historiaModel.getNombrehistoria() + " no se ha podido modificar</span>"));
            return ERROR;

        }

    }

    public String borrarHdu()throws Exception{

        boolean delete = LogicaHistoria.borrarHist(historiaModel.getHisId());

        if(delete){
            historiaModel.setMensaje(new MensajeDTO("success", "<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> Historia " +
                    historiaModel.getNombrehistoria() + " borrada con exito</span>"));
            return SUCCESS;
        }else{
            historiaModel.setMensaje(new MensajeDTO("error", "<span class='glyphicon glyphicon-remove' style='color:red; text-align: left; font-size: 40px;'></span> &nbsp; " +
                    "<span style='font-size: 18px; text-align: center;'> Historia " +
                    historiaModel.getNombrehistoria() + " no se puede borrar, tiene tareas asignadas</span>"));
            return ERROR;
        }

    }
    public String listarHduConSrint() throws Exception {
        HistoriaDTO sprint = new HistoriaDTO();
        sprint.setSprint(this.historiaModel.getSprint());

        LogicaHistoria logicaHistoria = new LogicaHistoria(sprint);
        List<HistoriaDTO> lista = logicaHistoria.filtroHduConSprint();

        if(lista.size() >= 0 ){
            this.historiaModel.setListHistorias(lista);
            this.historiaModel.setSprint(sprint.getSprint());
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }

    public String listarHduSinSrint() throws Exception {
        HistoriaDTO sprint = new HistoriaDTO();
        sprint.setSprint(this.historiaModel.getSprint());

        LogicaHistoria logicaHistoria = new LogicaHistoria(sprint);
        List<HistoriaDTO> lista = logicaHistoria.filtroHduSinSprint();

        if(lista.size() >= 0 ){
            this.historiaModel.setListHistorias(lista);
            this.historiaModel.setSprint(sprint.getSprint());
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }

}
