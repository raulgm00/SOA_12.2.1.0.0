(:: pragma bea:global-element-parameter parameter="$getComprobantesResponse" element="ns2:getComprobantesResponse" location="../XSD/AdminPagosSvc.xsd" ::)
(:: pragma bea:global-element-return element="ns0:notificarPagoResponse" location="../XSD/PagoLineaSvc.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPDSRFPagoLineaSvc";
declare namespace ns2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPFileType";
declare namespace xf = "http://tempuri.org/OSBTestComp/Resources/XQ/TrNotificarPagoResponse/";

declare function xf:TrNotificarPagoResponse($getComprobantesResponse as element(ns2:getComprobantesResponse),
    $respuesta as xs:string)
    as element(ns0:notificarPagoResponse) {
        <ns0:notificarPagoResponse>
            <ns0:respuesta>{ $respuesta }</ns0:respuesta>
            
                <ns0:comprobantesPDF>
                {
                    for $file in $getComprobantesResponse/ns2:comprobantesList/ns1:file
                    return
                        <ns1:file>{ $file/@* , $file/node() }</ns1:file>
                }
            </ns0:comprobantesPDF>           
        </ns0:notificarPagoResponse>
};

declare variable $getComprobantesResponse as element(ns2:getComprobantesResponse) external;
declare variable $respuesta as xs:string external;

xf:TrNotificarPagoResponse($getComprobantesResponse,
    $respuesta)