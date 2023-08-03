<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://tempuri.org/" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:ns1="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.DataContract" xmlns:ns2="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity" xmlns:ns3="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.Modelos" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns4="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:NMPCampania="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPClientesSvcElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="validarClienteRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/CRMClienteSvcBajaDisElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="ConfirmaAccesoPortal" namespace="http://tempuri.org/"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU DEC 17 12:55:14 CST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ConfirmaAccesoPortal>
      <tns:requestAcceso>
        <ns1:CorreoElectronicoPortal>
          <xsl:value-of select="/ns0:validarClienteRequest/ns0:email"/>
        </ns1:CorreoElectronicoPortal>
        <ns1:CredencialNMP>
          <xsl:value-of select="/ns0:validarClienteRequest/ns0:numCredencial"/>
        </ns1:CredencialNMP>
      </tns:requestAcceso>
    </tns:ConfirmaAccesoPortal>
  </xsl:template>
</xsl:stylesheet>