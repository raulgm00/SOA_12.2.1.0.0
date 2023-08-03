
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
 *         &lt;element name="UndoCheckOutResult" type="{http://www.stellent.com/CheckIn/}UndoCheckOutResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "undoCheckOutResult" })
@XmlRootElement(name = "UndoCheckOutResponse")
public class UndoCheckOutResponse {

    @XmlElement(name = "UndoCheckOutResult")
    protected UndoCheckOutResult undoCheckOutResult;

    /**
     * Gets the value of the undoCheckOutResult property.
     *
     * @return
     *     possible object is
     *     {@link UndoCheckOutResult }
     *
     */
    public UndoCheckOutResult getUndoCheckOutResult() {
        return undoCheckOutResult;
    }

    /**
     * Sets the value of the undoCheckOutResult property.
     *
     * @param value
     *     allowed object is
     *     {@link UndoCheckOutResult }
     *
     */
    public void setUndoCheckOutResult(UndoCheckOutResult value) {
        this.undoCheckOutResult = value;
    }

}
