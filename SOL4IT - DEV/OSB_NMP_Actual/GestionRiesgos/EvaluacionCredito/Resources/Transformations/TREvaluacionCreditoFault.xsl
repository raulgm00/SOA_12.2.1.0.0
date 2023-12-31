<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:nmpm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:ctx1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Service/NMPCredito">
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
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [TUE MAR 14 20:17:56 CST 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <soap:Fault>
      <xsl:variable name="beaCode" select="number(substring-after (ctx:fault/ctx:errorCode, &quot;OSB-&quot; ))"/>
      <xsl:variable name="fault" select="ctx:fault"/>
      <soap:faultcode>
        <xsl:value-of select="nmp:evaluacionCreditoFault"/>
      </soap:faultcode>
      <soap:faultstring>
        <xsl:call-template name="faultstring">
          <xsl:with-param name="beaCode" select="$beaCode"/>
        </xsl:call-template>
      </soap:faultstring>
      <soap:detail>
        <nmpm:messageError>
          <nmpm:codigoError>
            <xsl:call-template name="codigoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </nmpm:codigoError>
          <nmpm:descripcionError>
            <xsl:call-template name="descripcionError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
              <xsl:with-param name="fault" select="$fault"/>
            </xsl:call-template>
          </nmpm:descripcionError>
          <nmpm:tipoError>
            <xsl:call-template name="tipoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </nmpm:tipoError>
          <nmpm:severidad>
            <xsl:call-template name="severidad">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </nmpm:severidad>
        </nmpm:messageError>
      </soap:detail>
    </soap:Fault>
  </xsl:template>
</xsl:stylesheet>