(:: pragma bea:global-element-parameter parameter="$obtenerInformacionPartidaResponse" element="ns3:obtenerInformacionPartidaResponse" location="../WSDL/MIDASCajaOnline.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:getPartidaResponse" location="../XSD/AdminPagosSvc.xsd" ::)

declare namespace ns0 = "http://dto.model.midas.nmp.com.mx";
declare namespace ns2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidaSaldos";
declare namespace xf = "http://tempuri.org/OSBTestComp/Resources/XQ/TrGetPartidaMidasToSoa/";
declare namespace ns3 = "urn:mx.com.nmp.midas";

declare function xf:TrGetPartidaMidasToSoa($obtenerInformacionPartidaResponse as element(ns3:obtenerInformacionPartidaResponse))
    as element(ns2:getPartidaResponse) {
        <ns2:getPartidaResponse>
            <ns2:partidaSaldos>
                <ns1:folio>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:folio) }</ns1:folio>
                <ns1:tipoContrato>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:tipoContrato) }</ns1:tipoContrato>
                <ns1:sucursal>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:sucursal) }</ns1:sucursal>
                <ns1:transaccion>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:transaccion) }</ns1:transaccion>
                <ns1:idCliente>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:idCliente) }</ns1:idCliente>
                <ns1:aplicarReempeno>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:aplicaReempenio) }</ns1:aplicarReempeno>
                <ns1:prestamoPagado>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:prestamoPagado) }</ns1:prestamoPagado>
                <ns1:numRefrendo>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:numeroRefrendo) }</ns1:numRefrendo>
                <ns1:fechaComercializacion>{ data($obtenerInformacionPartidaResponse/ns3:return/ns0:fechaComercializacion) }</ns1:fechaComercializacion>
                {
                    for $detalleOperacionOnline in $obtenerInformacionPartidaResponse/ns3:return/ns0:detalleOperacionOnline
                    return
                        <ns1:operacionesBancariasDisponibles>
                            {
                                for $DetalleOperacionOnline in $detalleOperacionOnline/ns0:DetalleOperacionOnline
                                return
                                    <ns1:detalleOperacionBancaria>
                                        <ns1:idOperacion>{ data($DetalleOperacionOnline/ns0:idOperacion) }</ns1:idOperacion>
                                        <ns1:montoMaximo>{ data($DetalleOperacionOnline/ns0:montoMaximo) }</ns1:montoMaximo>
                                        <ns1:montoMinimo>{ data($DetalleOperacionOnline/ns0:montoMinimo) }</ns1:montoMinimo>
                                        <ns1:nombreOperacion>{ data($DetalleOperacionOnline/ns0:nombreOperacion) }</ns1:nombreOperacion>
                                    </ns1:detalleOperacionBancaria>
                            }
                        </ns1:operacionesBancariasDisponibles>
                }
            </ns2:partidaSaldos>
        </ns2:getPartidaResponse>
};

declare variable $obtenerInformacionPartidaResponse as element(ns3:obtenerInformacionPartidaResponse) external;

xf:TrGetPartidaMidasToSoa($obtenerInformacionPartidaResponse)