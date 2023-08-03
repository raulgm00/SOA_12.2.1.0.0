xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
(:: import schema at "../Schemas/NMPAdminPagosXSD.xsd" ::)
declare namespace db="http://xmlns.oracle.com/pcbpel/adapter/db/top/NmpDSRFPagoLineaDB";
(:: import schema at "../Schemas/NMPAdminPagosBitacoraDBXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago";

declare variable $insertNotificaPago as element() (:: schema-element(ns2:setOperacionRequest) ::) external;
declare variable $operacionAutorizada as element() (:: schema-element(ns2:setOperacionResponse) ::) external;

declare function local:func($insertNotificaPago as element() (:: schema-element(ns2:setOperacionRequest) ::), 
                            $operacionAutorizada as element() (:: schema-element(ns2:setOperacionResponse) ::)) 
                            as element() (:: schema-element(db:NmpAdminPagosBitTCollection) ::) {
    <db:NmpAdminPagosBitTCollection>
        <db:NmpAdminPagosBitT>
            <db:numContrato>{fn:data($insertNotificaPago/ns2:operacion/nmp:folio)}</db:numContrato>
            <db:hrRegistroPago>{fn:current-dateTime()}</db:hrRegistroPago>
            <db:tipoOperacion>{fn:data($insertNotificaPago/ns2:operacion/nmp:idOperacion)}</db:tipoOperacion>            
            <db:importe>{fn:data($insertNotificaPago/ns2:operacion/nmp:importe)}</db:importe>            
            <db:numTransaccion>{fn:data($insertNotificaPago/ns2:operacion/nmp:transaccion)}</db:numTransaccion>            
            <db:numAutorizacion>{fn:data($insertNotificaPago/ns2:operacion/nmp:autorizacion)}</db:numAutorizacion>
            <db:numOperacion>{fn:data($insertNotificaPago/ns2:operacion/nmp:transaccionBancaria)}</db:numOperacion>
            {
                if ($operacionAutorizada/ns2:code/text() = 0)
                then 
                 <db:operacionAutorizada>Si</db:operacionAutorizada>
                else 
                 <db:operacionAutorizada>No</db:operacionAutorizada>
            }
            <db:operacion>notificarPago</db:operacion>
        </db:NmpAdminPagosBitT>
    </db:NmpAdminPagosBitTCollection>
};

local:func($insertNotificaPago, $operacionAutorizada)