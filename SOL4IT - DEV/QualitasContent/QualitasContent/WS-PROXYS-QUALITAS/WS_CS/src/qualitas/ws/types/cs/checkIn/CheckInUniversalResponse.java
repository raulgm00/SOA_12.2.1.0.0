
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
 *         &lt;element name="CheckInUniversalResult" type="{http://www.stellent.com/CheckIn/}CheckInUniversalResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "checkInUniversalResult" })
@XmlRootElement(name = "CheckInUniversalResponse")
public class CheckInUniversalResponse {

    @XmlElement(name = "CheckInUniversalResult")
    protected CheckInUniversalResult checkInUniversalResult;

    /**
     * Gets the value of the checkInUniversalResult property.
     *
     * @return
     *     possible object is
     *     {@link CheckInUniversalResult }
     *
     */
    public CheckInUniversalResult getCheckInUniversalResult() {
        return checkInUniversalResult;
    }

    /**
     * Sets the value of the checkInUniversalResult property.
     *
     * @param value
     *     allowed object is
     *     {@link CheckInUniversalResult }
     *
     */
    public void setCheckInUniversalResult(CheckInUniversalResult value) {
        this.checkInUniversalResult = value;
    }

}
