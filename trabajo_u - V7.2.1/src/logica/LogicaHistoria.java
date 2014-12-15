package logica;

import com.sun.org.apache.xpath.internal.operations.Bool;
import dao.HistoriaDAO;
import dao.RepositorioDAO;
import dao.TareaDAO;
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

    public static Boolean modHistoria (HistoriaDTO historiaDTO)throws Exception{

        boolean exito = false;
        boolean update = HistoriaDAO.updateHistoria(historiaDTO);
        if(update){
            exito = true;
        }
        else
        { exito = false;}
        return exito;
    }

    public static boolean borrarHist(int idhis) throws Exception {
        boolean existe = false;
        boolean buscarTareas = TareaDAO.selectTareaXHdu(idhis);

        if(buscarTareas){
            return existe;
        }
        else
        {
            boolean buscarRepo = RepositorioDAO.selectRepoHdu(idhis);
            if(buscarRepo){
                    // si es true borra el repositorio y luego la historia
                    RepositorioDAO.deleteRepo(idhis);
                    HistoriaDAO.deleteHdu(idhis);
                    existe = true;
            }
            else
            {
                // buscarRepo = false, solo borra la historia ya que no contiene repositorio
                HistoriaDAO.deleteHdu(idhis);
                existe = true;
            }
        }

        return existe;
    }
    public List<HistoriaDTO> filtroHduConSprint() throws Exception{
        List<HistoriaDTO> listahistoria = HistoriaDAO.filtroHduConSprint(historia);

        return listahistoria;


    }


    public List<HistoriaDTO> filtroHduSinSprint() throws Exception{

        List<HistoriaDTO> listahistoria = HistoriaDAO.filtroHduSinSprint();

        return listahistoria;


    }

    public List<HistoriaDTO> hduPorGrupo(int grupo) throws Exception{

        List<HistoriaDTO> listahistoria = HistoriaDAO.hduPorGrupo(grupo);

        return listahistoria;


    }
}
