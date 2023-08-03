<xsl:stylesheet version="1.0" exclude-result-prefixes=" ns0 xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction ns0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:NMPCot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador" xmlns:NMPDoc="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc" xmlns:NMPVeh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo" xmlns:NMPComun="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:NMPsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:NMPPers="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPersona" xmlns:NMPCred="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPFlujoVehiculosSinResguardoSvcXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="iniciarFlujoVehiculoSinResguardoResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPVehiculosSinResguardoXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="generarSolicitudResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [TUE MAR 07 14:59:13 EST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="newFolio"/>
   <xsl:template match="/">
      <tns:generarSolicitudResponse>
         <ns0:folio>
            <xsl:value-of select="$newFolio"/>
         </ns0:folio>
      </tns:generarSolicitudResponse>
   </xsl:template>
</xsl:stylesheet>