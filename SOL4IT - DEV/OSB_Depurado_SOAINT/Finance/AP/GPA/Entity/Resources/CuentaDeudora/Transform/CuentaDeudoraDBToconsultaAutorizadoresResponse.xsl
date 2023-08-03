<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:tns="http://service.gpa.mx.com.qualitas/" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/CuentasDeudorasDB" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../../Data/BusinessSvc/CuentaDeudoraData/Resources/CuentasDeudorasDB_table.xsd"/>
            <oracle-xsl-mapper:rootElement name="Gpa018CdeudorasCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/CuentasDeudorasDB"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../CuentaDeudoraSvcXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="consultarAutorizadoresResponse" namespace="http://service.gpa.mx.com.qualitas/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU APR 13 02:27:18 CDT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:consultarAutorizadoresResponse>
         <response>
            <xsl:for-each select="/ns0:Gpa018CdeudorasCollection/ns0:Gpa018Cdeudoras">
               <autorizador login="{ns0:userLogin}" numero="{ns0:idCedudoras}">
                  <email>
                     <xsl:value-of select="concat (ns0:userLogin, &quot;@qualitas.com.mx&quot; )"/>
                  </email>
                  <nombre>
                     <xsl:value-of select="ns0:descDeudoras"/>
                  </nombre>
               </autorizador>
            </xsl:for-each>
         </response>
      </tns:consultarAutorizadoresResponse>
   </xsl:template>
</xsl:stylesheet>