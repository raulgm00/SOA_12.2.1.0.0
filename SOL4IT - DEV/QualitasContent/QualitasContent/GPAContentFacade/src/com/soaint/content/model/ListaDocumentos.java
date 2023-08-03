package com.soaint.content.model;


import java.io.Serializable;

import java.util.ArrayList;
import java.util.Iterator;

public class ListaDocumentos  extends ArrayList<Documento> implements Serializable {
    
    @SuppressWarnings("compatibility:-2591459619760401034")
        
    private static final long serialVersionUID = 1L;

    private boolean exito;
    private String errorGenerico;
    private String codigoRespuesta;
    private String aux;
    
    public void agregar(Documento d){
        super.add( d );
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
    
    public String toXml(){
        StringBuffer buffer = new StringBuffer();
        buffer.append("<documentos>");
        Iterator<Documento> iterD = this.iterator();
        Documento dataElement = null;
        while( iterD.hasNext() ){
            dataElement = iterD.next();
            
            buffer.append( dataElement.toXml() );
        }
        buffer.append("</documentos>");
        
        return buffer.toString();
    }
    
}
