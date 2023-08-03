<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/OrdenesTrabajo" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns0="http://tempuri.org/" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:ns1="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.DataContract" xmlns:ns2="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity" xmlns:ns3="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.Modelos" xmlns:OrdT="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/OrdenesTrabajo" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns4="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Persona" xmlns:ns5="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:ns6="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Cliente">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/CRMGestionesElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="ConsultaAgendaResponse" namespace="http://tempuri.org/"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
         <oracle-xsl-mapper:schema location="../Schemas/NMPSvcOrdenesTrabajoElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="consultarAgendaPromotorResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/OrdenesTrabajo"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SUN DEC 06 18:33:53 CST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:consultarAgendaPromotorResponse>
      <OrdT:Ordenes>
        <xsl:for-each select="/ns0:ConsultaAgendaResponse/ns0:ConsultaAgendaResult/ns1:DetalleRespuesta/ns3:Orden">
          <OrdT:Orden>
            <OrdT:Cliente>
              <OrdT:idCliente>
                <xsl:value-of select="ns3:Cliente/ns3:IdCliente"/>
              </OrdT:idCliente>
              <OrdT:nombreCliente>
                <xsl:value-of select="ns3:Cliente/ns3:NombreCliente"/>
              </OrdT:nombreCliente>
            </OrdT:Cliente>
            <OrdT:fechaInicio>
              <xsl:value-of select="ns3:ScheduledStart"/>
            </OrdT:fechaInicio>
            <OrdT:fechaFin>
              <xsl:value-of select="ns3:ScheduledEnd"/>
            </OrdT:fechaFin>
          </OrdT:Orden>
        </xsl:for-each>
      </OrdT:Ordenes>
    </tns:consultarAgendaPromotorResponse>
  </xsl:template>
</xsl:stylesheet>