<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:cot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador" xmlns:NMPIniciaASR="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo" xmlns:NMPCred="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito" xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo" xmlns:NMPDoc="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc" xmlns:ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:NMPPers="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPersona" xmlns:ava="http://servicios.montedepiedad.com.mx/NMP/Schema/Avaluo" xmlns:ct="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCommonTypes" xmlns:ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader">
    <oracle-xsl-mapper:schema>
        <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
        <oracle-xsl-mapper:mapSources>
            <oracle-xsl-mapper:source type="XSD">
                <oracle-xsl-mapper:schema location="../Schemas/NMPVehiculosSinResguardoXSD.xsd"/>
                <oracle-xsl-mapper:rootElement name="generarContratoRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo"/>
            </oracle-xsl-mapper:source>
            <oracle-xsl-mapper:source type="XSD">
                <oracle-xsl-mapper:schema location="../../../Creditos/Resources/Schemas/NMPCreditoSvcElementosXSD.xsd"/>
                <oracle-xsl-mapper:rootElement name="generarContratoResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito"/>
                <oracle-xsl-mapper:param name="generarContratoSapResponse"/>
            </oracle-xsl-mapper:source>          
        </oracle-xsl-mapper:mapSources>
        <oracle-xsl-mapper:mapTargets>
            <oracle-xsl-mapper:target type="XSD">
                <oracle-xsl-mapper:schema location="../../../SolicitudesVSR/Resources/Schemas/NMPSolicitudesVSRXSD.xsd"/>
                <oracle-xsl-mapper:rootElement name="actualizarSolicitudRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR"/>
            </oracle-xsl-mapper:target>
        </oracle-xsl-mapper:mapTargets>
        <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [WED APR 26 11:14:10 EDT 2017].-->
    </oracle-xsl-mapper:schema>
    <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
    <xsl:param name="generarContratoSapResponse"/>
    <xsl:param name="usuario"/>
    <xsl:template match="/">
        <tns:actualizarSolicitudRequest>
            <tns:NmpSolicitudesClientesInfo>
                <tns:numCliente>
                    <xsl:value-of select="/ns0:generarContratoRequest/NMPCred:idCliente"/>
                </tns:numCliente>
                <tns:folioTramite>
                    <xsl:value-of select="/ns0:generarContratoRequest/NMPCred:folio"/>
                </tns:folioTramite>
                <tns:idContrato>
                    <xsl:value-of select="$generarContratoSapResponse//NMPCred:idContrato"/>
                </tns:idContrato>
                <tns:fechaActualizacion>
                    <xsl:value-of select="xp20:current-dateTime ( )"/>
                </tns:fechaActualizacion>
                <tns:nmpFormasPagoCollection>
                    <tns:NmpFormasPago>
                        <cot:plazo>
                            <xsl:value-of select="/ns0:generarContratoRequest/NMPCred:datosContrato/NMPCred:plazo"/>
                        </cot:plazo>
                        <cot:montoCredito>
                            <xsl:value-of select="/ns0:generarContratoRequest/NMPCred:datosContrato/NMPCred:montoSolicitado"/>
                        </cot:montoCredito>
                        <cot:pagoMensual>
                            <xsl:value-of select="/ns0:generarContratoRequest/NMPCred:datosContrato/NMPCred:pagoMensual"/>
                        </cot:pagoMensual>
                        <cot:tasa>
                            <xsl:value-of select="/ns0:generarContratoRequest/NMPCred:datosContrato/NMPCred:tasaInteres"/>
                        </cot:tasa>
                        <cot:creadoPor>
                            <xsl:value-of select="$usuario"/>
                        </cot:creadoPor>
                        <cot:fechaCreacion>
                            <xsl:value-of select="xp20:current-dateTime ( )"/>
                        </cot:fechaCreacion>
                        <cot:actualizadoPor>
                            <xsl:value-of select="$usuario"/>
                        </cot:actualizadoPor>
                        <cot:fechaActualizacion>
                            <xsl:value-of select="xp20:current-dateTime ( )"/>
                        </cot:fechaActualizacion>
                        <cot:estadoFormaPago>ACEPTADA</cot:estadoFormaPago>
                    </tns:NmpFormasPago>
                </tns:nmpFormasPagoCollection>
            </tns:NmpSolicitudesClientesInfo>
        </tns:actualizarSolicitudRequest>
    </xsl:template>
</xsl:stylesheet>