package dto;

import java.io.File;
import java.util.Date;

/**
 * Created by EmilioCesar on 26-11-2014.
 */
public class RepositorioDTO {
    private int idHdu;
    private File archivo;
    private String archivoFileName;
    private String archivoContentType;
    private String descripcionRepo;
    private Date fechaCreacion;


    public RepositorioDTO(int idHdu, File archivo, String archivoFileName, String archivoContentType,String descripcionRepo,Date fechaCreacion) {
        this.idHdu = idHdu;
        this.archivo = archivo;
        this.archivoFileName = archivoFileName;
        this.archivoContentType = archivoContentType;
        this.descripcionRepo = descripcionRepo;
        this.fechaCreacion= fechaCreacion;

    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getDescripcionRepo() {
        return descripcionRepo;
    }

    public void setDescripcionRepo(String descripcionRepo) {
        this.descripcionRepo = descripcionRepo;
    }

    public RepositorioDTO() {
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
