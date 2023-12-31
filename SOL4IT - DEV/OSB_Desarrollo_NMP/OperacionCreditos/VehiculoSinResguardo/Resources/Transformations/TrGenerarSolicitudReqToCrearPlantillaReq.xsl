<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:cot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador" xmlns:NMPIniciaASR="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo" xmlns:NMPCred="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito" xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo" xmlns:ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:NMPPers="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPersona" xmlns:adt="http://servicios.montedepiedad.com.mx/NMP/Schema/AdminDoctosTipos">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPVehiculosSinResguardoXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="generarSolicitudRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../../Utileria/AdminDocumentos/Resources/Schemas/NMPAdministraDocumentosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="crearPlantillaRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU APR 20 19:13:45 EDT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="newFolio"/>
   <xsl:template match="/">
      <tns:crearPlantillaRequest>
         <tns:proceso>VSR</tns:proceso>
         <tns:BusinessWorkspace parentGroup="ClientesConin">
            <tns:numero>
               <xsl:value-of select="/ns0:generarSolicitudRequest/NMPIniciaASR:cliente/NMPIniciaASR:numeroCliente"/>
            </tns:numero>
         </tns:BusinessWorkspace>
         <tns:plantilla>
            <tns:nombre>plantillaVSR</tns:nombre>
            <tns:contenedor tipo="folioVSR">
               <xsl:value-of select="$newFolio"/>
            </tns:contenedor>
         </tns:plantilla>
      </tns:crearPlantillaRequest>
   </xsl:template>
</xsl:stylesheet>