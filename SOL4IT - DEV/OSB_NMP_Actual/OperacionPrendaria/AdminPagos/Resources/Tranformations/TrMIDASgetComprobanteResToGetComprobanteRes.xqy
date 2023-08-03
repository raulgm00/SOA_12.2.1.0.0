(:: pragma bea:global-element-parameter parameter="$obtenerComprobanteResponse" element="ns2:obtenerComprobanteResponse" location="../WSDL/MIDASCajaOnline.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:getComprobantesResponse" location="../XSD/AdminPagosSvc.xsd" ::)

declare namespace ns0 = "http://dto.model.midas.nmp.com.mx";
declare namespace ns2 = "urn:mx.com.nmp.midas";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
declare namespace ns3 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPFileType";
declare namespace xf = "http://tempuri.org/OSBTestComp/Resources/XQ/TrGetComprobanteMidasToSoa/";

declare function xf:TrGetComprobanteMidasToSoa($obtenerComprobanteResponse as element(ns2:obtenerComprobanteResponse))
    as element(ns1:getComprobantesResponse) {
        <ns1:getComprobantesResponse>
            <ns1:comprobantesList>
                {
                    for $ComprobanteOnline in $obtenerComprobanteResponse/ns2:return/ns0:ComprobanteOnline
                    return
                        <ns3:file>
                            <ns3:idOperacion>{ data($ComprobanteOnline/ns0:idOperacion) }</ns3:idOperacion>
                            <ns3:archivo>{ data($ComprobanteOnline/ns0:archivo) }</ns3:archivo>
                        </ns3:file>
                }
            </ns1:comprobantesList>
        </ns1:getComprobantesResponse>
};

declare variable $obtenerComprobanteResponse as element(ns2:obtenerComprobanteResponse) external;

xf:TrGetComprobanteMidasToSoa($obtenerComprobanteResponse)