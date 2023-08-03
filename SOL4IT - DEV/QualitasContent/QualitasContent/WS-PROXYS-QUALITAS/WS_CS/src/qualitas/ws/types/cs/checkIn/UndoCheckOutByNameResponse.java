
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
 *         &lt;element name="UndoCheckOutByNameResult" type="{http://www.stellent.com/CheckIn/}UndoCheckOutByNameResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "undoCheckOutByNameResult" })
@XmlRootElement(name = "UndoCheckOutByNameResponse")
public class UndoCheckOutByNameResponse {

    @XmlElement(name = "UndoCheckOutByNameResult")
    protected UndoCheckOutByNameResult undoCheckOutByNameResult;

    /**
     * Gets the value of the undoCheckOutByNameResult property.
     *
     * @return
     *     possible object is
     *     {@link UndoCheckOutByNameResult }
     *
     */
    public UndoCheckOutByNameResult getUndoCheckOutByNameResult() {
        return undoCheckOutByNameResult;
    }

    /**
     * Sets the value of the undoCheckOutByNameResult property.
     *
     * @param value
     *     allowed object is
     *     {@link UndoCheckOutByNameResult }
     *
     */
    public void setUndoCheckOutByNameResult(UndoCheckOutByNameResult value) {
        this.undoCheckOutByNameResult = value;
    }

}
