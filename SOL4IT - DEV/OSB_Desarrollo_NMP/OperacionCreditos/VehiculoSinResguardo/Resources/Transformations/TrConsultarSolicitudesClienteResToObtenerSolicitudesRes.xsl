<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo" xmlns:doc="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc" xmlns:ct="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCommonTypes" xmlns:ava="http://servicios.montedepiedad.com.mx/NMP/Schema/Avaluo" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:cot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador" xmlns:NMPIniciaASR="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo" xmlns:ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:NMPPers="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPersona" xmlns:NMPCred="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito" xmlns:ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/FlujoVehiculosSinResguardo/Catalogos">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../SolicitudesVSR/Resources/Schemas/NMPSolicitudesVSRXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="consultarEstadoSolicitudResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPCatalogoFlujoVSRXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="obtenerMotivosRechazoResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/FlujoVehiculosSinResguardo/Catalogos"/>
        <oracle-xsl-mapper:param name="motivosRechazo"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPCatalogoFlujoVSRXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="obtenerEtapasFlujoResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/FlujoVehiculosSinResguardo/Catalogos"/>
        <oracle-xsl-mapper:param name="etapasFlujo"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPCatalogoFlujoVSRXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="obtenerEstadosSolicitudResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/FlujoVehiculosSinResguardo/Catalogos"/>
        <oracle-xsl-mapper:param name="estadoSolicitud"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPVehiculosSinResguardoXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="obtenerSolicitudesResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [MON MAR 06 18:25:03 EST 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="motivosRechazo"/>
  <xsl:param name="etapasFlujo"/>
  <xsl:param name="estadoSolicitud"/>
  <xsl:template match="/">
    <tns:obtenerSolicitudesResponse>
      <tns:solicitudes>
        <xsl:for-each select="/ns0:consultarEstadoSolicitudResponse/ns0:solicitud">
          <tns:solicitud>
            <xsl:if test="ns0:numCliente != ''">
              <NMPIniciaASR:numeroCliente>
                <xsl:value-of select="ns0:numCliente"/>
              </NMPIniciaASR:numeroCliente>
            </xsl:if>
            <xsl:if test="ns0:folioTramite != ''">
              <NMPIniciaASR:folio>
                <xsl:value-of select="ns0:folioTramite"/>
              </NMPIniciaASR:folio>
            </xsl:if>
            <tns:estadoSolicitudId>
              <xsl:value-of select="ns0:estadoSolicitud"/>
            </tns:estadoSolicitudId>
            <xsl:if test="ns0:estadoSolicitud != ''">
              <tns:estadoSolicitud>
                <xsl:variable name="estado" select="string(ns0:estadoSolicitud)"/>
                <xsl:value-of select="$estadoSolicitud//ns3:estadoSolicitud[ns3:id = $estado]//ns3:descripcion"/>
              </tns:estadoSolicitud>
            </xsl:if>
            <tns:estadoFlujoBpmId>
              <xsl:value-of select="ns0:estadoFlujo"/>
            </tns:estadoFlujoBpmId>
            <xsl:if test="ns0:estadoFlujo != ''">
              <tns:estadoFlujoBpm>
                <xsl:variable name="estadoBpm" select="string(ns0:estadoFlujo)"/>
                <xsl:value-of select="$etapasFlujo//ns3:etapasFlujo[ns3:id = $estadoBpm]//ns3:descripcion"/>
              </tns:estadoFlujoBpm>
            </xsl:if>
            <xsl:if test="ns0:idMotivoRechazo != ''">
              <tns:motivoRechazo>
                <xsl:variable name="motivoRechazo" select="string(ns0:idMotivoRechazo)"/>
                <xsl:value-of select="$motivosRechazo//ns3:motivoRechazo[ns3:id = $motivoRechazo]//ns3:descripcion"/>
              </tns:motivoRechazo>
            </xsl:if>
            <xsl:if test="ns0:fechaCreacion != ''">
              <tns:fechaSolicitud>
                <xsl:value-of select="ns0:fechaCreacion"/>
              </tns:fechaSolicitud>
            </xsl:if>
          </tns:solicitud>
        </xsl:for-each>
      </tns:solicitudes>
    </tns:obtenerSolicitudesResponse>
  </xsl:template>
</xsl:stylesheet>