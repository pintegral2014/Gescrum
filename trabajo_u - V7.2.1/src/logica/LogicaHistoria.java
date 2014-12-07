package logica;

import dao.HistoriaDAO;
import dto.HistoriaDTO;

import java.util.List;

/**
 * Created by jordan on 06-07-2014.
 */
public class LogicaHistoria {

    HistoriaDTO historia = new HistoriaDTO();

    public LogicaHistoria() {
    }

    public LogicaHistoria(HistoriaDTO historia) {
        this.historia = historia;
    }

    public boolean creaHistoria() throws Exception {
        boolean exito = false;
        HistoriaDTO historia2 = HistoriaDAO.buscarHistoria(historia.getNombrehistoria());
        if (historia2 == null) {
            HistoriaDAO.insertHistoria(historia);
            exito = true;
        }
        return exito;
    }

    public List<HistoriaDTO> listaHistoria() throws Exception {
        List<HistoriaDTO> historiaDTO = HistoriaDAO.selectHistoria();
        return historiaDTO;
    }

    public HistoriaDTO traerDataHistoria(int idHis)throws Exception{
        HistoriaDTO historiaDTO = HistoriaDAO.obtenerData(idHis);
        if(historiaDTO != null){
            return historiaDTO;
        }
        return null;
    }
    public List<HistoriaDTO> listaHistoriaProyecto () throws Exception{
        List<HistoriaDTO> listahistoria = HistoriaDAO.proyectoHistoriaList(historia);
        if(listahistoria != null)
        {
            //retorna la lista de historia
            return listahistoria;
        }else{
            return null;
        }

    }

    public List<HistoriaDTO> listaHduProyecto (int idPro)throws Exception{

        List<HistoriaDTO> historiaDTOList = HistoriaDAO.proyectoHistoriaList2(idPro);
        if (historiaDTOList != null){
            return  historiaDTOList;
        }else {
            return null;
        }
    }
}
