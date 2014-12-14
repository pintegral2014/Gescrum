package logica;

import dao.GrupoDAO;
import dto.GrupoDTO;

import java.util.List;

/**
 * Created by Ripcrow on 26-11-2014.
 */
public class LogicaGrupo {

    GrupoDTO grupo = new GrupoDTO();

    public LogicaGrupo(GrupoDTO grupo){
        this.grupo = grupo;
    }

    public LogicaGrupo() {
    }

    public List<GrupoDTO> listaGrupo() throws Exception{
        List<GrupoDTO> listaGrupos = GrupoDAO.listaGrupos();
        if(listaGrupos != null)
        {
            //retorna la lista de grupos
            return listaGrupos;
        }else{
            return null;
        }
    }

    public GrupoDTO traerDataGrupo(int idGru)throws Exception{
        GrupoDTO grupoDTO = GrupoDAO.obtenerDataGrupo(idGru);
        if(grupoDTO != null){
            return grupoDTO;
        }
        return null;
    }

    public static boolean modDataGrupo (GrupoDTO grupoDTO)throws Exception{

        boolean exito = false;
        boolean update = GrupoDAO.updateGrupo(grupoDTO);
        if(update == true){
            exito = true;
        }
        return exito;
    }

    public static boolean creaGrupo (GrupoDTO grupo)throws Exception{
        boolean exito = false;
        boolean insert = GrupoDAO.insertGrupo(grupo);
        if(insert){
            exito = true;
        }
        return exito;
    }
    public List<GrupoDTO> listaGrupoValidos() throws Exception{
        List<GrupoDTO> listaGrupos = GrupoDAO.listaGruposValidos();
        if(listaGrupos != null)
        {
            //retorna la lista de grupos
            return listaGrupos;
        }else{
            return null;
        }
    }
}
