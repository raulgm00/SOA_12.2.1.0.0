<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:tns="http://www.montepiedad.com.mx/NMP/Prestamo/Autos" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns0="http://www.montepiedad.com.mx/Schemas/Autos/" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://www.montepiedad.com.mx/Services/WSDL/AutosSinResguardo" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:client="http://xmlns.oracle.com/NMPComposites/CalcularPrestamo/BPELCalcularPrestamo">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/AutosSinResguardo.wsdl"/>
            <oracle-xsl-mapper:rootElement name="calcularPrestamoRequest" namespace="http://www.montepiedad.com.mx/Schemas/Autos/"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/AutosSinResguardoBPEL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="calcularPrestamoRequest" namespace="http://www.montepiedad.com.mx/NMP/Prestamo/Autos"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [TUE JUL 19 13:05:08 GMT-06:00 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:calcularPrestamoRequest>
         <tns:calificacion>
            <xsl:value-of select="/ns0:calcularPrestamoRequest/ns0:calificacion"/>
         </tns:calificacion>
         <tns:avaluo>
            <xsl:value-of select="/ns0:calcularPrestamoRequest/ns0:avaluo"/>
         </tns:avaluo>
         <tns:sobreAforo>
            <xsl:value-of select="/ns0:calcularPrestamoRequest/ns0:sobreAforo"/>
         </tns:sobreAforo>
      </tns:calcularPrestamoRequest>
   </xsl:template>
</xsl:stylesheet>