
package qualitas.ws.types.cs.deleteDoc;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each
 * Java content interface and Java element interface
 * generated in the qualitas.ws.types.cs.deleteDoc package.
 * <p>An ObjectFactory allows you to programatically
 * construct new instances of the Java representation
 * for XML content. The Java representation of XML
 * content can consist of schema derived interfaces
 * and classes representing the binding of schema
 * type definitions, element declarations and model
 * groups.  Factory methods for each of these are
 * provided in this class.
 *
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: qualitas.ws.types.cs.deleteDoc
     *
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DeleteDoc }
     *
     */
    public DeleteDoc createDeleteDoc() {
        return new DeleteDoc();
    }

    /**
     * Create an instance of {@link IdcPropertyList }
     *
     */
    public IdcPropertyList createIdcPropertyList() {
        return new IdcPropertyList();
    }

    /**
     * Create an instance of {@link DeleteDocResponse }
     *
     */
    public DeleteDocResponse createDeleteDocResponse() {
        return new DeleteDocResponse();
    }

    /**
     * Create an instance of {@link DeleteDocResult }
     *
     */
    public DeleteDocResult createDeleteDocResult() {
        return new DeleteDocResult();
    }

    /**
     * Create an instance of {@link StatusInfo }
     *
     */
    public StatusInfo createStatusInfo() {
        return new StatusInfo();
    }

    /**
     * Create an instance of {@link IdcProperty }
     *
     */
    public IdcProperty createIdcProperty() {
        return new IdcProperty();
    }

}
