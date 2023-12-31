<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:ns0="http://www.montepiedad.com.mx/OXXO/Schemas/PagosEnLinea/ConsultarCliente" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/ConsultarClienteXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="ConsultarClienteRequest" namespace="http://www.montepiedad.com.mx/OXXO/Schemas/PagosEnLinea/ConsultarCliente"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/ConsultarClienteXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="OLS" namespace="http://www.montepiedad.com.mx/OXXO/Schemas/PagosEnLinea/ConsultarCliente"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [TUE JUL 26 12:57:38 GMT-06:00 2016].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="clientId"/>
  <xsl:template match="/">
    <ns0:OLS>
      <ns0:account>12345</ns0:account>
      <ns0:name>
        <xsl:value-of select="$clientId"/>
      </ns0:name>
      <ns0:address>Calle 123</ns0:address>
      <ns0:status>Regular</ns0:status>
      <ns0:reference>Residencial</ns0:reference>
      <ns0:partial>T</ns0:partial>
      <ns0:concepts>
        <ns0:concept>
          <ns0:descripcion>Deuda</ns0:descripcion>
          <ns0:amount>5000</ns0:amount>
          <ns0:operation>+</ns0:operation>
        </ns0:concept>
        <ns0:concept>
          <ns0:descripcion>Descuento</ns0:descripcion>
          <ns0:amount>1000</ns0:amount>
          <ns0:operation>-</ns0:operation>
        </ns0:concept>
        <ns0:concept>
          <ns0:descripcion>Total</ns0:descripcion>
          <ns0:amount>4000</ns0:amount>
          <ns0:operation>t</ns0:operation>
        </ns0:concept>
      </ns0:concepts>
      <ns0:code>00</ns0:code>
      <ns0:message>Cliente Encontrado</ns0:message>
    </ns0:OLS>
  </xsl:template>
</xsl:stylesheet>