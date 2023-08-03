
package qualitas.ws.proxy.cs.checkIn;

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
@WebServiceClient(name = "CheckIn", targetNamespace = "http://www.stellent.com/CheckIn/",
                  wsdlLocation =
                  "http://WIN-PII5F6TBN7S:16200/_dav/cs/idcplg/#%7Bhttp%3A%2F%2Fwww.stellent.com%2FCheckIn%2F%7DCheckIn?wsdl")

public class CheckIn extends Service {

    private final static URL CHECKIN_WSDL_LOCATION;
    private final static WebServiceException CHECKIN_EXCEPTION;
    private final static QName CHECKIN_QNAME = new QName("http://www.stellent.com/CheckIn/", "CheckIn");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url =
                new URL("http://WIN-PII5F6TBN7S:16200/_dav/cs/idcplg/#%7Bhttp%3A%2F%2Fwww.stellent.com%2FCheckIn%2F%7DCheckIn?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        CHECKIN_WSDL_LOCATION = url;
        CHECKIN_EXCEPTION = e;
    }

    public CheckIn() {
        super(__getWsdlLocation(), CHECKIN_QNAME);
    }

    public CheckIn(WebServiceFeature... features) {
        super(__getWsdlLocation(), CHECKIN_QNAME, features);
    }

    public CheckIn(URL wsdlLocation) {
        super(wsdlLocation, CHECKIN_QNAME);
    }

    public CheckIn(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, CHECKIN_QNAME, features);
    }

    public CheckIn(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public CheckIn(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     *
     * @return
     *     returns CheckInSoap
     */
    @WebEndpoint(name = "CheckInSoap")
    public CheckInSoap getCheckInSoap() {
        return super.getPort(new QName("http://www.stellent.com/CheckIn/", "CheckInSoap"), CheckInSoap.class);
    }

    /**
     *
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns CheckInSoap
     */
    @WebEndpoint(name = "CheckInSoap")
    public CheckInSoap getCheckInSoap(WebServiceFeature... features) {
        return super.getPort(new QName("http://www.stellent.com/CheckIn/", "CheckInSoap"), CheckInSoap.class, features);
    }

    private static URL __getWsdlLocation() {
        if (CHECKIN_EXCEPTION != null) {
            throw CHECKIN_EXCEPTION;
        }
        return CHECKIN_WSDL_LOCATION;
    }

}