
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
 *         &lt;element name="CheckInListResult" type="{http://www.stellent.com/CheckIn/}CheckInListResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "checkInListResult" })
@XmlRootElement(name = "CheckInListResponse")
public class CheckInListResponse {

    @XmlElement(name = "CheckInListResult")
    protected CheckInListResult checkInListResult;

    /**
     * Gets the value of the checkInListResult property.
     *
     * @return
     *     possible object is
     *     {@link CheckInListResult }
     *
     */
    public CheckInListResult getCheckInListResult() {
        return checkInListResult;
    }

    /**
     * Sets the value of the checkInListResult property.
     *
     * @param value
     *     allowed object is
     *     {@link CheckInListResult }
     *
     */
    public void setCheckInListResult(CheckInListResult value) {
        this.checkInListResult = value;
    }

}
