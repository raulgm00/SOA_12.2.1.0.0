xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos";
(:: import schema at "../Schemas/NMPUtileriaAdminPagosXSD.xsd" ::)
declare namespace ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPDSRFPagoLineaSvc";
(:: import schema at "../Schemas/NMPPagoLineaXSD.xsd" ::)
declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidaSaldos";

declare variable $getPartidaResponse as element() (:: schema-element(ns1:consultarInformacionPartidaResponse) ::) external;

declare variable $estadoTransaccion as element() (:: schema-element(ns1:validarTransaccionPagoResponse) ::) external;

declare function local:func($getPartidaResponse as element() (:: schema-element(ns1:consultarInformacionPartidaResponse) ::), $estadoTransaccion as element() (:: schema-element(ns1:validarTransaccionPagoResponse) ::)) 
                            as element() (:: schema-element(ns3:getPartidaClienteResponse) ::) {
    <ns3:getPartidaClienteResponse>
        <ns3:nombre>{fn:data($getPartidaResponse/ns1:cliente/ns1:nombre)}</ns3:nombre>
        <ns3:apellidoPaterno>{fn:data($getPartidaResponse/ns1:cliente/ns1:apellidoPaterno)}</ns3:apellidoPaterno>
        <ns3:apellidoMaterno>{fn:data($getPartidaResponse/ns1:cliente/ns1:apellidoMaterno)}</ns3:apellidoMaterno>       
        <ns3:correoElectronico>{fn:data($getPartidaResponse/ns1:cliente/ns1:correoElectronico)}</ns3:correoElectronico>       
        <ns3:partidaSaldos>
            <nmp:folio>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:folio)}</nmp:folio>
            <nmp:tipoContrato>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:tipoContrato)}</nmp:tipoContrato>
            <nmp:sucursal>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:sucursal)}</nmp:sucursal>
            <nmp:transaccion>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:transaccion)}</nmp:transaccion>
            <nmp:idCliente>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:idCliente)}</nmp:idCliente>
            <nmp:aplicarReempeno>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:aplicarReempeno)}</nmp:aplicarReempeno>
            <nmp:prestamoPagado>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:prestamoPagado)}</nmp:prestamoPagado>
            <nmp:numRefrendo>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:numRefrendo)}</nmp:numRefrendo>
            <nmp:fechaComercializacion>{fn:data($getPartidaResponse/ns1:partidaSaldos/nmp:fechaComercializacion)}</nmp:fechaComercializacion>
            {
                if ($estadoTransaccion/ns1:transaccion/ns1:estadoTransaccion)
                then <nmp:estadoPago>{fn:data($estadoTransaccion/ns1:transaccion[1]/ns1:estadoTransaccion)}</nmp:estadoPago>
                else <nmp:estadoPago>0</nmp:estadoPago>
            }
            {
                if ($getPartidaResponse/ns1:partidaSaldos/nmp:operacionesBancariasDisponibles)
                then 
                    <nmp:operacionesBancariasDisponibles>
                        {
                            for $detalleOperacionBancaria in $getPartidaResponse/ns1:partidaSaldos/nmp:operacionesBancariasDisponibles/nmp:detalleOperacionBancaria
                            return 
                            <nmp:detalleOperacionBancaria>
                                <nmp:idOperacion>{fn:data($detalleOperacionBancaria/nmp:idOperacion)}</nmp:idOperacion>
                                <nmp:montoMaximo>{fn:data($detalleOperacionBancaria/nmp:montoMaximo)}</nmp:montoMaximo>
                                <nmp:montoMinimo>{fn:data($detalleOperacionBancaria/nmp:montoMinimo)}</nmp:montoMinimo>
                                <nmp:nombreOperacion>{fn:data($detalleOperacionBancaria/nmp:nombreOperacion)}</nmp:nombreOperacion>
                            </nmp:detalleOperacionBancaria>
                        }
                    </nmp:operacionesBancariasDisponibles>
                else ()
            }
        </ns3:partidaSaldos>
    </ns3:getPartidaClienteResponse>
};

local:func($getPartidaResponse, $estadoTransaccion)