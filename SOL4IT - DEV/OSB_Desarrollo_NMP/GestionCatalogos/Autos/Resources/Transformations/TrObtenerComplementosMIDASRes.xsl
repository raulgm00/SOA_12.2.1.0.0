<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:tns="http://servicios.montepiedad.com.mx/NMP/Schema/CatalogoAutos" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="urn:mx.com.nmp.midas" xmlns:ns3="http://nmpcotizadorautomovil.services.nmp.servicios.montedepiedad.com.mx" xmlns:soapenc11="http://schemas.xmlsoap.org/soap/encoding/" xmlns:ns1="http://nmpcotizadorautomovil.schema.nmp.servicios.montedepiedad.com.mx" xmlns:soap11="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soapenc12="http://www.w3.org/2003/05/soap-encoding" xmlns:wsdlsoap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns2="http://nmpstandardmessage.schema.nmp.servicios.montedepiedad.com.mx" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope" xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/MIDASCatalogoAutosWSDL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="obtenerComplementosResponse" namespace="urn:mx.com.nmp.midas"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPCatalogoAutosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="obtenerComplementosResponse" namespace="http://servicios.montepiedad.com.mx/NMP/Schema/CatalogoAutos"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [WED FEB 22 18:19:23 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:obtenerComplementosResponse>
         <xsl:for-each select="/ns0:obtenerComplementosResponse/ns0:cotizadorAutomovilResponseType/ns1:catalogoCotizadorAutomovil/ns1:ValorCatalogoCotizador">
            <veh:complemento>
               <veh:id>
                  <xsl:value-of select="ns1:id"/>
               </veh:id>
               <veh:descripcion>
                  <xsl:value-of select="ns1:descripcion"/>
               </veh:descripcion>
               <veh:valor>
                  <xsl:value-of select="ns1:valor"/>
               </veh:valor>
               <veh:avaluo>
                  <xsl:value-of select="/ns0:obtenerComplementosResponse/ns0:cotizadorAutomovilResponseType/ns1:avaluo"/>
               </veh:avaluo>
            </veh:complemento>
         </xsl:for-each>
      </tns:obtenerComplementosResponse>
   </xsl:template>
</xsl:stylesheet>