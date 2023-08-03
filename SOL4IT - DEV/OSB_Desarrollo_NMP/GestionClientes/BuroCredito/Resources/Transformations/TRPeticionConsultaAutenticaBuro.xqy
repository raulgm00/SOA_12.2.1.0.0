xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace trg="http://bean.consulta.ws.bc.com/";
(:: import schema at "../Schemas/BCConsultaBuroCreditoXSD.xsd" ::)
declare namespace src="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)

declare namespace loc="http://www.w3.org/2005/xquery-local-functions";
declare namespace xs="http://www.w3.org/2001/XMLSchema";

declare variable $src:consultaInfoBC as element() (:: schema-element(src:consultaBCRequest) ::) external;
declare variable $xs:fechaCadena as xs:date external;

declare function loc:repeat-string($stringToRepeat as xs:string , $count as xs:integer )  as xs:string {
  fn:string-join((for $i in 1 to $count return $stringToRepeat),'')
 } ;

declare function loc:concat-pattern($node as xs:string, $count as xs:integer, $character as xs:string) as xs:string{
  fn:concat(loc:repeat-string($character, $count - fn:string-length($node)), $node)
};

declare function loc:TransformarConsultaAutenticaBC($src:consultaInfoBC as element() (:: schema-element(src:consultaBCRequest) ::)) as element() (:: schema-element(trg:consultaXML) ::) {
    <trg:consultaXML>
        <Consulta>
            <Personas>
                <Persona>
                    <Encabezado>
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:version/text())) then ()
                          else <Version>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:version)}</Version>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:numeroReferenciaOperador/text())) then <NumeroReferenciaOperador>{loc:concat-pattern(' ', 24, ' ')}</NumeroReferenciaOperador>
                          else <NumeroReferenciaOperador>{loc:concat-pattern(fn:data($src:consultaInfoBC/src:informacionGeneral/src:numeroReferenciaOperador), 25, ' ')}</NumeroReferenciaOperador>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:claveProductoRequerido/text())) then ()
                          else <ProductoRequerido>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:claveProductoRequerido)}</ProductoRequerido>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:clavePais/text())) then ()
                          else <ClavePais>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:clavePais)}</ClavePais>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:identificadorBuro/text())) then ()
                          else <IdentificadorBuro>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:identificadorBuro)}</IdentificadorBuro>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:claveUsuario/text())) then ()
                          else <ClaveUsuario>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:claveUsuario)}</ClaveUsuario>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:contrasenaUsuario/text())) then ()
                          else <Password>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:contrasenaUsuario)}</Password>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:tipoConsulta/text())) then ()
                          else <TipoConsulta>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:tipoConsulta)}</TipoConsulta>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:tipoContrato/text())) then ()
                          else <TipoContrato>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:tipoContrato)}</TipoContrato>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:claveUnidadMonetaria/text())) then ()
                          else <ClaveUnidadMonetaria>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:claveUnidadMonetaria)}</ClaveUnidadMonetaria>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:importeContrato/text())) then ()
                          else <ImporteContrato>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:importeContrato)}</ImporteContrato>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:idioma/text())) then ()
                          else <Idioma>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:idioma)}</Idioma>
                        }
                        {
                          if(fn:empty($src:consultaInfoBC/src:informacionGeneral/src:tipoSalida/text())) then ()
                          else <TipoSalida>{fn:data($src:consultaInfoBC/src:informacionGeneral/src:tipoSalida)}</TipoSalida> 
                        }
                    </Encabezado>
                    <Nombre>
                        <ApellidoPaterno>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:apellidoPaterno)}</ApellidoPaterno>
                        <ApellidoMaterno>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:apellidoMaterno)}</ApellidoMaterno>
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:apellidoAdicional)) then 
                              if(fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:apellidoAdicional/text())) then ()
                              else <ApellidoAdicional>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:apellidoAdicional)}</ApellidoAdicional>
                            else ()
                        }
                        <PrimerNombre>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:primerNombre)}</PrimerNombre>
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:segundoNombre))then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:segundoNombre/text()))then ()
                              else <SegundoNombre>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:segundoNombre)}</SegundoNombre>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:fechaNacimiento)) then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:fechaNacimiento/text())) then ()
                              else <FechaNacimiento>{fn:concat(loc:concat-pattern(fn:string(fn:day-from-date(fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:fechaNacimiento))), 2, '0'), loc:concat-pattern(fn:string(fn:month-from-date(fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:fechaNacimiento))), 2, '0'), fn:year-from-date(fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:fechaNacimiento)))}</FechaNacimiento>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:rfc)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:rfc/text())) then ()
                              else <RFC>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:rfc)}</RFC>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:prefijoPersonal)) then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:prefijoPersonal/text())) then ()
                              else <Prefijo>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:prefijoPersonal)}</Prefijo>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:sufijoPersonal)) then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:sufijoPersonal/text())) then ()
                              else <Sufijo>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:sufijoPersonal)}</Sufijo>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveNacionalidad)) then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveNacionalidad/text())) then ()
                              else <Nacionalidad>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveNacionalidad)}</Nacionalidad>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveTipoResidencia)) then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveTipoResidencia/text())) then ()
                              else <Residencia>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveTipoResidencia)}</Residencia>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroLicenciaConducir)) then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroLicenciaConducir/text())) then ()
                              else <NumeroLicenciaConducir>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroLicenciaConducir)}</NumeroLicenciaConducir>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveEstadoCivil)) then 
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveEstadoCivil/text())) then ()
                              else <EstadoCivil>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveEstadoCivil)}</EstadoCivil>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:genero)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:genero/text())) then ()
                              else <Sexo>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:genero)}</Sexo>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroCedulaProfesional)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroCedulaProfesional/text())) then ()
                              else <NumeroCedulaProfesional>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroCedulaProfesional)}</NumeroCedulaProfesional>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroRegistroElectoral)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroRegistroElectoral/text())) then ()
                              else <NumeroRegistroElectoral>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroRegistroElectoral)}</NumeroRegistroElectoral>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveImpuestoOtroPais)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveImpuestoOtroPais/text())) then ()
                              else <ClaveImpuestosOtroPais>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveImpuestoOtroPais)}</ClaveImpuestosOtroPais>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveOtroPais)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveOtroPais/text())) then ()
                              else <ClaveOtroPais>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:claveOtroPais)}</ClaveOtroPais>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroDependientes)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroDependientes/text())) then ()
                              else <NumeroDependientes>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:numeroDependientes)}</NumeroDependientes>
                            else ()
                        }
                        {
                            if (fn:exists($src:consultaInfoBC/src:informacionCliente/src:personal/src:edadesDependientes)) then
                              if (fn:empty($src:consultaInfoBC/src:informacionCliente/src:personal/src:edadesDependientes/text())) then ()
                              else <EdadesDependientes>{fn:data($src:consultaInfoBC/src:informacionCliente/src:personal/src:edadesDependientes)}</EdadesDependientes>
                            else ()
                        }
                    </Nombre>
                    <Domicilios>
                        {
                            for $domicilio in $src:consultaInfoBC/src:informacionCliente/src:personal/src:listaDomicilios/src:domicilio
                            return 
                            <Domicilio>
                                <Direccion1>{fn:data($domicilio/src:direccion)}</Direccion1>
                                {
                                    if (fn:exists($domicilio/src:direccionAdicional)) then
                                      if (fn:empty($domicilio/src:direccionAdicional/text())) then ()
                                      else <Direccion2>{fn:data($domicilio/src:direccionAdicional)}</Direccion2>
                                    else ()
                                }
                                {
                                    if (fn:exists($domicilio/src:coloniaPoblacion)) then
                                      if (fn:empty($domicilio/src:coloniaPoblacion/text())) then ()
                                      else <ColoniaPoblacion>{fn:data($domicilio/src:coloniaPoblacion)}</ColoniaPoblacion>
                                    else ()
                                }
                                <DelegacionMunicipio>{fn:data($domicilio/src:delegacionMunicipio)}</DelegacionMunicipio>
                                <Ciudad>{fn:data($domicilio/src:ciudad)}</Ciudad>
                                <Estado>{fn:data($domicilio/src:estado)}</Estado>
                                <CP>{loc:concat-pattern(fn:data($domicilio/src:codigoPostal), 5, '0')}</CP>
                                {
                                    if (fn:exists($domicilio/src:fechaResidencia)) then
                                      if (fn:empty($domicilio/src:fechaResidencia/text())) then ()
                                      else <FechaResidencia>{fn:concat(loc:concat-pattern(fn:string(fn:day-from-date(fn:data($domicilio/src:fechaResidencia))), 2, '0'), loc:concat-pattern(fn:string(fn:month-from-date(fn:data($domicilio/src:fechaResidencia))), 2, '0'), fn:year-from-date(fn:data($domicilio/src:fechaResidencia)))}</FechaResidencia>
                                    else ()
                                }
                                {
                                    if (fn:exists($domicilio/src:numeroTelefono)) then
                                      if (fn:empty($domicilio/src:numeroTelefono/text())) then ()
                                      else <NumeroTelefono>{fn:data($domicilio/src:numeroTelefono)}</NumeroTelefono>
                                    else ()
                                }
                                {
                                    if (fn:exists($domicilio/src:extension)) then
                                      if (fn:empty($domicilio/src:extension/text())) then ()
                                      else <Extension>{fn:data($domicilio/src:extension)}</Extension>
                                    else ()
                                }
                                {
                                    if (fn:exists($domicilio/src:fax)) then
                                      if (fn:empty($domicilio/src:fax/text())) then ()
                                      else <Fax>{fn:data($domicilio/src:fax)}</Fax>
                                    else ()
                                }
                                {
                                    if (fn:exists($domicilio/src:tipoDomicilio)) then
                                      if (fn:empty($domicilio/src:tipoDomicilio/text())) then ()
                                      else <TipoDomicilio>{fn:data($domicilio/src:tipoDomicilio)}</TipoDomicilio>
                                    else ()
                                }
                                {
                                    if (fn:exists($domicilio/src:indicadorEspecialDomicilio)) then
                                      if (fn:empty($domicilio/src:indicadorEspecialDomicilio/text())) then ()
                                      else <IndicadorEspecialDomicilio>{fn:data($domicilio/src:indicadorEspecialDomicilio)}</IndicadorEspecialDomicilio>
                                    else ()
                                }
                           </Domicilio>
                        }
                    </Domicilios>
                    
                        {
                            if(fn:count($src:consultaInfoBC/src:informacionCliente/src:personal/src:listaEmpleos/src:empleo) > 0) then
                              <Empleos> {
                              for $empleo in $src:consultaInfoBC/src:informacionCliente/src:personal/src:listaEmpleos/src:empleo
                              return 
                                <Empleo>
                                    {
                                        if (fn:exists($empleo/src:nombreEmpresa)) then
                                          if (fn:empty($empleo/src:nombreEmpresa/text())) then ()
                                          else <NombreEmpresa>{fn:data($empleo/src:nombreEmpresa)}</NombreEmpresa>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:direccion)) then
                                          if (fn:empty($empleo/src:direccion/text())) then ()
                                          else <Direccion1>{fn:data($empleo/src:direccion)}</Direccion1>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:direccionAdicional)) then
                                          if (fn:empty($empleo/src:direccionAdicional/text())) then ()
                                          else <Direccion2>{fn:data($empleo/src:direccionAdicional)}</Direccion2>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:coloniaPoblacion)) then
                                          if (fn:empty($empleo/src:coloniaPoblacion/text())) then ()
                                          else <ColoniaPoblacion>{fn:data($empleo/src:coloniaPoblacion)}</ColoniaPoblacion>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:delegacionMunicipio)) then
                                          if (fn:empty($empleo/src:delegacionMunicipio/text())) then ()
                                          else <DelegacionMunicipio>{fn:data($empleo/src:delegacionMunicipio)}</DelegacionMunicipio>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:ciudad)) then
                                          if (fn:empty($empleo/src:ciudad/text())) then ()
                                          else <Ciudad>{fn:data($empleo/src:ciudad)}</Ciudad>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:estado)) then
                                          if (fn:empty($empleo/src:estado/text())) then ()
                                          else <Estado>{fn:data($empleo/src:estado)}</Estado>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:codigoPostal)) then
                                          if (fn:empty($empleo/src:codigoPostal/text())) then ()
                                          else <CP>{loc:concat-pattern(fn:data($empleo/src:codigoPostal), 5, '0')}</CP>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:numeroTelefono)) then
                                          if (fn:empty($empleo/src:numeroTelefono/text())) then ()
                                          else <NumeroTelefono>{fn:data($empleo/src:numeroTelefono)}</NumeroTelefono>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:extension)) then
                                          if (fn:empty($empleo/src:extension/text())) then ()
                                          else <Extension>{fn:data($empleo/src:extension)}</Extension>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:fax)) then
                                          if (fn:empty($empleo/src:fax/text())) then ()
                                          else <Fax>{fn:data($empleo/src:fax)}</Fax>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:puesto)) then
                                          if (fn:empty($empleo/src:puesto/text())) then ()
                                          else <Cargo>{fn:data($empleo/src:puesto)}</Cargo>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:fechaContratacion)) then
                                          if (fn:empty($empleo/src:fechaContratacion/text())) then ()
                                          else <FechaContratacion>{fn:concat(loc:concat-pattern(fn:string(fn:day-from-date(fn:data($empleo/src:fechaContratacion))), 2, '0'), loc:concat-pattern(fn:string(fn:month-from-date(fn:data($empleo/src:fechaContratacion))), 2, '0'), fn:year-from-date(fn:data($empleo/src:fechaContratacion)))}</FechaContratacion>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:claveMonedaSalario)) then
                                          if (fn:empty($empleo/src:claveMonedaSalario/text())) then ()
                                          else <ClaveMonedaSalario>{fn:data($empleo/src:claveMonedaSalario)}</ClaveMonedaSalario>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:salario)) then
                                          if (fn:empty($empleo/src:salario/text())) then ()
                                          else <Salario>{fn:data($empleo/src:salario)}</Salario>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:baseSalarial)) then
                                          if (fn:empty($empleo/src:baseSalarial/text())) then ()
                                          else <BaseSalarial>{fn:data($empleo/src:baseSalarial)}</BaseSalarial>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:numeroEmpleado)) then
                                          if (fn:empty($empleo/src:numeroEmpleado/text())) then ()
                                          else <NumeroEmpleado>{fn:data($empleo/src:numeroEmpleado)}</NumeroEmpleado>
                                        else ()
                                    }
                                    {
                                        if (fn:exists($empleo/src:fechaUltimoDiaEmpleo)) then
                                          if (fn:empty($empleo/src:fechaUltimoDiaEmpleo/text())) then ()
                                          else <FechaUltimoDiaEmpleo>{fn:concat(loc:concat-pattern(fn:string(fn:day-from-date(fn:data($empleo/src:fechaUltimoDiaEmpleo))), 2, '0'), loc:concat-pattern(fn:string(fn:month-from-date(fn:data($empleo/src:fechaUltimoDiaEmpleo))), 2, '0'), fn:year-from-date(fn:data($empleo/src:fechaUltimoDiaEmpleo)))}</FechaUltimoDiaEmpleo>
                                        else ()
                                    }</Empleo>
                                  }</Empleos>
                                else ()
                        }
                    
                    {
                        for $cuenta in $src:consultaInfoBC/src:informacionCliente/src:personal/src:listaCuentas/src:cuenta
                        return 
                        <CuentaC>
                            {
                                if (fn:exists($cuenta/src:numeroCuenta)) then
                                  if (fn:empty($cuenta/src:numeroCuenta/text())) then ()
                                  else <NumeroCuenta>{fn:data($cuenta/src:numeroCuenta)}</NumeroCuenta>
                                else ()
                            }
                            {
                                if (fn:exists($cuenta/src:claveOtorgnte)) then
                                  if (fn:empty($cuenta/src:claveOtorgnte/text())) then ()
                                  else <ClaveOtorgante>{fn:data($cuenta/src:claveOtorgnte)}</ClaveOtorgante>
                                else ()
                            }
                            {
                                if (fn:exists($cuenta/src:nombreOtorgante)) then
                                  if (fn:empty($cuenta/src:nombreOtorgante/text())) then ()
                                  else <NombreOtorgante>{fn:data($cuenta/src:nombreOtorgante)}</NombreOtorgante>
                                else ()
                            }</CuentaC>
                    }
                    {
                      if(fn:exists($src:consultaInfoBC/src:informacionAutenticacion)) then
                          <Autentica>
                              <TipoReporte>{fn:data($src:consultaInfoBC/src:informacionAutenticacion/src:tipoReporte)}</TipoReporte>
                              <TipoSalidaAU>{fn:data($src:consultaInfoBC/src:informacionAutenticacion/src:tipoSalida)}</TipoSalidaAU>
                              <ReferenciaOperador>{loc:concat-pattern(fn:data($src:consultaInfoBC/src:informacionAutenticacion/src:referenciaOperador),25, ' ')}</ReferenciaOperador>
                              <TarjetaCredito>{fn:data($src:consultaInfoBC/src:informacionAutenticacion/src:tarjetaCredito)}</TarjetaCredito>
                              {
                                  if (fn:exists($src:consultaInfoBC/src:informacionAutenticacion/src:ultimosCuatroDigitos)) then
                                    if (fn:empty($src:consultaInfoBC/src:informacionAutenticacion/src:ultimosCuatroDigitos/text())) then ()
                                    else <UltimosCuatroDigitos>{fn:data($src:consultaInfoBC/src:informacionAutenticacion/src:ultimosCuatroDigitos)}</UltimosCuatroDigitos>
                                  else ()
                              }
                              <EjercidoCreditoHipotecario>{fn:data($src:consultaInfoBC/src:informacionAutenticacion/src:ejercidoCreditoHipotecario)}</EjercidoCreditoHipotecario>
                              <EjercidoCreditoAutomotriz>{fn:data($src:consultaInfoBC/src:informacionAutenticacion/src:ejercidoCreditoAutomotriz)}</EjercidoCreditoAutomotriz>
                          </Autentica>
                      else ()
                    }
                </Persona>
            </Personas>
        </Consulta>
    </trg:consultaXML>
};

loc:TransformarConsultaAutenticaBC($src:consultaInfoBC)