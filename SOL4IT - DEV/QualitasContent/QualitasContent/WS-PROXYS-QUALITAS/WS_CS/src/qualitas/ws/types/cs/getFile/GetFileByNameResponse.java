
package qualitas.ws.types.cs.getFile;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="GetFileByNameResult" type="{http://www.stellent.com/GetFile/}GetFileByNameResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "getFileByNameResult" })
@XmlRootElement(name = "GetFileByNameResponse")
public class GetFileByNameResponse {

    @XmlElement(name = "GetFileByNameResult")
    protected GetFileByNameResult getFileByNameResult;

    /**
     * Gets the value of the getFileByNameResult property.
     *
     * @return
     *     possible object is
     *     {@link GetFileByNameResult }
     *
     */
    public GetFileByNameResult getGetFileByNameResult() {
        return getFileByNameResult;
    }

    /**
     * Sets the value of the getFileByNameResult property.
     *
     * @param value
     *     allowed object is
     *     {@link GetFileByNameResult }
     *
     */
    public void setGetFileByNameResult(GetFileByNameResult value) {
        this.getFileByNameResult = value;
    }

}
