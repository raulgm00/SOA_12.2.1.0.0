xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)
declare namespace sap="urn:sap-com:document:sap:soap:functions:mc-style";
(:: import schema at "../WSDLs/SAPConsultaVigenteCreditoWSDL.wsdl" ::)

declare namespace crd="http://www.w3.org/2005/xquery-local-functions";

declare variable $sap:respuestaSAP as element() (:: schema-element(sap:ZlmfmRfcDetalleVigenteResponse) ::) external;
declare variable $idCliente as xs:long external;

declare function crd:string-to-dateFormat($stringTodate as xs:string)  as xs:string {
  fn:concat(fn:substring($stringTodate, 5, 4), "-", fn:substring($stringTodate, 3, 2), "-", fn:substring($stringTodate, 1, 2))
 } ;
 
declare function crd:string-to-signedLong($stringToSignedLong as xs:string) as xs:long{ 
  if ($stringToSignedLong = '') then  xs:long('0')
   else if(fn:substring($stringToSignedLong,fn:string-length($stringToSignedLong)) = '+') then
    xs:long(fn:substring($stringToSignedLong,1,fn:string-length($stringToSignedLong)-1))
  else if(fn:substring($stringToSignedLong,fn:string-length($stringToSignedLong)) = '-') then
    xs:long(xs:int(fn:substring($stringToSignedLong,1,fn:string-length($stringToSignedLong)-1)) * (-1))
  else xs:long($stringToSignedLong) 
 };

declare function crd:PeticionConsultaVigenteCredito($idCliente as xs:long, $sap:respuestaSAP as element() (:: schema-element(sap:ZlmfmRfcDetalleVigenteResponse) ::)) as element() (:: schema-element(nmp:consultaVigenteBCResponse) ::) {
    <nmp:consultaVigenteBCResponse>
        <nmp:respuesta>
        {
          if($sap:respuestaSAP/EConfirmacion = '0') then 'Vigente'
          else if($sap:respuestaSAP/EConfirmacion = '1') then 'No vigente'
          else 'No vigente'
        }
        </nmp:respuesta>
        <nmp:informeBuro>
            <nmp:encabezado>
                <nmp:version>{fn:data($sap:respuestaSAP/EtIntl/Version)}</nmp:version>
                <nmp:numeroReferenciaOperador>{fn:data($sap:respuestaSAP/EtIntl/RefOperador)}</nmp:numeroReferenciaOperador>
                <nmp:claveProductoRequerido>{fn:data($sap:respuestaSAP/EtIntl/Producto)}</nmp:claveProductoRequerido>
                <nmp:clavePais>{fn:data($sap:respuestaSAP/EtIntl/Pais)}</nmp:clavePais>
                <nmp:identificadorBuro>{fn:data($sap:respuestaSAP/EtIntl/IdBuro)}</nmp:identificadorBuro>
                <nmp:claveUsuario></nmp:claveUsuario>
                <nmp:contrasenaUsuario></nmp:contrasenaUsuario>
                <nmp:tipoConsulta>{fn:data($sap:respuestaSAP/EtIntl/TipoConsulta)}</nmp:tipoConsulta>
                <nmp:tipoContrato>{fn:data($sap:respuestaSAP/EtIntl/TipoContrato)}</nmp:tipoContrato>
                <nmp:claveUnidadMonetaria>{fn:data($sap:respuestaSAP/EtIntl/Moneda)}</nmp:claveUnidadMonetaria>
                <nmp:importeContrato>{fn:data($sap:respuestaSAP/EtIntl/ImporteContrato)}</nmp:importeContrato>
                <nmp:idioma>{fn:data($sap:respuestaSAP/EtIntl/Idioma)}</nmp:idioma>
                <nmp:tipoSalida>{fn:data($sap:respuestaSAP/EtIntl/TipoSalida)}</nmp:tipoSalida>
                <nmp:claveOtorgante>{fn:data($sap:respuestaSAP/EtIntl/Otorgante)}</nmp:claveOtorgante>
                <nmp:claveRetornoConsumidorPrincipal>{fn:data($sap:respuestaSAP/EtIntl/RcPrincipal)}</nmp:claveRetornoConsumidorPrincipal>
                <nmp:claveRetornoConsumidorSecundario>{fn:data($sap:respuestaSAP/EtIntl/RcSecundario)}</nmp:claveRetornoConsumidorSecundario>
                <nmp:numeroControlConsulta>{fn:data($sap:respuestaSAP/EtEs/item/Control)}</nmp:numeroControlConsulta>
            </nmp:encabezado>
            <nmp:cliente>
                <nmp:idCliente>{fn:string($idCliente)}</nmp:idCliente>
                <nmp:primerNombre>{fn:data($sap:respuestaSAP/EtPn/PrimerNombre)}</nmp:primerNombre>
                <nmp:segundoNombre>{fn:data($sap:respuestaSAP/EtPn/SegundoNombre)}</nmp:segundoNombre>
                <nmp:apellidoPaterno>{fn:data($sap:respuestaSAP/EtPn/ApePaterno)}</nmp:apellidoPaterno>
                <nmp:apellidoMaterno>{fn:data($sap:respuestaSAP/EtPn/ApeMaterno)}</nmp:apellidoMaterno>
                <nmp:apellidoAdicional>{fn:data($sap:respuestaSAP/EtPn/ApeAdicional)}</nmp:apellidoAdicional>
                
                {
                  if(fn:empty($sap:respuestaSAP/EtPn/FechaNacimiento/text())) then ()
                  else
                    if(fn:string($sap:respuestaSAP/EtPn/FechaNacimiento) != '0000-00-00') then
                      <nmp:fechaNacimiento>{fn:data($sap:respuestaSAP/EtPn/FechaNacimiento)}</nmp:fechaNacimiento>
                    else ()
                }
                
                <nmp:rfc>{fn:data($sap:respuestaSAP/EtPn/Rfc)}</nmp:rfc>
                <nmp:prefijoPersonal>{fn:data($sap:respuestaSAP/EtPn/Prefijo)}</nmp:prefijoPersonal>
                <nmp:sufijoPersonal>{fn:data($sap:respuestaSAP/EtPn/Sufijo)}</nmp:sufijoPersonal>
                <nmp:claveNacionalidad>{fn:data($sap:respuestaSAP/EtPn/Nacionalidad)}</nmp:claveNacionalidad>
                <nmp:claveTipoResidencia>{fn:data($sap:respuestaSAP/EtPn/Residencia)}</nmp:claveTipoResidencia>
                <nmp:numeroLicenciaConducir>{fn:data($sap:respuestaSAP/EtPn/LicConducir)}</nmp:numeroLicenciaConducir>
                <nmp:claveEstadoCivil>{fn:data($sap:respuestaSAP/EtPn/EdoCivil)}</nmp:claveEstadoCivil>
                <nmp:genero>{fn:data($sap:respuestaSAP/EtPn/Sexo)}</nmp:genero>
                <nmp:numeroCedulaProfesional>{fn:data($sap:respuestaSAP/EtPn/CedulaProf)}</nmp:numeroCedulaProfesional>
                <nmp:numeroRegistroElectoral>{fn:data($sap:respuestaSAP/EtPn/RegElectoral)}</nmp:numeroRegistroElectoral>
                <nmp:claveImpuestoOtroPais>{fn:data($sap:respuestaSAP/EtPn/ImpuestosExt)}</nmp:claveImpuestoOtroPais>
                <nmp:claveOtroPais>{fn:data($sap:respuestaSAP/EtPn/PaisExt)}</nmp:claveOtroPais>
                <nmp:numeroDependientes>{fn:data($sap:respuestaSAP/EtPn/Dependientes)}</nmp:numeroDependientes>
                <nmp:edadesDependientes>{fn:data($sap:respuestaSAP/EtPn/EdadesDep)}</nmp:edadesDependientes>
                {
                  if(fn:empty($sap:respuestaSAP/EtPn/FechaRecepcion/text())) then ()
                  else
                    if(fn:string($sap:respuestaSAP/EtPn/FechaRecepcion) != '0000-00-00') then
                      <nmp:fechaRecepcionInformacionDependientes>{fn:data($sap:respuestaSAP/EtPn/FechaRecepcion)}</nmp:fechaRecepcionInformacionDependientes>
                    else ()
                }
                {
                  if(fn:empty($sap:respuestaSAP/EtPn/FechaDefuncion/text())) then ()
                  else
                    if(fn:string($sap:respuestaSAP/EtPn/FechaDefuncion) != '0000-00-00') then
                      <nmp:fechaDefusion>{fn:data($sap:respuestaSAP/EtPn/FechaDefuncion)}</nmp:fechaDefusion>
                    else ()
                }
            </nmp:cliente>
            <nmp:domicilios>
                {
                    for $item in $sap:respuestaSAP/EtPa/item
                    return 
                    <nmp:domicilio>
                        <nmp:direccion>{fn:data($item/Direccion1)}</nmp:direccion>
                        <nmp:direccionAdicional>{fn:data($item/Direccion2)}</nmp:direccionAdicional>
                        <nmp:coloniaPoblacion>{fn:data($item/Colonia)}</nmp:coloniaPoblacion>
                        <nmp:delegacionMunicipio>{fn:data($item/Municipio)}</nmp:delegacionMunicipio>
                        <nmp:ciudad>{fn:data($item/Ciudad)}</nmp:ciudad>
                        <nmp:estado>{fn:data($item/Estado)}</nmp:estado>
                        <nmp:codigoPostal>{fn:data($item/Cp)}</nmp:codigoPostal>
                        {
                          if(fn:empty($item/FechaResidencia/text())) then ()
                          else
                            if(fn:string($item/FechaResidencia) != '0000-00-00') then
                              <nmp:fechaResidencia>{fn:data($item/FechaResidencia)}</nmp:fechaResidencia>
                            else ()
                        }
                        <nmp:numeroTelefono>{fn:data($item/Telefono)}</nmp:numeroTelefono>
                        <nmp:extension>{fn:data($item/ExtensionTel)}</nmp:extension>
                        <nmp:fax>{fn:data($item/Fax)}</nmp:fax>
                        <nmp:tipoDomicilio>{fn:data($item/TipoDomicilio)}</nmp:tipoDomicilio>
                        <nmp:indicadorEspecialDomicilio>{fn:data($item/IdEspDom)}</nmp:indicadorEspecialDomicilio>
                        {
                          if(fn:empty($item/FechaDir/text())) then ()
                            else
                              if(fn:string($item/FechaDir) != '0000-00-00') then
                                <nmp:fechaReporteDireccion>{fn:data($item/FechaDir)}</nmp:fechaReporteDireccion>
                              else ()
                        }
                      </nmp:domicilio>
                }</nmp:domicilios>
            <nmp:empleos>
                {
                    for $item1 in $sap:respuestaSAP/EtPe/item
                    return 
                    <nmp:empleo>
                        <nmp:nombreEmpresa>{fn:data($item1/Razonsocial)}</nmp:nombreEmpresa>
                        <nmp:direccion>{fn:data($item1/Direccion1)}</nmp:direccion>
                        <nmp:direccionAdicional>{fn:data($item1/Direccion2)}</nmp:direccionAdicional>
                        <nmp:coloniaPoblacion>{fn:data($item1/Colonia)}</nmp:coloniaPoblacion>
                        <nmp:delegacionMunicipio>{fn:data($item1/Municipio)}</nmp:delegacionMunicipio>
                        <nmp:ciudad>{fn:data($item1/Ciudad)}</nmp:ciudad>
                        <nmp:estado>{fn:data($item1/Estado)}</nmp:estado>
                        <nmp:codigoPostal>{fn:data($item1/Cp)}</nmp:codigoPostal>
                        <nmp:numeroTelefono>{fn:data($item1/Telefono)}</nmp:numeroTelefono>
                        <nmp:extension>{fn:data($item1/ExtensionTel)}</nmp:extension>
                        <nmp:fax>{fn:data($item1/Fax)}</nmp:fax>
                        <nmp:puesto>{fn:data($item1/Cargo)}</nmp:puesto>
                        {
                          if(fn:empty($item1/FechaContrata/text())) then ()
                            else
                              if(fn:string($item1/FechaContrata) != '0000-00-00') then
                                <nmp:fechaContratacion>{fn:data($item1/FechaContrata)}</nmp:fechaContratacion>
                              else ()
                        }
                        <nmp:claveMonedaSalario>{fn:data($item1/Moneda)}</nmp:claveMonedaSalario>
                        <nmp:salario>{fn:data($item1/Salario)}</nmp:salario>
                        <nmp:baseSalarial>{fn:data($item1/Base)}</nmp:baseSalarial>
                        <nmp:numeroEmpleado>{fn:data($item1/NumEmpleado)}</nmp:numeroEmpleado>
                        {
                          if(fn:empty($item1/FechaUltDia/text())) then ()
                            else
                              if(fn:string($item1/FechaUltDia) != '0000-00-00') then
                                <nmp:fechaUltimoDiaEmpleo>{fn:data($item1/FechaUltDia)}</nmp:fechaUltimoDiaEmpleo>
                              else ()
                        }
                        {
                          if(fn:empty($item1/FechaRegistro/text())) then ()
                            else
                              if(fn:string($item1/FechaRegistro) != '0000-00-00') then
                                <nmp:fechaReporteEmpleo>{fn:data($item1/FechaRegistro)}</nmp:fechaReporteEmpleo>
                              else ()
                        }
                        {
                          if(fn:empty($item1/FechaVerif/text())) then ()
                            else
                              if(fn:string($item1/FechaVerif) != '0000-00-00') then
                                <nmp:fechaVerificacion>{fn:data($item1/FechaVerif)}</nmp:fechaVerificacion>
                              else ()
                        }
                        <nmp:modoVerificacion>{fn:data($item1/ModoVerif)}</nmp:modoVerificacion></nmp:empleo>
                }
            </nmp:empleos>
            <nmp:cuentas>
                {
                    for $item2 in $sap:respuestaSAP/EtTl/item
                    return 
                    <nmp:cuenta>
                        <nmp:numeroCuenta>{fn:data($item2/Cuenta)}</nmp:numeroCuenta>
                        <nmp:claveOtorgnte>{fn:data($item2/Otorgante)}</nmp:claveOtorgnte>
                        <nmp:nombreOtorgante>{fn:data($item2/NombreOtorgante)}</nmp:nombreOtorgante>
                        {
                          if(fn:empty($item2/FechaActualiza/text())) then ()
                            else
                              if(fn:string($item2/FechaActualiza) != '0000-00-00') then
                                <nmp:fechaActualizacion>{fn:data($item2/FechaActualiza)}</nmp:fechaActualizacion>
                              else ()
                        }
                        <nmp:registroImpugnado>{fn:data($item2/RegImpugnado)}</nmp:registroImpugnado>
                        <nmp:numeroTelefonoOtorgante>{fn:data($item2/Telefono)}</nmp:numeroTelefonoOtorgante>
                        <nmp:identificadorSociedadInformacionCrediticia>{fn:data($item2/Sic)}</nmp:identificadorSociedadInformacionCrediticia>
                        <nmp:indicadorTipoResponsabilidad>{fn:data($item2/TipoRespon)}</nmp:indicadorTipoResponsabilidad>
                        <nmp:tipoCuenta>{fn:data($item2/TipoCuenta)}</nmp:tipoCuenta>
                        <nmp:tipoContrato>{fn:data($item2/TipoContrato)}</nmp:tipoContrato>
                        <nmp:claveUnidadMonetaria>{fn:data($item2/Moneda)}</nmp:claveUnidadMonetaria>
                        <nmp:valorActivoValuacion>{fn:data($item2/ValorActivo)}</nmp:valorActivoValuacion>
                        <nmp:numeroPagos>{fn:data($item2/NumPagos)}</nmp:numeroPagos>
                        <nmp:frecuenciaPagos>{fn:data($item2/Frecuencia)}</nmp:frecuenciaPagos>
                        <nmp:montoPagar>{fn:data($item2/Monto)}</nmp:montoPagar>
                        {
                          if(fn:empty($item2/FechaApertura/text())) then ()
                            else
                              if(fn:string($item2/FechaApertura) != '0000-00-00') then
                                <nmp:fechaAperturaCuenta>{fn:data($item2/FechaApertura)}</nmp:fechaAperturaCuenta>
                              else ()
                        }
                        {
                          if(fn:empty($item2/FechaUltPago/text())) then ()
                            else
                              if(fn:string($item2/FechaUltPago) != '0000-00-00') then
                                <nmp:fechaUltimoPago>{fn:data($item2/FechaUltPago)}</nmp:fechaUltimoPago>
                              else ()
                        }
                        {
                          if(fn:empty($item2/FechaUltCompra/text())) then ()
                            else
                              if(fn:string($item2/FechaUltCompra) != '0000-00-00') then
                                <nmp:fechaUltimaCompra>{fn:data($item2/FechaUltCompra)}</nmp:fechaUltimaCompra>
                              else ()
                        }
                        {
                          if(fn:empty($item2/FechaCierre/text())) then ()
                            else
                              if(fn:string($item2/FechaCierre) != '0000-00-00') then
                                <nmp:fechaCierreCuenta>{fn:data($item2/FechaCierre)}</nmp:fechaCierreCuenta>
                              else ()
                        }
                        {
                          if(fn:empty($item2/FechaReporte/text())) then ()
                            else
                              if(fn:string($item2/FechaReporte) != '0000-00-00') then
                                <nmp:fechaReporte>{fn:data($item2/FechaReporte)}</nmp:fechaReporte>
                              else ()
                        }
                        <nmp:modoReportar>{fn:data($item2/ModoReporte)}</nmp:modoReportar>
                        {
                          if(fn:empty($item2/FechaCero/text())) then ()
                            else
                              if(fn:string($item2/FechaCero) != '0000-00-00') then
                                <nmp:ultimaFechaSaldoCero>{fn:data($item2/FechaCero)}</nmp:ultimaFechaSaldoCero>
                              else ()
                        }
                        <nmp:garantia>{fn:data($item2/Garantia)}</nmp:garantia>
                        <nmp:creditoMaximo>{fn:data($item2/CreditoMax)}</nmp:creditoMaximo>
                        <nmp:saldoActual>{crd:string-to-signedLong($item2/SaldoActual)}</nmp:saldoActual>
                        <nmp:limiteCredito>{crd:string-to-signedLong($item2/LimiteCredito)}</nmp:limiteCredito>
                        <nmp:saldoVencido>{crd:string-to-signedLong(fn:data($item2/SaldoVencido))}</nmp:saldoVencido>
                        <nmp:numeroPagosVencidos>{crd:string-to-signedLong(fn:data($item2/PagosVencidos))}</nmp:numeroPagosVencidos>
                        <nmp:formaPagoActual>{fn:data($item2/Mop)}</nmp:formaPagoActual>
                        <nmp:historicoPagos>{fn:data($item2/HistoricoPagos)}</nmp:historicoPagos>
                        {
                          if(fn:empty($item2/FechaRecHist/text())) then ()
                            else
                              if(fn:string($item2/FechaRecHist) != '0000-00-00') then
                                <nmp:fechaMasRecienteHistoricoPagos>{fn:data($item2/FechaRecHist)}</nmp:fechaMasRecienteHistoricoPagos>
                              else ()
                        }
                        {
                          if(fn:empty($item2/FechaAntHist/text())) then ()
                            else
                              if(fn:string($item2/FechaAntHist) != '0000-00-00') then                        
                                <nmp:fechaMasAntiguaHistoricoPagos>{fn:data($item2/FechaAntHist)}</nmp:fechaMasAntiguaHistoricoPagos>
                              else ()
                        }
                        <nmp:claveObservacion>{fn:data($item2/Observacion)}</nmp:claveObservacion>
                        <nmp:totalPagosReportados>{fn:data($item2/TotalPagos)}</nmp:totalPagosReportados>
                        <nmp:totalPagosCalificadosMOP2>{fn:data($item2/CalifMop02)}</nmp:totalPagosCalificadosMOP2>
                        <nmp:totalPagosCalificadosMOP3>{fn:data($item2/CalifMop03)}</nmp:totalPagosCalificadosMOP3>
                        <nmp:totalPagosCalificadosMOP4>{fn:data($item2/CalifMop04)}</nmp:totalPagosCalificadosMOP4>
                        <nmp:totalPagosCalificadosMOP5>{fn:data($item2/CalifMop05)}</nmp:totalPagosCalificadosMOP5>
                        <nmp:importeSaldoMorosidadHistMasGrave>{crd:string-to-signedLong(fn:data($item2/HistMoraSaldo))}</nmp:importeSaldoMorosidadHistMasGrave>
                        {
                          if(fn:empty($item2/HistMoraFecha/text())) then ()
                            else
                              if(fn:string($item2/HistMoraFecha) != '0000-00-00') then   
                                <nmp:fechaHistoricaMorosidadMasGrave>{fn:data($item2/HistMoraFecha)}</nmp:fechaHistoricaMorosidadMasGrave>
                              else ()
                        }
                        <nmp:mopHistoricoMorosidadMasGrave>{fn:data($item2/HistMoraMop02)}</nmp:mopHistoricoMorosidadMasGrave>
                        {
                          if(fn:empty($item2/FechaInicio/text())) then ()
                            else
                              if(fn:string($item2/FechaInicio) != '0000-00-00') then   
                                <nmp:fechaInicioReestructura>{fn:data($item2/FechaInicio)}</nmp:fechaInicioReestructura>
                              else ()
                        }
                        <nmp:montoUltimoPago>{fn:data($item2/MontoUltimo)}</nmp:montoUltimoPago></nmp:cuenta>
                }
            </nmp:cuentas>
            <nmp:consultasEfectuadasExpediente>
                {
                    for $item3 in $sap:respuestaSAP/EtIq/item
                    return 
                    <nmp:consultaEfectuda>
                        {
                          if(fn:empty($item3/FechaConsulta/text())) then ()
                            else
                              if(fn:string($item3/FechaConsulta) != '0000-00-00') then
                                <nmp:fechaConsulta>{fn:data($item3/FechaConsulta)}</nmp:fechaConsulta>
                              else ()
                        }
                        <nmp:identificacionBuro>{fn:data($item3/IdBuro)}</nmp:identificacionBuro>
                        <nmp:claveOtorgante>{fn:data($item3/Otorgante)}</nmp:claveOtorgante>
                        <nmp:nombreOtorgante>{fn:data($item3/NombreOtorgante)}</nmp:nombreOtorgante>
                        <nmp:telefonoOtorgante>{fn:data($item3/Telefono)}</nmp:telefonoOtorgante>
                        <nmp:tipoContrato>{fn:data($item3/TipoContrato)}</nmp:tipoContrato>
                        <nmp:claveUnidadMonetaria>{fn:data($item3/Moneda)}</nmp:claveUnidadMonetaria>
                        <nmp:importeContrato>{crd:string-to-signedLong(fn:data($item3/Importe))}</nmp:importeContrato>
                        <nmp:indicadorTipoResponsabilidad>{fn:data($item3/TipoRespon)}</nmp:indicadorTipoResponsabilidad>
                        <nmp:consumidorNuevo>{fn:data($item3/ConsumidorNuevo)}</nmp:consumidorNuevo>
                        <nmp:resultadoFinal>{fn:data($item3/Resultado)}</nmp:resultadoFinal></nmp:consultaEfectuda>
                }
            </nmp:consultasEfectuadasExpediente>
            <nmp:reportesResumenExpediente>
                {
                    for $item4 in $sap:respuestaSAP/EtRs/item
                    return 
                    <nmp:resumen>
                        {
                          if(fn:empty($item4/FechaIngreso/text())) then ()
                          else
                            if(fn:string($item4/FechaIngreso) != '0000-00-00') then
                              <nmp:fechaIngresoBD>{fn:data($item4/FechaIngreso)}</nmp:fechaIngresoBD>
                            else ()
                        }
                        <nmp:numeroMOP7>{fn:data($item4/NumMop07)}</nmp:numeroMOP7>
                        <nmp:numeroMOP6>{fn:data($item4/NumMop06)}</nmp:numeroMOP6>
                        <nmp:numeroMOP5>{fn:data($item4/NumMop05)}</nmp:numeroMOP5>
                        <nmp:numeroMOP4>{fn:data($item4/NumMop04)}</nmp:numeroMOP4>
                        <nmp:numeroMOP3>{fn:data($item4/NumMop03)}</nmp:numeroMOP3>
                        <nmp:numeroMOP2>{fn:data($item4/NumMop02)}</nmp:numeroMOP2>
                        <nmp:numeroMOP1>{fn:data($item4/NumMop01)}</nmp:numeroMOP1>
                        <nmp:numeroMOP0>{fn:data($item4/NumMop00)}</nmp:numeroMOP0>
                        <nmp:numeroMOPUR>{fn:data($item4/NumMopur)}</nmp:numeroMOPUR>
                        <nmp:numeroCuentas>{fn:data($item4/NumCuentas)}</nmp:numeroCuentas>
                        <nmp:cuentasPagosFijosHipotecas>{fn:data($item4/CuentasFijos)}</nmp:cuentasPagosFijosHipotecas>
                        <nmp:cuentasRevolventesAbiertas>{fn:data($item4/CuentasRevol)}</nmp:cuentasRevolventesAbiertas>
                        <nmp:cuentasCerradas>{fn:data($item4/CuentasCerradas)}</nmp:cuentasCerradas>
                        <nmp:cuentasNegativasActuales>{fn:data($item4/CuentasNeg)}</nmp:cuentasNegativasActuales>
                        <nmp:cuentasClavesHistoriaNegativa>{fn:data($item4/CuentasMop)}</nmp:cuentasClavesHistoriaNegativa>
                        <nmp:cuentasDisputa>{fn:data($item4/CuentasDisputa)}</nmp:cuentasDisputa>
                        <nmp:numeroSolicitudesUltimos6Meses>{fn:data($item4/Solicitudes)}</nmp:numeroSolicitudesUltimos6Meses>
                        <nmp:nuevaDireccionReportadaUltimos60Dias>{fn:data($item4/NuevaDireccion)}</nmp:nuevaDireccionReportadaUltimos60Dias>
                        <nmp:mensajesAlerta>{fn:data($item4/Alerta)}</nmp:mensajesAlerta>
                        <nmp:existenciaDeclaracionesConsumidor>{fn:data($item4/Declaraciones)}</nmp:existenciaDeclaracionesConsumidor>
                        <nmp:tipoMoneda>{fn:data($item4/Moneda)}</nmp:tipoMoneda>
                        <nmp:totalCreditosMaximosRevolventes>{fn:data($item4/TotCreditosRev)}</nmp:totalCreditosMaximosRevolventes>
                        <nmp:totalLimitesCreditoRevolventes>{fn:data($item4/TotLimitesRev)}</nmp:totalLimitesCreditoRevolventes>
                        <nmp:totalSaldosActualesRevolventes>{fn:data($item4/TotSaldosRev)}</nmp:totalSaldosActualesRevolventes>
                        <nmp:totalSaldosVencidosRevolventes>{fn:data($item4/TotVenRev)}</nmp:totalSaldosVencidosRevolventes>
                        <nmp:totalPagosRevolventes>{fn:data($item4/TotPagosRev)}</nmp:totalPagosRevolventes>
                        <nmp:pctLimiteCreditoUtilizadoRevolventes>{fn:data($item4/PorLimRev)}</nmp:pctLimiteCreditoUtilizadoRevolventes>                        
                        <nmp:totalCreditosMaximosPagosFijos>{crd:string-to-signedLong(fn:data($item4/TotCreditosHip))}</nmp:totalCreditosMaximosPagosFijos>
                        <nmp:totalSaldosActualesPagosFijos>{crd:string-to-signedLong(fn:data($item4/TotSaldosHip))}</nmp:totalSaldosActualesPagosFijos>
                        <nmp:totalSaldosVencidosPagosFijos>{crd:string-to-signedLong(fn:data($item4/TotVenHip))}</nmp:totalSaldosVencidosPagosFijos>
                        <nmp:totalPagosPagosFijos>{crd:string-to-signedLong(fn:data($item4/TotPagosHip))}</nmp:totalPagosPagosFijos>
                        <nmp:numeroMOP96>{fn:data($item4/NumMop96)}</nmp:numeroMOP96>
                        <nmp:numeroMOP97>{fn:data($item4/NumMop97)}</nmp:numeroMOP97>
                        <nmp:numeroMOP99>{fn:data($item4/NumMop99)}</nmp:numeroMOP99>
                        {
                          if(fn:empty($item4/FAntCuenta/text())) then ()
                          else
                            if(fn:string($item4/FAntCuenta) != '0000-00-00') then
                              <nmp:fechaAperturaCuentaMasAntigua>{fn:data($item4/FAntCuenta)}</nmp:fechaAperturaCuentaMasAntigua>
                            else ()
                        }
                        {
                          if(fn:empty($item4/FRecCuenta/text())) then ()
                          else
                            if(fn:string($item4/FRecCuenta) != '0000-00-00') then
                              <nmp:fechaAperturaCuentaMasReciente>{fn:data($item4/FRecCuenta)}</nmp:fechaAperturaCuentaMasReciente>
                            else ()
                        }
                        <nmp:totalSolicitudesReporte>{fn:data($item4/TotSolicitudes)}</nmp:totalSolicitudesReporte>
                        {
                          if(fn:empty($item4/FRecReporte/text())) then ()
                          else
                            if(fn:string($item4/FRecReporte) != '0000-00-00') then
                              <nmp:fechaSolicitudReporteMasReciente>{fn:data($item4/FRecReporte)}</nmp:fechaSolicitudReporteMasReciente>
                            else ()
                        }
                        <nmp:numeroTotalCuentasDespachoCobranza>{fn:data($item4/NumCobranzas)}</nmp:numeroTotalCuentasDespachoCobranza>
                        {
                          if(fn:empty($item4/FechaCobranza/text())) then ()
                          else
                            if(fn:string($item4/FechaCobranza) != '0000-00-00') then
                              <nmp:fechaAperturaCuentaMasRecienteDespachoCobranza>{fn:data($item4/FechaCobranza)}</nmp:fechaAperturaCuentaMasRecienteDespachoCobranza>
                            else ()
                        }
                        <nmp:numeroTotalSolicitudesDespachosCobranza>{fn:data($item4/TotSolicCobra)}</nmp:numeroTotalSolicitudesDespachosCobranza>
                        {
                          if(fn:empty($item4/FSolicCobra/text())) then ()
                          else
                            if(fn:string($item4/FSolicCobra) != '0000-00-00') then
                              <nmp:fechaSolicitudMasRecienteDespachoCobranza>{fn:data($item4/FSolicCobra)}</nmp:fechaSolicitudMasRecienteDespachoCobranza>
                            else ()
                        }
                    </nmp:resumen>
                }</nmp:reportesResumenExpediente>
            <nmp:alertasHawk>
                <nmp:informacionConsulta>
                    {
                        for $item5 in $sap:respuestaSAP/EtHi/item
                        return 
                        <nmp:alerta>
                            {
                              if(fn:empty($item5/Fecha/text())) then ()
                              else
                                if(fn:string($item5/Fecha) != '0000-00-00') then
                                  <nmp:fechaReporte>{fn:data($item5/Fecha)}</nmp:fechaReporte>
                                else ()
                            }
                            <nmp:codigoClave>{fn:data($item5/Codigo)}</nmp:codigoClave>
                            <nmp:tipoInstitucion>{fn:data($item5/Institucion)}</nmp:tipoInstitucion>
                            <nmp:mensaje>{fn:data($item5/Mensaje)}</nmp:mensaje>
                        </nmp:alerta>
                    }
                </nmp:informacionConsulta>
                <nmp:informacionBaseDatos>
                    {
                        for $item6 in $sap:respuestaSAP/EtHr/item
                        return 
                        <nmp:alerta>
                            {
                              if(fn:empty($item6/Fecha/text())) then ()
                              else
                                if(fn:string($item6/Fecha) != '0000-00-00') then
                                  <nmp:fechaReporte>{fn:data($item6/Fecha)}</nmp:fechaReporte>
                                else ()
                            }
                            <nmp:codigoClave>{fn:data($item6/Codigo)}</nmp:codigoClave>
                            <nmp:tipoInstitucion>{fn:data($item6/Institucion)}</nmp:tipoInstitucion>
                            <nmp:mensaje>{fn:data($item6/Mensaje)}</nmp:mensaje>
                        </nmp:alerta>
                    }
                </nmp:informacionBaseDatos>
            </nmp:alertasHawk>
            <nmp:declaracionesCliente>
                <nmp:declaracionConsumidor>{fn:data($sap:respuestaSAP/EtCr/Declaracion)}</nmp:declaracionConsumidor>
            </nmp:declaracionesCliente>
            <nmp:calificaciones>
                <nmp:calificacion>
                    <nmp:nombreScore>{fn:data($sap:respuestaSAP/EtSc/Nombre)}</nmp:nombreScore>
                    <nmp:codigoScore>{fn:data($sap:respuestaSAP/EtSc/Codigo)}</nmp:codigoScore>
                    <nmp:valorScore>{fn:data($sap:respuestaSAP/EtSc/Valor)}</nmp:valorScore>
                    <nmp:codigosRazon>
                      {
                      if($sap:respuestaSAP/EtSc/Razon1) then
                        <nmp:codigoRazon>{fn:data($sap:respuestaSAP/EtSc/Razon1)}</nmp:codigoRazon>
                      else ()
                      }
                      {
                      if($sap:respuestaSAP/EtSc/Razon2) then
                        <nmp:codigoRazon>{fn:data($sap:respuestaSAP/EtSc/Razon2)}</nmp:codigoRazon>
                      else ()
                      }
                      {
                      if($sap:respuestaSAP/EtSc/Razon3) then
                        <nmp:codigoRazon>{fn:data($sap:respuestaSAP/EtSc/Razon3)}</nmp:codigoRazon>
                      else ()
                      }
                    </nmp:codigosRazon>
                    <nmp:codigoError>{fn:data($sap:respuestaSAP/EtSc/Error)}</nmp:codigoError></nmp:calificacion>
            </nmp:calificaciones>
            <nmp:Errores>
                <nmp:usuario>
                    {
                      if($sap:respuestaSAP/EtUr/RefOperador) then
                        if(fn:empty($sap:respuestaSAP/EtUr/RefOperador/text())) then ()
                        else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/RefOperador), '. ', fn:data($sap:respuestaSAP/EtUr/RefOperador))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtUr/Solicitud) then
                        if(fn:empty($sap:respuestaSAP/EtUr/Solicitud/text())) then ()
                        else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/Solicitud), '. ', fn:data($sap:respuestaSAP/EtUr/Solicitud))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtUr/Version) then
                        if(fn:empty($sap:respuestaSAP/EtUr/Version/text())) then ()
                        else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/Version), '. ', fn:data($sap:respuestaSAP/EtUr/Version))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtUr/Producto) then
                        if(fn:empty($sap:respuestaSAP/EtUr/Producto/text())) then ()
                        else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/Producto), '. ', fn:data($sap:respuestaSAP/EtUr/Producto))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtUr/Password) then
                        if(fn:empty($sap:respuestaSAP/EtUr/Password/text())) then ()
                        else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/Password), '. ', fn:data($sap:respuestaSAP/EtUr/Password))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtUr/Segmento) then
                        if(fn:empty($sap:respuestaSAP/EtUr/Segmento/text())) then ()
                        else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/Segmento), '. ', fn:data($sap:respuestaSAP/EtUr/Segmento))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/UltInfoValida) then
                          if(fn:empty($sap:respuestaSAP/EtUr/UltInfoValida/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/UltInfoValida), '. ', fn:data($sap:respuestaSAP/EtUr/UltInfoValida))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/InfoErrConsul) then
                          if(fn:empty($sap:respuestaSAP/EtUr/InfoErrConsul/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/InfoErrConsul), '. ', fn:data($sap:respuestaSAP/EtUr/InfoErrConsul))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/ValorErrRel) then
                          if(fn:empty($sap:respuestaSAP/EtUr/ValorErrRel/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/ValorErrRel), '. ', fn:data($sap:respuestaSAP/EtUr/ValorErrRel))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/ErrorBuro) then
                          if(fn:empty($sap:respuestaSAP/EtUr/ErrorBuro/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/ErrorBuro), '. ', fn:data($sap:respuestaSAP/EtUr/ErrorBuro))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/EtiquetaSeg) then
                          if(fn:empty($sap:respuestaSAP/EtUr/EtiquetaSeg/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/EtiquetaSeg), '. ', fn:data($sap:respuestaSAP/EtUr/EtiquetaSeg))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/OrdenErr) then
                          if(fn:empty($sap:respuestaSAP/EtUr/OrdenErr/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/OrdenErr), '. ', fn:data($sap:respuestaSAP/EtUr/OrdenErr))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/NumErrSeg) then
                          if(fn:empty($sap:respuestaSAP/EtUr/NumErrSeg/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/NumErrSeg), '. ', fn:data($sap:respuestaSAP/EtUr/NumErrSeg))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if ($sap:respuestaSAP/EtUr/Requerido1) then
                          if(fn:empty($sap:respuestaSAP/EtUr/Requerido1/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtUr/Requerido1), '. ', fn:data($sap:respuestaSAP/EtUr/Requerido1))}</nmp:mensaje>
                      else ()
                    }
                </nmp:usuario>
                <nmp:autenticacion>
                    {
                      if($sap:respuestaSAP/EtAr/RefOperador) then
                          if(fn:empty($sap:respuestaSAP/EtAr/RefOperador/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtAr/RefOperador), '. ', fn:data($sap:respuestaSAP/EtAr/RefOperador))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtAr/NoAutenticado) then
                          if(fn:empty($sap:respuestaSAP/EtAr/NoAutenticado/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtAr/NoAutenticado), '. ', fn:data($sap:respuestaSAP/EtAr/NoAutenticado))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtAr/Clave) then
                          if(fn:empty($sap:respuestaSAP/EtAr/Clave/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtAr/Clave), '. ', fn:data($sap:respuestaSAP/EtAr/Clave))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtAr/ErrorBuro) then
                          if(fn:empty($sap:respuestaSAP/EtAr/ErrorBuro/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtAr/ErrorBuro), '. ', fn:data($sap:respuestaSAP/EtAr/ErrorBuro))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtAr/Segmento) then
                          if(fn:empty($sap:respuestaSAP/EtAr/Segmento/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtAr/Segmento), '. ', fn:data($sap:respuestaSAP/EtAr/Segmento))}</nmp:mensaje>
                      else ()
                    }
                    {
                      if($sap:respuestaSAP/EtAr/Requerido1) then
                          if(fn:empty($sap:respuestaSAP/EtAr/Requerido1/text())) then ()
                          else <nmp:mensaje>{fn:concat(fn:name($sap:respuestaSAP/EtAr/Requerido1), '. ', fn:data($sap:respuestaSAP/EtAr/Requerido1))}</nmp:mensaje>
                      else ()
                    }
                </nmp:autenticacion>
            </nmp:Errores>
        </nmp:informeBuro>
    </nmp:consultaVigenteBCResponse>
};

crd:PeticionConsultaVigenteCredito($idCliente, $sap:respuestaSAP)