
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
 *         &lt;element name="CheckOutByNameResult" type="{http://www.stellent.com/CheckIn/}CheckOutByNameResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "checkOutByNameResult" })
@XmlRootElement(name = "CheckOutByNameResponse")
public class CheckOutByNameResponse {

    @XmlElement(name = "CheckOutByNameResult")
    protected CheckOutByNameResult checkOutByNameResult;

    /**
     * Gets the value of the checkOutByNameResult property.
     *
     * @return
     *     possible object is
     *     {@link CheckOutByNameResult }
     *
     */
    public CheckOutByNameResult getCheckOutByNameResult() {
        return checkOutByNameResult;
    }

    /**
     * Sets the value of the checkOutByNameResult property.
     *
     * @param value
     *     allowed object is
     *     {@link CheckOutByNameResult }
     *
     */
    public void setCheckOutByNameResult(CheckOutByNameResult value) {
        this.checkOutByNameResult = value;
    }

}
