package logica;

import dao.RepositorioDAO;
import dto.RepositorioDTO;

import javax.swing.*;
import java.util.List;

/**
 * Created by EmilioCesar on 26-11-2014.
 */
public class LogicaRepositorio {
    RepositorioDTO repositorio = new RepositorioDTO();

    public LogicaRepositorio() {
    }

    public LogicaRepositorio(RepositorioDTO repositorio) {
        this.repositorio = repositorio;
    }



    public boolean ingresarRepositorio(){
    boolean exito = RepositorioDAO.ingresarRepositorio(repositorio);
        if(exito)
        {
            return true;
        }
      return false;
    }

    public List<RepositorioDTO> listarRepositorio(){
        List<RepositorioDTO> listaRepositorio = RepositorioDAO.listarRepositorio(repositorio);
        if(listaRepositorio != null)
        {
            //retorna la lista de repositorios
            return listaRepositorio;
        }else{
            return null;
        }
    }
}
