package mx.qualitas.gpa.ws;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import mx.qualitas.gpa.modelo.Prorrateo;

@XmlRootElement
public class ProrrateoResponse implements Serializable {
    
    @XmlElement
    private int result = 0;
    
    @XmlElement
    private String detail;
    
    @XmlElement
    private Prorrateo data = Prorrateo.dummy();

    public void setData(Prorrateo data) {
        this.data = data;
    }

    public Prorrateo getData() {
        return data;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public int getResult() {
        return result;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDetail() {
        return detail;
    }
}
