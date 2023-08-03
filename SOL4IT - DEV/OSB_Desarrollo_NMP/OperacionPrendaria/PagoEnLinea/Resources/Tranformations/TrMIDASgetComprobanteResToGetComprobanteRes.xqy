xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos";
(:: import schema at "../Schemas/NMPUtileriaAdminPagosXSD.xsd" ::)
declare namespace ns1="urn:mx.com.nmp.midas";
(:: import schema at "../WSDLs/MIDASCajaOnlineWSDL.wsdl" ::)

declare namespace xf="http://tempuri.org/OSBTestComp/Resources/XQ/TrGetComprobanteMidasToSoa/";

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPFileType";

declare namespace dto = "http://dto.model.midas.nmp.com.mx";

declare variable $obtenerComprobanteResponse as element() (:: schema-element(ns1:obtenerComprobanteResponse) ::) external;

declare function xf:TrGetComprobanteMidasToSoa($obtenerComprobanteResponse as element() (:: schema-element(ns1:obtenerComprobanteResponse) ::)) as element() (:: schema-element(ns2:obtenerComprobantesResponse) ::) {
    <ns2:obtenerComprobantesResponse>
        <ns2:comprobantesList>
            {
                for $ComprobanteOnline in $obtenerComprobanteResponse/ns1:return/dto:ComprobanteOnline
                return 
                <nmp:file>
                    <nmp:idOperacion>{fn:data($ComprobanteOnline/dto:idOperacion)}</nmp:idOperacion>
                    <nmp:archivo>{fn:data($ComprobanteOnline/dto:archivo)}</nmp:archivo></nmp:file>
            }</ns2:comprobantesList>
    </ns2:obtenerComprobantesResponse>
};

xf:TrGetComprobanteMidasToSoa($obtenerComprobanteResponse)