xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/EvaluacionCredito";
(:: import schema at "../Schemas/OSBRenovacionCreditoElementosXSD.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/xdb/CMSOA";
(:: import schema at "../Schemas/OSBRenovacionTiposXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPersona";

declare namespace nmp1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";

declare namespace nmp2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito";

declare variable $aqBody as element() (:: schema-element(ns1:RENOVACION_MESSAGE_TYPE) ::) external;

declare function local:func($aqBody as element() (:: schema-element(ns1:RENOVACION_MESSAGE_TYPE) ::)) as element() (:: schema-element(ns2:processCreditoRequest) ::) {
    <ns2:processCreditoRequest>
        <ns2:cliente>
            <nmp:Contacto>
                <nmp:ListaDirecciones>
                    <nmp:Direccion>
                        {
                            if ($aqBody/ESTADO)
                            then <nmp:estado>{fn:data($aqBody/ESTADO)}</nmp:estado>
                            else ()
                        }
                    </nmp:Direccion>
                </nmp:ListaDirecciones>
            </nmp:Contacto>
            {
                if ($aqBody/ID_CLIENTE)
                then <nmp1:id>{fn:data($aqBody/ID_CLIENTE)}</nmp1:id>
                else ()
            }
            <nmp1:infoBasicaCliente>
                {
                    if ($aqBody/MANDT)
                    then <nmp1:mandante>{fn:data($aqBody/MANDT)}</nmp1:mandante>
                    else ()
                }
                {
                    if ($aqBody/SOCIEDAD)
                    then <nmp1:sociedad>{fn:data($aqBody/SOCIEDAD)}</nmp1:sociedad>
                    else ()
                }
            </nmp1:infoBasicaCliente>
            <nmp1:calificacionCliente>
                {
                    if ($aqBody/CP)
                    then <nmp1:capacidadDePago>{fn:data($aqBody/CP)}</nmp1:capacidadDePago>
                    else ()
                }
                {
                    if ($aqBody/PI)
                    then <nmp1:probabilidadIncumplimiento>{fn:data($aqBody/PI)}</nmp1:probabilidadIncumplimiento>
                    else ()
                }
                {
                    if (fn:exists($aqBody/FECHA_BURO))
                    then 
                      if(fn:empty($aqBody/FECHA_BURO/text()))
                      then ()
                      else
                    <nmp1:ultimafechaConsultaBuro>{fn:data(fn:substring-before($aqBody/FECHA_BURO/text(),"T"))}</nmp1:ultimafechaConsultaBuro>
                    else ()
                }
                {
                    if ($aqBody/SCORE)
                    then <nmp1:calificacionBuro>{fn:data($aqBody/SCORE)}</nmp1:calificacionBuro>
                    else ()
                }
                {
                    if ($aqBody/SIVA)
                    then <nmp1:calificacionSiva>{fn:data($aqBody/SIVA)}</nmp1:calificacionSiva>
                    else ()
                }
            </nmp1:calificacionCliente>
        </ns2:cliente>
        <ns2:credito>
            {
                if ($aqBody/ID_CLIENTE)
                then <nmp2:idCliente>{fn:data($aqBody/ID_CLIENTE)}</nmp2:idCliente>
                else ()
            }
            {
                if ($aqBody/CONTRATO)
                then <nmp2:contrato>{fn:data($aqBody/CONTRATO)}</nmp2:contrato>
                else ()
            }
            {
                if ($aqBody/ESTATUS)
                then <nmp2:estatus>{fn:data($aqBody/ESTATUS)}</nmp2:estatus>
                else ()
            }
            <nmp2:codicionesContrato>
                {
                    if ($aqBody/PRODUCTO)
                    then <nmp2:productoTipo>{fn:data($aqBody/PRODUCTO)}</nmp2:productoTipo>
                    else ()
                }
                {
                    if ($aqBody/SUBPRODUCTO)
                    then <nmp2:subProductoTipo>{fn:data($aqBody/SUBPRODUCTO)}</nmp2:subProductoTipo>
                    else ()
                }
                {
                    if ($aqBody/PLAZO)
                    then <nmp2:plazo>{fn:data($aqBody/PLAZO)}</nmp2:plazo>
                    else ()
                }
                {
                    if ($aqBody/FRECUENCIA)
                    then <nmp2:frecuencia>{fn:data($aqBody/FRECUENCIA)}</nmp2:frecuencia>
                    else ()
                }
                {
                    if ($aqBody/MONTO_DESEMBOLSO)
                    then <nmp2:desembolso>{fn:data($aqBody/MONTO_DESEMBOLSO)}</nmp2:desembolso>
                    else ()
                }
                {
                    if ($aqBody/PAGO_PERIODICO)
                    then <nmp2:montoPagoPeriodico>{fn:data($aqBody/PAGO_PERIODICO)}</nmp2:montoPagoPeriodico>
                    else ()
                }
            </nmp2:codicionesContrato>
            <nmp2:saldo>
                {
                    if ($aqBody/SALDO_VENCIDO)
                    then <nmp2:saldoVencido>{fn:data($aqBody/SALDO_VENCIDO)}</nmp2:saldoVencido>
                    else ()
                }
                {
                    if ($aqBody/CUOTAS_TRANSCURR)
                    then <nmp2:cuotasDevengadas>{fn:data($aqBody/CUOTAS_TRANSCURR)}</nmp2:cuotasDevengadas>
                    else ()
                }
                {
                    if ($aqBody/CAPITAL_PAGADO)
                    then <nmp2:porcentajeCapitalPagado>{fn:data($aqBody/CAPITAL_PAGADO)}</nmp2:porcentajeCapitalPagado>
                    else ()
                }
                <nmp2:listaCardexPagosVencidos>
                 {
                    if ($aqBody/PV1)
                    then    <nmp2:pagoVencido cardexNum="1">{fn:data($aqBody/PV1)}</nmp2:pagoVencido>
                    else ()
                }
                {
                    if ($aqBody/PV2)
                    then    <nmp2:pagoVencido cardexNum="2">{fn:data($aqBody/PV2)}</nmp2:pagoVencido>
                    else ()
                }
                {
                    if ($aqBody/PV3)
                    then    <nmp2:pagoVencido cardexNum="3">{fn:data($aqBody/PV3)}</nmp2:pagoVencido>
                    else ()
                }
                {
                    if ($aqBody/PV4)
                    then    <nmp2:pagoVencido cardexNum="4">{fn:data($aqBody/PV4)}</nmp2:pagoVencido>
                    else ()
                }
                </nmp2:listaCardexPagosVencidos>
            </nmp2:saldo>
        </ns2:credito>
    </ns2:processCreditoRequest>

};

local:func($aqBody)