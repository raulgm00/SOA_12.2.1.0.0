
package qualitas.ws.types.cs.checkIn;

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
 *         &lt;element name="UpdateDocInfoResult" type="{http://www.stellent.com/CheckIn/}UpdateDocInfoResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "updateDocInfoResult" })
@XmlRootElement(name = "UpdateDocInfoResponse")
public class UpdateDocInfoResponse {

    @XmlElement(name = "UpdateDocInfoResult")
    protected UpdateDocInfoResult updateDocInfoResult;

    /**
     * Gets the value of the updateDocInfoResult property.
     *
     * @return
     *     possible object is
     *     {@link UpdateDocInfoResult }
     *
     */
    public UpdateDocInfoResult getUpdateDocInfoResult() {
        return updateDocInfoResult;
    }

    /**
     * Sets the value of the updateDocInfoResult property.
     *
     * @param value
     *     allowed object is
     *     {@link UpdateDocInfoResult }
     *
     */
    public void setUpdateDocInfoResult(UpdateDocInfoResult value) {
        this.updateDocInfoResult = value;
    }

}
