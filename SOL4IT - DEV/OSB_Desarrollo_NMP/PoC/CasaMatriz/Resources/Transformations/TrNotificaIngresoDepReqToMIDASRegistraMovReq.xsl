<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://www.montepiedad.com.mx/Schemas/CasaMatriz/Automatizacion" xmlns:tns="urn:mx.com.nmp.midas" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:NPMsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:ns1="http://www.montepiedad.com.mx/Services/CasaMatriz/Automatizacion" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soapenc11="http://schemas.xmlsoap.org/soap/encoding/" xmlns:soap11="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soapenc12="http://www.w3.org/2003/05/soap-encoding" xmlns:ns2="http://nmpstandardmessage.schema.nmp.servicios.montedepiedad.com.mx" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope" xmlns:ns3="http://nmpstandardresponse.schema.nmp.servicios.montepiedad.com.mx" xmlns:NPMsh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/NMPAutomatizacionCMAPIWSDL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="notificarIngresoDepositoRequest" namespace="http://www.montepiedad.com.mx/Schemas/CasaMatriz/Automatizacion"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/MIDASRegistroMovPrendarioWSDL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="registrarIngresoADeposito" namespace="urn:mx.com.nmp.midas"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [TUE JUL 12 11:31:59 CDT 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:registrarIngresoADeposito>
         <tns:folio>
            <xsl:value-of select="/ns0:notificarIngresoDepositoRequest/ns0:folio"/>
         </tns:folio>
      </tns:registrarIngresoADeposito>
   </xsl:template>
</xsl:stylesheet>