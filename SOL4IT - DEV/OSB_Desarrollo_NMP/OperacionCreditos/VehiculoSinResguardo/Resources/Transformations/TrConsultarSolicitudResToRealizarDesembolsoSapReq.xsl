<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:cot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador" xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo" xmlns:doc="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:ct="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCommonTypes" xmlns:ava="http://servicios.montedepiedad.com.mx/NMP/Schema/Avaluo" xmlns:NMPIniciaASR="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo" xmlns:ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../SolicitudesVSR/Resources/Schemas/NMPSolicitudesVSRXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="consultarSolicitudResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../Creditos/Resources/Schemas/NMPCreditoSvcElementosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="realizarDesembolsoRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU APR 27 22:22:32 EDT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:realizarDesembolsoRequest>
         <tns:sociedad>01</tns:sociedad>
         <tns:contrato>
            <xsl:value-of select="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:idContrato"/>
         </tns:contrato>
         <xsl:choose>
             <xsl:when test="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:tipoPago">
                <tns:viaDePago>
                   <xsl:value-of select="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:tipoPago"/>
                </tns:viaDePago>
             </xsl:when>
             <xsl:otherwise>
               <tns:viaDePago>O</tns:viaDePago>
             </xsl:otherwise>
         </xsl:choose>
         <tns:banco>BANAR</tns:banco>
          <xsl:choose>
           <xsl:when test="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:tipoPago = 'T'">
             <xsl:if test="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:clabe">
                <tns:clabe>
                   <xsl:value-of select="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:clabe"/>
                </tns:clabe>
             </xsl:if>
             <xsl:if test="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:numCuenta">
                <tns:cuenta>
                   <xsl:value-of select="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:numCuenta"/>
                </tns:cuenta>
             </xsl:if>
             <xsl:if test="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:numSucursal">
                <tns:sucursal>
                   <xsl:value-of select="/ns0:consultarSolicitudResponse/ns0:NmpSolicitudesClientesInfo/ns0:numSucursal"/>
                </tns:sucursal>
             </xsl:if>
             </xsl:when>
             <xsl:otherwise>
                 <tns:clabe/>
                 <tns:cuenta/>
                <tns:sucursal/>
             </xsl:otherwise>
            </xsl:choose>
         <tns:fecha>
            <!--xsl:value-of select="xp20:current-date ( )"/-->
			<xsl:value-of select="2017-07-13"/>
         </tns:fecha>
      </tns:realizarDesembolsoRequest>
   </xsl:template>
</xsl:stylesheet>