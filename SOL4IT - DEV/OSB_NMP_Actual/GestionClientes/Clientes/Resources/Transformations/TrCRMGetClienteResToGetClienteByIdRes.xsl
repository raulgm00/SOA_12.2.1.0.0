<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi xsl ns0 a xsd NMPConsultaC bpws xp20 mhdr bpel oraext dvm hwf med ids bpm xdk xref ora socket ldap" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:NMPConsultaC="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:a="http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:NMPCampania="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/CRMClienteSvcAltaDisElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="GetClienteResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPClientesSvcElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="getClientesByIDResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI DEC 11 14:55:16 CST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <NMPConsultaC:getClientesByIDResponse>
      <NMPConsultaC:Cliente>
        <!-- Validacion Long 23-12-2016 -->
        <xsl:choose>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:IdCliente != ''">
            <NMPConsultaC:idCliente>
              <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:IdCliente"/>
            </NMPConsultaC:idCliente>
          </xsl:when>
          <xsl:otherwise>
            <NMPConsultaC:idCliente>
              <xsl:text disable-output-escaping="no">0</xsl:text>
            </NMPConsultaC:idCliente>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Genero = 1.0">
            <NMPConsultaC:genero>
              <xsl:text disable-output-escaping="no">H</xsl:text>
            </NMPConsultaC:genero>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Genero = 2.0">
            <NMPConsultaC:genero>
              <xsl:text disable-output-escaping="no">M</xsl:text>
            </NMPConsultaC:genero>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Genero = 3.0">
            <NMPConsultaC:genero>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </NMPConsultaC:genero>
          </xsl:when>
        </xsl:choose>
        <NMPConsultaC:nombre>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Nombre"/>
        </NMPConsultaC:nombre>
        <NMPConsultaC:apellidoPaterno>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:ApellidoPaterno"/>
        </NMPConsultaC:apellidoPaterno>
        <NMPConsultaC:apellidoMaterno>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:ApellidoMaterno"/>
        </NMPConsultaC:apellidoMaterno>
        <!-- Validacion Date Time 23-12-2016 -->
        <xsl:choose>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:FechaNacimiento != ''">
            <NMPConsultaC:fechaDeNacimiento>
              <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:FechaNacimiento"/>
            </NMPConsultaC:fechaDeNacimiento>
          </xsl:when>
          <xsl:otherwise>
            <NMPConsultaC:fechaDeNacimiento>
              <xsl:text disable-output-escaping="no">0000-00-00T05:00:00</xsl:text>
            </NMPConsultaC:fechaDeNacimiento>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Trabaja = 1.0">
            <NMPConsultaC:trabaja>
              <xsl:text disable-output-escaping="no">S</xsl:text>
            </NMPConsultaC:trabaja>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Trabaja = 0.0">
            <NMPConsultaC:trabaja>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </NMPConsultaC:trabaja>
          </xsl:when>
        </xsl:choose>
        <!-- Validacion Int 23-12-2015-->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Boletinado != ''">
          <NMPConsultaC:banderaDeBoletinacion>
            <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Boletinado"/>
          </NMPConsultaC:banderaDeBoletinacion>
        </xsl:if>
        <NMPConsultaC:numeroDeCredencial>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:CredencialNMP"/>
        </NMPConsultaC:numeroDeCredencial>
        <!-- Validacion Obligatorio 23-12-2016 -->
            <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Cotitulares/a:Cotitular/a:Nombre != ''">
            <NMPConsultaC:Cotitular>
              <NMPConsultaC:nombre>
                <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Cotitulares/a:Cotitular/a:Nombre"/>
              </NMPConsultaC:nombre>
              <NMPConsultaC:apellidoPaterno>
                <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Cotitulares/a:Cotitular/a:ApellidoPaterno"/>
              </NMPConsultaC:apellidoPaterno>
              <NMPConsultaC:apellidoMaterno>
                <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Cotitulares/a:Cotitular/a:ApellidoMaterno"/>
              </NMPConsultaC:apellidoMaterno>
            </NMPConsultaC:Cotitular>
        </xsl:if>
        <!--<NMPConsultaC:Cotitulares>
          <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Cotitulares/a:Cotitular">
            <NMPConsultaC:Cotitular>
              <NMPConsultaC:nombre>
                <xsl:value-of select="a:Nombre"/>
              </NMPConsultaC:nombre>
              <NMPConsultaC:apellidoPaterno>
                <xsl:value-of select="a:ApellidoPaterno"/>
              </NMPConsultaC:apellidoPaterno>
              <NMPConsultaC:apellidoMaterno>
                <xsl:value-of select="a:ApellidoMaterno"/>
              </NMPConsultaC:apellidoMaterno>
              <NMPConsultaC:ListaTelefonos>
                <xsl:for-each select="a:Telefonos/a:Telefono">
                  <NMPConsultaC:Telefono>
                    <NMPConsultaC:numeroTelefonico>
                      <xsl:value-of select="a:NumeroTelefonico"/>
                    </NMPConsultaC:numeroTelefonico>
                    <NMPConsultaC:extension>
                      <xsl:value-of select="a:Extension"/>
                    </NMPConsultaC:extension>
                    <NMPConsultaC:tipoTelefono>
                      <xsl:value-of select="a:TipoTelefono"/>
                    </NMPConsultaC:tipoTelefono>
                  </NMPConsultaC:Telefono>
                </xsl:for-each>
              </NMPConsultaC:ListaTelefonos>
            </NMPConsultaC:Cotitular>
          </xsl:for-each>
        </NMPConsultaC:Cotitulares>-->
        <!-- Validacion 23-12-2016-->
          <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Beneficiarios/a:Beneficiario[1]">
                <NMPConsultaC:Beneficiarios>
                <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Beneficiarios/a:Beneficiario">
                  <NMPConsultaC:Beneficiario>
                    <NMPConsultaC:nombre>
                      <xsl:value-of select="a:Nombre"/>
                    </NMPConsultaC:nombre>
                    <NMPConsultaC:apellidoPaterno>
                      <xsl:value-of select="a:ApellidoPaterno"/>
                    </NMPConsultaC:apellidoPaterno>
                    <NMPConsultaC:apellidoMaterno>
                      <xsl:value-of select="a:ApellidoMaterno"/>
                    </NMPConsultaC:apellidoMaterno>
                  </NMPConsultaC:Beneficiario>
                </xsl:for-each>
              </NMPConsultaC:Beneficiarios>
          </xsl:if>              
        <NMPConsultaC:email>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Email"/>
        </NMPConsultaC:email>
        <!--NMPConsultaC:CorreosElectronicos>
          <NMPConsultaC:CorreoElectronico>
            <NMPConsultaC:email>email@email.com</NMPConsultaC:email>
            <NMPConsultaC:tipoEmail>personal</NMPConsultaC:tipoEmail>
            <NMPConsultaC:fuenteDato>Credito</NMPConsultaC:fuenteDato>
            <NMPConsultaC:origenDato>Portal</NMPConsultaC:origenDato>
          </NMPConsultaC:CorreoElectronico>
        </NMPConsultaC:CorreosElectronicos-->
        <!--Validacion Decimal 23-12-2016 -->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:SobreAforo != ''">
                <NMPConsultaC:sobreAforo>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:SobreAforo"/>
                </NMPConsultaC:sobreAforo>
        </xsl:if>
        <!--Validacion Decimal 23-12-2016 -->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:CalificacionReal != ''">
                <NMPConsultaC:calificacionReal>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:CalificacionReal"/>
                </NMPConsultaC:calificacionReal>
        </xsl:if>        
        <!--Validacion Decimal 23-12-2016 -->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:CalificacionMidas != ''">
                <NMPConsultaC:calificacionMidas>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:CalificacionMidas"/>
                </NMPConsultaC:calificacionMidas>
        </xsl:if>
        <!--Validacion Decimal 23-12-2016 -->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:CapacidadPago != ''">
                <NMPConsultaC:capacidadDePago>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:CapacidadPago"/>
                </NMPConsultaC:capacidadDePago>
        </xsl:if>
        <!--Validacion Decimal 23-12-2016 -->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:ProbabilidadIncumplimiento != ''">
                <NMPConsultaC:probabilidadIncumplimiento>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:ProbabilidadIncumplimiento"/>
                </NMPConsultaC:probabilidadIncumplimiento>
        </xsl:if>
        <!--Validacion Decimal 23-12-2016 -->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:IndiceRecuperacion != ''">
                <NMPConsultaC:indiceRecuperacion>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:IndiceRecuperacion"/>
                </NMPConsultaC:indiceRecuperacion>
        </xsl:if>
        <!--Validacion Decimal 23-12-2016 -->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:GradoConfianza != ''">
                <NMPConsultaC:gradoDeConfianza>
                    <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:GradoConfianza"/>
                </NMPConsultaC:gradoDeConfianza>
         </xsl:if>
         <NMPConsultaC:tipoIdentificacion>
              <xsl:value-of select="DVMFunctions:lookupValue ('GestionCatalogos/Comun/Resources/DVMs/TipoIdentificacion', 'CRM', /ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion, 'NMP', '' )"/>
        </NMPConsultaC:tipoIdentificacion>
        <!--xsl:choose>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 1.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">CREDENCIAL PARA VOTAR</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 2.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">PASAPORTE</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 3.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">DOCUMENTACIÓN EXPEDIDA POR EL INSTITUTO NACIONAL DE MIGRACIÓN</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 4.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">CÉDULA PROFESIONAL</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 5.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">CARTILLA DE SERVICIO MILITAR</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 6.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">CERTIFICADO DE MATRÍCULA CONSULAR</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 7.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">TARJETA ÚNICA DE IDENTIFICACIÓN MILITAR</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 8.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">TARJETA DE AFILIACIÓN AL INSTITUTO NACIONAL DE LAS PERSONAS ADULTAS M</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 9.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">CREDENCIALES Y CARNETS EXPEDIDOS POR EL INSTITUTO MEXICANO DEL SEGURO</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 10.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">LICENCIA PARA CONDUCIR</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 11.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">OTRA CREDENCIAL EMITIDA POR AUTORIDADES FEDERALES</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 12.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">OTRA CREDENCIAL EMITIDA POR AUTORIDADES ESTATALES</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 13.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">OTRA CREDENCIAL EMITIDA POR AUTORIDADES MUNICIPALES</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 14.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">FORMA MIGRATORIA</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
          <xsl:when test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoIdentificacion = 16.0">
            <NMPConsultaC:tipoIdentificacion>
              <xsl:text disable-output-escaping="no">ACTA CONSITUTIVA</xsl:text>
            </NMPConsultaC:tipoIdentificacion>
          </xsl:when>
        </xsl:choose-->
        <NMPConsultaC:numeroIdentificacion>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:NoIdentificacion"/>
        </NMPConsultaC:numeroIdentificacion>
        <!-- Validacion Boolean 23-12-2016-->
        <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Clienteencampana != ''">
            <NMPConsultaC:existCamp>
                  <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Clienteencampana"/>
            </NMPConsultaC:existCamp>
        </xsl:if>
        <NMPConsultaC:deseaSerContactado>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:DeseaserContactado"/>
        </NMPConsultaC:deseaSerContactado>
        <NMPConsultaC:alertaMIDAS>false</NMPConsultaC:alertaMIDAS>
        <!--Validacion Opcional 23-12-2016-->
          <xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Telefonos/a:Telefono[1] or /ns0:GetClienteResponse/ns0:GetClienteResult/a:Direcciones/a:Direccion[1]">
                <NMPConsultaC:Contacto>
                <NMPConsultaC:ListaTelefonos>
                  <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Telefonos/a:Telefono">
                    <NMPConsultaC:Telefono>
                      <NMPConsultaC:codigoArea>
                        <xsl:value-of select="a:Lada"/>
                      </NMPConsultaC:codigoArea>
                      <NMPConsultaC:numeroTelefonico>
                        <xsl:value-of select="a:NumeroTelefonico"/>
                      </NMPConsultaC:numeroTelefonico>
                      <NMPConsultaC:extension>
                        <xsl:value-of select="a:Extension"/>
                      </NMPConsultaC:extension>
                      <!--xsl:choose>
                        <xsl:when test="a:TipoTelefono = 1.0"-->
                      <NMPConsultaC:tipoTelefono>
                        <xsl:value-of select="DVMFunctions:lookupValue ('GestionCatalogos/Comun/Resources/DVMs/TipoTelefono', 'CRM', a:TipoTelefono, 'OTROS', 'No valido' )"/>
                        <!--xsl:text disable-output-escaping="no">casa</xsl:text-->
                      </NMPConsultaC:tipoTelefono>
                      <!--/xsl:when>
                        <xsl:when test="a:TipoTelefono = 2.0">
                          <NMPConsultaC:tipoTelefono>
                            <xsl:text disable-output-escaping="no">oficina</xsl:text>
                          </NMPConsultaC:tipoTelefono>
                        </xsl:when>
                        <xsl:when test="a:TipoTelefono = 3.0">
                          <NMPConsultaC:tipoTelefono>
                            <xsl:text disable-output-escaping="no">celular</xsl:text>
                          </NMPConsultaC:tipoTelefono>
                        </xsl:when>
                      </xsl:choose-->
                    </NMPConsultaC:Telefono>
                  </xsl:for-each>
                </NMPConsultaC:ListaTelefonos>
                <NMPConsultaC:ListaDirecciones>
                  <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Direcciones/a:Direccion">
                    <NMPConsultaC:Direccion>
                      <NMPConsultaC:nombreDelaCalle>
                        <xsl:value-of select="a:Calle"/>
                      </NMPConsultaC:nombreDelaCalle>
                      <NMPConsultaC:numeroExterior>
                        <xsl:value-of select="a:NumeroExterior"/>
                      </NMPConsultaC:numeroExterior>
                      <NMPConsultaC:numeroInterior>
                        <xsl:value-of select="a:NumeroInterior"/>
                      </NMPConsultaC:numeroInterior>
                      <NMPConsultaC:estado>
                        <xsl:value-of select="a:EstadoOtro"/>
                      </NMPConsultaC:estado>
                      <NMPConsultaC:idEstado>
                        <xsl:value-of select="a:Estado"/>
                      </NMPConsultaC:idEstado>
                      <NMPConsultaC:delegacionMunicipio>
                        <xsl:value-of select="a:DelegacionMunicipioOtro"/>
                      </NMPConsultaC:delegacionMunicipio>
                      <NMPConsultaC:colonia>
                        <xsl:value-of select="a:ColoniaOtro"/>
                      </NMPConsultaC:colonia>
                      <NMPConsultaC:codigoPostal>
                        <xsl:value-of select="a:CP"/>
                      </NMPConsultaC:codigoPostal>
                      <NMPConsultaC:tipoDomicilio>
                        <xsl:value-of select="a:TipoDomicilio"/>
                      </NMPConsultaC:tipoDomicilio>
                    </NMPConsultaC:Direccion>
                  </xsl:for-each>
                </NMPConsultaC:ListaDirecciones>
              </NMPConsultaC:Contacto>
        </xsl:if>
        <!--NMPConsultaC:tipoCliente>
          <xsl:value-of select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:TipoCliente"/>
        </NMPConsultaC:tipoCliente-->
        <!-- Validacion Alertas 23-12-2016-->
         <!--xsl:if test="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Alertas/a:Alerta[1]">
              <NMPConsultaC:listaAlertas>
                <xsl:for-each select="/ns0:GetClienteResponse/ns0:GetClienteResult/a:Alertas/a:Alerta">
                  <NMPConsultaC:alerta>
                    <NMPConsultaC:nombreAlerta>
                      <xsl:value-of select="a:NombreAlerta"/>
                    </NMPConsultaC:nombreAlerta>
                    <NMPConsultaC:descripcion>
                      <xsl:value-of select="a:Descripcion"/>
                    </NMPConsultaC:descripcion>
                  </NMPConsultaC:alerta>
                </xsl:for-each>
              </NMPConsultaC:listaAlertas>
        </xsl:if-->
      </NMPConsultaC:Cliente>
    </NMPConsultaC:getClientesByIDResponse>
  </xsl:template>
</xsl:stylesheet>