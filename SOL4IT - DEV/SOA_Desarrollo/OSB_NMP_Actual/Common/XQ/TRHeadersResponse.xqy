xquery version "1.0" encoding "utf-8";

  (:: OracleAnnotationVersion "1.0" ::)
  declare namespace soap="http://schemas.xmlsoap.org/soap/envelope/";
  (:: import schema at "../XSD/SOAP-envXSD.xsd" ::)
  declare namespace ctx="http://www.bea.com/wli/sb/context";
  (:: import schema at "../XSD/SOAPMessageContextXSD.xsd" ::)
  declare namespace tp="http://www.bea.com/wli/sb/transports";
  declare namespace http = "http://www.bea.com/wli/sb/transports/http";
  declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader";
  (:: import schema at "../XSD/NMPStandardHeader.xsd" ::)

declare variable $requestHeader as element() (:: schema-element(soap:Header) ::) external;
declare variable $inbound as element() (:: schema-element(ctx:endpoint) ::) external;
declare function local:establecerRequestHeader($requestHeader as element() (:: schema-element(soap:Header) ::) (:: schema-element(ctx:endpoint) ::)) {

      <nmp:headerMessageResponse>
           
           {
             if (exists($requestHeader/nmp:headerMessage/nmp:usuario))
              then
                  <nmp:usuario>{$requestHeader/nmp:headerMessage/nmp:usuario/text()}</nmp:usuario>
              else
              ()
           }
          { if (exists($requestHeader/nmp:headerMessage/nmp:usuario))
                then
                      <nmp:idConsumidor>{$requestHeader/nmp:headerMessage/nmp:idConsumidor/text()}</nmp:idConsumidor>
                else
                ()
          }
   
          {
               if (exists($requestHeader/nmp:headerMessage/nmp:usuario))
                then
                    <nmp:idDestino>{$requestHeader/nmp:headerMessage/nmp:idDestino/text()}</nmp:idDestino>
                else
                ()
          }
          {
              <nmp:codigoRespuesta>{0}</nmp:codigoRespuesta>                
          }
          {
              <nmp:descripcionRespuesta>{xs:string('Ejecución satisfactoria')}</nmp:descripcionRespuesta>                
          }
     </nmp:headerMessageResponse>
  
  };

local:establecerRequestHeader($requestHeader)