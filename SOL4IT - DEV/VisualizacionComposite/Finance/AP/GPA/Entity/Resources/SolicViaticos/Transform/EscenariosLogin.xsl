<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:tns="http://service.gpa.mx.com.qualitas/" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source/>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/SolicitudViaticosSvcXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="consultarActivasResponse" namespace="http://service.gpa.mx.com.qualitas/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [WED APR 05 10:35:46 CDT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="loginUser"/>
   <xsl:template match="/">
   <xsl:if test="$loginUser='nherrera'">
      <tns:consultarActivasResponse>
         <return>
            <resultado>
               <satisfactorio>1</satisfactorio>
            </resultado>
            <solicitud>
               <id>GPA021704208</id>
            </solicitud>
         </return>
      </tns:consultarActivasResponse>
  </xsl:if>
  <xsl:if test="$loginUser='weblogic'">
      <tns:consultarActivasResponse>
         <return>
            <resultado>
               <satisfactorio>2</satisfactorio>
            </resultado>
            <solicitud>
               <id>GPA021703613</id>
            </solicitud>
         </return>
      </tns:consultarActivasResponse>
      </xsl:if>
    <xsl:if test="$loginUser='nreyes'">
      <tns:consultarActivasResponse>
         <return>
            <resultado>
               <satisfactorio>3</satisfactorio>
            </resultado>
            <solicitud>
               <id>GPA021704210</id>
            </solicitud>
         </return>
      </tns:consultarActivasResponse>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>