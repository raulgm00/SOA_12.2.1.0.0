
package qualitas.ws.types.cs.deleteDoc;

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
 *         &lt;element name="DeleteDocResult" type="{http://www.stellent.com/DeleteFile/}DeleteDocResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "deleteDocResult" })
@XmlRootElement(name = "DeleteDocResponse")
public class DeleteDocResponse {

    @XmlElement(name = "DeleteDocResult")
    protected DeleteDocResult deleteDocResult;

    /**
     * Gets the value of the deleteDocResult property.
     *
     * @return
     *     possible object is
     *     {@link DeleteDocResult }
     *
     */
    public DeleteDocResult getDeleteDocResult() {
        return deleteDocResult;
    }

    /**
     * Sets the value of the deleteDocResult property.
     *
     * @param value
     *     allowed object is
     *     {@link DeleteDocResult }
     *
     */
    public void setDeleteDocResult(DeleteDocResult value) {
        this.deleteDocResult = value;
    }

}
