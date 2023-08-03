
package qualitas.ws.types.cs.checkIn;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CheckInListResult complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="CheckInListResult"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="CheckInList" type="{http://www.stellent.com/CheckIn/}CheckInList" maxOccurs="unbounded" minOccurs="0"/&gt;
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
@XmlType(name = "CheckInListResult", propOrder = { "checkInList", "statusInfo" })
public class CheckInListResult {

    @XmlElement(name = "CheckInList")
    protected List<CheckInList> checkInList;
    @XmlElement(name = "StatusInfo")
    protected StatusInfo statusInfo;

    /**
     * Gets the value of the checkInList property.
     *
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the checkInList property.
     *
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getCheckInList().add(newItem);
     * </pre>
     *
     *
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CheckInList }
     *
     *
     */
    public List<CheckInList> getCheckInList() {
        if (checkInList == null) {
            checkInList = new ArrayList<CheckInList>();
        }
        return this.checkInList;
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
