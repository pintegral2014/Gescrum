package logica;

import dao.CargoDAO;
import dao.RolDAO;
import dto.RolDTO;

import javax.swing.*;
import java.util.Arrays;
import java.util.List;

/**
 * Created by jordan on 06-07-2014.
 */
public class LogicaRol {

    public List<RolDTO> listRol () throws Exception{
        List<RolDTO> listaRoles = RolDAO.listaRoles();
        if(listaRoles != null)
        {
            // retorna la lista de roles
            return listaRoles;
        }else{
            // return null
            return null;
        }

        
    }
}
