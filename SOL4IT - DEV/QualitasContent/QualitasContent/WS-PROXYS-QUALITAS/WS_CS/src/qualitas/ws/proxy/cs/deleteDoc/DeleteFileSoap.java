
package qualitas.ws.proxy.cs.deleteDoc;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

import qualitas.ws.types.cs.deleteDoc.DeleteDocResult;
import qualitas.ws.types.cs.deleteDoc.IdcPropertyList;
import qualitas.ws.types.cs.deleteDoc.ObjectFactory;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150616.1732
 * Generated source version: 2.2
 *
 */
@WebService(name = "DeleteFileSoap", targetNamespace = "http://www.stellent.com/DeleteFile/")
@XmlSeeAlso({ ObjectFactory.class })
public interface DeleteFileSoap {


    /**
     *
     * @param dDocName
     * @param dID
     * @param extraProps
     * @return
     *     returns qualitas.ws.types.cs.deleteDoc.DeleteDocResult
     */
    @WebMethod(operationName = "DeleteDoc", action = "http://www.stellent.com/DeleteFile/")
    @WebResult(name = "DeleteDocResult", targetNamespace = "http://www.stellent.com/DeleteFile/")
    @RequestWrapper(localName = "DeleteDoc", targetNamespace = "http://www.stellent.com/DeleteFile/",
                    className = "qualitas.ws.types.cs.deleteDoc.DeleteDoc")
    @ResponseWrapper(localName = "DeleteDocResponse", targetNamespace = "http://www.stellent.com/DeleteFile/",
                     className = "qualitas.ws.types.cs.deleteDoc.DeleteDocResponse")
    public DeleteDocResult deleteDoc(@WebParam(name = "dDocName",
                                               targetNamespace = "http://www.stellent.com/DeleteFile/") String dDocName,
                                     @WebParam(name = "dID", targetNamespace = "http://www.stellent.com/DeleteFile/")
                                     Integer dID,
                                     @WebParam(name = "extraProps",
                                               targetNamespace = "http://www.stellent.com/DeleteFile/")
                                     IdcPropertyList extraProps);

}
