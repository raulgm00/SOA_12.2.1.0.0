
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
 *         &lt;element name="CheckOutResult" type="{http://www.stellent.com/CheckIn/}CheckOutResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "checkOutResult" })
@XmlRootElement(name = "CheckOutResponse")
public class CheckOutResponse {

    @XmlElement(name = "CheckOutResult")
    protected CheckOutResult checkOutResult;

    /**
     * Gets the value of the checkOutResult property.
     *
     * @return
     *     possible object is
     *     {@link CheckOutResult }
     *
     */
    public CheckOutResult getCheckOutResult() {
        return checkOutResult;
    }

    /**
     * Sets the value of the checkOutResult property.
     *
     * @param value
     *     allowed object is
     *     {@link CheckOutResult }
     *
     */
    public void setCheckOutResult(CheckOutResult value) {
        this.checkOutResult = value;
    }

}
