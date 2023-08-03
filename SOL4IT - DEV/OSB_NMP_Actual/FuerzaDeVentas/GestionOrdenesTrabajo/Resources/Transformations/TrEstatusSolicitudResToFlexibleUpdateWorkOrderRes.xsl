<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction IsUserInRoleFunction DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST" xmlns:GestionT="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilRESTTipos" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../../OperacionCreditos/Creditos/Resources/Schemas/NMPCreditoSvcElementosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="getEstatusSolicitudResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/GestionMovilFormiikRestElementosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="FlexibleUpdateWorkOrderResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 150326.1203.0799) AT [THU MAR 03 17:54:39 CST 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:FlexibleUpdateWorkOrderResponse>
         <GestionT:UpdateFieldsValues>
            <GestionT:Resultado>Operación exitosa</GestionT:Resultado>
            <GestionT:Estatus_Solicitud>
              <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:estatusSolicitud"/>
            </GestionT:Estatus_Solicitud>
            <GestionT:Nombre_Cliente>
               <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:nombreCliente"/>
            </GestionT:Nombre_Cliente>
            <GestionT:Estatus_Solicitudes/>
            <GestionT:Solicitud>
               <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:solicitud"/>
            </GestionT:Solicitud>
            <GestionT:Estatus_Gestion>
               <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:estatusGestion"/>
            </GestionT:Estatus_Gestion>
            <GestionT:Motivo_Pen>
               <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:motivoPen"/>
            </GestionT:Motivo_Pen>
            <GestionT:Fecha_Firma>
               <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:fechaFirma"/>
            </GestionT:Fecha_Firma>
            <GestionT:Monto_Desembolso>
               <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:montoDesembolso"/>
            </GestionT:Monto_Desembolso>
            <GestionT:Saldo_Fecha>
               <xsl:value-of select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes/ns0:saldoFecha"/>
            </GestionT:Saldo_Fecha>
         </GestionT:UpdateFieldsValues>
      </tns:FlexibleUpdateWorkOrderResponse>
   </xsl:template>
</xsl:stylesheet>