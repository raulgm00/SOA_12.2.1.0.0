package com.soaint.content.model;

import java.io.Serializable;

public class TipoDocumentoTipo implements Serializable{

    private String codigo;
    private String estatus;
    private String nombre;
    private Documento documento;

    public TipoDocumentoTipo() {

    }

    public TipoDocumentoTipo(String codigo,String estatus,String nombre) {
        this.codigo=codigo;
        this.estatus=estatus;
        this.nombre=nombre;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDocumento(Documento documento) {
        this.documento = documento;
    }

    public Documento getDocumento() {
        return documento;
    }    
}
