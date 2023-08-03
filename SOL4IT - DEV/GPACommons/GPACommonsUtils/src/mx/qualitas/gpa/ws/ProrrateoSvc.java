package mx.qualitas.gpa.ws;

import java.io.IOException;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import javax.jws.soap.SOAPBinding.Style;

import mx.qualitas.gpa.util.ExcelParser;

@WebService(serviceName = "ProrrateoSvc", wsdlLocation = "WEB-INF/wsdl/ProrrateoSvc.wsdl")
@SOAPBinding(style = Style.RPC)
public class ProrrateoSvc {
    
    
    @WebMethod(operationName = "parse")
    @WebResult(name = "Prorrateo")  
    public ProrrateoResponse parse(@WebParam(name = "data") byte[] data){
        
        // TODO: jmoreno, esto se ajustara con un Logger de WebLogic
        System.out.println( "___________________ Recibida " + data + " _________________" );
        
        ProrrateoResponse response = new ProrrateoResponse();
        try {
            response.setData(ExcelParser.parsearArchivoProrrateoFromBytes(data));
            response.setResult( 1 );
            System.out.println( "___________________ RESPONDIDA  _________________" );
        } catch (Throwable e) {
            System.err.println(" ························· ");
            System.err.println(e);
            e.printStackTrace();
            response.setDetail( e.getMessage() );
        }

        return response;
    }
}
