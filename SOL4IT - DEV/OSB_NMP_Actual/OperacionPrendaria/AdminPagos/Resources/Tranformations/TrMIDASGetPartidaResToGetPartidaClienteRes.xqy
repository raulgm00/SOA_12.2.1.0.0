xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
(:: import schema at "../Schemas/NMPAdminPagosXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../../../../GestionClientes/Clientes/Resources/Schemas/NMPClientesSvcElementosXSD.xsd" ::)
declare namespace ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPDSRFPagoLineaSvc";
(:: import schema at "../Schemas/NMPPagoLineaXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidaSaldos";

declare variable $getPartidaResponse as element() (:: schema-element(ns1:getPartidaResponse) ::) external;
declare variable $getClientesByIDResponse as element() (:: schema-element(ns2:getClientesByIDResponse) ::) external;

declare function local:func($getPartidaResponse as element() (:: schema-element(ns1:getPartidaResponse) ::), 
                            $getClientesByIDResponse as element() (:: schema-element(ns2:getClientesByIDResponse) ::)) 
                            as element() (:: schema-element(ns3:getPartidaClienteResponse) ::) {
    <ns3:getPartidaClienteResponse>
        <ns3:nombre>{fn:data($getClientesByIDResponse/ns2:Cliente/ns2:nombre)}</ns3:nombre>
        <ns3:apellidoPaterno>{fn:data($getClientesByIDResponse/ns2:Cliente/ns2:apellidoPaterno)}</ns3:apellidoPaterno>
        <ns3:apellidoMaterno>{fn:data($getClientesByIDResponse/ns2:Cliente/ns2:apellidoMaterno)}</ns3:apellidoMaterno>       
       {
            if ($getClientesByIDResponse[ns2:Cliente/ns2:CorreosElectronicos/ns2:CorreoElectronico/ns2:tipoEmail = 'RF y DL']) then
                <ns3:correoElectronico>{fn:data($getClientesByIDResponse/ns2:Cliente/ns2:CorreosElectronicos/ns2:CorreoElectronico[ns2:tipoEmail = 'RF y DL']/ns2:email)}</ns3:correoElectronico>
            else
                <ns3:correoElectronico>{fn:data($getClientesByIDResponse/ns2:Cliente/ns2:CorreosElectronicos/ns2:CorreoElectronico[ns2:tipoEmail = 'Principal']/ns2:email)}</ns3:correoElectronico>
        }
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

local:func($getPartidaResponse, $getClientesByIDResponse)