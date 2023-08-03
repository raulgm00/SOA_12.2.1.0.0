package mx.qualitas.gpa.modelo;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlElement;


public class ProrrateoRow implements Serializable{
    
    @XmlElement
    private String folio;
    
    @XmlElement
    private double importe;
    
    @XmlElement
    private String numeroOficina;
    
    @XmlElement
    private String numeroCentroCosto;
    
    public ProrrateoRow() {
        super();
    }


    public ProrrateoRow(String folio, double importe, String numeroOficina, String numeroCentroCosto) {
        this.folio = folio;
        this.importe = importe;
        this.numeroOficina = numeroOficina;
        this.numeroCentroCosto = numeroCentroCosto;
    }

    public void setFolio(String folio) {
        this.folio = folio;
    }

    public String getFolio() {
        return folio;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public double getImporte() {
        return importe;
    }

    public void setNumeroOficina(String numeroOficina) {
        this.numeroOficina = numeroOficina;
    }

    public String getNumeroOficina() {
        return numeroOficina;
    }

    public void setNumeroCentroCosto(String numeroCentroCosto) {
        this.numeroCentroCosto = numeroCentroCosto;
    }

    public String getNumeroCentroCosto() {
        return numeroCentroCosto;
    }
}
