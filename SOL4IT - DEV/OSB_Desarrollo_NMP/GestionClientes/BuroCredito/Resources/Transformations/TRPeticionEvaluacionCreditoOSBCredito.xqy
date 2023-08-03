xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace bc="http://bean.consulta.ws.bc.com/";
(:: import schema at "../Schemas/BCConsultaBuroCreditoXSD.xsd" ::)
declare namespace bcc="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)
declare namespace bcv="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito";
(:: import schema at "../../../../GestionRiesgos/EvaluacionCredito/Resources/Schemas/NMPEvaluacionCreditoXSD.xsd" ::)

declare namespace crd="http://www.w3.org/2005/xquery-local-functions";

declare variable $consultaBuroCredito as element() (:: schema-element(bc:consultaXMLResponse) ::) external;
declare variable $consultaBuroCreditoVigente as element() (:: schema-element(bcc:consultaVigenteBCResponse) ::) external;
declare variable $idCliente as xs:long external;
declare variable $probabilidadIncumplimiento as xs:decimal external;
declare variable $siva as xs:int external;
declare variable $origenConsulta as xs:string external;

declare function crd:string-to-dateFormat($stringTodate as xs:string)  as xs:string {
  fn:concat(fn:substring($stringTodate, 5, 4), "-", fn:substring($stringTodate, 3, 2), "-", fn:substring($stringTodate, 1, 2))
 } ;
 
declare function crd:string-to-signedLong($stringToSignedLong as xs:string) as xs:long{
  if(fn:substring($stringToSignedLong,fn:string-length($stringToSignedLong)) = '+') then
    xs:long(fn:substring($stringToSignedLong,1,fn:string-length($stringToSignedLong)-1))
  else if(fn:substring($stringToSignedLong,fn:string-length($stringToSignedLong)) = '-') then
    xs:long(xs:int(fn:substring($stringToSignedLong,1,fn:string-length($stringToSignedLong)-1)) * (-1))
  else xs:long($stringToSignedLong) 
 };

declare function crd:peticionEvaluacionCreditoOSBCredito($consultaBuroCredito as element() (:: schema-element(bc:consultaXMLResponse) ::), 
                                                         $consultaBuroCreditoVigente as element() (:: schema-element(bcc:consultaVigenteBCResponse) ::),
                                                         $idCliente as xs:long,
                                                         $probabilidadIncumplimiento as xs:decimal,
                                                         $siva as xs:int,
                                                         $origenConsulta as xs:string) 
                                                         as element() (:: schema-element(bcv:valorarRiesgoRequest) ::) {
    <bcv:valorarRiesgoRequest>
        <bcv:cliente>
            <bcv:idCliente>{fn:data($idCliente)}</bcv:idCliente>
            <bcv:fechaEvaluacion>{fn:current-date()}</bcv:fechaEvaluacion>
            <bcv:probabilidadIncumplimiento>{fn:data($probabilidadIncumplimiento)}</bcv:probabilidadIncumplimiento>
            <bcv:siva>{fn:data($siva)}</bcv:siva>
        </bcv:cliente>
        <bcv:buroCredito>
            {
                if ($origenConsulta = 'SAP') then
                    <bcv:totalConsultasEfectuadas>{fn:count($consultaBuroCreditoVigente/bcc:informeBuro/bcc:consultasEfectuadasExpediente/bcc:consultaEfectuda)}</bcv:totalConsultasEfectuadas>
                else if($origenConsulta = 'BURO') then
                    <bcv:totalConsultasEfectuadas>{fn:count($consultaBuroCredito/return/Personas/Persona/ConsultasEfectuadas/ConsultaEfectuada)}</bcv:totalConsultasEfectuadas>
                else ()
            }
            <bcv:calificacion>
                {
                    if ($origenConsulta = 'SAP') then
                      if(fn:exists($consultaBuroCreditoVigente/bcc:informeBuro/bcc:calificaciones/bcc:calificacion/bcc:valorScore)) then
                        if(fn:empty($consultaBuroCreditoVigente/bcc:informeBuro/bcc:calificaciones/bcc:calificacion/bcc:valorScore/text())) then <bcv:valorCalificacion>0</bcv:valorCalificacion>
                        else <bcv:valorCalificacion>{fn:data($consultaBuroCreditoVigente/bcc:informeBuro/bcc:calificaciones/bcc:calificacion/bcc:valorScore)}</bcv:valorCalificacion>
                      else <bcv:valorCalificacion>0</bcv:valorCalificacion>
                    else if ($origenConsulta = 'BURO') then
                        <bcv:valorCalificacion>{fn:data($consultaBuroCredito/return/Personas/Persona/ScoreBuroCredito/ScoreBC/ValorScore)}</bcv:valorCalificacion>
                    else ()
                }
                {
                  if ($origenConsulta = 'SAP') then
                     if ($consultaBuroCreditoVigente/bcc:informeBuro/bcc:calificaciones/bcc:calificacion/bcc:codigoError)
                      then <bcv:codigoError>{fn:data($consultaBuroCreditoVigente/bcc:informeBuro/bcc:calificaciones/bcc:calificacion/bcc:codigoError)}</bcv:codigoError>
                      else ()
                  else if ($origenConsulta = 'BURO') then
                      if ($consultaBuroCredito/return/Personas/Persona/ScoreBuroCredito/ScoreBC/CodigoError)
                      then <bcv:codigoError>{fn:data($consultaBuroCredito/return/Personas/Persona/ScoreBuroCredito/ScoreBC/CodigoError)}</bcv:codigoError>
                      else ()
                  else ()
                }
            </bcv:calificacion>
            <bcv:cuentas>
                {
                if ($origenConsulta = 'SAP') then
                    for $cuenta in $consultaBuroCreditoVigente/bcc:informeBuro/bcc:cuentas/bcc:cuenta
                    return 
                    <bcv:cuenta>
                      {
                        if (fn:empty($cuenta/bcc:fechaActualizacion/text())) then ()
                        else <bcv:FechaActualizo>{fn:data($cuenta/bcc:fechaActualizacion)}</bcv:FechaActualizo>
                      }
                      {
                        if (fn:empty($cuenta/bcc:nombreOtorgante)) then ()
                        else <bcv:usuarioReporto>{fn:data($cuenta/bcc:nombreOtorgante)}</bcv:usuarioReporto>
                      }
                      {
                        if (fn:empty($cuenta/bcc:numeroCuenta/text())) then ()
                        else <bcv:numeroCuenta>{fn:data($cuenta/bcc:numeroCuenta)}</bcv:numeroCuenta>
                      }
                      {
                        if (fn:empty($cuenta/bcc:indicadorTipoResponsabilidad/text())) then ()
                        else <bcv:tipoResponsabilidadCuenta>{fn:data($cuenta/bcc:indicadorTipoResponsabilidad)}</bcv:tipoResponsabilidadCuenta>
                      }
                      {
                        if (fn:empty($cuenta/bcc:tipoCuenta/text())) then ()
                        else <bcv:tipoCuenta>{fn:data($cuenta/bcc:tipoCuenta)}</bcv:tipoCuenta>
                      }
                      {
                        if (fn:empty($cuenta/bcc:tipoContrato/text())) then ()
                        else <bcv:tipoContrato>{fn:data($cuenta/bcc:tipoContrato)}</bcv:tipoContrato>
                      }
                      {
                        if (fn:empty($cuenta/bcc:claveUnidadMonetaria/text())) then ()
                        else <bcv:claveMoneda>{fn:data($cuenta/bcc:claveUnidadMonetaria)}</bcv:claveMoneda>
                      }
                      {
                        if (fn:empty($cuenta/bcc:valorActivoValuacion/text())) then ()
                        else <bcv:montoAvaluao>{fn:data($cuenta/bcc:valorActivoValuacion)}</bcv:montoAvaluao>
                      }
                      {
                        if (fn:empty($cuenta/bcc:numeroPagos/text())) then ()
                        else <bcv:numeroPagos>{fn:data($cuenta/bcc:numeroPagos)}</bcv:numeroPagos>
                      }
                      {
                        if (fn:empty($cuenta/bcc:frecuenciaPagos/text())) then ()
                        else <bcv:frecuenciaPagos>{fn:data($cuenta/bcc:frecuenciaPagos)}</bcv:frecuenciaPagos>
                      }
                      {
                        if (fn:empty($cuenta/bcc:montoPagar/text())) then ()
                        else <bcv:montoPagar>{fn:data($cuenta/bcc:montoPagar)}</bcv:montoPagar>
                      }
                      {
                        if (fn:empty($cuenta/bcc:fechaAperturaCuenta/text())) then ()
                        else <bcv:fechaAperturaCuenta>{fn:data($cuenta/bcc:fechaAperturaCuenta)}</bcv:fechaAperturaCuenta>
                      }
                      {
                        if (fn:empty($cuenta/bcc:fechaUltimoPago/text())) then ()
                        else <bcv:fechaUltimoPago>{fn:data($cuenta/bcc:fechaUltimoPago)}</bcv:fechaUltimoPago>
                      }
                      {
                        if (fn:empty($cuenta/bcc:fechaCierreCuenta/text())) then ()
                        else <bcv:fechaCierreCuenta>{fn:data($cuenta/bcc:fechaCierreCuenta)}</bcv:fechaCierreCuenta>
                      }
                      {
                        if (fn:empty($cuenta/bcc:fechaReporte/text())) then ()
                        else <bcv:fechaReportoCuenta>{fn:data($cuenta/bcc:fechaReporte)}</bcv:fechaReportoCuenta>
                      }
                      {
                        if (fn:empty($cuenta/bcc:saldoActual/text())) then ()
                        else <bcv:saldoActual>{fn:data($cuenta/bcc:saldoActual)}</bcv:saldoActual>
                      }
                      {
                        if (fn:empty($cuenta/bcc:limiteCredito/text())) then ()
                        else <bcv:limiteCredito>{fn:data($cuenta/bcc:limiteCredito)}</bcv:limiteCredito>
                      }
                      {
                        if (fn:empty($cuenta/bcc:saldoVencido/text())) then ()
                        else <bcv:saldoVencido>{fn:data($cuenta/bcc:saldoVencido)}</bcv:saldoVencido>
                      }
                      {
                        if (fn:empty($cuenta/bcc:numeroPagosVencidos/text())) then ()
                        else <bcv:pagosVencidos>{fn:data($cuenta/bcc:numeroPagosVencidos)}</bcv:pagosVencidos>
                      }
                      {
                        if (fn:empty($cuenta/bcc:formaPagoActual/text())) then ()
                        else <bcv:puntualidadPagoActual>{fn:data($cuenta/bcc:formaPagoActual)}</bcv:puntualidadPagoActual>
                      }
                      {
                        if (fn:empty($cuenta/bcc:totalPagosReportados/text())) then ()
                        else <bcv:totalPagosReportados>{fn:data($cuenta/bcc:totalPagosReportados)}</bcv:totalPagosReportados>
                      }
                      {
                        if (fn:empty($cuenta/bcc:totalPagosCalificadosMOP2/text())) then ()
                        else <bcv:totalPagosCalificadosMOP2>{fn:data($cuenta/bcc:totalPagosCalificadosMOP2)}</bcv:totalPagosCalificadosMOP2>
                      }
                      {
                        if (fn:empty($cuenta/bcc:totalPagosCalificadosMOP3/text())) then ()
                        else <bcv:totalPagosCalificadosMOP3>{fn:data($cuenta/bcc:totalPagosCalificadosMOP3)}</bcv:totalPagosCalificadosMOP3>
                      }
                      {
                        if (fn:empty($cuenta/bcc:totalPagosCalificadosMOP4/text())) then ()
                        else <bcv:totalPagosCalificadosMOP4>{fn:data($cuenta/bcc:totalPagosCalificadosMOP4)}</bcv:totalPagosCalificadosMOP4>
                      }
                      {
                        if (fn:empty($cuenta/bcc:totalPagosCalificadosMOP5/text())) then ()
                        else <bcv:totalPagosCalificadosMOP5>{fn:data($cuenta/bcc:totalPagosCalificadosMOP5)}</bcv:totalPagosCalificadosMOP5>
                      }
                      {
                        if (fn:empty($cuenta/bcc:importeSaldoMorosidadHistMasGrave/text())) then ()
                        else <bcv:montoSaldoPuntualidadHistoricaMasAlta>{fn:data($cuenta/bcc:importeSaldoMorosidadHistMasGrave)}</bcv:montoSaldoPuntualidadHistoricaMasAlta>
                      }
                      {
                        if (fn:empty($cuenta/bcc:fechaHistoricaMorosidadMasGrave/text())) then ()
                        else <bcv:fechaPuntualidadPagoHistoricaMasAlto>{fn:data($cuenta/bcc:fechaHistoricaMorosidadMasGrave)}</bcv:fechaPuntualidadPagoHistoricaMasAlto>
                      }
                      {
                        if (fn:empty($cuenta/bcc:mopHistoricoMorosidadMasGrave/text())) then ()
                        else <bcv:puntualidadPagoHistoricaMasAlto>{fn:data($cuenta/bcc:mopHistoricoMorosidadMasGrave)}</bcv:puntualidadPagoHistoricaMasAlto>
                      }
                      {
                        if (fn:empty($cuenta/bcc:montoUltimoPago/text())) then ()
                        else <bcv:montoUltimoPago>{fn:data($cuenta/bcc:montoUltimoPago)}</bcv:montoUltimoPago>
                      }
                    </bcv:cuenta>
                else if ($origenConsulta = 'BURO') then
                    for $cuenta in $consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta
                    return 
                    <bcv:cuenta>
                      {
                          if(fn:empty($cuenta/FechaActualizacion/text())) then ()
                          else
                            if(fn:string($cuenta/FechaActualizacion) != '00000000') then
                              <bcv:FechaActualizo>{crd:string-to-dateFormat($cuenta/FechaActualizacion)}</bcv:FechaActualizo>
                            else ()
                      }
                      {
                        if (fn:empty($cuenta/NombreOtorgante/text())) then ()
                        else <bcv:usuarioReporto>{fn:data($cuenta/NombreOtorgante)}</bcv:usuarioReporto>
                      }
                      {
                        if (fn:empty($cuenta/NumeroCuentaActual/text())) then ()
                        else <bcv:numeroCuenta>{fn:data($cuenta/NumeroCuentaActual)}</bcv:numeroCuenta>
                      }
                      {
                        if (fn:empty($cuenta/IndicadorTipoResponsabilidad/text())) then ()
                        else <bcv:tipoResponsabilidadCuenta>{fn:data($cuenta/IndicadorTipoResponsabilidad)}</bcv:tipoResponsabilidadCuenta>
                      }
                      {
                        if (fn:empty($cuenta/TipoCuenta/text())) then ()
                        else <bcv:tipoCuenta>{fn:data($cuenta/TipoCuenta)}</bcv:tipoCuenta>
                      }
                      {
                        if (fn:empty($cuenta/TipoContrato/text())) then ()
                        else <bcv:tipoContrato>{fn:data($cuenta/TipoContrato)}</bcv:tipoContrato>
                      }
                      {
                        if (fn:empty($cuenta/ClaveUnidadMonetaria/text())) then ()
                        else <bcv:claveMoneda>{fn:data($cuenta/ClaveUnidadMonetaria)}</bcv:claveMoneda>
                      }
                      {
                        if (fn:empty($cuenta/ValorActivoValuacion/text())) then ()
                        else <bcv:montoAvaluao>{crd:string-to-signedLong($cuenta/ValorActivoValuacion)}</bcv:montoAvaluao>
                      }
                      {
                        if (fn:empty($cuenta/NumeroPagos/text())) then ()
                        else <bcv:numeroPagos>{fn:data($cuenta/NumeroPagos)}</bcv:numeroPagos>
                      }
                      {
                        if (fn:empty($cuenta/FrecuenciaPagos/text())) then ()
                        else <bcv:frecuenciaPagos>{fn:data($cuenta/FrecuenciaPagos)}</bcv:frecuenciaPagos>
                      }
                      {
                        if (fn:empty($cuenta/MontoPagar/text())) then ()
                        else<bcv:montoPagar>{crd:string-to-signedLong($cuenta/MontoPagar)}</bcv:montoPagar>
                      }
                      {
                       
                        if(fn:empty($cuenta/FechaAperturaCuenta/text())) then ()
                        else
                          if(fn:string($cuenta/FechaAperturaCuenta) != '00000000') then
                            <bcv:fechaAperturaCuenta>{crd:string-to-dateFormat($cuenta/FechaAperturaCuenta)}</bcv:fechaAperturaCuenta>
                          else()
                      }
                      {
                          if(fn:empty($cuenta/FechaUltimoPago/text())) then ()
                          else
                            if(fn:string($cuenta/FechaUltimoPago) != '00000000') then
                              <bcv:fechaUltimoPago>{crd:string-to-dateFormat($cuenta/FechaUltimoPago)}</bcv:fechaUltimoPago>
                            else ()
                      }
                      {
                          if(fn:empty($cuenta/FechaCierreCuenta/text())) then ()
                          else
                            if(fn:string($cuenta/FechaCierreCuenta) != '00000000') then
                              <bcv:fechaCierreCuenta>{crd:string-to-dateFormat($cuenta/FechaCierreCuenta)}</bcv:fechaCierreCuenta>
                            else ()
                      }
                      {
                          if(fn:empty($cuenta/FechaReporte/text())) then ()
                          else
                            if(fn:string($cuenta/FechaReporte) != '00000000') then
                              <bcv:fechaReportoCuenta>{crd:string-to-dateFormat($cuenta/FechaReporte)}</bcv:fechaReportoCuenta>
                            else ()
                      }
                      {
                        if(fn:empty($cuenta/SaldoActual/text())) then ()
                        else <bcv:saldoActual>{crd:string-to-signedLong($cuenta/SaldoActual)}</bcv:saldoActual>
                      }
                      {
                        if (fn:empty($cuenta/LimiteCredito/text())) then ()
                        else <bcv:limiteCredito>{crd:string-to-signedLong($cuenta/LimiteCredito)}</bcv:limiteCredito>
                      }
                      {
                        if (fn:empty($cuenta/SaldoVencido/text())) then ()
                        else <bcv:saldoVencido>{crd:string-to-signedLong($cuenta/SaldoVencido)}</bcv:saldoVencido>
                      }
                      {
                        if (fn:empty($cuenta/NumeroPagosVencidos/text())) then ()
                        else <bcv:pagosVencidos>{fn:data($cuenta/NumeroPagosVencidos)}</bcv:pagosVencidos>
                      }
                      {
                        if (fn:empty($cuenta/FormaPagoActual/text())) then ()
                        else <bcv:puntualidadPagoActual>{fn:data($cuenta/FormaPagoActual)}</bcv:puntualidadPagoActual>
                      }
                      {                        
                        if (fn:empty($cuenta/TotalPagosReportados/text())) then ()
                        else <bcv:totalPagosReportados>{fn:data($cuenta/TotalPagosReportados)}</bcv:totalPagosReportados>
                      }
                      {
                        if (fn:empty($cuenta/TotalPagosCalificadosMOP2/text())) then ()
                        else <bcv:totalPagosCalificadosMOP2>{fn:data($cuenta/TotalPagosCalificadosMOP2)}</bcv:totalPagosCalificadosMOP2>
                      }
                      {
                        if (fn:empty($cuenta/TotalPagosCalificadosMOP3/text())) then ()
                        else <bcv:totalPagosCalificadosMOP3>{fn:data($cuenta/TotalPagosCalificadosMOP3)}</bcv:totalPagosCalificadosMOP3>
                      }

                      {
                        if (fn:empty($cuenta/TotalPagosCalificadosMOP4/text())) then ()
                        else <bcv:totalPagosCalificadosMOP4>{fn:data($cuenta/TotalPagosCalificadosMOP4)}</bcv:totalPagosCalificadosMOP4>
                      }
                      
                      {
                        if (fn:empty($cuenta/TotalPagosCalificadosMOP5/text())) then ()
                        else <bcv:totalPagosCalificadosMOP5>{fn:data($cuenta/TotalPagosCalificadosMOP5)}</bcv:totalPagosCalificadosMOP5>
                      }
                      {
                        if (fn:empty($cuenta/ImporteSaldoMorosidadHistMasGrave/text())) then ()
                        else <bcv:montoSaldoPuntualidadHistoricaMasAlta>{crd:string-to-signedLong($cuenta/ImporteSaldoMorosidadHistMasGrave)}</bcv:montoSaldoPuntualidadHistoricaMasAlta>
                      }
                      {
                          if(fn:empty($cuenta/FechaHistoricaMorosidadMasGrave/text())) then ()
                          else
                            if(fn:string($cuenta/FechaHistoricaMorosidadMasGrave) != '00000000') then
                              <bcv:fechaPuntualidadPagoHistoricaMasAlto>{crd:string-to-dateFormat($cuenta/FechaHistoricaMorosidadMasGrave)}</bcv:fechaPuntualidadPagoHistoricaMasAlto>
                            else ()
                      }
                      {
                        if(fn:empty($cuenta/MopHistoricoMorosidadMasGrave/text())) then ()
                        else <bcv:puntualidadPagoHistoricaMasAlto>{fn:data($cuenta/MopHistoricoMorosidadMasGrave)}</bcv:puntualidadPagoHistoricaMasAlto>
                      }
                      {
                         if(fn:empty($cuenta/MontoUltimoPago/text())) then ()
                         else <bcv:montoUltimoPago>{crd:string-to-signedLong($cuenta/MontoUltimoPago)}</bcv:montoUltimoPago>
                      }
                    </bcv:cuenta>
                else ()
                }
            </bcv:cuentas>
        </bcv:buroCredito>
    </bcv:valorarRiesgoRequest>
};

crd:peticionEvaluacionCreditoOSBCredito($consultaBuroCredito, $consultaBuroCreditoVigente, $idCliente, $probabilidadIncumplimiento, $siva, $origenConsulta)