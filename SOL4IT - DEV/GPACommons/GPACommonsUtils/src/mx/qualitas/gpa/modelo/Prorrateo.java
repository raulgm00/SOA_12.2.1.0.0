package mx.qualitas.gpa.modelo;

import java.io.IOException;
import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;


public class Prorrateo implements Serializable{
    
    @XmlElement
    private String descripcion;
    
    @XmlElement
    private String descripcionIVA;    
    
    @XmlElement
    private String cuentaContable;    

    @XmlElement
    private String cuentaContableIVA;    

    @XmlElement
    private String oficinaIVA;    

    @XmlElement
    private String centroCostosIVA;    

    @XmlElement
    private String concepto;    

    @XmlElement
    private Double total;
    
    @XmlElement
    private List<ProrrateoRow> listaProrrateoRow = new ArrayList<ProrrateoRow>();    
    

    
    public Prorrateo() {
        super();
        listaProrrateoRow = new ArrayList<>();
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Double getTotal() {
        return total;
    }

    public void setListaProrrateoRow(List<ProrrateoRow> listaProrrateoRow) {
        this.listaProrrateoRow = listaProrrateoRow;
    }

    public List<ProrrateoRow> getListaProrrateoRow() {
        return listaProrrateoRow;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setCuentaContable(String cuentaContable) {
        this.cuentaContable = cuentaContable;
    }

    public String getCuentaContable() {
        return cuentaContable;
    }

    public void setDescripcionIVA(String descripcionIVA) {
        this.descripcionIVA = descripcionIVA;
    }

    public String getDescripcionIVA() {
        return descripcionIVA;
    }

    
    public static Prorrateo dummy()  {
        Prorrateo prorrateo = new Prorrateo();
        prorrateo.setTotal(180000D);
        prorrateo.setDescripcion("SOAINT SA de CV");
        prorrateo.setCuentaContable("5411310900000");

        ProrrateoRow row = new ProrrateoRow();
        row.setFolio("123456");
        row.setImporte(10000);
        row.setNumeroCentroCosto("15");
        row.setNumeroOficina("20");

        ProrrateoRow row1 = new ProrrateoRow();
        row1.setFolio("789654");
        row1.setImporte(8000);
        row1.setNumeroCentroCosto("15");
        row1.setNumeroOficina("20");

        prorrateo.getListaProrrateoRow().add(row);
        prorrateo.getListaProrrateoRow().add(row1);
        return prorrateo;
    }


    public void setCuentaContableIVA(String cuentaContableIVA) {
        this.cuentaContableIVA = cuentaContableIVA;
    }

    public String getCuentaContableIVA() {
        return cuentaContableIVA;
    }

    public void setOficinaIVA(String oficinaIVA) {
        this.oficinaIVA = oficinaIVA;
    }

    public String getOficinaIVA() {
        return oficinaIVA;
    }

    public void setCentroCostosIVA(String centroCostosIVA) {
        this.centroCostosIVA = centroCostosIVA;
    }

    public String getCentroCostosIVA() {
        return centroCostosIVA;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    public String getConcepto() {
        return concepto;
    }
}
