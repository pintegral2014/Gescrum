package action;

import action.model.IteracionModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.net.httpserver.Authenticator;
import dto.IteracionDTO;
import dto.MensajeDTO;
import logica.LogicaIteracion;

import javax.swing.*;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by EmilioCesar on 08-12-2014.
 */
public class Iteracion extends ActionSupport implements ModelDriven {
    IteracionModel iteracionModel = new IteracionModel();



    @Override
    public Object getModel() {
        return iteracionModel;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }


    public String ingresaIteracion()throws Exception{

       IteracionDTO newIteracion = new IteracionDTO();


        newIteracion.setIteracionIdSprint(iteracionModel.getIteracionIdSprint());
        newIteracion.setIteracionEsfuerzo(iteracionModel.getIteracionEsfuerzo());
        newIteracion.setIteracionIdTarea(iteracionModel.getIteracionIdTarea());
        newIteracion.setIteracionUsuarioAsignado(iteracionModel.getIteracionUsuarioAsignado().getUsuLoginConexion());
        newIteracion.setIteracionEstado("En Proceso");
       //Ingresa Iteracion
        LogicaIteracion LogicaIteracion = new LogicaIteracion(newIteracion);
        boolean insert = LogicaIteracion.ingresaIteracion();

        if (insert){

            iteracionModel.setMensaje(new MensajeDTO("success",newIteracion.getMensajeAux()));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            iteracionModel.setMensaje(new MensajeDTO("error",newIteracion.getMensajeAux()));
            return ERROR;
        }

    } // fin metodo ingresarIteracion




    public String ingresaIteracion0()throws Exception {

        IteracionDTO newIteracion = new IteracionDTO();

        newIteracion.setIteracionIdSprint(iteracionModel.getIteracionIdSprint());
        newIteracion.setIteracionEsfuerzo(iteracionModel.getIteracionEsfuerzo());
        newIteracion.setIteracionIdTarea(iteracionModel.getIteracionIdTarea());
        newIteracion.setIteracionEstado("En Proceso");
        //Ingresa Iteracion
        LogicaIteracion LogicaIteracion = new LogicaIteracion(newIteracion);
        boolean insert = LogicaIteracion.ingresaIteracion0();

        if (insert){

            iteracionModel.setMensaje(new MensajeDTO("success","<span class='glyphicon glyphicon-ok' " +
                    "style='color:green; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Iteracion Ingresada con exito</span>" ));
            //se crea el registro de usuario en la bd
            return SUCCESS;
        } else {
            // no se crea registro de usuario

            iteracionModel.setMensaje(new MensajeDTO("error","<span class='glyphicon glyphicon-remove' " +
                    "style='color:red; text-align: left; font-size: 40px;'></span> &nbsp;<span style='font-size: 18px; text-align: center;'> " +
                    "Iteracion no ingresada</span>"));
            return ERROR;
        }

    } // fin metodo ingresarIteraciontodo ingresarIteracion

public String misTareas() throws Exception{
        // creo variable

        // Asigno Datos
        Map session = ActionContext.getContext().getSession();
        String usuarioSession = (String) session.get("loginConexion");
        //Logica tareas
        LogicaIteracion logicatarea = new LogicaIteracion();
        //Logica usuarios

        List<IteracionDTO> listaIteracion = logicatarea.listaTareaDeUsuario(usuarioSession);



        if(listaIteracion.size() >= 0 ){

            this.iteracionModel.setListaiteracion(listaIteracion);
            return SUCCESS;
        }
        else {

            return ERROR;
        }
    }

    public String dropearHistorias() throws Exception{
        IteracionDTO modificaIteracion = new IteracionDTO();
        modificaIteracion.setIdHistoria(this.iteracionModel.getIdHistoriaIteracion());
        modificaIteracion.setIteracionIdSprint(this.iteracionModel.getIteracionIdSprint());
        LogicaIteracion dropearHistoria = new LogicaIteracion(modificaIteracion);
        boolean exito = dropearHistoria.dropearHistoria();
        if(exito){
            return SUCCESS;
        }
        else{
            return ERROR;
        }

    }
}
