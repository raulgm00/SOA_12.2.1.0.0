xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPDSRFPagoLineaSvc";
(:: import schema at "../Schemas/NMPPagoLineaXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos";
(:: import schema at "../Schemas/NMPUtileriaAdminPagosXSD.xsd" ::)

declare namespace ap="http://servicios.montedepiedad.com.mx/NMP/XQ/AdminPagos";

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago";

declare variable $preregistarPagoRequest as element() (:: schema-element(ns1:preregistarPagoRequest) ::) external;

declare function ap:registraPagoBitacora($preregistarPagoRequest as element() (:: schema-element(ns1:preregistarPagoRequest) ::)) as element() (:: schema-element(ns2:registrarTransaccionPagoBitRequest) ::) {
    <ns2:registrarTransaccionPagoBitRequest>
        {
            for $partida in $preregistarPagoRequest/nmp:transaccionPago/nmp:partidas/nmp:partida
            return 
            <ns2:NmpTransaccionPago>
                <ns2:transaccionBancaria>{fn:data($preregistarPagoRequest/nmp:transaccionPago/nmp:banco/nmp:transaccionBancaria)}</ns2:transaccionBancaria>
                <ns2:importe>{fn:data($partida/nmp:monto)}</ns2:importe>
                <ns2:folioPartida>{fn:data($partida/nmp:folio)}</ns2:folioPartida>
                <ns2:idOperacion>{fn:data($partida/nmp:idOperacion)}</ns2:idOperacion>
                <ns2:correoElectronico>{fn:data($preregistarPagoRequest/nmp:transaccionPago/nmp:cliente/nmp:correoElectronico)}</ns2:correoElectronico></ns2:NmpTransaccionPago>
        }
    </ns2:registrarTransaccionPagoBitRequest>
};

ap:registraPagoBitacora($preregistarPagoRequest)