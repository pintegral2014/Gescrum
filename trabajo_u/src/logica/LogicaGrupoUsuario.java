package logica;

import dao.GrupoUsuarioDAO;
import dto.GrupoUsuarioDTO;

import javax.swing.*;
import java.util.List;

/**
 * Created by Ripcrow on 27-11-2014.
 */
public class LogicaGrupoUsuario {
    GrupoUsuarioDTO grupousuario = new GrupoUsuarioDTO();

    public LogicaGrupoUsuario(GrupoUsuarioDTO grupousuario){
        this.grupousuario = grupousuario;
    }

    public LogicaGrupoUsuario() {
    }

    public List<GrupoUsuarioDTO> listaGrupoUsuario() throws Exception{
        List<GrupoUsuarioDTO> listaGruposUsuarios = GrupoUsuarioDAO.listaGruUsu(grupousuario);
        if(listaGruposUsuarios != null)
        {
            //retorna la lista de grupos x usuario
            return listaGruposUsuarios;
        }else{
            return null;
        }
    }

    public List<GrupoUsuarioDTO> listaUsuarioSinGrupo() throws Exception{
        List<GrupoUsuarioDTO> listaUsuarioSinGrupo = GrupoUsuarioDAO.listaUsuSin(grupousuario);
        if(listaUsuarioSinGrupo != null)
        {
            //retorna la lista de usuarios sin grupo
            return listaUsuarioSinGrupo;
        }else{
            return null;
        }
    }

    public boolean asociarusuario() throws Exception{
        boolean exito = GrupoUsuarioDAO.asociarUsuario(grupousuario);
        if(exito){
            return exito;
        }
        else
            return false;
    }

    public boolean desasociarusuario() throws Exception{
        boolean exito = GrupoUsuarioDAO.desasociarUsuario(grupousuario);
        if(exito){
            return exito;
        }
        else
            return false;
    }
}
