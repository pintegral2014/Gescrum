package dto;

/**
 * Created by jordan on 28-05-2014.
 */
public class MensajeDTO {
    private  String tipo;
    private String texto;

    public MensajeDTO(String tipo, String texto) {
        this.tipo = tipo;
        this.texto = texto;
    }

    public MensajeDTO(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }
}
