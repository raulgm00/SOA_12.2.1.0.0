
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
 *         &lt;element name="dDocName" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="dDocTitle" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="dDocType" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="dDocAuthor" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="dSecurityGroup" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="dDocAccount" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="CustomDocMetaData" type="{http://www.stellent.com/CheckIn/}IdcPropertyList" minOccurs="0"/&gt;
 *         &lt;element name="primaryFile" type="{http://www.stellent.com/CheckIn/}IdcFile" minOccurs="0"/&gt;
 *         &lt;element name="alternateFile" type="{http://www.stellent.com/CheckIn/}IdcFile" minOccurs="0"/&gt;
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
@XmlType(name = "", propOrder = {
         "dDocName", "dDocTitle", "dDocType", "dDocAuthor", "dSecurityGroup", "dDocAccount", "customDocMetaData",
         "primaryFile", "alternateFile", "extraProps"
    })
@XmlRootElement(name = "CheckInUniversal")
public class CheckInUniversal {

    protected String dDocName;
    protected String dDocTitle;
    protected String dDocType;
    protected String dDocAuthor;
    protected String dSecurityGroup;
    protected String dDocAccount;
    @XmlElement(name = "CustomDocMetaData")
    protected IdcPropertyList customDocMetaData;
    protected IdcFile primaryFile;
    protected IdcFile alternateFile;
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
     * Gets the value of the dDocTitle property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDDocTitle() {
        return dDocTitle;
    }

    /**
     * Sets the value of the dDocTitle property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDDocTitle(String value) {
        this.dDocTitle = value;
    }

    /**
     * Gets the value of the dDocType property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDDocType() {
        return dDocType;
    }

    /**
     * Sets the value of the dDocType property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDDocType(String value) {
        this.dDocType = value;
    }

    /**
     * Gets the value of the dDocAuthor property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDDocAuthor() {
        return dDocAuthor;
    }

    /**
     * Sets the value of the dDocAuthor property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDDocAuthor(String value) {
        this.dDocAuthor = value;
    }

    /**
     * Gets the value of the dSecurityGroup property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDSecurityGroup() {
        return dSecurityGroup;
    }

    /**
     * Sets the value of the dSecurityGroup property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDSecurityGroup(String value) {
        this.dSecurityGroup = value;
    }

    /**
     * Gets the value of the dDocAccount property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDDocAccount() {
        return dDocAccount;
    }

    /**
     * Sets the value of the dDocAccount property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDDocAccount(String value) {
        this.dDocAccount = value;
    }

    /**
     * Gets the value of the customDocMetaData property.
     *
     * @return
     *     possible object is
     *     {@link IdcPropertyList }
     *
     */
    public IdcPropertyList getCustomDocMetaData() {
        return customDocMetaData;
    }

    /**
     * Sets the value of the customDocMetaData property.
     *
     * @param value
     *     allowed object is
     *     {@link IdcPropertyList }
     *
     */
    public void setCustomDocMetaData(IdcPropertyList value) {
        this.customDocMetaData = value;
    }

    /**
     * Gets the value of the primaryFile property.
     *
     * @return
     *     possible object is
     *     {@link IdcFile }
     *
     */
    public IdcFile getPrimaryFile() {
        return primaryFile;
    }

    /**
     * Sets the value of the primaryFile property.
     *
     * @param value
     *     allowed object is
     *     {@link IdcFile }
     *
     */
    public void setPrimaryFile(IdcFile value) {
        this.primaryFile = value;
    }

    /**
     * Gets the value of the alternateFile property.
     *
     * @return
     *     possible object is
     *     {@link IdcFile }
     *
     */
    public IdcFile getAlternateFile() {
        return alternateFile;
    }

    /**
     * Sets the value of the alternateFile property.
     *
     * @param value
     *     allowed object is
     *     {@link IdcFile }
     *
     */
    public void setAlternateFile(IdcFile value) {
        this.alternateFile = value;
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
