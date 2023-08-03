xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
(:: import schema at "../Schemas/NMPAdminPagosXSD.xsd" ::)
declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPDSRFPagoLineaSvc";
(:: import schema at "../Schemas/NMPPagoLineaXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago";

declare variable $aplicarMovimiento as element() (:: schema-element(ns1:notificarPagoRequest) ::) external;

declare function local:func($aplicarMovimiento as element() (:: schema-element(ns1:notificarPagoRequest) ::)) as element() (:: schema-element(ns2:setOperacionRequest) ::) {
    <ns2:setOperacionRequest>
        <ns2:operacion>
            <nmp:folio>{fn:data($aplicarMovimiento/ns1:aplicarMovimiento/nmp:folio)}</nmp:folio>
            <nmp:idOperacion>{fn:data($aplicarMovimiento/ns1:aplicarMovimiento/nmp:idOperacion)}</nmp:idOperacion>
            {
                if ($aplicarMovimiento/ns1:aplicarMovimiento/nmp:importe)
                then <nmp:importe>{fn:data($aplicarMovimiento/ns1:aplicarMovimiento/nmp:importe)}</nmp:importe>
                else ()
            }
            <nmp:transaccion>{fn:data($aplicarMovimiento/ns1:aplicarMovimiento/nmp:transaccion)}</nmp:transaccion>
            {
                if ($aplicarMovimiento/ns1:aplicarMovimiento/nmp:autorizacion)
                then <nmp:autorizacion>{fn:data($aplicarMovimiento/ns1:aplicarMovimiento/nmp:autorizacion)}</nmp:autorizacion>
                else ()
            }
            {
                if ($aplicarMovimiento/ns1:aplicarMovimiento/nmp:transaccionBancaria)
                then <nmp:transaccionBancaria>{fn:data($aplicarMovimiento/ns1:aplicarMovimiento/nmp:transaccionBancaria)}</nmp:transaccionBancaria>
                else ()
            }
            <nmp:origen>{fn:data($aplicarMovimiento/ns1:aplicarMovimiento/nmp:origen)}</nmp:origen>
        </ns2:operacion>
    </ns2:setOperacionRequest>
};

local:func($aplicarMovimiento)