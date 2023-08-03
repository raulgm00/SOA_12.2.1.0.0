<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:ns0="http://tempuri.org/" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPNotificacionesSMS" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns2="http://schemas.datacontract.org/2004/07/EntityLayer.Respuesta" xmlns:ns1="http://schemas.datacontract.org/2004/07/EntityLayer">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/CRMCodigosSms0XSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="ValidaCodigoResponse" namespace="http://tempuri.org/"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPNotificacionesSMSXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="validarCodigoSMSResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPNotificacionesSMS"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU FEB 23 13:35:46 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:validarCodigoSMSResponse>
         <xsl:if test="/ns0:ValidaCodigoResponse/ns0:ValidaCodigoResult/ns2:Codigo">
            <tns:codigo>
               <xsl:value-of select="/ns0:ValidaCodigoResponse/ns0:ValidaCodigoResult/ns2:Codigo"/>
            </tns:codigo>
         </xsl:if>
         <xsl:if test="/ns0:ValidaCodigoResponse/ns0:ValidaCodigoResult/ns2:Mensaje">
            <tns:mensaje>
               <xsl:value-of select="/ns0:ValidaCodigoResponse/ns0:ValidaCodigoResult/ns2:Mensaje"/>
            </tns:mensaje>
         </xsl:if>
      </tns:validarCodigoSMSResponse>
   </xsl:template>
</xsl:stylesheet>