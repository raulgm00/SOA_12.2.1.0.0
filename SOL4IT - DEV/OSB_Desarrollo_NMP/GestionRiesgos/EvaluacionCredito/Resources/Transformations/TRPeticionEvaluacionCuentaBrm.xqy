xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito";
(:: import schema at "../Schemas/NMPEvaluacionCreditoXSD.xsd" ::)
declare namespace brm="http://servicios.montedepiedad.com.mx/NMP/Schema/ReglaRechazoCredito";
(:: import schema at "../Schemas/BRMReglasRechazoCreditoXSD.xsd" ::)

declare namespace crd="http://www.w3.org/2005/xquery-local-functions";

declare variable $peticionCliente as element() (:: schema-element(nmp:valorarRiesgoRequest) ::) external;
declare variable $indiceCuentaEvaluar as xs:int external;

declare function crd:esEstadoCuenta($fechaCierreCuenta as xs:string) as xs:string
{
      if (fn:string-length($fechaCierreCuenta) > 1) then 'Cerrada'
      else 'Abierta'
};

declare function crd:generarPeticionEvaluarCuenta($peticionCliente as element() (:: schema-element(nmp:valorarRiesgoRequest) ::), 
                                                  $indiceCuentaEvaluar as xs:int) 
                                                  as element() (:: schema-element(brm:aplicarReglasRechazoRequest) ::) {
    <brm:aplicarReglasRechazoRequest>
        <brm:cliente>
            <brm:idCliente>{fn:data($peticionCliente/nmp:cliente/nmp:idCliente)}</brm:idCliente>
            <brm:consultasEfetudasBuroCredito>
            {
              if(fn:exists($peticionCliente/nmp:buroCredito/nmp:totalConsultasEfectuadas)) then
                if (fn:empty($peticionCliente/nmp:buroCredito/nmp:totalConsultasEfectuadas/text())) then 0
                else fn:data($peticionCliente/nmp:buroCredito/nmp:totalConsultasEfectuadas)
              else 0
            }
            </brm:consultasEfetudasBuroCredito>
            <brm:calificacionBuro>
            {
              if(fn:exists($peticionCliente/nmp:buroCredito/nmp:calificacion/nmp:valorCalificacion)) then
                if(fn:empty($peticionCliente/nmp:buroCredito/nmp:calificacion/nmp:valorCalificacion/text())) then -9
                else 
                  if ($peticionCliente/nmp:buroCredito/nmp:calificacion/nmp:valorCalificacion = '0') then -9
                  else fn:data($peticionCliente/nmp:buroCredito/nmp:calificacion/nmp:valorCalificacion)
              else
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:calificacion/nmp:codigoError)) then
                  if(fn:empty($peticionCliente/nmp:buroCredito/nmp:calificacion/nmp:codigoError/text())) then -9
                  else -9
                else -9
            }
            </brm:calificacionBuro>
            <brm:siva>
            {
              if(fn:exists($peticionCliente/nmp:cliente/nmp:siva)) then
                if (fn:empty($peticionCliente/nmp:cliente/nmp:siva/text())) then 0
                else fn:data($peticionCliente/nmp:cliente/nmp:siva)
              else 0
            }
            </brm:siva>
            <brm:probabilidadIncumplimiento>
            {
              if(fn:exists($peticionCliente/nmp:cliente/nmp:probabilidadIncumplimiento)) then
                if (fn:empty($peticionCliente/nmp:cliente/nmp:probabilidadIncumplimiento/text())) then 0
                else fn:round-half-to-even($peticionCliente/nmp:cliente/nmp:probabilidadIncumplimiento, 5) 
              else 0
            }
            </brm:probabilidadIncumplimiento>
        </brm:cliente>
        <brm:cuentaEvaluar>
            <brm:numeroCuenta>
            {
              if($indiceCuentaEvaluar = -1) then ()
              else fn:data($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:numeroCuenta)
            }
            </brm:numeroCuenta>
            <brm:tipoContrato>
            {
              if($indiceCuentaEvaluar = -1) then '-' 
              else 
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:tipoContrato)) then
                  if (fn:empty($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:tipoContrato/text())) then '-'
                  else fn:data($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:tipoContrato)
                else '-' 
            }
            </brm:tipoContrato>
            <brm:institucionReporto>
            {
              if($indiceCuentaEvaluar = -1) then '-' 
              else 
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:usuarioReporto)) then
                  if (fn:empty($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:usuarioReporto/text())) then '-'
                  else fn:data($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:usuarioReporto)
                else '-' 
            }
            </brm:institucionReporto>
            <brm:estadoCuenta>
            {
              if($indiceCuentaEvaluar = -1) then 'Cerrada' 
              else crd:esEstadoCuenta(fn:concat(fn:string($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:fechaCierreCuenta), ' '))
            }
            </brm:estadoCuenta>
            <brm:saldoActual>
            {
              if($indiceCuentaEvaluar = -1) then 0
              else 
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:saldoActual)) then 
                  if(fn:empty($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:saldoActual/text())) then 0
                  else fn:abs($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:saldoActual)
                else 0
            }
            </brm:saldoActual>
            <brm:saldoVencido>
            {
              if($indiceCuentaEvaluar = -1) then 0
              else
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:saldoVencido/text())) then
                  if(fn:empty($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:saldoVencido/text())) then 0
                  else fn:abs($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:saldoVencido)
                else 0
            }
            </brm:saldoVencido>
            <brm:mopActual>
            {
              if($indiceCuentaEvaluar = -1) then 1
              else
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoActual)) then
                  if(fn:empty($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoActual/text())) then 0
                  else
                    if($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoActual = 'UR') then -1
                    else fn:data($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoActual)
                  else 0
            }
            </brm:mopActual>
            <brm:mopHistoricoMasAlto>
            {
              if($indiceCuentaEvaluar = -1) then 1
              else
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoHistoricaMasAlto)) then
                  if(fn:empty($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoHistoricaMasAlto/text())) then 0
                  else
                    if($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoHistoricaMasAlto = 'UR') then -1
                    else fn:data($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:puntualidadPagoHistoricaMasAlto)
                else 0
            }
            </brm:mopHistoricoMasAlto>
            <brm:frecuenciaPago>
            {
              if($indiceCuentaEvaluar = -1) then '-' 
              else 
                if(fn:exists($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:frecuenciaPagos)) then
                  if (fn:empty($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:frecuenciaPagos/text())) then '-'
                  else fn:data($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:frecuenciaPagos)
                else '-'
            }
            </brm:frecuenciaPago>
            <brm:porcentajeMora>{-99.99999}</brm:porcentajeMora>
        </brm:cuentaEvaluar>
        <brm:grupoCuentas>
            {
              if($indiceCuentaEvaluar = -1) then 
                <brm:cuenta>
                    <brm:numeroCuenta/>
                    <brm:saldoActual>0</brm:saldoActual>
                    <brm:saldoVencido>0</brm:saldoVencido>
                </brm:cuenta>
              else 
                if ($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:usuarioReporto/text() = 'COMUNICACIONES'
                    or $peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:usuarioReporto/text() = 'SERVICIOS') then
                      for $cuenta in $peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta
                      where  fn:concat($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:usuarioReporto/text(), '-') = fn:concat($cuenta/nmp:usuarioReporto/text(), '-')
                        and fn:concat($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:tipoContrato/text(), '-') = fn:concat($cuenta/nmp:tipoContrato/text(), '-')
                        and crd:esEstadoCuenta(fn:concat(fn:string($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:fechaCierreCuenta), ' ')) = crd:esEstadoCuenta(fn:concat(fn:string($cuenta/nmp:fechaCierreCuenta), ' '))
                      return 
                      <brm:cuenta>
                          <brm:numeroCuenta>{fn:data($cuenta/nmp:numeroCuenta)}</brm:numeroCuenta>
                          <brm:saldoActual>
                          {
                            if(fn:exists($cuenta/nmp:saldoActual)) then 
                              if(fn:empty($cuenta/nmp:saldoActual/text())) then 0
                              else fn:abs($cuenta/nmp:saldoActual)
                            else 0
                          }
                          </brm:saldoActual>
                          <brm:saldoVencido>
                          {
                            if(fn:exists($cuenta/nmp:saldoVencido)) then 
                              if(fn:empty($cuenta/nmp:saldoVencido/text())) then 0
                              else fn:abs($cuenta/nmp:saldoVencido)
                            else 0
                          }
                          </brm:saldoVencido>
                      </brm:cuenta>
                else
                  for $cuenta in $peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta
                  where (fn:concat($cuenta/nmp:usuarioReporto/text(), '-') != 'COMUNICACIONES' or fn:concat($cuenta/nmp:usuarioReporto/text(), '-') != 'SERVICIOS')
                    and fn:concat($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:tipoContrato/text(), '-') = fn:concat($cuenta/nmp:tipoContrato/text(), '-')
                    and crd:esEstadoCuenta(fn:concat(fn:string($peticionCliente/nmp:buroCredito/nmp:cuentas/nmp:cuenta[$indiceCuentaEvaluar]/nmp:fechaCierreCuenta), ' ')) = crd:esEstadoCuenta(fn:concat(fn:string($cuenta/nmp:fechaCierreCuenta), ' '))
                  return 
                  <brm:cuenta>
                      <brm:numeroCuenta>{fn:data($cuenta/nmp:numeroCuenta)}</brm:numeroCuenta>
                      <brm:saldoActual>
                      {
                        if(fn:exists($cuenta/nmp:saldoActual)) then 
                          if(fn:empty($cuenta/nmp:saldoActual/text())) then 0
                          else fn:abs($cuenta/nmp:saldoActual)
                        else 0
                      }
                      </brm:saldoActual>
                      <brm:saldoVencido>
                      {
                        if(fn:exists($cuenta/nmp:saldoVencido)) then 
                          if(fn:empty($cuenta/nmp:saldoVencido/text())) then 0
                          else fn:abs($cuenta/nmp:saldoVencido)
                        else 0
                      }
                      </brm:saldoVencido>
                  </brm:cuenta>
            }
        </brm:grupoCuentas>
    </brm:aplicarReglasRechazoRequest>
};

crd:generarPeticionEvaluarCuenta($peticionCliente, $indiceCuentaEvaluar)