
package qualitas.ws.types.cs.checkIn;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
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
 *         &lt;element name="dDocName" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="extraProps" type="{http://www.stellent.com/CheckIn/}IdcPropertyList" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "dDocName", "extraProps" })
@XmlRootElement(name = "CheckOutByName")
public class CheckOutByName {

    protected String dDocName;
    protected IdcPropertyList extraProps;

    /**
     * Gets the value of the dDocName property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDDocName() {
        return dDocName;
    }

    /**
     * Sets the value of the dDocName property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDDocName(String value) {
        this.dDocName = value;
    }

    /**
     * Gets the value of the extraProps property.
     *
     * @return
     *     possible object is
     *     {@link IdcPropertyList }
     *
     */
    public IdcPropertyList getExtraProps() {
        return extraProps;
    }

    /**
     * Sets the value of the extraProps property.
     *
     * @param value
     *     allowed object is
     *     {@link IdcPropertyList }
     *
     */
    public void setExtraProps(IdcPropertyList value) {
        this.extraProps = value;
    }

}
