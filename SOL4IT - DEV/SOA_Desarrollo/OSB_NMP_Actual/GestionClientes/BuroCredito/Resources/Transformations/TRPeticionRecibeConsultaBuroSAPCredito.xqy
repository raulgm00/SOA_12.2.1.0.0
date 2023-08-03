xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace bc="http://bean.consulta.ws.bc.com/";
(:: import schema at "../Schemas/BCConsultaBuroCreditoXSD.xsd" ::)
declare namespace soc="urn:sap-com:document:sap:soap:functions:mc-style";
(:: import schema at "../WSDLs/SAPRecibeConsultaBuroCreditoWSDL.wsdl" ::)

declare namespace crd="http://www.w3.org/2005/xquery-local-functions";

declare variable $consultaBC as element() (:: schema-element(bc:consultaXMLResponse) ::) external;
declare variable $idCliente as xs:int external;
declare variable $probabilidadIncumplimiento as xs:decimal external;
declare variable $siva as xs:int external;

declare function crd:string-to-dateFormat($stringTodate as xs:string)  as xs:string {
  fn:concat(fn:substring($stringTodate, 5, 4), "-", fn:substring($stringTodate, 3, 2), "-", fn:substring($stringTodate, 1, 2))
 } ;

declare function crd:PeticionRecibeBuroCredito($idCliente as xs:int, $probabilidadIncumplimiento as xs:decimal, $siva as xs:int, $consultaBC as element() (:: schema-element(bc:consultaXMLResponse) ::)) as element() (:: schema-element(soc:ZlmRfcRecibeBuro) ::) {
    <soc:ZlmRfcRecibeBuro>
      {
        if(fn:exists($consultaBC/return/Personas/Persona/Error/AR)) then
          <IAr>
              <RefOperador>{fn:data($consultaBC/return/Personas/Persona/Error/AR/ReferenciaOperador)}</RefOperador>
              <NoAutenticado>{fn:data($consultaBC/return/Personas/Persona/Error/AR/SujetoNoAutenticado)}</NoAutenticado>
              <Clave>{fn:data($consultaBC/return/Personas/Persona/Error/AR/ClaveOPasswordErroneo)}</Clave>
              <ErrorBuro>{fn:data($consultaBC/return/Personas/Persona/Error/AR/ErrorSistemaBC)}</ErrorBuro>
              <Segmento>{fn:data($consultaBC/return/Personas/Persona/Error/AR/EtiquetaSegmentoErronea)}</Segmento>
              <Requerido1>{fn:data($consultaBC/return/Personas/Persona/Error/AR/FaltaCampoRequerido)}</Requerido1>
          </IAr>
        else ()
      }
        <ICr>
            <Longitud>{fn:string-length($consultaBC/return/Personas/Persona/DeclaracionesCliente/DeclaracionConsumidor)}</Longitud>
            <Declaracion>{fn:data($consultaBC/return/Personas/Persona/DeclaracionesCliente/DeclaracionConsumidor)}</Declaracion></ICr>
        <IEs>{
          if(fn:empty($consultaBC/return/Personas/Persona/Encabezado/NumeroControlConsulta/text())) then 'XXXXXXXXX'
          else fn:data($consultaBC/return/Personas/Persona/Encabezado/NumeroControlConsulta)
        }</IEs>
        {
            if (fn:exists($consultaBC/return/Personas/Persona/HawkAlertConsulta))
            then <IHi>
                {
                    for $HawkAlertC in $consultaBC/return/Personas/Persona/HawkAlertConsulta/HawkAlertC
                    return 
                    <item>
                        <Fecha>{crd:string-to-dateFormat($HawkAlertC/FechaReporte)}</Fecha>
                        <Codigo>{fn:data($HawkAlertC/CodigoClave)}</Codigo>
                        <Institucion>{fn:data($HawkAlertC/TipoInstitucion)}</Institucion>
                        <Mensaje>{fn:data($HawkAlertC/Mensaje)}</Mensaje>
                    </item>
                }</IHi>
            else ()
        }
        {
            if (fn:exists($consultaBC/return/Personas/Persona/HawkAlertBD))
            then <IHr>
                {
                    for $HawkAlertBD in $consultaBC/return/Personas/Persona/HawkAlertBD/HawkAlertBD
                    return 
                    <item>
                        <Fecha>{crd:string-to-dateFormat($HawkAlertBD/FechaReporte)}</Fecha>
                        <Codigo>{fn:data($HawkAlertBD/CodigoClave)}</Codigo>
                        <Institucion>{fn:data($HawkAlertBD/TipoInstitucion)}</Institucion>
                        <Mensaje>{fn:data($HawkAlertBD/Mensaje)}</Mensaje>
                    </item>
                }</IHr>
            else ()
        }
        <IIntl>
            <Etiqueta></Etiqueta>
            <Version>{fn:data($consultaBC/return/Personas/Persona/Encabezado/Version)}</Version>
            <RefOperador>{fn:data($consultaBC/return/Personas/Persona/Encabezado/NumeroReferenciaOperador)}</RefOperador>
            <Producto>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ProductoRequerido)}</Producto>
            <Pais>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ClavePais)}</Pais>
            <IdBuro>{fn:data($consultaBC/return/Personas/Persona/Encabezado/IdentificadorBuro)}</IdBuro>
            <ClaveUsuario>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ClaveUsuario)}</ClaveUsuario>
            <PassUsuario>{fn:data($consultaBC/return/Personas/Persona/Encabezado/Password)}</PassUsuario>
            <TipoConsulta>{fn:data($consultaBC/return/Personas/Persona/Encabezado/TipoConsulta)}</TipoConsulta>
            <TipoContrato>{fn:data($consultaBC/return/Personas/Persona/Encabezado/TipoContrato)}</TipoContrato>
            <Moneda>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ClaveUnidadMonetaria)}</Moneda>
            <ImporteContrato>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ImporteContrato)}</ImporteContrato>
            <Idioma>{fn:data($consultaBC/return/Personas/Persona/Encabezado/Idioma)}</Idioma>
            <TipoSalida>{fn:data($consultaBC/return/Personas/Persona/Encabezado/TipoSalida)}</TipoSalida>
            <BloqueRespuesta></BloqueRespuesta>
            <IdImpresora></IdImpresora>
            <UsoFuturo></UsoFuturo>
            <Otorgante>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ClaveOtorgante)}</Otorgante>
            <RcPrincipal>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ClaveRetornoConsumidorPrincipal)}</RcPrincipal>
            <RcSecundario>{fn:data($consultaBC/return/Personas/Persona/Encabezado/ClaveRetornoConsumidorSecundario)}</RcSecundario>
        </IIntl>
        <IIq>
            {
                for $ConsultaEfectuada in $consultaBC/return/Personas/Persona/ConsultasEfectuadas/ConsultaEfectuada
                return 
                <item>
                    <FechaConsulta>{
                      if(fn:exists($ConsultaEfectuada/FechaConsulta)) then
                        if(fn:empty($ConsultaEfectuada/FechaConsulta/text())) then ()
                        else crd:string-to-dateFormat($ConsultaEfectuada/FechaConsulta)
                      else()
                    }</FechaConsulta>
                    <IdBuro>{fn:data($ConsultaEfectuada/IdentificacionBuro)}</IdBuro>
                    <Otorgante>{fn:data($ConsultaEfectuada/ClaveOtorgante)}</Otorgante>
                    <NombreOtorgante>{fn:data($ConsultaEfectuada/NombreOtorgante)}</NombreOtorgante>
                    <Telefono>{fn:data($ConsultaEfectuada/TelefonoOtorgante)}</Telefono>
                    <TipoContrato>{fn:data($ConsultaEfectuada/TipoContrato)}</TipoContrato>
                    <Moneda>{fn:data($ConsultaEfectuada/ClaveUnidadMonetaria)}</Moneda>
                    <Importe>{fn:data($ConsultaEfectuada/ImporteContrato)}</Importe>
                    <TipoRespon>{fn:data($ConsultaEfectuada/IndicadorTipoResponsabilidad)}</TipoRespon>
                    <ConsumidorNuevo>{fn:data($ConsultaEfectuada/ConsumidorNuevo)}</ConsumidorNuevo>
                    <Resultado>{fn:data($ConsultaEfectuada/ResultadoFinal)}</Resultado>
                    <Sic>{fn:data($ConsultaEfectuada/IdentificadorOrigenConsulta)}</Sic>
                </item>
            }</IIq>
        <IPa>
            {
                for $Domicilio in $consultaBC/return/Personas/Persona/Domicilios/Domicilio
                return 
                <item>
                    <Direccion1>{fn:data($Domicilio/Direccion1)}</Direccion1>
                    <Direccion2>{fn:data($Domicilio/Direccion2)}</Direccion2>
                    <Colonia>{fn:data($Domicilio/ColoniaPoblacion)}</Colonia>
                    <Municipio>{fn:data($Domicilio/DelegacionMunicipio)}</Municipio>
                    <Ciudad>{fn:data($Domicilio/Ciudad)}</Ciudad>
                    <Estado>{fn:data($Domicilio/Estado)}</Estado>
                    <Cp>{fn:data($Domicilio/CP)}</Cp>
                    <FechaResidencia>{
                      if(fn:exists($Domicilio/FechaResidencia)) then
                        if(fn:empty($Domicilio/FechaResidencia/text())) then ()
                        else crd:string-to-dateFormat($Domicilio/FechaResidencia)
                      else ()
                    }</FechaResidencia>
                    <Telefono>{fn:data($Domicilio/NumeroTelefono)}</Telefono>
                    <ExtensionTel>{fn:data($Domicilio/Extension)}</ExtensionTel>
                    <Fax>{fn:data($Domicilio/Fax)}</Fax>
                    <TipoDomicilio>{fn:data($Domicilio/TipoDomicilio)}</TipoDomicilio>
                    <IdEspDom>{fn:data($Domicilio/IndicadorEspecialDomicilio)}</IdEspDom>
                    <FechaDir>{
                      if(fn:exists($Domicilio/FechaReporteDireccion)) then
                        if(fn:empty($Domicilio/FechaReporteDireccion/text())) then ()
                        else crd:string-to-dateFormat($Domicilio/FechaReporteDireccion)
                      else ()
                    }</FechaDir>
                </item>
            }</IPa>
        <IPartner>{fn:string(fn:data($idCliente))}</IPartner>
        {
            if (fn:exists($consultaBC/return/Personas/Persona/Empleos))
            then <IPe>
                {
                    for $Empleo in $consultaBC/return/Personas/Persona/Empleos/Empleo
                    return 
                    <item>
                        <Razonsocial>{fn:data($Empleo/NombreEmpresa)}</Razonsocial>
                        <Direccion1>{fn:data($Empleo/Direccion1)}</Direccion1>
                        <Direccion2>{fn:data($Empleo/Direccion2)}</Direccion2>
                        <Colonia>{fn:data($Empleo/ColoniaPoblacion)}</Colonia>
                        <Municipio>{fn:data($Empleo/DelegacionMunicipio)}</Municipio>
                        <Ciudad>{fn:data($Empleo/Ciudad)}</Ciudad>
                        <Estado>{fn:data($Empleo/Estado)}</Estado>
                        <Cp>{fn:data($Empleo/CP)}</Cp>
                        <Telefono>{fn:data($Empleo/NumeroTelefono)}</Telefono>
                        <ExtensionTel>{fn:data($Empleo/Extension)}</ExtensionTel>
                        <Fax>{fn:data($Empleo/Fax)}</Fax>
                        <Cargo>{fn:data($Empleo/Cargo)}</Cargo>
                        <FechaContrata>{
                          if(fn:exists($Empleo/FechaContratacion)) then 
                            if(fn:empty($Empleo/FechaContratacion/text())) then ()
                            else crd:string-to-dateFormat($Empleo/FechaContratacion)
                          else ()
                        }</FechaContrata>
                        <Moneda>{fn:data($Empleo/ClaveMonedaSalario)}</Moneda>
                        <Salario>{fn:data($Empleo/Salario)}</Salario>
                        <Base>{fn:data($Empleo/BaseSalarial)}</Base>
                        <NumEmpleado>{fn:data($Empleo/NumeroEmpleado)}</NumEmpleado>
                        <FechaUltDia>{
                          if(fn:exists($Empleo/FechaUltimoDiaEmpleo)) then 
                            if(fn:empty($Empleo/FechaUltimoDiaEmpleo/text())) then ()
                            else crd:string-to-dateFormat($Empleo/FechaUltimoDiaEmpleo)
                          else ()
                        }</FechaUltDia>
                        <FechaRegistro>{
                          if(fn:exists($Empleo/FechaReportoEmpleo)) then 
                            if(fn:empty($Empleo/FechaReportoEmpleo/text())) then ()
                            else crd:string-to-dateFormat($Empleo/FechaReportoEmpleo)
                          else ()
                        }</FechaRegistro>
                        <FechaVerif>{
                          if(fn:exists($Empleo/FechaVerificacion)) then 
                            if(fn:empty($Empleo/FechaVerificacion/text())) then ()
                            else crd:string-to-dateFormat($Empleo/FechaVerificacion)
                          else ()
                        }</FechaVerif>
                        <ModoVerif>{fn:data($Empleo/ModoVerificacion)}</ModoVerif>
                    </item>
                }</IPe>
            else ()
        }
        <IPi>{fn:string(fn:data($probabilidadIncumplimiento))}</IPi>
        <IPn>
            <ApePaterno>{fn:data($consultaBC/return/Personas/Persona/Nombre/ApellidoPaterno)}</ApePaterno>
            <ApeMaterno>{fn:data($consultaBC/return/Personas/Persona/Nombre/ApellidoMaterno)}</ApeMaterno>
            <ApeAdicional>{fn:data($consultaBC/return/Personas/Persona/Nombre/ApellidoAdicional)}</ApeAdicional>
            <PrimerNombre>{fn:data($consultaBC/return/Personas/Persona/Nombre/PrimerNombre)}</PrimerNombre>
            <SegundoNombre>{fn:data($consultaBC/return/Personas/Persona/Nombre/SegundoNombre)}</SegundoNombre>
            <FechaNacimiento>{
              if(fn:exists($consultaBC/return/Personas/Persona/Nombre/FechaNacimiento)) then
                if(fn:empty($consultaBC/return/Personas/Persona/Nombre/FechaNacimiento/text())) then ()
                  else crd:string-to-dateFormat($consultaBC/return/Personas/Persona/Nombre/FechaNacimiento)
                else ()
            }</FechaNacimiento>
            <Rfc>{fn:data($consultaBC/return/Personas/Persona/Nombre/RFC)}</Rfc>
            <Prefijo>{fn:data($consultaBC/return/Personas/Persona/Nombre/Prefijo)}</Prefijo>
            <Sufijo>{fn:data($consultaBC/return/Personas/Persona/Nombre/Sufijo)}</Sufijo>
            <Nacionalidad>{fn:data($consultaBC/return/Personas/Persona/Nombre/Nacionalidad)}</Nacionalidad>
            <Residencia>{fn:data($consultaBC/return/Personas/Persona/Nombre/Residencia)}</Residencia>
            <LicConducir>{fn:data($consultaBC/return/Personas/Persona/Nombre/NumeroLicenciaConducir)}</LicConducir>
            <EdoCivil>{fn:data($consultaBC/return/Personas/Persona/Nombre/EstadoCivil)}</EdoCivil>
            <Sexo>{fn:data($consultaBC/return/Personas/Persona/Nombre/Sexo)}</Sexo>
            <CedulaProf>{fn:data($consultaBC/return/Personas/Persona/Nombre/NumeroCedulaProfesional)}</CedulaProf>
            <RegElectoral>{fn:data($consultaBC/return/Personas/Persona/Nombre/NumeroRegistroElectoral)}</RegElectoral>
            <ImpuestosExt>{fn:data($consultaBC/return/Personas/Persona/Nombre/ClaveImpuestosOtroPais)}</ImpuestosExt>
            <PaisExt>{fn:data($consultaBC/return/Personas/Persona/Nombre/ClaveOtroPais)}</PaisExt>
            <Dependientes>{fn:data($consultaBC/return/Personas/Persona/Nombre/NumeroDependientes)}</Dependientes>
            <EdadesDep>{fn:data($consultaBC/return/Personas/Persona/Nombre/EdadesDependientes)}</EdadesDep>
            <FechaRecepcion>{
              if(fn:exists($consultaBC/return/Personas/Persona/Nombre/FechaRecepcionInformacionDependientes)) then
                if(fn:empty($consultaBC/return/Personas/Persona/Nombre/FechaRecepcionInformacionDependientes/text())) then ()
                  else crd:string-to-dateFormat($consultaBC/return/Personas/Persona/Nombre/FechaRecepcionInformacionDependientes)
                else ()
            }</FechaRecepcion>
            <FechaDefuncion>{
              if(fn:exists($consultaBC/return/Personas/Persona/Nombre/FechaDefuncion)) then
                if(fn:empty($consultaBC/return/Personas/Persona/Nombre/FechaDefuncion/text())) then ()
                  else crd:string-to-dateFormat($consultaBC/return/Personas/Persona/Nombre/FechaDefuncion)
                else ()
            }</FechaDefuncion>
        </IPn>
        <IRs>
            {
                for $ResumenReporte in $consultaBC/return/Personas/Persona/ResumenReporte/ResumenReporte
                return 
                <item>
                    <FechaIngreso>{
                      if(fn:exists($ResumenReporte/FechaIngresoBD)) then 
                        if(fn:empty($ResumenReporte/FechaIngresoBD/text())) then ()
                        else crd:string-to-dateFormat($ResumenReporte/FechaIngresoBD)
                      else ()
                    }</FechaIngreso>
                    <NumMop07>{fn:data($ResumenReporte/NumeroMOP7)}</NumMop07>
                    <NumMop06>{fn:data($ResumenReporte/NumeroMOP6)}</NumMop06>
                    <NumMop05>{fn:data($ResumenReporte/NumeroMOP5)}</NumMop05>
                    <NumMop04>{fn:data($ResumenReporte/NumeroMOP4)}</NumMop04>
                    <NumMop03>{fn:data($ResumenReporte/NumeroMOP3)}</NumMop03>
                    <NumMop02>{fn:data($ResumenReporte/NumeroMOP2)}</NumMop02>
                    <NumMop01>{fn:data($ResumenReporte/NumeroMOP1)}</NumMop01>
                    <NumMop00>{fn:data($ResumenReporte/NumeroMOP0)}</NumMop00>
                    <NumMopur>{fn:data($ResumenReporte/NumeroMOPUR)}</NumMopur>
                    <NumCuentas>{fn:data($ResumenReporte/NumeroCuentas)}</NumCuentas>
                    <CuentasFijos>{fn:data($ResumenReporte/CuentasPagosFijosHipotecas)}</CuentasFijos>
                    <CuentasRevol>{fn:data($ResumenReporte/CuentasRevolventesAbiertas)}</CuentasRevol>
                    <CuentasCerradas>{fn:data($ResumenReporte/CuentasCerradas)}</CuentasCerradas>
                    <CuentasNeg>{fn:data($ResumenReporte/CuentasNegativasActuales)}</CuentasNeg>
                    <CuentasMop>{fn:data($ResumenReporte/CuentasClavesHistoriaNegativa)}</CuentasMop>
                    <CuentasDisputa>{fn:data($ResumenReporte/CuentasDisputa)}</CuentasDisputa>
                    <Solicitudes>{fn:data($ResumenReporte/NumeroSolicitudesUltimos6Meses)}</Solicitudes>
                    <NuevaDireccion>{fn:data($ResumenReporte/NuevaDireccionReportadaUltimos60Dias)}</NuevaDireccion>
                    <Alerta>{fn:data($ResumenReporte/MensajesAlerta)}</Alerta>
                    <Declaraciones>{fn:data($ResumenReporte/ExistenciaDeclaracionesConsumidor)}</Declaraciones>
                    <Moneda>{fn:data($ResumenReporte/TipoMoneda)}</Moneda>
                    <TotCreditosRev>{fn:data($ResumenReporte/TotalCreditosMaximosRevolventes)}</TotCreditosRev>
                    <TotLimitesRev>{fn:data($ResumenReporte/TotalLimitesCreditoRevolventes)}</TotLimitesRev>
                    <TotSaldosRev>{fn:data($ResumenReporte/TotalSaldosActualesRevolventes)}</TotSaldosRev>
                    <TotVenRev>{fn:data($ResumenReporte/TotalSaldosVencidosRevolventes)}</TotVenRev>
                    <TotPagosRev>{fn:data($ResumenReporte/TotalPagosRevolventes)}</TotPagosRev>
                    <PorLimRev>{fn:data($ResumenReporte/PctLimiteCreditoUtilizadoRevolventes)}</PorLimRev>
                    <TotCreditosHip>{fn:data($ResumenReporte/TotalCreditosMaximosPagosFijos)}</TotCreditosHip>
                    <TotSaldosHip>{fn:data($ResumenReporte/TotalSaldosActualesPagosFijos)}</TotSaldosHip>
                    <TotVenHip>{fn:data($ResumenReporte/TotalSaldosVencidosPagosFijos)}</TotVenHip>
                    <TotPagosHip>{fn:data($ResumenReporte/TotalPagosPagosFijos)}</TotPagosHip>
                    <NumMop96>{fn:data($ResumenReporte/NumeroMOP96)}</NumMop96>
                    <NumMop97>{fn:data($ResumenReporte/NumeroMOP97)}</NumMop97>
                    <NumMop99>{fn:data($ResumenReporte/NumeroMOP99)}</NumMop99>
                    <FAntCuenta>{
                      if(fn:exists($ResumenReporte/FechaAperturaCuentaMasAntigua)) then 
                        if(fn:empty($ResumenReporte/FechaAperturaCuentaMasAntigua/text())) then ()
                        else crd:string-to-dateFormat($ResumenReporte/FechaAperturaCuentaMasAntigua)
                      else ()
                    }</FAntCuenta>
                    <FRecCuenta>{
                      if(fn:exists($ResumenReporte/FechaAperturaCuentaMasReciente)) then 
                        if(fn:empty($ResumenReporte/FechaAperturaCuentaMasReciente/text())) then ()
                        else crd:string-to-dateFormat($ResumenReporte/FechaAperturaCuentaMasReciente)
                      else ()
                    }</FRecCuenta>
                    <TotSolicitudes>{fn:data($ResumenReporte/TotalSolicitudesReporte)}</TotSolicitudes>
                    <FRecReporte>{
                      if(fn:exists($ResumenReporte/FechaSolicitudReporteMasReciente)) then 
                        if(fn:empty($ResumenReporte/FechaSolicitudReporteMasReciente/text())) then ()
                        else crd:string-to-dateFormat($ResumenReporte/FechaSolicitudReporteMasReciente)
                      else ()
                    }</FRecReporte>
                    <NumCobranzas>{fn:data($ResumenReporte/NumeroTotalCuentasDespachoCobranza)}</NumCobranzas>
                    <FechaCobranza>{
                      if(fn:exists($ResumenReporte/FechaAperturaCuentaMasRecienteDespachoCobranza)) then 
                        if(fn:empty($ResumenReporte/FechaAperturaCuentaMasRecienteDespachoCobranza/text())) then ()
                        else crd:string-to-dateFormat($ResumenReporte/FechaAperturaCuentaMasRecienteDespachoCobranza)
                      else ()
                    }</FechaCobranza>
                    <TotSolicCobra>{fn:data($ResumenReporte/NumeroTotalSolicitudesDespachosCobranza)}</TotSolicCobra>
                    <FSolicCobra>{
                      if(fn:exists($ResumenReporte/FechaSolicitudMasRecienteDespachoCobranza)) then 
                        if(fn:empty($ResumenReporte/FechaSolicitudMasRecienteDespachoCobranza/text())) then ()
                        else crd:string-to-dateFormat($ResumenReporte/FechaSolicitudMasRecienteDespachoCobranza)
                      else ()
                    }</FSolicCobra>
                </item>
            }</IRs>
        <ISc>
            <Nombre>{fn:data($consultaBC/return/Personas/Persona/ScoreBuroCredito/ScoreBC/nombreScore)}</Nombre>
            <Codigo>{fn:data($consultaBC/return/Personas/Persona/ScoreBuroCredito/ScoreBC/CodigoScore)}</Codigo>
            <Valor>{fn:data($consultaBC/return/Personas/Persona/ScoreBuroCredito/ScoreBC/ValorScore)}</Valor>
            <Razon1>{fn:data($consultaBC/return/Personas/Persona/ScoreBuroCredito/ScoreBC/CodigoRazon[1])}</Razon1>
            <Razon2>{fn:data($consultaBC/return/Personas/Persona/ScoreBuroCredito/ScoreBC/CodigoRazon[2])}</Razon2>
            <Razon3>{fn:data($consultaBC/return/Personas/Persona/ScoreBuroCredito/ScoreBC/CodigoRazon[3])}</Razon3>
            <Error>{fn:data($consultaBC/return/Personas/Persona/ScoreBuroCredito/ScoreBC/CodigoError)}</Error>
        </ISc>
        <ISiva>{fn:string(fn:data($siva))}</ISiva>
        <ITipoAutoriza/>
        <ITl>
            {
                for $Cuenta in $consultaBC/return/Personas/Persona/Cuentas/Cuenta
                return 
                <item>
                    <FechaActualiza>{
                      if(fn:exists($Cuenta/FechaActualizacion)) then 
                        if(fn:empty($Cuenta/FechaActualizacion/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaActualizacion)
                      else ()
                    }</FechaActualiza>
                    <RegImpugnado>{fn:data($Cuenta/RegistroImpugnado)}</RegImpugnado>
                    <Otorgante>{fn:data($Cuenta/ClaveOtorgante)}</Otorgante>
                    <NombreOtorgante>{fn:data($Cuenta/NombreOtorgante)}</NombreOtorgante>
                    <Telefono>{fn:data($Cuenta/NumeroTelefonoOtorgante)}</Telefono>
                    <Sic>{fn:data($Cuenta/IdentificadorSociedadInformacionCrediticia)}</Sic>
                    <Cuenta>{fn:data($Cuenta/NumeroCuentaActual)}</Cuenta>
                    <TipoRespon>{fn:data($Cuenta/IndicadorTipoResponsabilidad)}</TipoRespon>
                    <TipoCuenta>{fn:data($Cuenta/TipoCuenta)}</TipoCuenta>
                    <TipoContrato>{fn:data($Cuenta/TipoContrato)}</TipoContrato>
                    <Moneda>{fn:data($Cuenta/ClaveUnidadMonetaria)}</Moneda>
                    <ValorActivo>{fn:data($Cuenta/ValorActivoValuacion)}</ValorActivo>
                    <NumPagos>{fn:data($Cuenta/NumeroPagos)}</NumPagos>
                    <Frecuencia>{fn:data($Cuenta/FrecuenciaPagos)}</Frecuencia>
                    <Monto>{fn:data($Cuenta/MontoPagar)}</Monto>
                    <FechaApertura>{
                      if(fn:exists($Cuenta/FechaAperturaCuenta)) then 
                        if(fn:empty($Cuenta/FechaAperturaCuenta/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaAperturaCuenta)
                      else ()
                    }</FechaApertura>
                    <FechaUltPago>{
                      if(fn:exists($Cuenta/FechaUltimoPago)) then 
                        if(fn:empty($Cuenta/FechaUltimoPago/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaUltimoPago)
                      else ()
                    }</FechaUltPago>
                    <FechaUltCompra>{
                      if(fn:exists($Cuenta/FechaUltimaCompra)) then 
                        if(fn:empty($Cuenta/FechaUltimaCompra/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaUltimaCompra)
                      else ()
                    }</FechaUltCompra>
                    <FechaCierre>{
                      if(fn:exists($Cuenta/FechaCierreCuenta)) then 
                        if(fn:empty($Cuenta/FechaCierreCuenta/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaCierreCuenta)
                      else ()
                    }</FechaCierre>
                    <FechaReporte>{
                      if(fn:exists($Cuenta/FechaReporte)) then 
                        if(fn:empty($Cuenta/FechaReporte/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaReporte)
                      else ()
                    }</FechaReporte>
                    <ModoReporte>{fn:data($Cuenta/ModoReportar)}</ModoReporte>
                    <FechaCero>{
                      if(fn:exists($Cuenta/UltimaFechaSaldoCero)) then 
                        if(fn:empty($Cuenta/UltimaFechaSaldoCero/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/UltimaFechaSaldoCero)
                      else ()
                    }</FechaCero>
                    <Garantia>{fn:data($Cuenta/Garantia)}</Garantia>
                    <CreditoMax>{fn:data($Cuenta/CreditoMaximo)}</CreditoMax>
                    <SaldoActual>{fn:data($Cuenta/SaldoActual)}</SaldoActual>
                    <LimiteCredito>{fn:data($Cuenta/LimiteCredito)}</LimiteCredito>
                    <SaldoVencido>{fn:data($Cuenta/SaldoVencido)}</SaldoVencido>
                    <PagosVencidos>{fn:data($Cuenta/NumeroPagosVencidos)}</PagosVencidos>
                    <Mop>{fn:data($Cuenta/FormaPagoActual)}</Mop>
                    <HistoricoPagos>{fn:data($Cuenta/HistoricoPagos)}</HistoricoPagos>
                    <FechaRecHist>{
                      if(fn:exists($Cuenta/FechaMasRecienteHistoricoPagos)) then 
                        if(fn:empty($Cuenta/FechaMasRecienteHistoricoPagos/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaMasRecienteHistoricoPagos)
                      else ()
                    }</FechaRecHist>
                    <FechaAntHist>{
                      if(fn:exists($Cuenta/FechaMasAntiguaHistoricoPagos)) then 
                        if(fn:empty($Cuenta/FechaMasAntiguaHistoricoPagos/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaMasAntiguaHistoricoPagos)
                      else ()
                    }</FechaAntHist>
                    <Observacion>{fn:data($Cuenta/ClaveObservacion)}</Observacion>
                    <TotalPagos>{fn:data($Cuenta/TotalPagosReportados)}</TotalPagos>
                    <CalifMop02>{fn:data($Cuenta/TotalPagosCalificadosMOP2)}</CalifMop02>
                    <CalifMop03>{fn:data($Cuenta/TotalPagosCalificadosMOP3)}</CalifMop03>
                    <CalifMop04>{fn:data($Cuenta/TotalPagosCalificadosMOP4)}</CalifMop04>
                    <CalifMop05>{fn:data($Cuenta/TotalPagosCalificadosMOP5)}</CalifMop05>
                    <HistMoraSaldo>{fn:data($Cuenta/ImporteSaldoMorosidadHistMasGrave)}</HistMoraSaldo>
                    <HistMoraFecha>{
                      if(fn:exists($Cuenta/FechaHistoricaMorosidadMasGrave)) then 
                        if(fn:empty($Cuenta/FechaHistoricaMorosidadMasGrave/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaHistoricaMorosidadMasGrave)
                      else ()
                    }</HistMoraFecha>
                    <HistMoraMop02>{fn:data($Cuenta/MopHistoricoMorosidadMasGrave)}</HistMoraMop02>
                    <FechaInicio>{
                      if(fn:exists($Cuenta/FechaInicioReestructura)) then 
                        if(fn:empty($Cuenta/FechaInicioReestructura/text())) then ()
                        else crd:string-to-dateFormat($Cuenta/FechaInicioReestructura)
                      else ()
                    }</FechaInicio>
                    <MontoUltimo>{fn:data($Cuenta/MontoUltimoPago)}</MontoUltimo>
                </item>
            }</ITl>
        <IUr>
            <RefOperador>{fn:data($consultaBC/return/Personas/Persona/Error/UR/NumeroReferenciaOperador)}</RefOperador>
            <Solicitud>{fn:data($consultaBC/return/Personas/Persona/Error/UR/SolicitudClienteErronea)}</Solicitud>
            <Version>{fn:data($consultaBC/return/Personas/Persona/Error/UR/VersionProporcionadaErronea)}</Version>
            <Producto>{fn:data($consultaBC/return/Personas/Persona/Error/UR/ProductoSolicitadoErroneo)}</Producto>
            <Password>{fn:data($consultaBC/return/Personas/Persona/Error/UR/PasswordOClaveErronea)}</Password>
            <Segmento>{fn:data($consultaBC/return/Personas/Persona/Error/UR/SegmentoRequeridoNoProporcionado)}</Segmento>
            <UltInfoValida>{fn:data($consultaBC/return/Personas/Persona/Error/UR/UltimaInformacionValidaCliente)}</UltInfoValida>
            <InfoErrConsul>{fn:data($consultaBC/return/Personas/Persona/Error/UR/InformacionErroneaParaConsulta)}</InfoErrConsul>
            <ValorErrRel>{fn:data($consultaBC/return/Personas/Persona/Error/UR/ValorErroneoCampoRelacionado)}</ValorErrRel>
            <ErrorBuro>{fn:data($consultaBC/return/Personas/Persona/Error/UR/ErrorSistemaBuroCredito)}</ErrorBuro>
            <EtiquetaSeg>{fn:data($consultaBC/return/Personas/Persona/Error/UR/EtiquetaSegmentoErronea)}</EtiquetaSeg>
            <OrdenErr>{fn:data($consultaBC/return/Personas/Persona/Error/UR/OrdenErroneoSegmento)}</OrdenErr>
            <NumErrSeg>{fn:data($consultaBC/return/Personas/Persona/Error/UR/NumeroErroneoSegmentos)}</NumErrSeg>
            <Requerido1>{fn:data($consultaBC/return/Personas/Persona/Error/UR/FaltaCampoRequerido)}</Requerido1></IUr>
    </soc:ZlmRfcRecibeBuro>
};

crd:PeticionRecibeBuroCredito($idCliente, $probabilidadIncumplimiento, $siva, $consultaBC)