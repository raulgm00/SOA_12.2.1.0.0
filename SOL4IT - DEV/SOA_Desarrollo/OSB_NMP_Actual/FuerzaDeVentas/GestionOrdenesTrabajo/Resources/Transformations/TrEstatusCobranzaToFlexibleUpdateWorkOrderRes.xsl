<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/CobranzaConsultas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST" xmlns:CbzT="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/CobranzaConsultas" xmlns:GestionT="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilRESTTipos">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../OperacionCreditos/Cobranza/Resources/Schemas/NMPSvcCobranzaConsultasElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="consultarEstatusCobranzaResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/CobranzaConsultas"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/GestionMovilFormiikRestElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="FlexibleUpdateWorkOrderResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU AUG 04 10:43:03 CDT 2016].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:FlexibleUpdateWorkOrderResponse>
      <GestionT:UpdateFieldsValues>
        <GestionT:Resultado>Operacion existosa</GestionT:Resultado>
        <GestionT:Nombre_Cliente>
          <xsl:value-of select="/ns0:consultarEstatusCobranzaResponse/CbzT:EstatusCobranza/CbzT:nombreCliente"/>
        </GestionT:Nombre_Cliente>
        <GestionT:Num_Cliente>
          <xsl:value-of select="/ns0:consultarEstatusCobranzaResponse/CbzT:EstatusCobranza/CbzT:idCliente"/>
        </GestionT:Num_Cliente>
        <GestionT:Num_Contrato>
          <xsl:value-of select="/ns0:consultarEstatusCobranzaResponse/CbzT:EstatusCobranza/CbzT:contrato"/>
        </GestionT:Num_Contrato>
        <GestionT:Gestion_Visita>
          <xsl:value-of select="/ns0:consultarEstatusCobranzaResponse/CbzT:EstatusCobranza/CbzT:gestionVisita"/>
        </GestionT:Gestion_Visita>
        <GestionT:Resultado_Visita>
          <xsl:value-of select="/ns0:consultarEstatusCobranzaResponse/CbzT:EstatusCobranza/CbzT:resultadoVisita"/>
        </GestionT:Resultado_Visita>
        <GestionT:Fecha_PromesaPago>
          <xsl:value-of select="/ns0:consultarEstatusCobranzaResponse/CbzT:EstatusCobranza/CbzT:fechaPromesaPago"/>
        </GestionT:Fecha_PromesaPago>
        <GestionT:Monto_PromesaPago>
          <xsl:value-of select="/ns0:consultarEstatusCobranzaResponse/CbzT:EstatusCobranza/CbzT:montoPromesaPago"/>
        </GestionT:Monto_PromesaPago>
      </GestionT:UpdateFieldsValues>
    </tns:FlexibleUpdateWorkOrderResponse>
  </xsl:template>
</xsl:stylesheet>