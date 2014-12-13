package action;
import java.io.File;
import java.util.List;

import action.model.RepositorioModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dto.RepositorioDTO;
import logica.LogicaRepositorio;

import javax.swing.*;

/**
 * Created by EmilioCesar on 25-11-2014.
 */
public class CargaArchivo extends ActionSupport implements ModelDriven {

    RepositorioModel repositorioModel = new RepositorioModel();

    @Override
    public Object getModel() {
        return repositorioModel ;
    }

    @Override
    public String execute()  {return SUCCESS;}


    public String cargarArchivo(){
        RepositorioDTO newRepo =new RepositorioDTO();

        newRepo.setArchivo(repositorioModel.getArchivo());
        newRepo.setArchivoFileName(repositorioModel.getArchivoFileName());
        newRepo.setIdHdu(repositorioModel.getIdHdu());
        newRepo.setDescripcionRepo(repositorioModel.getDescripcionRepo());
        File nuevoArchivo = new File("C:/Users/Jordan/Documents/GESCRUM APP/trunk/trabajo_u - V7.2.1/web/repositorio", newRepo.getArchivoFileName());
        newRepo.getArchivo().renameTo(nuevoArchivo);
        if(nuevoArchivo != null)
        {
            LogicaRepositorio repositorio = new LogicaRepositorio(newRepo);
           boolean prueba = repositorio.ingresarRepositorio();
            if(prueba){
                JOptionPane.showMessageDialog(null,"Archivo creado");
                return SUCCESS;
            }
        }
        JOptionPane.showMessageDialog(null,"Archivo no creado");
        return ERROR;
    }

    public String listarRepositorios(){
        RepositorioDTO idHduRepo =new RepositorioDTO();
        idHduRepo.setIdHdu(repositorioModel.getIdHdu());
        LogicaRepositorio logicarepositorio = new LogicaRepositorio(idHduRepo);
        List<RepositorioDTO> listaRepositorio = logicarepositorio.listarRepositorio();

        if(idHduRepo.getIdHdu() >= 1 ){

            this.repositorioModel.setListarepositorio(listaRepositorio);

            return SUCCESS;
        }
        else {

            return ERROR;
        }
    }

}
