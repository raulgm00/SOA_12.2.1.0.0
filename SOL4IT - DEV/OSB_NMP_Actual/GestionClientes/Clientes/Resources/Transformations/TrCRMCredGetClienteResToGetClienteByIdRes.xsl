<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:NMPConsultaC="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns0="http://tempuri.org/" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:ns1="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.DataContract" xmlns:ns2="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity" xmlns:ns3="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.Modelos" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns4="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:NMPCampania="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. TrCRMCredGetClienteResToGetClienteByIdRes-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/CRMClienteSvcBajaDisElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="GetClienteResponse" namespace="http://tempuri.org/"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPClientesSvcElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="getClientesByIDResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON DEC 21 22:28:26 CST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
    <xsl:template match="/">
        <NMPConsultaC:getClientesByIDResponse>
            <!-- Obligatorio -->
            <NMPConsultaC:Cliente>
                <!-- Obligatorio String -->
                <NMPConsultaC:idCliente>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:IdCliente"/>
                </NMPConsultaC:idCliente>
                <xsl:choose>
                    <!-- Obligatorio String -->
                    <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Genero = 1.0">
                        <NMPConsultaC:genero>H</NMPConsultaC:genero>
                    </xsl:when>
                    <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Genero = 2.0">
                        <NMPConsultaC:genero>M</NMPConsultaC:genero>
                    </xsl:when>
                    <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Genero = 3.0">
                        <NMPConsultaC:genero>N</NMPConsultaC:genero>
                    </xsl:when>
                    <xsl:otherwise>
                        <NMPConsultaC:genero/>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Obligatorio String -->
                <NMPConsultaC:nombre>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Nombre"/>
                </NMPConsultaC:nombre>
                <!-- Obligatorio String -->
                <NMPConsultaC:apellidoPaterno>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:ApellidoPaterno"/>
                </NMPConsultaC:apellidoPaterno>
                <!-- Obligatorio String -->
                <NMPConsultaC:apellidoMaterno>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:ApellidoMaterno"/>
                </NMPConsultaC:apellidoMaterno>
                <!-- Obligatorio Datetime -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:FechaNacimiento!=''">
                    <NMPConsultaC:fechaDeNacimiento>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:FechaNacimiento"/>
                    </NMPConsultaC:fechaDeNacimiento>
                </xsl:if>   
                <xsl:choose>
                    <!-- Obligatorio String -->
                    <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Trabaja = 1.0">
                        <NMPConsultaC:trabaja>
                            <xsl:text disable-output-escaping="no">S</xsl:text>
                        </NMPConsultaC:trabaja>
                    </xsl:when>
                    <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Trabaja = 0.0">
                        <NMPConsultaC:trabaja>
                            <xsl:text disable-output-escaping="no">N</xsl:text>
                        </NMPConsultaC:trabaja>
                    </xsl:when>
                    <xsl:otherwise>
                        <NMPConsultaC:trabaja/>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Opcional String -->
                <NMPConsultaC:URLVision360>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:URLVision360"/>
                </NMPConsultaC:URLVision360>
                <xsl:choose>
                    <!-- Opcional Int -->
                    <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Boletinado">
                        <NMPConsultaC:banderaDeBoletinacion>
                            <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Boletinado"/>
                        </NMPConsultaC:banderaDeBoletinacion>
                    </xsl:when>
                    <xsl:otherwise>
                        <NMPConsultaC:banderaDeBoletinacion>0</NMPConsultaC:banderaDeBoletinacion>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Obligatorio String -->
                <NMPConsultaC:numeroDeCredencial>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CredencialNMP"/>
                </NMPConsultaC:numeroDeCredencial>
                <!-- Obligatorio -->
                <NMPConsultaC:Cotitular>
                    <!-- Obligatorio String -->
                    <NMPConsultaC:nombre>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Cotitulares/ns3:Cotitular/ns3:Nombre"/>
                    </NMPConsultaC:nombre>
                    <!-- Obligatorio String -->
                    <NMPConsultaC:apellidoPaterno>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Cotitulares/ns3:Cotitular/ns3:ApellidoPaterno"/>
                    </NMPConsultaC:apellidoPaterno>
                    <!-- Obligatorio String -->
                    <NMPConsultaC:apellidoMaterno>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Cotitulares/ns3:Cotitular/ns3:ApellidoMaterno"/>
                    </NMPConsultaC:apellidoMaterno>                    
                </NMPConsultaC:Cotitular>
                <!-- Opcional -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Beneficiarios/ns3:Beneficiario[1]">
                    <NMPConsultaC:Beneficiarios>
                        <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Beneficiarios/ns3:Beneficiario">
                            <!-- Obligatorio -->
                            <NMPConsultaC:Beneficiario>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:nombre>
                                    <xsl:value-of select="ns3:Nombre"/>
                                </NMPConsultaC:nombre>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:apellidoPaterno>
                                    <xsl:value-of select="ns3:ApellidoPaterno"/>
                                </NMPConsultaC:apellidoPaterno>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:apellidoMaterno>
                                    <xsl:value-of select="ns3:ApellidoMaterno"/>
                                </NMPConsultaC:apellidoMaterno>
                            </NMPConsultaC:Beneficiario>
                        </xsl:for-each>
                    </NMPConsultaC:Beneficiarios>
                </xsl:if>                
                <!-- Opcional String -->
                <NMPConsultaC:email/>
                <!-- Opcional -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Email/ns3:Correo[1]">
                    <NMPConsultaC:CorreosElectronicos>
                        <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Email/ns3:Correo">
                            <!-- Obligatorio -->
                            <NMPConsultaC:CorreoElectronico>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:email>
                                    <xsl:value-of select="ns3:correo"/>
                                </NMPConsultaC:email>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:tipoEmail>
                                    <xsl:value-of select="DVMFunctions:lookupValue('GestionCatalogos/Comun/Resources/DVMs/TipoCorreos', 'CRM', ns3:TipoCorreo, 'NMP', '' )"/>
                                </NMPConsultaC:tipoEmail>                           
                                <NMPConsultaC:fuenteDato>
                                    <xsl:value-of select="ns3:FuenteDato"/>
                                </NMPConsultaC:fuenteDato>
                                <!-- Opcional String -->
                                <NMPConsultaC:origenDato>
                                    <xsl:value-of select="ns3:Origen"/>
                                </NMPConsultaC:origenDato>
                            </NMPConsultaC:CorreoElectronico>
                        </xsl:for-each>
                    </NMPConsultaC:CorreosElectronicos> 
                </xsl:if>   
                <!-- Opcional Decimal -->
                 <xsl:choose>
                    <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:SobreAforoAjustado != ''">
                      <NMPConsultaC:sobreAforo>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:SobreAforoAjustado"/>
                      </NMPConsultaC:sobreAforo>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:SobreAforoSIVA2!=''">
                            <NMPConsultaC:sobreAforo>
                                <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:SobreAforoSIVA2"/>
                            </NMPConsultaC:sobreAforo>
                        </xsl:if>                      
                  </xsl:otherwise>
                </xsl:choose>
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CalificacionSIVA2!=''">
                    <NMPConsultaC:calificacionReal>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CalificacionSIVA2"/>
                    </NMPConsultaC:calificacionReal>
                </xsl:if>                
                <!-- Opcional Decimal -->
                 <xsl:choose>
                     <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CalificacionAjustada!=''">
                        <NMPConsultaC:calificacionMidas>
                            <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CalificacionAjustada"/>
                        </NMPConsultaC:calificacionMidas>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CalificacionSIVA2!=''">
                            <NMPConsultaC:calificacionMidas>
                                <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CalificacionSIVA2"/>
                            </NMPConsultaC:calificacionMidas>
                        </xsl:if>                       
                    </xsl:otherwise>
                </xsl:choose>                             
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CapacidadPago!=''">
                    <NMPConsultaC:capacidadDePago>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:CapacidadPago"/>
                    </NMPConsultaC:capacidadDePago>
                </xsl:if>               
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:ProbabilidadIncumplimiento!=''">
                    <NMPConsultaC:probabilidadIncumplimiento>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:ProbabilidadIncumplimiento"/>
                    </NMPConsultaC:probabilidadIncumplimiento>
                </xsl:if>                
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:IndiceRecuperacion!=''">
                    <NMPConsultaC:indiceRecuperacion>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:IndiceRecuperacion"/>
                    </NMPConsultaC:indiceRecuperacion>
                </xsl:if>                
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:GradoConfianza!=''">
                    <NMPConsultaC:gradoDeConfianza>
                        <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:GradoConfianza"/>
                    </NMPConsultaC:gradoDeConfianza>
                </xsl:if>     
                <NMPConsultaC:tipoIdentificacion>
                    <xsl:value-of select="DVMFunctions:lookupValue('GestionCatalogos/Comun/Resources/DVMs/TipoIdentificacion', 'CRM', /ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:TipoIdentificacion, 'NMP', '' )"/>
                </NMPConsultaC:tipoIdentificacion>                
                <!-- Opcional String -->
                <NMPConsultaC:numeroIdentificacion>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:NoIdentificacion"/>
                </NMPConsultaC:numeroIdentificacion>                
                <!-- Opcional String -->
                <NMPConsultaC:deseaSerContactado>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:DeseaserContactado"/>
                </NMPConsultaC:deseaSerContactado>
                <!-- Opcional Boolean -->
                <NMPConsultaC:alertaMIDAS>false</NMPConsultaC:alertaMIDAS>
                <!-- Opcional -->
                <NMPConsultaC:Contacto>
                    <!-- Opcional -->
                    <NMPConsultaC:ListaTelefonos>
                        <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Telefonos/ns3:Telefono">
                            <!-- Opcional -->
                            <NMPConsultaC:Telefono>
                                <!-- Opcional String -->
                                <NMPConsultaC:codigoArea>
                                    <xsl:value-of select="ns3:Lada"/>
                                </NMPConsultaC:codigoArea>
                                <!-- Opcional String -->
                                <NMPConsultaC:numeroTelefonico>
                                    <xsl:value-of select="ns3:NumeroTelefono"/>
                                </NMPConsultaC:numeroTelefonico>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:Extension!=''">
                                    <NMPConsultaC:extension>
                                        <xsl:value-of select="ns3:Extension"/>
                                    </NMPConsultaC:extension>
                                </xsl:if>
                                <!-- Opcional String -->
                                <NMPConsultaC:tipoTelefono>
                                    <xsl:value-of select="DVMFunctions:lookupValue ('GestionCatalogos/Comun/Resources/DVMs/TipoTelefono', 'CRM', ns3:TipoTelefono, 'OTROS', 'No valido' )"/>
                                </NMPConsultaC:tipoTelefono>                                
                            </NMPConsultaC:Telefono>
                        </xsl:for-each>
                    </NMPConsultaC:ListaTelefonos>
                    <!-- Opcional -->
                    <NMPConsultaC:ListaDirecciones>
                        <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/ns1:DetalleRespuesta/ns3:Direcciones/ns3:Direccion">
                            <!-- Opcional String -->
                            <NMPConsultaC:Direccion>
                                <xsl:if test="ns3:Calle!=''">
                                    <NMPConsultaC:nombreDelaCalle>
                                        <xsl:value-of select="ns3:Calle"/>
                                    </NMPConsultaC:nombreDelaCalle>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:NumeroExterior!=''">
                                    <NMPConsultaC:numeroExterior>
                                        <xsl:value-of select="ns3:NumeroExterior"/>
                                    </NMPConsultaC:numeroExterior>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:NumeroInterior!=''">
                                    <NMPConsultaC:numeroInterior>
                                        <xsl:value-of select="ns3:NumeroInterior"/>
                                    </NMPConsultaC:numeroInterior>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:EntreCalle1!=''">
                                    <NMPConsultaC:entreCalle1>
                                        <xsl:value-of select="ns3:EntreCalle1"/>
                                    </NMPConsultaC:entreCalle1>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:EntreCalle2!=''">
                                    <NMPConsultaC:entreCalle2>
                                        <xsl:value-of select="ns3:EntreCalle2"/>
                                    </NMPConsultaC:entreCalle2>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:Estado!=''">
                                    <xsl:choose>
                                        <xsl:when test="ns3:Estado = 0">
                                            <NMPConsultaC:estado>
                                                <xsl:value-of select="ns3:EstadoOtro"/>
                                            </NMPConsultaC:estado>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <NMPConsultaC:estado>
                                                <xsl:value-of select="ns3:DescripcionEstado"/>
                                            </NMPConsultaC:estado>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <!-- Opcional Int -->
                                <xsl:if test="ns3:Estado!=''">
                                    <NMPConsultaC:idEstado>
                                        <xsl:value-of select="ns3:Estado"/>
                                    </NMPConsultaC:idEstado>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:DelegacionMunicipio!=''">
                                    <xsl:choose>
                                        <xsl:when test="ns3:DelegacionMunicipio = 0">
                                            <NMPConsultaC:delegacionMunicipio>
                                                <xsl:value-of select="ns3:DelegacionMunicipioOtro"/>
                                            </NMPConsultaC:delegacionMunicipio>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <NMPConsultaC:delegacionMunicipio>
                                                <xsl:value-of select="ns3:DescripcionDelegacionMunicipio"/>
                                            </NMPConsultaC:delegacionMunicipio>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <!-- Opcional Int -->
                                <xsl:if test="ns3:DelegacionMunicipio!=''">
                                    <NMPConsultaC:idDelegacionMunicipio>
                                        <xsl:value-of select="ns3:DelegacionMunicipio"/>
                                    </NMPConsultaC:idDelegacionMunicipio>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:Colonia!=''">
                                    <xsl:choose>
                                        <xsl:when test="ns3:Colonia = 0">
                                            <NMPConsultaC:colonia>
                                                <xsl:value-of select="ns3:ColoniaOtro"/>
                                            </NMPConsultaC:colonia>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <NMPConsultaC:colonia>
                                                <xsl:value-of select="ns3:DescripcionColonia"/>
                                            </NMPConsultaC:colonia>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <!-- Opcional Int -->
                                <xsl:if test="ns3:Colonia!=''">
                                    <NMPConsultaC:idColonia>
                                        <xsl:value-of select="ns3:Colonia"/>
                                    </NMPConsultaC:idColonia>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:CP!=''">
                                    <xsl:choose>
                                        <xsl:when test="ns3:CP = 0">
                                            <NMPConsultaC:codigoPostal>
                                                <xsl:value-of select="ns3:CPOtro"/>
                                            </NMPConsultaC:codigoPostal>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <NMPConsultaC:codigoPostal>
                                                <xsl:value-of select="ns3:DescripcionCP"/>
                                            </NMPConsultaC:codigoPostal>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <!-- Opcional Int -->
                                <xsl:if test="ns3:CP!=''">
                                    <NMPConsultaC:idCodigoPostal>
                                        <xsl:value-of select="ns3:CP"/>
                                    </NMPConsultaC:idCodigoPostal>
                                </xsl:if>
                                <!-- Opcional String -->
                                <xsl:if test="ns3:TipoDomicilio!=''">
                                    <NMPConsultaC:tipoDomicilio>
                                        <xsl:value-of select="ns3:TipoDomicilio"/>
                                    </NMPConsultaC:tipoDomicilio>
                                </xsl:if>
                            </NMPConsultaC:Direccion>
                        </xsl:for-each>
                    </NMPConsultaC:ListaDirecciones>
                </NMPConsultaC:Contacto>
            </NMPConsultaC:Cliente>
        </NMPConsultaC:getClientesByIDResponse>
    </xsl:template>
</xsl:stylesheet>