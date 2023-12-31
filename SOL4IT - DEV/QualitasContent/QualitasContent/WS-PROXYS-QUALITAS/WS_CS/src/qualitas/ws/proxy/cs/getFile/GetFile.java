
package qualitas.ws.proxy.cs.getFile;

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
@WebServiceClient(name = "GetFile", targetNamespace = "http://www.stellent.com/GetFile/",
                  wsdlLocation =
                  "http://WIN-PII5F6TBN7S:16200/_dav/cs/idcplg/#%7Bhttp%3A%2F%2Fwww.stellent.com%2FGetFile%2F%7DGetFile?wsdl")
public class GetFile extends Service {

    private final static URL GETFILE_WSDL_LOCATION;
    private final static WebServiceException GETFILE_EXCEPTION;
    private final static QName GETFILE_QNAME = new QName("http://www.stellent.com/GetFile/", "GetFile");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url =
                new URL("http://WIN-PII5F6TBN7S:16200/_dav/cs/idcplg/#%7Bhttp%3A%2F%2Fwww.stellent.com%2FGetFile%2F%7DGetFile?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        GETFILE_WSDL_LOCATION = url;
        GETFILE_EXCEPTION = e;
    }

    public GetFile() {
        super(__getWsdlLocation(), GETFILE_QNAME);
    }

    public GetFile(WebServiceFeature... features) {
        super(__getWsdlLocation(), GETFILE_QNAME, features);
    }

    public GetFile(URL wsdlLocation) {
        super(wsdlLocation, GETFILE_QNAME);
    }

    public GetFile(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, GETFILE_QNAME, features);
    }

    public GetFile(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public GetFile(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     *
     * @return
     *     returns GetFileSoap
     */
    @WebEndpoint(name = "GetFileSoap")
    public GetFileSoap getGetFileSoap() {
        return super.getPort(new QName("http://www.stellent.com/GetFile/", "GetFileSoap"), GetFileSoap.class);
    }

    /**
     *
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns GetFileSoap
     */
    @WebEndpoint(name = "GetFileSoap")
    public GetFileSoap getGetFileSoap(WebServiceFeature... features) {
        return super.getPort(new QName("http://www.stellent.com/GetFile/", "GetFileSoap"), GetFileSoap.class, features);
    }

    private static URL __getWsdlLocation() {
        if (GETFILE_EXCEPTION != null) {
            throw GETFILE_EXCEPTION;
        }
        return GETFILE_WSDL_LOCATION;
    }

}
