package action.model;

/**
 * Created by jordan on 06-07-2014.
 */
public class HistoriaModel {
    private int prioridad;
    private int usuariocrea;
    private int estado;
    private String descripcion;
    private String nombrehistoria;



    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public int getUsuariocrea() {
        return usuariocrea;
    }

    public void setUsuariocrea(int usuariocrea) {
        this.usuariocrea = usuariocrea;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombrehistoria() {
        return nombrehistoria;
    }

    public void setNombrehistoria(String nombrehistoria) {
        this.nombrehistoria = nombrehistoria;
    }
}
