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
declare function local:establecerRequestHeader($requestHeader as element() (:: schema-element(soap:Header) ::),$inbound as element() (:: schema-element(ctx:endpoint) ::)) {

      <nmp:headerMessage>
           
           {
             if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='usuario']/@value))
              then
                  <nmp:usuario>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='usuario']/@value)}</nmp:usuario>
              else if (exists($requestHeader/nmp:headerMessage/nmp:usuario))
              then
                  <nmp:usuario>{$requestHeader/nmp:headerMessage/nmp:usuario/text()}</nmp:usuario>
              else
              ()
           }
          {
              if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idConsumidor']/@value))
                then
                    <nmp:idConsumidor>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idConsumidor']/@value)}</nmp:idConsumidor>
                else if (exists($requestHeader/nmp:headerMessage/nmp:idConsumidor))
                then
                      <nmp:idConsumidor>{$requestHeader/nmp:headerMessage/nmp:idConsumidor/text()}</nmp:idConsumidor>
                else
                ()
          }
   
          {
                if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idDestino']/@value))
                then
                    <nmp:idDestino>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idDestino']/@value)}</nmp:idDestino>
                else if (exists($requestHeader/nmp:headerMessage/nmp:idDestino))
                then
                    <nmp:idDestino>{$requestHeader/nmp:headerMessage/nmp:idDestino/text()}</nmp:idDestino>
                else
                ()
          }
     </nmp:headerMessage>
  
  };

local:establecerRequestHeader($requestHeader, $inbound)