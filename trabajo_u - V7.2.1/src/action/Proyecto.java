package action;

import action.model.ProyectoModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.MensajeDTO;
import dto.ProyectoDTO;
import logica.LogicaProyecto;

import java.util.List;
import java.util.Map;

/**
 * Created by Jordan on 29-11-2014.
 */
public class Proyecto extends ActionSupport implements ModelDriven {
    ProyectoModel proyectoModel = new ProyectoModel();
    private int idPro;

    public int getIdPro() {
        return idPro;
    }

    public void setIdPro(int idPro) {
        this.idPro = idPro;
    }

    @Override
    public Object getModel() {
        return proyectoModel;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    public String listaProyectos() throws Exception {

        LogicaProyecto logicaProyecto = new LogicaProyecto();
        List<ProyectoDTO> listaPro = logicaProyecto.listaProyectos2();

        if (listaPro.size() >= 0) {
            this.proyectoModel.setListPro(listaPro);
            return SUCCESS;
        }
        else
            return ERROR;

    }

    public String buscarInfoProyecto()throws Exception{
        LogicaProyecto logicaProyecto = new LogicaProyecto();

        ProyectoDTO proyectoDTO = logicaProyecto.traerDataProyecto(this.idPro);

        if(proyectoDTO != null)
        {
            proyectoModel.setProyectoDTO(proyectoDTO);
            return "historiaDataJSON";
        }
        return ERROR;
    }

    public String modificarDataProyecto() throws Exception {
        ProyectoDTO proyectoDTO = new ProyectoDTO();
        proyectoDTO.setProId(proyectoModel.getProId());
        proyectoDTO.setProNombre(proyectoModel.getProNombre());
        proyectoDTO.setEstado(proyectoModel.getEstado());
        proyectoDTO.setProDescripcion(proyectoModel.getProDescripcion());

        boolean exito = LogicaProyecto.modDataProyecto(proyectoDTO);

        if(exito == true){

            proyectoModel.setMensajeDTO(new MensajeDTO("success", "<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> Proyecto " +
                    proyectoModel.getProNombre() + " modificado con exito</span>"));
            return SUCCESS;
        }
        proyectoModel.setMensajeDTO(new MensajeDTO("error", "<span class='glyphicon glyphicon-remove' style='color:red; text-align: left; font-size: 40px;'></span> &nbsp; " +
                "<span style='font-size: 18px; text-align: center;'> Proyecto " +
                proyectoModel.getProNombre() + " no se ha podido modificar</span>"));
        return ERROR;
    }

    public String crearProyecto() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String usuario = (String)session.get("loginConexion");
        ProyectoDTO proyectoDTO = new ProyectoDTO();
        proyectoDTO.setProNombre(proyectoModel.getProNombre());
        proyectoDTO.setEstado(proyectoModel.getEstado());
        proyectoDTO.setProDescripcion(proyectoModel.getProDescripcion());
        proyectoDTO.setUsuCrea(usuario);

        LogicaProyecto logicaProyecto = new LogicaProyecto();
        boolean insert = logicaProyecto.crearProyecto(proyectoDTO);
        if (insert) {
            proyectoModel.setMensajeDTO(new MensajeDTO("success", "<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Historia " + proyectoModel.getProNombre() + " creado con exito</span>"));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {

            proyectoModel.setMensajeDTO(new MensajeDTO("error", "<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Historia " + proyectoModel.getProNombre() + " existente en registros</span>"));
            return ERROR;
        }
    }
}
