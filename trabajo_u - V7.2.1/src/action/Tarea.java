package action;

import action.model.TareaModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.MensajeDTO;
import dto.RepositorioDTO;
import dto.TareaDTO;
import dto.UsuarioDTO;
import logica.LogicaTarea;
import logica.LogicaUsuario;

import javax.swing.*;
import java.util.List;

/**
 * Created by EmilioCesar on 28-11-2014.
 */
public class Tarea extends ActionSupport implements ModelDriven {
    TareaModel modelTarea = new TareaModel();
    @Override
    public Object getModel() {
        return modelTarea ;
    }

    @Override
    public String execute()  {return SUCCESS;}

    public String ListaTareaHdu() throws Exception{
        // creo variable
        TareaDTO tareaIdHis = new TareaDTO();
        // Asigno Datos
        tareaIdHis.setHduTarID(this.modelTarea.getHduTarID());
        //Logica tareas
        LogicaTarea logicatarea = new LogicaTarea(tareaIdHis);
        //Logica usuarios
        LogicaUsuario logicaUsuario = new LogicaUsuario();

        int idHistoria = this.modelTarea.getHduTarID();
        int sprint = this.modelTarea.getSprint();


        List<TareaDTO> listaTarea = logicatarea.listaTareaFil();
        List<UsuarioDTO> listaUsuario = logicaUsuario.listaUsuarioGrupoSprint(sprint);


        if(tareaIdHis.getHduTarID() >= 0 ){

            this.modelTarea.setListaTarea(listaTarea);
            this.modelTarea.setHduTarID(idHistoria);
            this.modelTarea.setSprint(sprint);
            this.modelTarea.setListaUsuariosTarea(listaUsuario);

            return SUCCESS;
        }
        else {

            return ERROR;
        }
    }


    public String ListaTareaHdu2() throws Exception{
        // creo variable
        TareaDTO tareaIdHis = new TareaDTO();
        // Asigno Datos
        tareaIdHis.setHduTarID(this.modelTarea.getHduTarID());
        //Logica tareas
        LogicaTarea logicatarea = new LogicaTarea(tareaIdHis);
        //Logica usuarios
        LogicaUsuario logicaUsuario = new LogicaUsuario();

        int idHistoria = this.modelTarea.getHduTarID();
        int sprint = this.modelTarea.getSprint();


        List<TareaDTO> listaTarea = logicatarea.listaTareaFil2();
        List<UsuarioDTO> listaUsuario = logicaUsuario.listaUsuarioGrupoSprint(sprint);


        if(tareaIdHis.getHduTarID() >= 0 ){

            this.modelTarea.setListaTarea(listaTarea);
            this.modelTarea.setHduTarID(idHistoria);
            this.modelTarea.setSprint(sprint);
            this.modelTarea.setListaUsuariosTarea(listaUsuario);

            return SUCCESS;
        }
        else {

            return ERROR;
        }
    }

    public String IngresarTarea() throws  Exception{
        TareaDTO tarea = new TareaDTO();
        tarea.setDescripcionTarea(this.modelTarea.getDescripcionTarea());
        tarea.setUsuCreador(this.modelTarea.getUsuCreador());
        tarea.setHduTarID(this.modelTarea.getHduTarID());

        LogicaTarea pruebaTarea = new LogicaTarea(tarea);
        boolean prueba = pruebaTarea.crearTarea();
        if(prueba){

            modelTarea.setMensaje(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'>Tarea creada con exito</span>" ));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            modelTarea.setMensaje(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'>La tarea no se ha creado</span>"));
            return ERROR;
        }
    }
    public String ListaTareaHduSinIteraciones() throws Exception{
        // creo variable
        TareaDTO tareaIdHis = new TareaDTO();
        // Asigno Datos
        tareaIdHis.setHduTarID(this.modelTarea.getHduTarID());
        //Logica tareas
        LogicaTarea logicatarea = new LogicaTarea(tareaIdHis);
        //Logica usuarios

        int idHistoria = this.modelTarea.getHduTarID();
        int sprint = this.modelTarea.getSprint();


        List<TareaDTO> listaTarea = logicatarea.listaTareaFilSinIteraciones();



        if(tareaIdHis.getHduTarID() >= 0 ){

            this.modelTarea.setListaTarea(listaTarea);
            this.modelTarea.setHduTarID(idHistoria);
            this.modelTarea.setSprint(sprint);

            return SUCCESS;
        }
        else {

            return ERROR;
        }
    }
}
