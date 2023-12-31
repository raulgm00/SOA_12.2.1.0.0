
package qualitas.ws.proxy.cs.search;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150616.1732
 * Generated source version: 2.2
 *
 */
@WebServiceClient(name = "Search", targetNamespace = "http://www.stellent.com/Search/",
                  wsdlLocation =
                  "http://WIN-PII5F6TBN7S:16200/_dav/cs/idcplg/#%7Bhttp%3A%2F%2Fwww.stellent.com%2FSearch%2F%7DSearch?wsdl")
public class Search extends Service {

    private final static URL SEARCH_WSDL_LOCATION;
    private final static WebServiceException SEARCH_EXCEPTION;
    private final static QName SEARCH_QNAME = new QName("http://www.stellent.com/Search/", "Search");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url =
                new URL("http://WIN-PII5F6TBN7S:16200/_dav/cs/idcplg/#%7Bhttp%3A%2F%2Fwww.stellent.com%2FSearch%2F%7DSearch?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        SEARCH_WSDL_LOCATION = url;
        SEARCH_EXCEPTION = e;
    }

    public Search() {
        super(__getWsdlLocation(), SEARCH_QNAME);
    }

    public Search(WebServiceFeature... features) {
        super(__getWsdlLocation(), SEARCH_QNAME, features);
    }

    public Search(URL wsdlLocation) {
        super(wsdlLocation, SEARCH_QNAME);
    }

    public Search(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, SEARCH_QNAME, features);
    }

    public Search(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public Search(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     *
     * @return
     *     returns SearchSoap
     */
    @WebEndpoint(name = "SearchSoap")
    public SearchSoap getSearchSoap() {
        return super.getPort(new QName("http://www.stellent.com/Search/", "SearchSoap"), SearchSoap.class);
    }

    /**
     *
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns SearchSoap
     */
    @WebEndpoint(name = "SearchSoap")
    public SearchSoap getSearchSoap(WebServiceFeature... features) {
        return super.getPort(new QName("http://www.stellent.com/Search/", "SearchSoap"), SearchSoap.class, features);
    }

    private static URL __getWsdlLocation() {
        if (SEARCH_EXCEPTION != null) {
            throw SEARCH_EXCEPTION;
        }
        return SEARCH_WSDL_LOCATION;
    }

}
