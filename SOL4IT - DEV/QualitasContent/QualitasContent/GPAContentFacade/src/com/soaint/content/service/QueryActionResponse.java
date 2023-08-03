package com.soaint.content.service;

import com.soaint.content.model.ListaDocumentos;

public class QueryActionResponse extends ActionResponse {
    
    private ListaDocumentos documentos;

    public void setDocumentos(ListaDocumentos documentos) {
        this.documentos = documentos;
    }

    public ListaDocumentos getDocumentos() {
        return documentos;
    }

}