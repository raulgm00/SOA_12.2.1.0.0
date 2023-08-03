(:: pragma bea:global-element-parameter parameter="$setOperacionRequest" element="ns1:setOperacionRequest" location="../XSD/AdminPagosSvc.xsd" ::)
(:: pragma bea:global-element-return element="ns2:registrarOperacion" location="../WSDL/MIDASCajaOnline.wsdl" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago";
declare namespace ns2 = "urn:mx.com.nmp.midas";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
declare namespace xf = "http://tempuri.org/OSBTestComp/Resources/XQ/TrSetOperacionSoaToMidas/";

declare function xf:TrSetOperacionSoaToMidas($setOperacionRequest as element(ns1:setOperacionRequest))
    as element(ns2:registrarOperacion) {
        <ns2:registrarOperacion>
            <ns2:folio>{ data($setOperacionRequest/ns1:operacion/ns0:folio) }</ns2:folio>
            <ns2:idOperacion>{ data($setOperacionRequest/ns1:operacion/ns0:idOperacion) }</ns2:idOperacion>
            <ns2:importe>{ data($setOperacionRequest/ns1:operacion/ns0:importe) }</ns2:importe>
            <ns2:transaccion>{ data($setOperacionRequest/ns1:operacion/ns0:transaccion) }</ns2:transaccion>
            <ns2:autorizacion>{ data($setOperacionRequest/ns1:operacion/ns0:autorizacion) }</ns2:autorizacion>
            <ns2:origen>{ data($setOperacionRequest/ns1:operacion/ns0:origen) }</ns2:origen>
        </ns2:registrarOperacion>
};

declare variable $setOperacionRequest as element(ns1:setOperacionRequest) external;

xf:TrSetOperacionSoaToMidas($setOperacionRequest)