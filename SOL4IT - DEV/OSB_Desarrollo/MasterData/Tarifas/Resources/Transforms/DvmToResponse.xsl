<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:tns="http://master.mx.com.qualitas/"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:a="http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source/>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../TarifasViaticosSvcXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="consultarResponse" namespace="http://master.mx.com.qualitas/"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [MON MAR 27 15:47:07 CST 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:variable name="myArray">
    <item>HOS</item>
    <item>ALI</item>
    <item>GEN</item>
    <item>KM</item>
  </xsl:variable>
  <xsl:variable name="documentoArray" select="document('')/*/xsl:variable[@name='myArray']/*"/>
  <xsl:template match="/">
    <tns:consultarResponse>
      <response>
        <xsl:for-each select="$documentoArray">
          <xsl:variable name="data" select="."/>
          <!--xsl:variable name="codeDetail" select='DVMFunctions:lookupValue1M ("MasterData/Tarifas/Resources/DVMs/TarifaViaticos","Codigo",$data,("Codigo","Nombre","Descripcion","Valor","Activa"))'/-->
          <xsl:variable name="Activas">
                <xsl:value-of select='DVMFunctions:lookupValue ("MasterData/Tarifas/Resources/DVMs/TarifaViaticos","Codigo",$data,"Activa","false")'/>
          </xsl:variable>
          <xsl:if test="$Activas='true'">
            <categoriaTarifa>
              <codigo>
                <!--xsl:value-of select="$data"/-->
                <!--xsl:value-of select="$codeDetail/Codigo"/-->
                <xsl:value-of select='DVMFunctions:lookupValue ("MasterData/Tarifas/Resources/DVMs/TarifaViaticos","Codigo",$data,"Codigo","NA")'/>
              </codigo>
              <nombre>
                <!--xsl:value-of select="$codeDetail/Nombre"/-->
                <xsl:value-of select='DVMFunctions:lookupValue ("MasterData/Tarifas/Resources/DVMs/TarifaViaticos","Codigo",$data,"Nombre","NA")'/>
              </nombre>
              <descripcion>
                <!--xsl:value-of select="$codeDetail/Descripcion"/-->
                <xsl:value-of select='DVMFunctions:lookupValue ("MasterData/Tarifas/Resources/DVMs/TarifaViaticos","Codigo",$data,"Descripcion","NA")'/>
              </descripcion>
              <tarifa>
                <!--xsl:value-of select="$codeDetail/Valor"/-->
                <xsl:value-of select='DVMFunctions:lookupValue ("MasterData/Tarifas/Resources/DVMs/TarifaViaticos","Codigo",$data,"Valor","NA")'/>
              </tarifa>
            </categoriaTarifa>
          </xsl:if>
        </xsl:for-each>
      </response>
    </tns:consultarResponse>
  </xsl:template>
</xsl:stylesheet>