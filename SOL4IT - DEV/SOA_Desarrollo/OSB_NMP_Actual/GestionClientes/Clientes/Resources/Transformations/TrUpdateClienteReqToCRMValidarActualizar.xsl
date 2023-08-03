<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://tempuri.org/" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:ns1="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.DataContract" xmlns:ns2="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity" xmlns:ns3="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.Modelos" xmlns:ns4="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns5="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:NMPCampania="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania" xmlns:dvm="http://www.oracle.com/osb/xpath-functions/dvm" xmlns:ns6="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal" xmlns:ns7="http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel" xmlns:ns8="http://schemas.microsoft.com/2003/10/Serialization/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPClientesSvcElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="updateClienteRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../Common/XSD/NMPStandardHeader.xsd"/>
        <oracle-xsl-mapper:rootElement name="headerMessage" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader"/>
        <oracle-xsl-mapper:param name="StandardHeader"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDL/CRMClientesSvcBajaDisWSDL.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ActualizaInformacionCliente" namespace="http://tempuri.org/"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU DEC 17 19:15:16 CST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="StandardHeader"/>
  <xsl:template match="/">
    <tns:ActualizaInformacionCliente>
      <xsl:variable name="FuenteDato">
        <xsl:value-of select="DVMFunctions:lookupValue ('Common/DVM/NMPFuenteDatosCRM', 'idDestinoOSB', $StandardHeader/ns4:headerMessage/ns4:idDestino, 'fuenteDatosCRM', '0')"/>
      </xsl:variable>
      <tns:request>
       <xsl:if test="/ns0:updateClienteRequest/ns0:aplicacionMovil">
        <ns1:DatosCliente>
          <ns3:AplicacionMovil>
            <xsl:value-of select="/ns0:updateClienteRequest/ns0:aplicacionMovil"/>
          </ns3:AplicacionMovil>
          </ns1:DatosCliente>
          </xsl:if>
        <xsl:choose>
          <xsl:when test="$FuenteDato=0">
            <xsl:variable name="idConsumidor">
              <xsl:value-of select="DVMFunctions:lookupValue ('GestionClientes/Clientes/Resources/DVM/NMPIdConsumidor', 'OSB', $StandardHeader/ns4:headerMessage/ns4:idConsumidor, 'CRM', '0')"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$idConsumidor=0">
                <ns1:FuenteDato>
                  <xsl:value-of select="$StandardHeader/ns4:headerMessage/ns4:idConsumidor"/>
                </ns1:FuenteDato>
              </xsl:when>
              <xsl:otherwise>
                <ns1:FuenteDato>
                  <xsl:value-of select="$idConsumidor"/>
                </ns1:FuenteDato>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <ns1:FuenteDato>
              <xsl:value-of select="$FuenteDato"/>
            </ns1:FuenteDato>
          </xsl:otherwise>
        </xsl:choose>
       

          
            <ns1:IdCliente>
              <xsl:value-of select="/ns0:updateClienteRequest/ns0:idCliente"/>
            </ns1:IdCliente>
            <xsl:if test="/ns0:updateClienteRequest/ns0:CorreosElectronicos">
              <ns1:correo>
                <xsl:for-each select="/ns0:updateClienteRequest/ns0:CorreosElectronicos/ns0:CorreoElectronico">
                  <ns3:Correo>
                    <!--ns3:Origen>
                                    <xsl:value-of select="$StandardHeader/ns4:headerMessage/ns4:idConsumidor"/>
                                </ns3:Origen-->
                    <ns3:TipoCorreo>
                      <xsl:value-of select="DVMFunctions:lookupValue('GestionCatalogos/Comun/Resources/DVMs/TipoCorreos', 'NMP', ns0:tipoEmail, 'CRM', 'No valido' )"/>
                    </ns3:TipoCorreo>
                    <!--xsl:choose>
                                    <xsl:when test="ns0:tipoEmail = &quot;Principal&quot;">
                                        <ns3:TipoCorreo>0</ns3:TipoCorreo>
                                    </xsl:when>
                                    <xsl:when test="ns0:tipoEmail = &quot;Adicional&quot;">
                                        <ns3:TipoCorreo>1</ns3:TipoCorreo>
                                    </xsl:when>
                                    <xsl:when test="ns0:tipoEmail = &quot;RF y DL&quot;">
                                        <ns3:TipoCorreo>4</ns3:TipoCorreo>
                                    </xsl:when>
                                </xsl:choose-->
                    <ns3:correo>
                      <xsl:value-of select="ns0:email"/>
                    </ns3:correo>
                  </ns3:Correo>
                </xsl:for-each>
              </ns1:correo>
            </xsl:if>
            <xsl:if test="/ns0:updateClienteRequest/ns0:Contacto/ns0:ListaDirecciones">
              <ns1:domicilio>
                <xsl:for-each select="/ns0:updateClienteRequest/ns0:Contacto/ns0:ListaDirecciones/ns0:Direccion">
                  <ns3:Domicilio>
                    <xsl:if test="ns0:nombreDelaCalle">
                      <ns3:Calle>
                        <xsl:value-of select="ns0:nombreDelaCalle"/>
                      </ns3:Calle>
                    </xsl:if>
                    <xsl:if test="ns0:codigoPostal">
                      <ns3:CodigoPostal>
                        <xsl:value-of select="ns0:codigoPostal"/>
                      </ns3:CodigoPostal>
                    </xsl:if>
                    <xsl:if test="ns0:idColonia">
                      <ns3:Colonia>
                        <xsl:value-of select="ns0:idColonia"/>
                      </ns3:Colonia>
                    </xsl:if>
                    <xsl:if test="ns0:idDelegacionMunicipio">
                      <ns3:DelegacionMunicipio>
                        <xsl:value-of select="ns0:idDelegacionMunicipio"/>
                      </ns3:DelegacionMunicipio>
                    </xsl:if>
                    <xsl:if test="ns0:entreCalle1">
                      <ns3:EntreCalle1>
                        <xsl:value-of select="ns0:entreCalle1"/>
                      </ns3:EntreCalle1>
                    </xsl:if>
                    <xsl:if test="ns0:entreCalle2">
                      <ns3:EntreCalle2>
                        <xsl:value-of select="ns0:entreCalle2"/>
                      </ns3:EntreCalle2>
                    </xsl:if>
                    <xsl:if test="ns0:idEstado">
                      <ns3:Estado>
                        <xsl:value-of select="ns0:idEstado"/>
                      </ns3:Estado>
                    </xsl:if>
                    <xsl:if test="ns0:numeroExterior">
                      <ns3:NumeroExterior>
                        <xsl:value-of select="ns0:numeroExterior"/>
                      </ns3:NumeroExterior>
                    </xsl:if>
                    <xsl:if test="ns0:numeroInterior">
                      <ns3:NumeroInterior>
                        <xsl:value-of select="ns0:numeroInterior"/>
                      </ns3:NumeroInterior>
                    </xsl:if>
                    <!--ns3:OrigenDato>
                                    <xsl:value-of select="$StandardHeader/ns4:headerMessage/ns4:idConsumidor"/>
                                </ns3:OrigenDato-->
                    <xsl:if test="ns0:tipoDomicilio">
                      <ns3:TipoDomicilio>
                        <xsl:value-of select="ns0:tipoDomicilio"/>
                      </ns3:TipoDomicilio>
                    </xsl:if>
                  </ns3:Domicilio>
                </xsl:for-each>
              </ns1:domicilio>
            </xsl:if>
            <xsl:if test="/ns0:updateClienteRequest/ns0:Contacto/ns0:ListaTelefonos">
              <ns1:telefono>
                <xsl:for-each select="/ns0:updateClienteRequest/ns0:Contacto/ns0:ListaTelefonos/ns0:Telefono">
                  <ns3:Telefono>
                    <xsl:if test="ns0:extension">
                      <ns3:Extension>
                        <xsl:value-of select="ns0:extension"/>
                      </ns3:Extension>
                    </xsl:if>
                    <xsl:if test="ns0:codigoArea">
                      <ns3:Lada>
                        <xsl:value-of select="ns0:codigoArea"/>
                      </ns3:Lada>
                    </xsl:if>
                    <xsl:if test="ns0:numeroTelefonico">
                      <ns3:NumeroTelefono>
                        <xsl:value-of select="ns0:numeroTelefonico"/>
                      </ns3:NumeroTelefono>
                    </xsl:if>
                    <!--ns3:OrigenDato>
                                    <xsl:value-of select="$StandardHeader/ns4:headerMessage/ns4:idConsumidor"/>
                                </ns3:OrigenDato-->
                    <ns3:TipoTelefono>
                      <xsl:value-of select="DVMFunctions:lookupValue ('GestionCatalogos/Comun/Resources/DVMs/TipoTelefono', 'OTROS', ns0:tipoTelefono, 'CRM', '0' )"/>
                    </ns3:TipoTelefono>
                    <!--xsl:choose>
                                    <xsl:when test="ns0:tipoTelefono = &quot;casa&quot;">
                                        <ns3:TipoTelefono>1</ns3:TipoTelefono>
                                    </xsl:when>
                                    <xsl:when test="ns0:tipoTelefono = &quot;oficina&quot;">
                                        <ns3:TipoTelefono>2</ns3:TipoTelefono>
                                    </xsl:when>
                                    <xsl:when test="ns0:tipoTelefono = &quot;celular&quot;">
                                        <ns3:TipoTelefono>3</ns3:TipoTelefono>
                                    </xsl:when>
                                </xsl:choose-->
                  </ns3:Telefono>
                </xsl:for-each>
              </ns1:telefono>
            </xsl:if>

      </tns:request>
    </tns:ActualizaInformacionCliente>
  </xsl:template>
</xsl:stylesheet>