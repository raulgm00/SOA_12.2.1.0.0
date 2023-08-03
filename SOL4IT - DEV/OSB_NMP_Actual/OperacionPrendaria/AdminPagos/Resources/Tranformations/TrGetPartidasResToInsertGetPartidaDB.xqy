xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
(:: import schema at "../Schemas/NMPAdminPagosXSD.xsd" ::)
declare namespace db="http://xmlns.oracle.com/pcbpel/adapter/db/top/NmpDSRFPagoLineaDB";
(:: import schema at "../Schemas/NMPAdminPagosBitacoraDBXSD.xsd" ::)

declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidaSaldos";

declare variable $insertPartidaClientes as element() (:: schema-element(ns2:getPartidaResponse) ::) external;

declare function local:func($insertPartidaClientes as element() (:: schema-element(ns2:getPartidaResponse) ::)) as element() (:: element(*, db:NmpAdminPagosBitTCollection) ::) {
    <db:NmpAdminPagosBitTCollection>
    { for $detalle in $insertPartidaClientes/ns2:partidaSaldos/ns1:operacionesBancariasDisponibles/ns1:detalleOperacionBancaria
        return
        <db:NmpAdminPagosBitT>
            <db:numContrato>{fn:data($insertPartidaClientes/ns2:partidaSaldos/ns1:folio)}</db:numContrato>
            <db:hrConsultaContrato>{fn:current-dateTime()}</db:hrConsultaContrato>
            <db:tipoOperacion>{fn:data($detalle/ns1:idOperacion)}</db:tipoOperacion>
            <db:importe>{fn:data($detalle/ns1:montoMaximo)}</db:importe>
            <db:numTransaccion>{fn:data($insertPartidaClientes/ns2:partidaSaldos/ns1:transaccion)}</db:numTransaccion>
            <db:operacion>getPartidaCliente</db:operacion>
        </db:NmpAdminPagosBitT>
        }
    </db:NmpAdminPagosBitTCollection>
};

local:func($insertPartidaClientes)