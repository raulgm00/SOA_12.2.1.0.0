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
declare variable $idCliente as xs:int external;
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
                                                         $idCliente as xs:int,
                                                         $probabilidadIncumplimiento as xs:decimal,
                                                         $siva as xs:int,
                                                         $origenConsulta as xs:string) 
                                                         as element() (:: schema-element(bcv:valorRiesgoRequest) ::) {
    <bcv:valorRiesgoRequest>
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
                        <bcv:valorCalificacion>{fn:data($consultaBuroCreditoVigente/bcc:informeBuro/bcc:calificaciones/bcc:calificacion/bcc:valorScore)}</bcv:valorCalificacion>
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
                    for $cuenta in $consultaBuroCreditoVigente/bcc:informeBuro/bcc:cuentas/bcc:cuenta
                    return 
                    <bcv:cuenta>
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:FechaActualizo>{fn:data($cuenta/bcc:fechaActualizacion)}</bcv:FechaActualizo>
                        else if ($origenConsulta = 'BURO') then
                          if(fn:empty($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaActualizacion/text())) then ()
                          else
                            if(fn:string($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaActualizacion) != '00000000') then
                              <bcv:FechaActualizo>{crd:string-to-dateFormat($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaActualizacion)}</bcv:FechaActualizo>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:usuarioReporto>{fn:data($cuenta/bcc:nombreOtorgante)}</bcv:usuarioReporto>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:usuarioReporto>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/NombreOtorgante)}</bcv:usuarioReporto>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:numeroCuenta>{fn:data($cuenta/bcc:numeroCuenta)}</bcv:numeroCuenta>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:numeroCuenta>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/NumeroCuentaActual)}</bcv:numeroCuenta>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:indicadorTipoResponsabilidad)
                            then <bcv:tipoResponsabilidadCuenta>{fn:data($cuenta/bcc:indicadorTipoResponsabilidad)}</bcv:tipoResponsabilidadCuenta>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                            if ($cuenta/bcc:indicadorTipoResponsabilidad)
                            then 
                                if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/IndicadorTipoResponsabilidad)
                                then <bcv:tipoResponsabilidadCuenta>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/IndicadorTipoResponsabilidad)}</bcv:tipoResponsabilidadCuenta>
                                else ()
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:tipoCuenta)
                            then <bcv:tipoCuenta>{fn:data($cuenta/bcc:tipoCuenta)}</bcv:tipoCuenta>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TipoCuenta)
                            then <bcv:tipoCuenta>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TipoCuenta)}</bcv:tipoCuenta>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:tipoContrato>{fn:data($cuenta/bcc:tipoContrato)}</bcv:tipoContrato>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:tipoContrato>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TipoContrato)}</bcv:tipoContrato>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          
                            if ($cuenta/bcc:claveUnidadMonetaria)
                            then <bcv:claveMoneda>{fn:data($cuenta/bcc:claveUnidadMonetaria)}</bcv:claveMoneda>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/ClaveUnidadMonetaria)
                            then <bcv:claveMoneda>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/ClaveUnidadMonetaria)}</bcv:claveMoneda>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          
                            if ($cuenta/bcc:valorActivoValuacion)
                            then <bcv:montoAvaluao>{fn:data($cuenta/bcc:valorActivoValuacion)}</bcv:montoAvaluao>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/ValorActivoValuacion)
                            then <bcv:montoAvaluao>{crd:string-to-signedLong($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/ValorActivoValuacion)}</bcv:montoAvaluao>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          
                            if ($cuenta/bcc:numeroPagos)
                            then <bcv:numeroPagos>{fn:data($cuenta/bcc:numeroPagos)}</bcv:numeroPagos>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/NumeroPagos)
                            then <bcv:numeroPagos>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/NumeroPagos)}</bcv:numeroPagos>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:frecuenciaPagos>{fn:data($cuenta/bcc:frecuenciaPagos)}</bcv:frecuenciaPagos>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:frecuenciaPagos>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FrecuenciaPagos)}</bcv:frecuenciaPagos>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          
                            if ($cuenta/bcc:montoPagar)
                            then <bcv:montoPagar>{fn:data($cuenta/bcc:montoPagar)}</bcv:montoPagar>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          <bcv:montoPagar>{crd:string-to-signedLong($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/MontoPagar)}</bcv:montoPagar>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:fechaAperturaCuenta)
                            then <bcv:fechaAperturaCuenta>{fn:data($cuenta/bcc:fechaAperturaCuenta)}</bcv:fechaAperturaCuenta>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          if(fn:empty($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaAperturaCuenta/text())) then ()
                          else
                            if(fn:string($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaAperturaCuenta) != '00000000') then
                              <bcv:fechaAperturaCuenta>{crd:string-to-dateFormat($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaAperturaCuenta)}</bcv:fechaAperturaCuenta>
                            else()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:fechaUltimoPago)
                            then <bcv:fechaUltimoPago>{fn:data($cuenta/bcc:fechaUltimoPago)}</bcv:fechaUltimoPago>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          if(fn:empty($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaUltimoPago/text())) then ()
                          else
                            if(fn:string($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaUltimoPago) != '00000000') then
                              <bcv:fechaUltimoPago>{crd:string-to-dateFormat($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaUltimoPago)}</bcv:fechaUltimoPago>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:fechaCierreCuenta)
                            then <bcv:fechaCierreCuenta>{fn:data($cuenta/bcc:fechaCierreCuenta)}</bcv:fechaCierreCuenta>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          if(fn:empty($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaCierreCuenta/text())) then ()
                          else
                            if(fn:string($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaCierreCuenta) != '00000000') then
                              <bcv:fechaCierreCuenta>{crd:string-to-dateFormat($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaCierreCuenta)}</bcv:fechaCierreCuenta>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:fechaReporte)
                            then <bcv:fechaReportoCuenta>{fn:data($cuenta/bcc:fechaReporte)}</bcv:fechaReportoCuenta>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          if(fn:empty($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaReporte/text())) then ()
                          else
                            if(fn:string($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaReporte) != '00000000') then
                              <bcv:fechaReportoCuenta>{crd:string-to-dateFormat($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaReporte)}</bcv:fechaReportoCuenta>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:saldoActual>{fn:data($cuenta/bcc:saldoActual)}</bcv:saldoActual>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:saldoActual>{crd:string-to-signedLong($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/SaldoActual)}</bcv:saldoActual>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:limiteCredito)
                            then <bcv:limiteCredito>{fn:data($cuenta/bcc:limiteCredito)}</bcv:limiteCredito>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          <bcv:limiteCredito>{crd:string-to-signedLong($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/LimiteCredito)}</bcv:limiteCredito>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:saldoVencido>{fn:data($cuenta/bcc:saldoVencido)}</bcv:saldoVencido>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:saldoVencido>{crd:string-to-signedLong($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/SaldoVencido)}</bcv:saldoVencido>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:numeroPagosVencidos)
                            then <bcv:pagosVencidos>{fn:data($cuenta/bcc:numeroPagosVencidos)}</bcv:pagosVencidos>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/NumeroPagosVencidos)
                            then <bcv:pagosVencidos>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/NumeroPagosVencidos)}</bcv:pagosVencidos>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:puntualidadPagoActual>{fn:data($cuenta/bcc:formaPagoActual)}</bcv:puntualidadPagoActual>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:puntualidadPagoActual>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FormaPagoActual)}</bcv:puntualidadPagoActual>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:totalPagosReportados)
                            then <bcv:totalPagosReportados>{fn:data($cuenta/bcc:totalPagosReportados)}</bcv:totalPagosReportados>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosReportados)
                            then <bcv:totalPagosReportados>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosReportados)}</bcv:totalPagosReportados>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:totalPagosCalificadosMOP2)
                            then <bcv:totalPagosCalificacosMOP2>{fn:data($cuenta/bcc:totalPagosCalificadosMOP2)}</bcv:totalPagosCalificacosMOP2>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP2)
                            then <bcv:totalPagosCalificacosMOP2>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP2)}</bcv:totalPagosCalificacosMOP2>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:totalPagosCalificadosMOP3)
                            then <bcv:totalPagosCalificacosMOP3>{fn:data($cuenta/bcc:totalPagosCalificadosMOP3)}</bcv:totalPagosCalificacosMOP3>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP3)
                            then <bcv:totalPagosCalificacosMOP3>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP3)}</bcv:totalPagosCalificacosMOP3>
                            else ()
                        else ()
                      }
                      
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:totalPagosCalificadosMOP4)
                            then <bcv:totalPagosCalificacosMOP4>{fn:data($cuenta/bcc:totalPagosCalificadosMOP4)}</bcv:totalPagosCalificacosMOP4>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP4)
                            then <bcv:totalPagosCalificacosMOP4>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP4)}</bcv:totalPagosCalificacosMOP4>
                            else ()
                        else ()
                      }
                      
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:totalPagosCalificadosMOP5)
                            then <bcv:totalPagosCalificacosMOP5>{fn:data($cuenta/bcc:totalPagosCalificadosMOP5)}</bcv:totalPagosCalificacosMOP5>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                            if ($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP5)
                            then <bcv:totalPagosCalificacosMOP5>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/TotalPagosCalificadosMOP5)}</bcv:totalPagosCalificacosMOP5>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:importeSaldoMorosidadHistMasGrave)
                            then <bcv:montoSaldoPuntualidadHistoricaMasAlta>{fn:data($cuenta/bcc:importeSaldoMorosidadHistMasGrave)}</bcv:montoSaldoPuntualidadHistoricaMasAlta>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          <bcv:montoSaldoPuntualidadHistoricaMasAlta>{crd:string-to-signedLong($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/ImporteSaldoMorosidadHistMasGrave)}</bcv:montoSaldoPuntualidadHistoricaMasAlta>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:fechaHistoricaMorosidadMasGrave)
                            then <bcv:fechaPuntualidadPagoHistoricaMasAlto>{fn:data($cuenta/bcc:fechaHistoricaMorosidadMasGrave)}</bcv:fechaPuntualidadPagoHistoricaMasAlto>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          if(fn:empty($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaHistoricaMorosidadMasGrave/text())) then ()
                          else
                            if(fn:string($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaHistoricaMorosidadMasGrave) != '00000000') then
                              <bcv:fechaPuntualidadPagoHistoricaMasAlto>{crd:string-to-dateFormat($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/FechaHistoricaMorosidadMasGrave)}</bcv:fechaPuntualidadPagoHistoricaMasAlto>
                            else ()
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                          <bcv:puntualidadPagoHistoricaMasAlto>{fn:data($cuenta/bcc:mopHistoricoMorosidadMasGrave)}</bcv:puntualidadPagoHistoricaMasAlto>
                        else if ($origenConsulta = 'BURO') then
                          <bcv:puntualidadPagoHistoricaMasAlto>{fn:data($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/MopHistoricoMorosidadMasGrave)}</bcv:puntualidadPagoHistoricaMasAlto>
                        else ()
                      }
                      {
                        if ($origenConsulta = 'SAP') then
                            if ($cuenta/bcc:montoUltimoPago)
                            then <bcv:montoUltimoPago>{fn:data($cuenta/bcc:montoUltimoPago)}</bcv:montoUltimoPago>
                            else ()
                        else if ($origenConsulta = 'BURO') then
                          <bcv:montoUltimoPago>{crd:string-to-signedLong($consultaBuroCredito/return/Personas/Persona/Cuentas/Cuenta/MontoUltimoPago)}</bcv:montoUltimoPago>
                        else ()
                      }
                    </bcv:cuenta>
                }
            </bcv:cuentas>
        </bcv:buroCredito>
    </bcv:valorRiesgoRequest>
};

crd:peticionEvaluacionCreditoOSBCredito($consultaBuroCredito, $consultaBuroCreditoVigente, $idCliente, $probabilidadIncumplimiento, $siva, $origenConsulta)