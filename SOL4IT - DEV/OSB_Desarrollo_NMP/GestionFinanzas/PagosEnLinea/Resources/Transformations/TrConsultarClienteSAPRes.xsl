<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:tns="http://www.montepiedad.com.mx/OXXO/Schemas/PagosEnLinea/ConsultarCliente" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="urn:sap-com:document:sap:soap:functions:mc-style" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy" xmlns:n1="urn:sap-com:document:sap:rfc:functions" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/WS_OXXO_SAP_CONSULTA.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ZlmRfcConsultaOxxoResponse" namespace="urn:sap-com:document:sap:soap:functions:mc-style"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/ConsultarClienteXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="OLS" namespace="http://www.montepiedad.com.mx/OXXO/Schemas/PagosEnLinea/ConsultarCliente"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU AUG 11 18:26:23 CDT 2016].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:OLS version="1.0">
      <tns:account>
        <xsl:value-of select="/ns0:ZlmRfcConsultaOxxoResponse/Referencia"/>
      </tns:account>
      <tns:name>
        <xsl:value-of select="/ns0:ZlmRfcConsultaOxxoResponse/NombreCliente"/>
      </tns:name>
      <tns:address/>
      <tns:status/>
      <tns:reference/>
      <tns:partial>
        <xsl:value-of select="/ns0:ZlmRfcConsultaOxxoResponse/Parcial"/>
      </tns:partial>
      <tns:concepts>
        <xsl:for-each select="/ns0:ZlmRfcConsultaOxxoResponse/Conceptos/item">
          <tns:concept>
            <tns:description>
              <xsl:value-of select="Leyenda"/>
            </tns:description>
            <tns:amount>
              <xsl:value-of select="Monto"/>
            </tns:amount>
            <tns:operation>
              <xsl:value-of select="Operacion"/>
            </tns:operation>
          </tns:concept>
        </xsl:for-each>
      </tns:concepts>
      <tns:code>
        <xsl:value-of select="substring (/ns0:ZlmRfcConsultaOxxoResponse/CodRetorno, 2, 3 )"/>
      </tns:code>
      <tns:message>
        <xsl:value-of select="/ns0:ZlmRfcConsultaOxxoResponse/DescripcionCod"/>
      </tns:message>
      <!--tns:message>
        <xsl:value-of select="/ns0:ZlmRfcConsultaOxxoResponse/Retorno/item[Number=/ns0:ZlmRfcConsultaOxxoResponse/CodRetorno]/Message"/>
      </tns:message-->
      <!--xsl:choose>
            <xsl:when test="count (/ns0:ZlmRfcConsultaOxxoResponse/Retorno/item ) = 1">
               <tns:message>
                  <xsl:value-of select="/ns0:ZlmRfcConsultaOxxoResponse/Retorno/item/Message"/>
               </tns:message>
            </xsl:when>
         </xsl:choose>
         <xsl:choose>
            <xsl:when test="count (/ns0:ZlmRfcConsultaOxxoResponse/Retorno/item ) = 2">
               <tns:message>
                  <xsl:value-of select="/ns0:ZlmRfcConsultaOxxoResponse/Retorno/item[2]/Message"/>
               </tns:message>
            </xsl:when>
         </xsl:choose-->
    </tns:OLS>
  </xsl:template>
</xsl:stylesheet>