
package qualitas.ws.types.cs.search;

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
 *         &lt;element name="AdvancedSearchResult" type="{http://www.stellent.com/Search/}AdvancedSearchResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "advancedSearchResult" })
@XmlRootElement(name = "AdvancedSearchResponse")
public class AdvancedSearchResponse {

    @XmlElement(name = "AdvancedSearchResult")
    protected AdvancedSearchResult advancedSearchResult;

    /**
     * Gets the value of the advancedSearchResult property.
     *
     * @return
     *     possible object is
     *     {@link AdvancedSearchResult }
     *
     */
    public AdvancedSearchResult getAdvancedSearchResult() {
        return advancedSearchResult;
    }

    /**
     * Sets the value of the advancedSearchResult property.
     *
     * @param value
     *     allowed object is
     *     {@link AdvancedSearchResult }
     *
     */
    public void setAdvancedSearchResult(AdvancedSearchResult value) {
        this.advancedSearchResult = value;
    }

}
