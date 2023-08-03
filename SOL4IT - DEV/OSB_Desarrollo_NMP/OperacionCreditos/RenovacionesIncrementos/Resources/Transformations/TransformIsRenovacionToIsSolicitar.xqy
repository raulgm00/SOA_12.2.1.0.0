xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/EvaluacionCredito";
(:: import schema at "../Schemas/OSBRenovacionCreditoElementosXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/ReglaRenovacionTopUp";
(:: import schema at "../Schemas/BRMReglaRenovacionTopUpXSD.xsd" ::)
declare namespace ns3="http://tempuri.org/";
(:: import schema at "../../../../FuerzaDeVentas/GestionOrdenesTrabajo/Resources/Schemas/CRMServicioOrdenesElementosXSD.xsd" ::)


declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";

declare namespace nmp1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOferta";

declare namespace nmp2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPLlamada";

declare namespace nmp3 = "http://schemas.datacontract.org/2004/07/Nmp.Crm.Servicios.DataContracts";

declare namespace nmp4 = "http://schemas.datacontract.org/2004/07/NMP.MRT.BusinessTypes";

                          

declare variable $bodyRequest as element() (:: schema-element(ns1:processCreditoRequest) ::) external;
declare variable $brmResponse as element() (:: schema-element(ns2:isRenovacionTopUpMessageResponse) ::) external;
declare variable $crmResponse as element() (:: schema-element(ns3:RecuperarUltimaLlamadaResponse) ::) external;

declare function local:func($bodyRequest as element() (:: schema-element(ns1:processCreditoRequest) ::), 
                            $brmResponse as element() (:: schema-element(ns2:isRenovacionTopUpMessageResponse) ::), 
                            $crmResponse as element() (:: schema-element(ns3:RecuperarUltimaLlamadaResponse) ::)) 
                            as element() (:: schema-element(ns2:isSolicitarCampanaMessageRequest) ::) {
    <ns2:isSolicitarCampanaMessageRequest>
        <ns2:idCliente>{fn:data($bodyRequest/ns1:cliente/nmp:id)}</ns2:idCliente>
        <ns2:ofertaCRM>
            {
                if ($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:TipoIncremento)
                then <nmp1:tipoIncremento>{fn:data($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:TipoIncremento)}</nmp1:tipoIncremento>
                else ()
            }
            {
                if ($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:ResultadoOfertaMonto)
                    then <nmp1:resultado>{fn:data($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:ResultadoOfertaMonto)}</nmp1:resultado>               
                else()
            }
            {
                if ($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:ProcesoActividadId)
                then <nmp1:nombreProducto>{fn:data($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:ProcesoActividadId)}</nmp1:nombreProducto>
                else ()
            }
            {
                if ($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:Ofertas/nmp4:Oferta/nmp4:VigenciaFinal)
                then <nmp1:fechaVencimientoOferta>{fn:data($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:Ofertas/nmp4:Oferta/nmp4:VigenciaFinal)}</nmp1:fechaVencimientoOferta>
                else ()
            }
            {
             if ($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:Ofertas)
                then 
                    <nmp1:listaOpcionesPlazo>
                        {
                            for $opcionesPlazo in $crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:Ofertas/nmp4:Oferta                           
                            return 
                            <nmp1:opcionesPlazo >
                                {
                                    if ($opcionesPlazo/nmp4:OfertaId)
                                    then attribute id {fn:data($opcionesPlazo/nmp4:OfertaId)}
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp4:Tasa)
                                    then <nmp1:tasa>{fn:data($opcionesPlazo/nmp4:Tasa)}</nmp1:tasa>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp4:Plazo)
                                    then <nmp1:plazo>{fn:data($opcionesPlazo/nmp4:Plazo)}</nmp1:plazo>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp4:PagoMensual)
                                    then <nmp1:pago>{fn:data($opcionesPlazo/nmp4:PagoMensual)}</nmp1:pago>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp4:Frecuencia)
                                    then <nmp1:frecuencia>{fn:data($opcionesPlazo/nmp4:Frecuencia)}</nmp1:frecuencia>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp4:Monto)
                                    then <nmp1:monto>{fn:data($opcionesPlazo/nmp4:Monto)}</nmp1:monto>
                                    else ()
                                }
                            </nmp1:opcionesPlazo>
                            }
            </nmp1:listaOpcionesPlazo>
            else()
          }
          
        </ns2:ofertaCRM>
        <ns2:ofertaBRM>
            {
                if ($brmResponse/ns2:oferta/nmp1:tipoIncremento)
                then <nmp1:tipoIncremento>{fn:data($brmResponse/ns2:oferta/nmp1:tipoIncremento)}</nmp1:tipoIncremento>
                else ()
            }
            {
                if ($brmResponse/ns2:oferta/nmp1:resultado)
                then <nmp1:resultado>{fn:data($brmResponse/ns2:oferta/nmp1:resultado)}</nmp1:resultado>
                else ()
            }
            {
                if ($brmResponse/ns2:oferta/nmp1:nombreProducto)
                then <nmp1:nombreProducto>{fn:data($brmResponse/ns2:oferta/nmp1:nombreProducto)}</nmp1:nombreProducto>
                else ()
            }
            {
                if ($brmResponse/ns2:oferta/nmp1:tipoOferta)
                then <nmp1:tipoOferta>{fn:data($brmResponse/ns2:oferta/nmp1:tipoOferta)}</nmp1:tipoOferta>
                else ()
            }
            {
                if ($brmResponse/ns2:oferta/nmp1:fechaVencimientoOferta)
                then <nmp1:fechaVencimientoOferta>{fn:data($brmResponse/ns2:oferta/nmp1:fechaVencimientoOferta)}</nmp1:fechaVencimientoOferta>
                else ()
            }
            {
                if ($brmResponse/ns2:oferta/nmp1:listaOpcionesPlazo)
                then 
                    <nmp1:listaOpcionesPlazo>
                        {
                            for $opcionesPlazo in $brmResponse/ns2:oferta/nmp1:listaOpcionesPlazo/nmp1:opcionesPlazo
                            return 
                            <nmp1:opcionesPlazo>
                                {
                                    if ($opcionesPlazo/@id)
                                    then attribute id {fn:data($opcionesPlazo/@id)}
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp1:idOfrecimiento)
                                    then <nmp1:idOfrecimiento>{fn:data($opcionesPlazo/nmp1:idOfrecimiento)}</nmp1:idOfrecimiento>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp1:tasa)
                                    then <nmp1:tasa>{fn:data($opcionesPlazo/nmp1:tasa)}</nmp1:tasa>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp1:plazo)
                                    then <nmp1:plazo>{fn:data($opcionesPlazo/nmp1:plazo)}</nmp1:plazo>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp1:pago)
                                    then <nmp1:pago>{fn:data($opcionesPlazo/nmp1:pago)}</nmp1:pago>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp1:frecuencia)
                                    then <nmp1:frecuencia>{fn:data($opcionesPlazo/nmp1:frecuencia)}</nmp1:frecuencia>
                                    else ()
                                }
                                {
                                    if ($opcionesPlazo/nmp1:monto)
                                    then <nmp1:monto>{fn:data($opcionesPlazo/nmp1:monto)}</nmp1:monto>
                                    else ()
                                }
                            </nmp1:opcionesPlazo>
                        }
                    </nmp1:listaOpcionesPlazo>
                else ()
            }
        </ns2:ofertaBRM>
        <ns2:respuestaCliente>
            {
                if ($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:FechaDeRespuesta)
                then <nmp2:fechaGestion>{fn:data($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:FechaDeRespuesta)}</nmp2:fechaGestion>
                else ()
            }
            {
                if ($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:Respuesta)
                then <nmp2:respuestaGestion>{fn:data($crmResponse/ns3:RecuperarUltimaLlamadaResult/nmp3:Objeto/nmp4:Respuesta)}</nmp2:respuestaGestion>
                else ()
            }
        </ns2:respuestaCliente>
    </ns2:isSolicitarCampanaMessageRequest>
};

local:func($bodyRequest, $brmResponse, $crmResponse)