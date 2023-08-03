<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:nmp1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/AppMonte" xmlns:appE="http://servicios.montedepiedad.com.mx/NMP/Servicios/GestionClientes/AppMonte" xmlns:jca="http://www.bea.com/wli/sb/transports/jca" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source/>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../Common/XSD/NMPStandardFault.xsd.xsd"/>
        <oracle-xsl-mapper:rootElement name="Fault" namespace="http://schemas.xmlsoap.org/soap/envelope/"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [WED AUG 17 12:47:18 CDT 2016].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="app"/>
  <xsl:template match="/">
    <!-- Variables -->
    <xsl:variable name="appCode" select="substring-before(ctx:fault/ctx:errorCode,'-')"/>
    <xsl:variable name="beaCode">
      <xsl:choose>
        <xsl:when test="$appCode != 'OSB'">
          <xsl:value-of select="substring-after(ctx:fault/ctx:errorCode,'-')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="number(substring-after(ctx:fault/ctx:errorCode,concat($appCode,'-')))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="faultstring">
      <xsl:choose>
        <xsl:when test="$appCode = 'OSB' ">
          <xsl:choose>
            <xsl:when test="$app =1">
              <xsl:text>XML Error: En la validacion de Schema</xsl:text>
            </xsl:when>
            <xsl:when test="$app =2">
              <xsl:text>DB Error: Ocurrió  un error con la base de datos</xsl:text>
            </xsl:when>
            <xsl:when test="$app =3">
              <xsl:text>SMS Error: Ocurrió  un error con el servicio de mensajería</xsl:text>
            </xsl:when>
            <xsl:when test="$app =4">
              <xsl:text>OSB Error: Error Inesperado</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="faultstring">
            <xsl:with-param name="beaCode" select="$beaCode"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="descripcionError">
      <xsl:choose>
        <xsl:when test="$appCode = 'OSB'">
          <xsl:choose>
            <xsl:when test="contains(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultcode,'operationErroredFault')">
              <xsl:value-of select="substring(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:errorInfo/nmpsm:errorMessage,0,500)"/>
            </xsl:when>
            <!-- CASO 1-->
            <xsl:when test="($beaCode='380001' or $beaCode='380002') and ctx:fault/ctx:reason!='' ">
              <xsl:value-of select="substring(ctx:fault/ctx:reason,1,600)"/>
            </xsl:when>
            <!-- CASO 2 -->
            <xsl:when test="$beaCode='382505' and ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1] ">
              <xsl:value-of select="ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1]"/>
            </xsl:when>
            <!-- CASO 3 -->
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail">
              <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-message"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="descripcionError">
                <xsl:with-param name="beaCode" select="$beaCode"/>
                <xsl:with-param name="fault" select="/ctx:fault"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring(ctx:fault/ctx:details,0,1500)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- END Variables -->
    <!-- Fault -->
    <soap:Fault>
      <faultcode>appE:Fault</faultcode>
      <faultstring>
        <xsl:value-of select="$faultstring"/>
      </faultstring>
      <detail>
        <nmpsm:messageError>
          <nmpsm:codigoError>
            <xsl:call-template name="codigoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </nmpsm:codigoError>
          <nmpsm:descripcionError>
            <xsl:value-of select="$descripcionError"/>
          </nmpsm:descripcionError>
          <nmpsm:tipoError>
            <xsl:call-template name="tipoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </nmpsm:tipoError>
          <nmpsm:severidad>
            <xsl:call-template name="severidad">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </nmpsm:severidad>
        </nmpsm:messageError>
      </detail>
    </soap:Fault>
    <!-- END Fault -->
  </xsl:template>
</xsl:stylesheet>