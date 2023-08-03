
package qualitas.ws.types.cs.checkIn;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CheckInUniversalResult complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="CheckInUniversalResult"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="dID" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *         &lt;element name="dRevisionID" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *         &lt;element name="dRevClassID" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *         &lt;element name="dRevLabel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="StatusInfo" type="{http://www.stellent.com/CheckIn/}StatusInfo" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CheckInUniversalResult", propOrder = {
         "did", "dRevisionID", "dRevClassID", "dRevLabel", "statusInfo" })
public class CheckInUniversalResult {

    @XmlElement(name = "dID")
    protected Integer did;
    protected Integer dRevisionID;
    protected Integer dRevClassID;
    protected String dRevLabel;
    @XmlElement(name = "StatusInfo")
    protected StatusInfo statusInfo;

    /**
     * Gets the value of the did property.
     *
     * @return
     *     possible object is
     *     {@link Integer }
     *
     */
    public Integer getDID() {
        return did;
    }

    /**
     * Sets the value of the did property.
     *
     * @param value
     *     allowed object is
     *     {@link Integer }
     *
     */
    public void setDID(Integer value) {
        this.did = value;
    }

    /**
     * Gets the value of the dRevisionID property.
     *
     * @return
     *     possible object is
     *     {@link Integer }
     *
     */
    public Integer getDRevisionID() {
        return dRevisionID;
    }

    /**
     * Sets the value of the dRevisionID property.
     *
     * @param value
     *     allowed object is
     *     {@link Integer }
     *
     */
    public void setDRevisionID(Integer value) {
        this.dRevisionID = value;
    }

    /**
     * Gets the value of the dRevClassID property.
     *
     * @return
     *     possible object is
     *     {@link Integer }
     *
     */
    public Integer getDRevClassID() {
        return dRevClassID;
    }

    /**
     * Sets the value of the dRevClassID property.
     *
     * @param value
     *     allowed object is
     *     {@link Integer }
     *
     */
    public void setDRevClassID(Integer value) {
        this.dRevClassID = value;
    }

    /**
     * Gets the value of the dRevLabel property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDRevLabel() {
        return dRevLabel;
    }

    /**
     * Sets the value of the dRevLabel property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDRevLabel(String value) {
        this.dRevLabel = value;
    }

    /**
     * Gets the value of the statusInfo property.
     *
     * @return
     *     possible object is
     *     {@link StatusInfo }
     *
     */
    public StatusInfo getStatusInfo() {
        return statusInfo;
    }

    /**
     * Sets the value of the statusInfo property.
     *
     * @param value
     *     allowed object is
     *     {@link StatusInfo }
     *
     */
    public void setStatusInfo(StatusInfo value) {
        this.statusInfo = value;
    }

}
