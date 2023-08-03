(:: pragma bea:global-element-parameter parameter="$obtenerComprobantesResponse" element="ns2:obtenerComprobantesResponse" location="../Schemas/NMPUtileriaAdminPagosXSD.xsd" ::)
(:: pragma bea:global-element-return element="ns0:notificarPagoResponse" location="../Schemas/NMPPagoLineaXSD.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPDSRFPagoLineaSvc";
declare namespace ns2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPFileType";
declare namespace xf = "http://tempuri.org/OSBTestComp/Resources/XQ/TrNotificarPagoResponse/";

declare function xf:TrNotificarPagoResponse($obtenerComprobantesResponse as element(ns2:obtenerComprobantesResponse),
    $respuesta as xs:string)
    as element(ns0:notificarPagoResponse) {
        <ns0:notificarPagoResponse>
            <ns0:respuesta>{ $respuesta }</ns0:respuesta>
            
                <ns0:comprobantesPDF>
                {
                    for $file in $obtenerComprobantesResponse/ns2:comprobantesList/ns1:file
                    return
                        <ns1:file>{ $file/@* , $file/node() }</ns1:file>
                }
            </ns0:comprobantesPDF>           
        </ns0:notificarPagoResponse>
};

declare variable $obtenerComprobantesResponse as element(ns2:obtenerComprobantesResponse) external;
declare variable $respuesta as xs:string external;

xf:TrNotificarPagoResponse($obtenerComprobantesResponse,
    $respuesta)