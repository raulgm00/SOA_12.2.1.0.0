xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

import module namespace functx = "http://www.functx.com" at "../../../../Common/XQ/functx-1.0-nodoc-2007-01.xqy";

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schemas/Cliente/Credito";
(:: import schema at "../Schemas/NMPClienteCreditoSvcXSD.xsd" ::)
declare namespace ns1="http://tempuri.org/";
(:: import schema at "../Schemas/CRMClienteCreditoSvcXSD.xsd" ::)

declare namespace com = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun";

declare namespace cli = "http://servicios.montedepiedad.com.mx/NMP/Schema/Entidad/Cliente";

declare namespace ent1 = "http://schemas.datacontract.org/2004/07/EntityLayer.Modelos";

declare namespace ent = "http://schemas.datacontract.org/2004/07/EntityLayer.Respuesta";

declare variable $body as element() (:: schema-element(ns1:GetClienteResponse) ::) external;

declare function local:convert($body as element() (:: schema-element(ns1:GetClienteResponse) ::)) as element() (:: schema-element(ns2:consultarClienteResponse) ::) {
    <ns2:consultarClienteResponse>
        <ns2:cliente>
            <cli:datosCuenta>
                <cli:idCliente>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:IdCliente)}</cli:idCliente>
                <cli:numeroCredencial>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:CredencialNMP)}</cli:numeroCredencial>
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:TipoCliente and fn:string-length($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:TipoCliente)>0)
                    then <cli:tipoCliente>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:TipoCliente)}</cli:tipoCliente>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:Boletinado and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:Boletinado))>0)
                    then <cli:boletinado>{fn:boolean($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:Boletinado)}</cli:boletinado>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:DeseaserContactado and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:DeseaserContactado))>0)
                    then <cli:deseaSerContactado>{fn:boolean($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:DeseaserContactado)}</cli:deseaSerContactado>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:FuenteDato and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:FuenteDato))> 0)
                    then <com:fuenteDato>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCuenta/ent1:FuenteDato)}</com:fuenteDato>
                    else ()
                }</cli:datosCuenta>
            <cli:datosPersonales>
                {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo and fn:string-length($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo)>0) then
                  <cli:tipoPersona>
                      {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo/ent1:ClaveSap and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo/ent1:ClaveSap))>0) then
                        <com:clave origen="{fn:string('SAP')}">
                          {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo/ent1:ClaveSap)}
                        </com:clave>
                        else ()}
                      {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo/ent1:ID and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo/ent1:ID))>0) then
                        <com:clave origen="{fn:string('CRM')}">
                          {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Tipo/ent1:ID)}
                        </com:clave>
                        else ()}
                  </cli:tipoPersona>
                 else()}
                {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Genero) then
                <cli:genero>
                    {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Genero/ent1:ClaveSap and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Genero/ent1:ClaveSap))>0) then
                        <com:clave origen="{fn:string('SAP')}">
                          {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Genero/ent1:ClaveSap)}
                        </com:clave>
                     else ()}
                     {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Genero/ent1:ID and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Genero/ent1:ID))>0) then
                        <com:clave origen="{fn:string('CRM')}">
                          {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Genero/ent1:ID)}
                        </com:clave>
                     else ()}
                </cli:genero>
                else()}
                <cli:nombre>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nombre)}</cli:nombre>
                <cli:apellidoPaterno>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:ApellidoPaterno)}</cli:apellidoPaterno>
                <cli:apellidoMaterno>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:ApellidoMaterno)}</cli:apellidoMaterno>
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:FechaNacimiento and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:FechaNacimiento))>0)
                    then <cli:fechaNacimiento>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:FechaNacimiento)}</cli:fechaNacimiento>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:RFC and fn:string-length($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:RFC)>0)
                    then <cli:rfc>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:RFC)}</cli:rfc>
                    else ()
                }
                {
                if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nacionalidad) then
                  <cli:nacionalidad>
                    {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nacionalidad/ent1:Abreviatura and fn:string-length($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nacionalidad/ent1:Abreviatura)>0) then
                        <com:clave origen="{fn:string('SAP')}">
                          {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nacionalidad/ent1:Abreviatura)}
                        </com:clave>
                    else ()}
                   {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nacionalidad/ent1:ID and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nacionalidad/ent1:ID))>0) then
                      <com:clave origen="{fn:string('CRM')}">
                        {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Nacionalidad/ent1:ID)}
                      </com:clave>
                  else ()}                 
                </cli:nacionalidad>
                else()}
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion)
                    then <cli:identificacion>
                    {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Tipo and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Tipo))>0) then                        
                        <cli:tipo>{dvmtr:lookupValue("GestionCatalogos/Comun/Resources/DVMs/TipoIdentificacion","CRM",fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Tipo),"NMP","N/A","")}
                        </cli:tipo>
                        else()}
                    {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Numero and fn:string-length($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Numero)>0) then
                        <cli:numero>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Numero)}</cli:numero>
                        else()}
                    {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Expiracion and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Expiracion))>0)then    
                        <cli:fechaExpiracion>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Identificacion/ent1:Expiracion)}</cli:fechaExpiracion>
                     else()}   
                        </cli:identificacion>
                    else ()
                }
                {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Escolaridad) then
                <cli:escolaridad>
                 {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Escolaridad/ent1:ClaveSap and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Escolaridad/ent1:ClaveSap))>0) then
                      <com:clave origen="{fn:string('SAP')}">
                        {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Escolaridad/ent1:ClaveSap)}
                      </com:clave>
                  else ()}     
                  {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Escolaridad/ent1:ID and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Escolaridad/ent1:ID))>0) then
                      <com:clave origen="{fn:string('CRM')}">
                        {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Escolaridad/ent1:ID)}
                      </com:clave>
                  else ()} 
                </cli:escolaridad>
                else()}
                 {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia))>0)
                    then <cli:paisResidencia>{                                    
                     if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia/ent1:Abreviatura and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia/ent1:Abreviatura))>0) then
                        <com:clave origen="{fn:string('SAP')}">
                          {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia/ent1:Abreviatura)}
                        </com:clave>
                      else ()}
                       {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia/ent1:ID and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia/ent1:ID))>0) then
                          <com:clave origen="{fn:string('CRM')}">
                            {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:PaisResidencia/ent1:ID)}
                          </com:clave>
                      else ()}
                    </cli:paisResidencia>
                    else ()
                }                
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Trabaja and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Trabaja))>0)
                    then <cli:trabaja>{xs:boolean(fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Trabaja))}</cli:trabaja>
                    else ()
                }
                {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:EstadoCivil) then
                <cli:estadoCivil>
                 {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:EstadoCivil/ent1:ClaveSap and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:EstadoCivil/ent1:ClaveSap))>0) then
                      <com:clave origen="{fn:string('SAP')}">
                        {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:EstadoCivil/ent1:ClaveSap)}
                      </com:clave>
                  else ()} 
                   {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:EstadoCivil/ent1:ID and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:EstadoCivil/ent1:ID))>0) then
                      <com:clave origen="{fn:string('CRM')}">
                        {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:EstadoCivil/ent1:ID)}
                      </com:clave>
                  else ()} 
                </cli:estadoCivil>
                else()}
                {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Giro) then 
                <cli:giro>
                 {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Giro/ent1:ClaveSap and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Giro/ent1:ClaveSap))>0) then
                      <com:clave origen="{fn:string('SAP')}">
                        {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Giro/ent1:ClaveSap)}
                      </com:clave>
                  else ()} 
                   {if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Giro/ent1:ID and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Giro/ent1:ID))>0) then
                      <com:clave origen="{fn:string('CRM')}">
                        {fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:Giro/ent1:ID)}
                      </com:clave>
                  else ()} 
                </cli:giro>
                else()}
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:RepresentanteLegal and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:RepresentanteLegal))>0)
                    then <cli:representanteLegal>{xs:boolean(fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:RepresentanteLegal))}</cli:representanteLegal>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:NumeroDependientes and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:NumeroDependientes))>0)
                    then <cli:numeroDependientes>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosPersonales/ent1:NumeroDependientes)}</cli:numeroDependientes>
                    else ()
                }
                </cli:datosPersonales>
            <cli:datosContacto>
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosContacto/ent1:Direcciones)
                    then <cli:direcciones>
                        {
                            for $Direccion in $body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosContacto/ent1:Direcciones/ent1:Direccion
                            return 
                            <com:direccion>
                                {
                                    if ($Direccion/ent1:TipoDomicilio and fn:string-length(fn:string($Direccion/ent1:TipoDomicilio))>0)
                                    then <com:tipoDomicilio>{fn:data($Direccion/ent1:TipoDomicilio)}</com:tipoDomicilio>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:vivienda)
                                    then <com:tipoVivienda>
                                     {if ($Direccion/ent1:vivienda/ent1:ClaveSap and fn:string-length(fn:string($Direccion/ent1:vivienda/ent1:ClaveSap))>0) then
                                          <com:clave origen="{fn:string('SAP')}">
                                            {fn:data($Direccion/ent1:vivienda/ent1:ClaveSap)}
                                          </com:clave>
                                      else ()}
                                      {if ($Direccion/ent1:vivienda/ent1:ID and fn:string-length(fn:string($Direccion/ent1:vivienda/ent1:ID))>0) then
                                          <com:clave origen="{fn:string('CRM')}">
                                            {fn:data($Direccion/ent1:vivienda/ent1:ID)}
                                          </com:clave>
                                      else ()}   
                                    </com:tipoVivienda>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:Calle and fn:string-length($Direccion/ent1:Calle)>0)
                                    then <com:nombreDelaCalle>{fn:data($Direccion/ent1:Calle)}</com:nombreDelaCalle>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:NumeroExterior and fn:string-length($Direccion/ent1:NumeroExterior)>0)
                                    then <com:numeroExterior>{fn:data($Direccion/ent1:NumeroExterior)}</com:numeroExterior>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:NumeroInterior and fn:string-length($Direccion/ent1:NumeroInterior)>0)
                                    then <com:numeroInterior>{fn:data($Direccion/ent1:NumeroInterior)}</com:numeroInterior>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:EntreCalle1 and fn:string-length($Direccion/ent1:EntreCalle1)>0)
                                    then <com:entreCalle1>{fn:data($Direccion/ent1:EntreCalle1)}</com:entreCalle1>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:EntreCalle2 and fn:string-length($Direccion/ent1:EntreCalle2)>0)
                                    then <com:entreCalle2>{fn:data($Direccion/ent1:EntreCalle2)}</com:entreCalle2>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:colonia)
                                    then <com:colonia>
                                         {if ($Direccion/ent1:colonia/ent1:Descripcion and fn:string-length($Direccion/ent1:colonia/ent1:Descripcion)>0) then
                                       <com:descripcion>{fn:data($Direccion/ent1:colonia/ent1:Descripcion)}</com:descripcion>
                                      else if($Direccion/ent1:colonia/ent1:Otro and fn:string-length($Direccion/ent1:colonia/ent1:Otro)>0) then
                                       <com:descripcion>{fn:data($Direccion/ent1:colonia/ent1:Otro)}</com:descripcion>
                                      else()}
                                       {if ($Direccion/ent1:colonia/ent1:ClaveSap and fn:string-length(fn:string($Direccion/ent1:colonia/ent1:ClaveSap))>0) then
                                        <com:clave origen="{fn:string('SAP')}">
                                          {fn:data($Direccion/ent1:colonia/ent1:ClaveSap)}
                                        </com:clave>
                                      else ()}
                                       {if ($Direccion/ent1:colonia/ent1:ID and fn:string-length(fn:string($Direccion/ent1:colonia/ent1:ID))>0) then
                                          <com:clave origen="{fn:string('CRM')}">
                                            {fn:data($Direccion/ent1:colonia/ent1:ID)}
                                          </com:clave>
                                      else ()}
                                       </com:colonia>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:Delegacionmunicipio)
                                    then <com:delegacionMunicipio>
                                         {if ($Direccion/ent1:Delegacionmunicipio/ent1:Descripcion and fn:string-length($Direccion/ent1:Delegacionmunicipio/ent1:Descripcion)>0) then
                                       <com:descripcion>{fn:data($Direccion/ent1:Delegacionmunicipio/ent1:Descripcion)}</com:descripcion>
                                      else if($Direccion/ent1:Delegacionmunicipio/ent1:Otro and fn:string-length($Direccion/ent1:Delegacionmunicipio/ent1:Otro)>0) then
                                       <com:descripcion>{fn:data($Direccion/ent1:Delegacionmunicipio/ent1:Otro)}</com:descripcion>
                                      else()}
                                       {if ($Direccion/ent1:Delegacionmunicipio/ent1:ClaveSap and fn:string-length(fn:string($Direccion/ent1:Delegacionmunicipio/ent1:ClaveSap))>0) then
                                        <com:clave origen="{fn:string('SAP')}">
                                          {fn:data($Direccion/ent1:Delegacionmunicipio/ent1:ClaveSap)}
                                        </com:clave>
                                      else ()}
                                       {if ($Direccion/ent1:Delegacionmunicipio/ent1:ID and fn:string-length(fn:string($Direccion/ent1:Delegacionmunicipio/ent1:ID))>0) then
                                          <com:clave origen="{fn:string('CRM')}">
                                            {fn:data($Direccion/ent1:Delegacionmunicipio/ent1:ID)}
                                          </com:clave>
                                      else ()}
                                        </com:delegacionMunicipio>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:estado)
                                    then <com:estado>
                                     {if ($Direccion/ent1:estado/ent1:Descripcion and fn:string-length($Direccion/ent1:estado/ent1:Descripcion)>0) then
                                       <com:descripcion>{fn:data($Direccion/ent1:estado/ent1:Descripcion)}</com:descripcion>
                                      else if($Direccion/ent1:estado/ent1:Otro and fn:string-length($Direccion/ent1:estado/ent1:Otro)>0) then
                                       <com:descripcion>{fn:data($Direccion/ent1:estado/ent1:Otro and fn:string-length($Direccion/ent1:estado/ent1:Otro)>0)}</com:descripcion>
                                      else()}
                                       {if ($Direccion/ent1:estado/ent1:ClaveSap and fn:string-length(fn:string($Direccion/ent1:estado/ent1:ClaveSap))>0) then
                                        <com:clave origen="{fn:string('SAP')}">
                                          {fn:data($Direccion/ent1:estado/ent1:ClaveSap)}
                                        </com:clave>
                                      else ()}
                                       {if ($Direccion/ent1:estado/ent1:ID and fn:string-length(fn:string($Direccion/ent1:estado/ent1:ID))>0) then
                                          <com:clave origen="{fn:string('CRM')}">
                                            {fn:data($Direccion/ent1:estado/ent1:ID)}
                                          </com:clave>
                                      else ()}
                                       </com:estado>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:cp/ent1:ID and fn:string-length(fn:string($Direccion/ent1:cp/ent1:ID))>0)
                                    then <com:codigoPostal>{fn:data($Direccion/ent1:cp/ent1:ID)}</com:codigoPostal>
                                    else if ($Direccion/ent1:cp/ent1:Otro and fn:string-length($Direccion/ent1:cp/ent1:Otro)>0)
                                    then <com:codigoPostal>{fn:data($Direccion/ent1:cp/ent1:Otro)}</com:codigoPostal>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:pais and fn:string-length(fn:string($Direccion/ent1:pais))>0)
                                    then <com:pais>{                                    
                                     if ($Direccion/ent1:pais/ent1:Abreviatura and fn:string-length(fn:string($Direccion/ent1:pais/ent1:Abreviatura))>0) then
                                        <com:clave origen="{fn:string('SAP')}">
                                          {fn:data($Direccion/ent1:pais/ent1:Abreviatura)}
                                        </com:clave>
                                      else ()}
                                       {if ($Direccion/ent1:pais/ent1:ID and fn:string-length(fn:string($Direccion/ent1:pais/ent1:ID))>0) then
                                          <com:clave origen="{fn:string('CRM')}">
                                            {fn:data($Direccion/ent1:pais/ent1:ID)}
                                          </com:clave>
                                      else ()}
                                    </com:pais>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:DomicilioExtranjero and fn:string-length($Direccion/ent1:DomicilioExtranjero )>0)
                                    then <com:domicilioExtranjero>{fn:data($Direccion/ent1:DomicilioExtranjero)}</com:domicilioExtranjero>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:FechaCreacion and fn:string-length(fn:string($Direccion/ent1:FechaCreacion))>0)
                                    then <com:fechaCreacion>{fn:data($Direccion/ent1:FechaCreacion)}</com:fechaCreacion>
                                    else ()
                                }
                                {
                                    if ($Direccion/ent1:FuenteDato and fn:string-length(fn:string($Direccion/ent1:FuenteDato))>0)
                                    then <com:fuenteDato>{fn:data($Direccion/ent1:FuenteDato)}</com:fuenteDato>
                                    else ()
                                }
                                </com:direccion>
                        }</cli:direcciones>
                    else ()
                }
                <cli:correosElectronicos>
                    {if($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosContacto/ent1:EmailPrincipal and fn:string-length($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosContacto/ent1:EmailPrincipal)>0) then
                      <com:correoElectronico>
                            <com:direccionCorreo>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosContacto/ent1:EmailPrincipal)}</com:direccionCorreo>
                            <com:tipoCorreo>{dvmtr:lookupValue("GestionCatalogos/Comun/Resources/DVMs/TipoCorreos","CRM",fn:string('0'),"NMP","N/A","")}
                                  </com:tipoCorreo>
                      </com:correoElectronico>
                     else ()}
                     
                     {for $Email in $body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosContacto/ent1:Email/ent1:Email
                        return 
                        <com:correoElectronico>
                            {
                                if ($Email/ent1:Correo and fn:string-length($Email/ent1:Correo )>0)
                                then <com:direccionCorreo>{fn:data($Email/ent1:Correo)}</com:direccionCorreo>
                                else ()
                            }
                            {
                                if ($Email/ent1:Tipo and fn:string-length(fn:string($Email/ent1:Tipo))>0)
                                then <com:tipoCorreo>{dvmtr:lookupValue("GestionCatalogos/Comun/Resources/DVMs/TipoCorreos","CRM",fn:string($Email/ent1:Tipo),"NMP","N/A","")}
                                  </com:tipoCorreo>
                                else ()
                            }
                            {
                                if ($Email/ent1:FuenteDato and fn:string-length(fn:string($Email/ent1:FuenteDato))>0)
                                then <com:fuenteDato>{fn:data($Email/ent1:FuenteDato)}</com:fuenteDato>
                                else ()
                            }</com:correoElectronico>
                    }
                </cli:correosElectronicos>
                <cli:telefonos>
                    {
                        for $Telefono1 in $body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosContacto/ent1:Telefonos/ent1:Telefono
                        return 
                        <com:telefono>
                            {
                                if ($Telefono1/ent1:Lada and fn:string-length($Telefono1/ent1:Lada)>0)
                                then <com:codigoArea>{fn:data($Telefono1/ent1:Lada)}</com:codigoArea>
                                else ()
                            }
                            {
                                if ($Telefono1/ent1:Numero and fn:string-length($Telefono1/ent1:Numero)>0)
                                then <com:numeroTelefonico>{fn:data($Telefono1/ent1:Numero)}</com:numeroTelefonico>
                                else ()
                            }
                            {
                                if ($Telefono1/ent1:Extension and fn:string-length($Telefono1/ent1:Extension)>0)
                                then <com:extension>{fn:data($Telefono1/ent1:Extension)}</com:extension>
                                else ()
                            }
                            {
                                if ($Telefono1/ent1:Tipo and fn:string-length(fn:string($Telefono1/ent1:Tipo))>0)
                                then <com:tipoTelefono>{dvmtr:lookupValue("GestionCatalogos/Comun/Resources/DVMs/TipoTelefono","CRM",fn:string($Telefono1/ent1:Tipo),"OTROS","N/A","")}</com:tipoTelefono>
                                else ()
                            }
                            {
                                if ($Telefono1/ent1:FuenteDato and fn:string-length($Telefono1/ent1:FuenteDato)>0)
                                then <com:fuenteDato>{fn:data($Telefono1/ent1:FuenteDato)}</com:fuenteDato>
                                else ()
                            }</com:telefono>
                    }
                </cli:telefonos>
            </cli:datosContacto>
            <cli:beneficiarios>
                {
                    for $Beneficiario in $body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:Beneficiarios/ent1:Beneficiario
                    where $Beneficiario/ent1:ApellidoMaterno eq $Beneficiario/ent1:ApellidoMaterno
                    return 
                    <cli:beneficiario>
                        <cli:id>{fn:data($Beneficiario/ent1:ID)}</cli:id>
                        {
                            if ($Beneficiario/ent1:Nombre and fn:string-length($Beneficiario/ent1:Nombre)>0)
                            then <cli:nombre>{fn:data($Beneficiario/ent1:Nombre)}</cli:nombre>
                            else ()
                        }
                        {
                            if ($Beneficiario/ent1:ApellidoPaterno and fn:string-length($Beneficiario/ent1:ApellidoPaterno)>0)
                            then <cli:apellidoPaterno>{fn:data($Beneficiario/ent1:ApellidoPaterno)}</cli:apellidoPaterno>
                            else ()
                        }
                        {
                            if ($Beneficiario/ent1:ApellidoMaterno and fn:string-length($Beneficiario/ent1:ApellidoMaterno)>0)
                            then <cli:apellidoMaterno>{fn:data($Beneficiario/ent1:ApellidoMaterno)}</cli:apellidoMaterno>
                            else ()
                        }
                        <cli:datosContacto>
                            {
                                if ($Beneficiario/ent1:Telefonos)
                                then <cli:telefonos>
                                    {
                                        for $Telefono in $Beneficiario/ent1:Telefonos/ent1:Telefono
                                        return 
                                        <com:telefono>
                                            {
                                                if ($Telefono/ent1:Lada and fn:string-length($Telefono/ent1:Lada)>0)
                                                then <com:codigoArea>{fn:data($Telefono/ent1:Lada)}</com:codigoArea>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/ent1:Numero and fn:string-length($Telefono/ent1:Numero)>0)
                                                then <com:numeroTelefonico>{fn:data($Telefono/ent1:Numero)}</com:numeroTelefonico>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/ent1:Extension and fn:string-length($Telefono/ent1:Extension)>0)
                                                then <com:extension>{fn:data($Telefono/ent1:Extension)}</com:extension>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/ent1:Tipo and fn:string-length(fn:string($Telefono/ent1:Tipo))>0)
                                                then <com:tipoTelefono>{dvmtr:lookupValue("GestionCatalogos/Comun/Resources/DVMs/TipoTelefono","CRM",fn:string($Telefono/ent1:Tipo),"OTROS","N/A","")}</com:tipoTelefono>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/ent1:FuenteDato and fn:string-length($Telefono/ent1:FuenteDato)>0)
                                                then <com:fuenteDato>{fn:data($Telefono/ent1:FuenteDato)}</com:fuenteDato>
                                                else ()
                                            }</com:telefono>
                                    }
                                </cli:telefonos>
                                else ()
                            }
                        </cli:datosContacto>
                        {
                            if ($Beneficiario/ent1:FechaCreacion and fn:string-length(fn:string($Beneficiario/ent1:FechaCreacion))>0)
                            then <com:fechaCreacion>{fn:data($Beneficiario/ent1:FechaCreacion)}</com:fechaCreacion>
                            else ()
                        }</cli:beneficiario>
                }</cli:beneficiarios>
            {
                if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:Otros)
                then <cli:informacionComplementaria>
                    <cli:urlVision360>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:Otros/ent1:URLVision360)}</cli:urlVision360></cli:informacionComplementaria>
                else ()
            }
            <ns2:calificacionCredito>
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:CalificacionSIVA2 and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:CalificacionSIVA2))>0)
                    then <ns2:calificacionSiva2>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:CalificacionSIVA2)}</ns2:calificacionSiva2>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:ProbabilidadIncumplimiento and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:ProbabilidadIncumplimiento))>0)
                    then <ns2:probabilidadIncumplimiento>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:ProbabilidadIncumplimiento)}</ns2:probabilidadIncumplimiento>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:CapacidadPago and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:CapacidadPago))>0)
                    then <ns2:capacidadPago>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:CapacidadPago)}</ns2:capacidadPago>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PrestamoPromedio and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PrestamoPromedio))>0)
                    then <ns2:prestamoPromedio>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PrestamoPromedio)}</ns2:prestamoPromedio>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PrestamoPromedioValuacion and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PrestamoPromedioValuacion))>0)
                    then <ns2:prestamoPromedioValuacion>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PrestamoPromedioValuacion)}</ns2:prestamoPromedioValuacion>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:Prestamos and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:Prestamos))>0)
                    then <ns2:prestamos>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:Prestamos)}</ns2:prestamos>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:Pagos and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:Pagos))>0)
                    then <ns2:pagos>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:Pagos)}</ns2:pagos>
                    else ()
                }
                {
                    if ($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PorcentajeDesempeno and fn:string-length(fn:string($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PorcentajeDesempeno))>0)
                    then <ns2:porcentajeDesempenio>{fn:data($body/ns1:GetClienteResult/ent:DetalleRespuesta/ent1:DatosCalificacionCredito/ent1:PorcentajeDesempeno)}</ns2:porcentajeDesempenio>
                    else ()
                }</ns2:calificacionCredito>
        </ns2:cliente>
    </ns2:consultarClienteResponse>
};

local:convert($body)