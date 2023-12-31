<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 ns1 UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:ns0="http://xmlns.oracle.com/bpel/services/IdentityService" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPIdentidades" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:isc="http://www.oracle.com/pcbpel/identityservice/isconfig" xmlns:tns="http://services.oracle.com/bpel/services/IdentityService">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/IdentidadesXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="roleObjects" namespace="http://xmlns.oracle.com/bpel/services/IdentityService"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPGestionIdentidades.xsd"/>
            <oracle-xsl-mapper:rootElement name="ObtenerRolesAutorizadosRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPIdentidades"/>
            <oracle-xsl-mapper:param name="obtenerRolesRequest"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPGestionIdentidades.xsd"/>
            <oracle-xsl-mapper:rootElement name="ObtenerRolesAutorizadosResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPIdentidades"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [WED APR 12 18:39:34 CDT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="obtenerRolesRequest"/>
<xsl:variable name="aplicacion" select="$obtenerRolesRequest/ns1:nombreAplicacion"/>
<xsl:variable name="nombreAplicacion" select="concat('OU=',$aplicacion)"/>
   <xsl:template match="/">
      <ns1:ObtenerRolesAutorizadosResponse>
         <ns1:roles>
            <xsl:for-each select="/ns0:roleObjects/ns0:groupObject[contains (ns0:uniqueName,$nombreAplicacion )]">
               <ns1:rol>
                  <ns1:nombre>
                     <xsl:value-of select="ns0:name"/>
                  </ns1:nombre>
                  <ns1:descripcion>
<xsl:value-of select="ns0:description"/>
                  </ns1:descripcion>
               </ns1:rol>
            </xsl:for-each>
         </ns1:roles>
      </ns1:ObtenerRolesAutorizadosResponse>
   </xsl:template>
</xsl:stylesheet>