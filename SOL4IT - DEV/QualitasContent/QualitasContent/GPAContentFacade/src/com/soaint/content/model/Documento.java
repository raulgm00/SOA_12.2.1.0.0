package com.soaint.content.model;

import java.io.Serializable;

public class Documento implements Serializable{

    private String idDocumento;
    private TipoDocumentoTipo nombre;
    private Boolean isXml;
    private String observaciones;

    private boolean selected;
    private String dRevLabel;
    private String dID;
    private String creationDate;
    private String dDocName;
    private String docName;
    private String title;
    private String customer;
    private String description;
    private String publishedFrom;
    private String publishedTo;
    private String extension;
    private String originalName;
    private String dDocType;
    private String dDocAuthor; 
    private String dSecurityGroup;
    private String dDocAccount;
    private String url;
    private String folioFiscalFactura;
    private String numeroSolicitud;

    public Documento() {

    }
    
    
    public String toXml(){
        StringBuffer buffer = new StringBuffer();
        buffer.append( "<documento>"   );
        buffer.append( "<id>" + dID+  "</id>" );
        buffer.append( "<isXml>" +isXml +  "</isXml>" );
        buffer.append( "<dDocName>" + dDocName+  "</dDocName>" );
        buffer.append( "<docName>" + docName+  "</docName>" );
        buffer.append( "<title>" + title+  "</title>" );
        buffer.append( "<dDocType>" +dDocType +  "</dDocType>" );
        buffer.append( "<dDocAuthor>" +dDocAuthor +  "</dDocAuthor>" );
        buffer.append( "<numeroSolicitud>" +numeroSolicitud +  "</numeroSolicitud>" );
        buffer.append( "<folioFiscalFactura>" +folioFiscalFactura+  "</folioFiscalFactura>" );
        buffer.append( "<url>" + url+  "</url>" );
        buffer.append( "</documento>"   );
        
        
        return buffer.toString();
    }
    
    public boolean isXML() {
        return "xml".equalsIgnoreCase(this.extension);
    }
    
    public void setIdDocumento(String idDocumento) {
        this.idDocumento = idDocumento;
    }

    public String getIdDocumento() {
        return idDocumento;
    }

    public void setNombre(TipoDocumentoTipo nombre) {
        this.nombre = nombre;
    }

    public TipoDocumentoTipo getNombre() {
        return nombre;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setIsXml(Boolean isXml) {
        this.isXml = isXml;
    }

    public Boolean getIsXml() {
        return isXml;
    }


    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setDRevLabel(String dRevLabel) {
        this.dRevLabel = dRevLabel;
    }

    public String getDRevLabel() {
        return dRevLabel;
    }

    public void setDID(String dID) {
        this.dID = dID;
    }

    public String getDID() {
        return dID;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setDDocName(String dDocName) {
        this.dDocName = dDocName;
    }

    public String getDDocName() {
        return dDocName;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getCustomer() {
        return customer;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setPublishedFrom(String publishedFrom) {
        this.publishedFrom = publishedFrom;
    }

    public String getPublishedFrom() {
        return publishedFrom;
    }

    public void setPublishedTo(String publishedTo) {
        this.publishedTo = publishedTo;
    }

    public String getPublishedTo() {
        return publishedTo;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getExtension() {
        return extension;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setDDocType(String dDocType) {
        this.dDocType = dDocType;
    }

    public String getDDocType() {
        return dDocType;
    }

    public void setDDocAuthor(String dDocAuthor) {
        this.dDocAuthor = dDocAuthor;
    }

    public String getDDocAuthor() {
        return dDocAuthor;
    }

    public void setDSecurityGroup(String dSecurityGroup) {
        this.dSecurityGroup = dSecurityGroup;
    }

    public String getDSecurityGroup() {
        return dSecurityGroup;
    }

    public void setDDocAccount(String dDocAccount) {
        this.dDocAccount = dDocAccount;
    }

    public String getDDocAccount() {
        return dDocAccount;
    }


    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }


    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocName() {
        return docName;
    }

    public void setFolioFiscalFactura(String folioFiscalFactura) {
        this.folioFiscalFactura = folioFiscalFactura;
    }

    public String getFolioFiscalFactura() {
        return folioFiscalFactura;
    }

    public void setNumeroSolicitud(String numeroSolicitud) {
        this.numeroSolicitud = numeroSolicitud;
    }

    public String getNumeroSolicitud() {
        return numeroSolicitud;
    }    
}
