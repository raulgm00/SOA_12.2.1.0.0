xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/EvaluacionCredito";
(:: import schema at "../Schemas/OSBRenovacionCreditoElementosXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/ReglaRenovacionTopUp";
(:: import schema at "../Schemas/BRMReglaRenovacionTopUpXSD.xsd" ::)
declare namespace ns3="http://tempuri.org/";
(:: import schema at "../../../../FuerzaDeVentas/GestionOrdenesTrabajo/Resources/Schemas/CRMServicioOrdenesElementosXSD.xsd" ::)

declare namespace nmp = "http://schemas.datacontract.org/2004/07/NMP.MRT.BusinessTypes";

declare namespace nmp1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";

declare namespace nmp2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito";

declare namespace nmp3 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOferta";

declare variable $osbInput as element() (:: schema-element(ns1:processCreditoRequest) ::) external;
declare variable $brmOutput as element() (:: schema-element(ns2:isRenovacionTopUpMessageResponse) ::) external;
declare variable $monthNames := ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre", "Octubre","Noviembre","Diciembre");


declare function local:func($osbInput as element() (:: schema-element(ns1:processCreditoRequest) ::), 
                            $brmOutput as element() (:: schema-element(ns2:isRenovacionTopUpMessageResponse) ::)) 
                            as element() (:: schema-element(ns3:MapearDatosProspecto) ::) {
                            
    <ns3:MapearDatosProspecto>
        <ns3:llamada>
            {
                if ($osbInput/ns1:cliente/nmp1:id)
                then <nmp:IdCliente>{fn:data($osbInput/ns1:cliente/nmp1:id)}</nmp:IdCliente>
                else ()
            }
            <nmp:ListaDeTrabajo>
            {fn:data(fn:concat('Renovación-',local:get-month-name(fn:current-date()),'-',fn:year-from-date(fn:current-date())))}
            </nmp:ListaDeTrabajo>
            {
                if ($osbInput/ns1:cliente/nmp1:infoBasicaCliente/nmp1:mandante)
                then <nmp:MandtSociedad>{fn:data($osbInput/ns1:cliente/nmp1:infoBasicaCliente/nmp1:mandante)}</nmp:MandtSociedad>
                else ()
            }
            {
                if ($osbInput/ns1:credito/nmp2:contrato)
                then <nmp:NumeroContrato>{fn:data($osbInput/ns1:credito/nmp2:contrato)}</nmp:NumeroContrato>
                else ()
            }
            {
                if ($brmOutput/ns2:oferta/nmp3:listaOpcionesPlazo)
                then 
                  <nmp:Ofertas>
                  {
                    for $opcionesPlazo in $brmOutput/ns2:oferta/nmp3:listaOpcionesPlazo/nmp3:opcionesPlazo
                            return 
                           <nmp:OfertasReq>
                    {
                        if ($opcionesPlazo/nmp3:frecuencia)
                        then <nmp:Frecuencia>{fn:data($opcionesPlazo/nmp3:frecuencia)}</nmp:Frecuencia>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/@id)
                        then <nmp:IDOfrecimiento>{fn:data($opcionesPlazo/@id)}</nmp:IDOfrecimiento>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp3:monto)
                        then <nmp:Monto>{fn:data($opcionesPlazo/nmp3:monto)}</nmp:Monto>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp3:pago)
                        then <nmp:PagoMensual>{fn:data($opcionesPlazo/nmp3:pago)}</nmp:PagoMensual>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp3:plazo)
                        then <nmp:Plazo>{fn:data($opcionesPlazo/nmp3:plazo)}</nmp:Plazo>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp3:tasa)
                        then <nmp:Tasa>{fn:data($opcionesPlazo/nmp3:tasa)}</nmp:Tasa>
                        else ()
                    }
                </nmp:OfertasReq>
                }
            </nmp:Ofertas>
            else()
            }
            {
                if ($brmOutput/ns2:oferta/nmp3:nombreProducto)
                then <nmp:ProcesoActividad>{fn:data($brmOutput/ns2:oferta/nmp3:nombreProducto)}</nmp:ProcesoActividad>
                else ()
            }
            
            {
                if ($brmOutput/ns2:oferta/nmp3:resultado)
                then <nmp:ResultadoOferta>{fn:data($brmOutput/ns2:oferta/nmp3:resultado)}</nmp:ResultadoOferta>
                else ()
            }
            {
                if ($brmOutput/ns2:oferta/nmp3:tipoIncremento)
                then <nmp:TipoIncremento>{fn:data($brmOutput/ns2:oferta/nmp3:tipoIncremento)}</nmp:TipoIncremento>
                else ()
            }
            {
                if ($brmOutput/ns2:oferta/nmp3:fechaVencimientoOferta)
                then <nmp:VigenciaFinal>{fn:data($brmOutput/ns2:oferta/nmp3:fechaVencimientoOferta)}</nmp:VigenciaFinal>
                else ()
            }
        </ns3:llamada>
    </ns3:MapearDatosProspecto>
};

declare function local:get-month-name($currentDate as xs:date) as xs:string {
    let $monthNum := fn:month-from-date($currentDate)
    return $monthNames [$monthNum]
};

local:func($osbInput, $brmOutput)