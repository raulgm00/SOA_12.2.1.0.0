package com.soaint.content.actions;

public class RespuestaMetodo {
    
    private boolean exito;
    private String errorGenerico;
    private String codigoRespuesta;
    private String aux;
    
    public RespuestaMetodo() {
        super();
        exito=true;
    }

    public void setExito(boolean exito) {
        this.exito = exito;
    }

    public boolean isExito() {
        return exito;
    }

    public void setErrorGenerico(String errorGenerico) {
        this.errorGenerico = errorGenerico;
    }

    public String getErrorGenerico() {
        return errorGenerico;
    }

    public void setCodigoRespuesta(String codigoRespuesta) {
        this.codigoRespuesta = codigoRespuesta;
    }

    public String getCodigoRespuesta() {
        return codigoRespuesta;
    }

    public void setAux(String aux) {
        this.aux = aux;
    }

    public String getAux() {
        return aux;
    }    
}
