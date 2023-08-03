xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos";
(:: import schema at "../Schemas/NMPUtileriaAdminPagosXSD.xsd" ::)
declare namespace ns2="urn:mx.com.nmp.midas";
(:: import schema at "../WSDLs/MIDASCajaOnlineWSDL.wsdl" ::)

declare namespace xf="http://tempuri.org/OSBTestComp/Resources/XQ/TrSetOperacionSoaToMidas/";

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago";

declare variable $registrarTransaccionPagoRequest as element() (:: schema-element(ns1:registrarTransaccionPagoRequest) ::) external;

declare function xf:TrSetOperacionSoaToMidas($registrarTransaccionPagoRequest as element() (:: schema-element(ns1:registrarTransaccionPagoRequest) ::)) as element() (:: schema-element(ns2:registrarOperacion) ::) {
    <ns2:registrarOperacion>
        <ns2:folio>{fn:data($registrarTransaccionPagoRequest/ns1:operacion/nmp:folio)}</ns2:folio>
        <ns2:idOperacion>{fn:data($registrarTransaccionPagoRequest/ns1:operacion/nmp:idOperacion)}</ns2:idOperacion>
        <ns2:importe>{fn:data($registrarTransaccionPagoRequest/ns1:operacion/nmp:importe)}</ns2:importe>
        <ns2:transaccion>{fn:data($registrarTransaccionPagoRequest/ns1:operacion/nmp:transaccion)}</ns2:transaccion>
        <ns2:autorizacion>{fn:data($registrarTransaccionPagoRequest/ns1:operacion/nmp:autorizacion)}</ns2:autorizacion>
        <ns2:origen>{fn:data($registrarTransaccionPagoRequest/ns1:operacion/nmp:origen)}</ns2:origen>
    </ns2:registrarOperacion>
};

xf:TrSetOperacionSoaToMidas($registrarTransaccionPagoRequest)