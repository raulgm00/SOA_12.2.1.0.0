
package qualitas.ws.types.cs.deleteDoc;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for StatusInfo complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="StatusInfo"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="statusCode" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *         &lt;element name="statusMessage" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "StatusInfo", propOrder = { "statusCode", "statusMessage" })
public class StatusInfo {

    protected Integer statusCode;
    protected String statusMessage;

    /**
     * Gets the value of the statusCode property.
     *
     * @return
     *     possible object is
     *     {@link Integer }
     *
     */
    public Integer getStatusCode() {
        return statusCode;
    }

    /**
     * Sets the value of the statusCode property.
     *
     * @param value
     *     allowed object is
     *     {@link Integer }
     *
     */
    public void setStatusCode(Integer value) {
        this.statusCode = value;
    }

    /**
     * Gets the value of the statusMessage property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getStatusMessage() {
        return statusMessage;
    }

    /**
     * Sets the value of the statusMessage property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setStatusMessage(String value) {
        this.statusMessage = value;
    }

}
