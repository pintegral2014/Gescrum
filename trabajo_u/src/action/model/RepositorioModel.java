package action.model;

import dto.RepositorioDTO;

import java.io.File;
import java.util.List;

/**
 * Created by EmilioCesar on 26-11-2014.
 */
public class RepositorioModel {
    private int idHdu;
    private File archivo;
    private String archivoFileName;
    private String archivoContentType;
    private String descripcionRepo;
    private List<RepositorioDTO> listarepositorio;


    public RepositorioModel() {
    }

    public List<RepositorioDTO> getListarepositorio() {
        return listarepositorio;
    }

    public void setListarepositorio(List<RepositorioDTO> listarepositorio) {
        this.listarepositorio = listarepositorio;
    }

    public String getDescripcionRepo() {
        return descripcionRepo;
    }

    public void setDescripcionRepo(String descripcionRepo) {
        this.descripcionRepo = descripcionRepo;
    }

    public int getIdHdu() {
        return idHdu;
    }

    public void setIdHdu(int idHdu) {
        this.idHdu = idHdu;
    }

    public File getArchivo() {
        return archivo;
    }

    public void setArchivo(File archivo) {
        this.archivo = archivo;
    }

    public String getArchivoFileName() {
        return archivoFileName;
    }

    public void setArchivoFileName(String archivoFileName) {
        this.archivoFileName = archivoFileName;
    }

    public String getArchivoContentType() {
        return archivoContentType;
    }

    public void setArchivoContentType(String archivoContentType) {
        this.archivoContentType = archivoContentType;
    }
}
