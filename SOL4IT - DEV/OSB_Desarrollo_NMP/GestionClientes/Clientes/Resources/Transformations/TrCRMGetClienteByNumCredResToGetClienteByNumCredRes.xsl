<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:NMPConsultaC="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:a="http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:NMPCampania="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania" xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/">
    <oracle-xsl-mapper:schema>
        <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. TrCRMGetClienteByNumCredResToGetClienteByNumCredRes.xsl-->
        <oracle-xsl-mapper:mapSources>
            <oracle-xsl-mapper:source type="XSD">
                <oracle-xsl-mapper:schema location="../Schemas/CRMClienteSvcAltaDisElementosXSD.xsd"/>
                <oracle-xsl-mapper:rootElement name="GetClienteByNMPCredentialResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal"/>
            </oracle-xsl-mapper:source>
        </oracle-xsl-mapper:mapSources>
        <oracle-xsl-mapper:mapTargets>
            <oracle-xsl-mapper:target type="XSD">
                <oracle-xsl-mapper:schema location="../Schemas/NMPClientesSvcElementosXSD.xsd"/>
                <oracle-xsl-mapper:rootElement name="getClientesByNumCredencialResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente"/>
            </oracle-xsl-mapper:target>
        </oracle-xsl-mapper:mapTargets>
        <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [WED DEC 16 20:26:21 CST 2015].-->
    </oracle-xsl-mapper:schema>
    <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <NMPConsultaC:getClientesByNumCredencialResponse>
            <!-- Obligatorio -->
            <NMPConsultaC:Cliente>
                <!-- Obligatorio -->
                <NMPConsultaC:idCliente>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:IdCliente"/>
                </NMPConsultaC:idCliente>
                <xsl:choose>
                    <!-- Obligatorio String -->
                    <xsl:when test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Genero = 1.0">
                        <NMPConsultaC:genero>H</NMPConsultaC:genero>
                    </xsl:when>
                    <xsl:when test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Genero = 2.0">
                        <NMPConsultaC:genero>M</NMPConsultaC:genero>
                    </xsl:when>
                    <xsl:when test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Genero = 3.0">
                        <NMPConsultaC:genero>N</NMPConsultaC:genero>
                    </xsl:when>
                    <xsl:otherwise>
                        <NMPConsultaC:genero/>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Obligatorio String -->
                <NMPConsultaC:nombre>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Nombre"/>
                </NMPConsultaC:nombre>
                <!-- Obligatorio String -->
                <NMPConsultaC:apellidoPaterno>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:ApellidoPaterno"/>
                </NMPConsultaC:apellidoPaterno>
                <!-- Obligatorio String -->
                <NMPConsultaC:apellidoMaterno>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:ApellidoMaterno"/>
                </NMPConsultaC:apellidoMaterno>
                <!-- Obligatorio DateTime -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:FechaNacimiento!=''">
                    <NMPConsultaC:fechaDeNacimiento>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:FechaNacimiento"/>
                    </NMPConsultaC:fechaDeNacimiento>
                </xsl:if>                
                <xsl:choose>
                    <!-- Obligatorio String -->
                    <xsl:when test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Trabaja = 1.0">
                        <NMPConsultaC:trabaja>S</NMPConsultaC:trabaja>
                    </xsl:when>
                    <xsl:when test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Trabaja = 0.0">
                        <NMPConsultaC:trabaja>N</NMPConsultaC:trabaja>
                    </xsl:when>
                </xsl:choose>
                <!-- Opcional Int -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Boletinado!=''">
                    <NMPConsultaC:banderaDeBoletinacion>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Boletinado"/>
                    </NMPConsultaC:banderaDeBoletinacion>
                </xsl:if>               
                <!-- Obligatorio String -->
                <NMPConsultaC:numeroDeCredencial>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:CredencialNMP"/>
                </NMPConsultaC:numeroDeCredencial>
                <!-- Obligatorio -->
                <NMPConsultaC:Cotitular>
                    <!-- Obligatorio String -->
                    <NMPConsultaC:nombre>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Cotitulares/a:Cotitular/a:Nombre"/>
                    </NMPConsultaC:nombre>
                    <!-- Obligatorio String -->
                    <NMPConsultaC:apellidoPaterno>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Cotitulares/a:Cotitular/a:ApellidoPaterno"/>
                    </NMPConsultaC:apellidoPaterno>
                    <!-- Obligatorio String -->
                    <NMPConsultaC:apellidoMaterno>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Cotitulares/a:Cotitular/a:ApellidoMaterno"/>
                    </NMPConsultaC:apellidoMaterno>
                </NMPConsultaC:Cotitular> 
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Beneficiarios/a:Beneficiario[1]">
                    <NMPConsultaC:Beneficiarios>
                        <xsl:for-each select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Beneficiarios/a:Beneficiario">
                            <!-- Obligatorio -->
                            <NMPConsultaC:Beneficiario>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:nombre>
                                    <xsl:value-of select="a:Nombre"/>
                                </NMPConsultaC:nombre>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:apellidoPaterno>
                                    <xsl:value-of select="a:ApellidoPaterno"/>
                                </NMPConsultaC:apellidoPaterno>
                                <!-- Obligatorio String -->
                                <NMPConsultaC:apellidoMaterno>
                                    <xsl:value-of select="a:ApellidoMaterno"/>
                                </NMPConsultaC:apellidoMaterno>
                            </NMPConsultaC:Beneficiario>
                        </xsl:for-each>
                    </NMPConsultaC:Beneficiarios>
                </xsl:if>                
                <!-- Opcional String -->
                <NMPConsultaC:email>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Email"/>
                </NMPConsultaC:email>
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:SobreAforo!=''">
                    <NMPConsultaC:sobreAforo>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:SobreAforo"/>
                    </NMPConsultaC:sobreAforo>
                </xsl:if>                
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:CalificacionReal!=''">
                    <NMPConsultaC:calificacionReal>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:CalificacionReal"/>
                    </NMPConsultaC:calificacionReal>
                </xsl:if>               
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:CalificacionMidas!=''">
                    <NMPConsultaC:calificacionMidas>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:CalificacionMidas"/>
                    </NMPConsultaC:calificacionMidas>
                </xsl:if>                
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:CapacidadPago!=''">
                    <NMPConsultaC:capacidadDePago>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:CapacidadPago"/>
                    </NMPConsultaC:capacidadDePago>
                </xsl:if>                
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:ProbabilidadIncumplimiento!=''">
                    <NMPConsultaC:probabilidadIncumplimiento>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:ProbabilidadIncumplimiento"/>
                    </NMPConsultaC:probabilidadIncumplimiento>
                </xsl:if>                
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:IndiceRecuperacion!=''">
                    <NMPConsultaC:indiceRecuperacion>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:IndiceRecuperacion"/>
                    </NMPConsultaC:indiceRecuperacion>
                </xsl:if>               
                <!-- Opcional Decimal -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:GradoConfianza!=''">
                    <NMPConsultaC:gradoDeConfianza>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:GradoConfianza"/>
                    </NMPConsultaC:gradoDeConfianza>
                </xsl:if>
                <NMPConsultaC:tipoIdentificacion>
                    <xsl:value-of select="DVMFunctions:lookupValue ('GestionCatalogos/Comun/Resources/DVMs/TipoIdentificacion', 'CRM', /ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:TipoIdentificacion, 'NMP', '' )"/>
                </NMPConsultaC:tipoIdentificacion>               
                <!-- Opcional String -->
                <NMPConsultaC:numeroIdentificacion>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:NoIdentificacion"/>
                </NMPConsultaC:numeroIdentificacion>
                <!-- Opcional boolean -->
                <xsl:if test="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Clienteencampana!=''">
                    <NMPConsultaC:existCamp>
                        <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Clienteencampana"/>
                    </NMPConsultaC:existCamp>
                </xsl:if>                
                <!-- Opcional String -->
                <NMPConsultaC:deseaSerContactado>
                    <xsl:value-of select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:DeseaserContactado"/>
                </NMPConsultaC:deseaSerContactado>
                <!-- Opcional Boolean -->
                <NMPConsultaC:alertaMIDAS>false</NMPConsultaC:alertaMIDAS>
                <!-- Opcional -->
                <NMPConsultaC:Contacto>
                    <!-- Opcional -->
                    <NMPConsultaC:ListaTelefonos>
                        <xsl:for-each select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Telefonos/a:Telefono">
                            <!-- Opcional -->
                            <NMPConsultaC:Telefono>
                                <!-- Opcional String -->
                                <NMPConsultaC:codigoArea>
                                    <xsl:value-of select="a:Lada"/>
                                </NMPConsultaC:codigoArea>
                                <!-- Opcional String -->
                                <NMPConsultaC:numeroTelefonico>
                                    <xsl:value-of select="a:NumeroTelefonico"/>
                                </NMPConsultaC:numeroTelefonico>
                                <!-- Opcional String -->
                                <NMPConsultaC:extension>
                                    <xsl:value-of select="a:Extension"/>
                                </NMPConsultaC:extension>
                                <!-- Opcional String -->
                                <NMPConsultaC:tipoTelefono>
                                    <xsl:value-of select="DVMFunctions:lookupValue ('GestionCatalogos/Comun/Resources/DVMs/TipoTelefono', 'CRM', a:TipoTelefono, 'OTROS', 'No valido' )"/>
                                </NMPConsultaC:tipoTelefono>                                
                            </NMPConsultaC:Telefono>
                        </xsl:for-each>
                    </NMPConsultaC:ListaTelefonos>
                    <!-- Opcional -->
                    <NMPConsultaC:ListaDirecciones>
                        <xsl:for-each select="/ns0:GetClienteByNMPCredentialResponse/ns0:GetClienteByNMPCredentialResult/a:Direcciones/a:Direccion">
                            <!-- Opcional -->
                            <NMPConsultaC:Direccion>
                                <!-- Opcional String -->
                                <NMPConsultaC:nombreDelaCalle>
                                    <xsl:value-of select="a:Calle"/>
                                </NMPConsultaC:nombreDelaCalle>
                                <!-- Opcional String -->
                                <NMPConsultaC:numeroExterior>
                                    <xsl:value-of select="a:NumeroExterior"/>
                                </NMPConsultaC:numeroExterior>
                                <!-- Opcional String -->
                                <NMPConsultaC:numeroInterior>
                                    <xsl:value-of select="a:NumeroInterior"/>
                                </NMPConsultaC:numeroInterior>
                                <!-- Opcional String -->
                                <NMPConsultaC:estado>
                                    <xsl:value-of select="a:EstadoOtro"/>
                                </NMPConsultaC:estado>
                                <!-- Opcional Int -->
                                <xsl:if test="a:Estado!=''">
                                    <NMPConsultaC:idEstado>
                                        <xsl:value-of select="a:Estado"/>
                                    </NMPConsultaC:idEstado>
                                </xsl:if>
                                <!-- Opcional String -->
                                <NMPConsultaC:delegacionMunicipio>
                                    <xsl:value-of select="a:DelegacionMunicipioOtro"/>
                                </NMPConsultaC:delegacionMunicipio>
                                <!-- Opcional String -->
                                <NMPConsultaC:colonia>
                                    <xsl:value-of select="a:ColoniaOtro"/>
                                </NMPConsultaC:colonia>
                                <!-- Opcional String -->
                                <NMPConsultaC:codigoPostal>
                                    <xsl:value-of select="a:CP"/>
                                </NMPConsultaC:codigoPostal>
                                <!-- Opcional String -->
                                <NMPConsultaC:tipoDomicilio>
                                    <xsl:value-of select="a:TipoDomicilio"/>
                                </NMPConsultaC:tipoDomicilio>
                            </NMPConsultaC:Direccion>
                        </xsl:for-each>
                    </NMPConsultaC:ListaDirecciones>
                </NMPConsultaC:Contacto>               
            </NMPConsultaC:Cliente>
        </NMPConsultaC:getClientesByNumCredencialResponse>
    </xsl:template>
</xsl:stylesheet>