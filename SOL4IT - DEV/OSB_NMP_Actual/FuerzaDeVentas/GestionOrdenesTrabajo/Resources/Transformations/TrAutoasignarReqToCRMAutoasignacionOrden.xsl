<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://tempuri.org/" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:OrdT="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/OrdenesTrabajo" xmlns:ns1="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.DataContract" xmlns:ns2="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity" xmlns:ns3="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.Modelos" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns4="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Persona" xmlns:ns5="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:ns6="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Cliente" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/OrdenesTrabajo">
    <oracle-xsl-mapper:schema>
        <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
        <oracle-xsl-mapper:mapSources>
            <oracle-xsl-mapper:source type="XSD">
                <oracle-xsl-mapper:schema location="../Schemas/NMPSvcOrdenesTrabajoElementosXSD.xsd"/>
                <oracle-xsl-mapper:rootElement name="autoasignarOrdenRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/OrdenesTrabajo"/>
            </oracle-xsl-mapper:source>
        </oracle-xsl-mapper:mapSources>
        <oracle-xsl-mapper:mapTargets>
            <oracle-xsl-mapper:target type="XSD">
                <oracle-xsl-mapper:schema location="../Schemas/CRMGestionesElementosXSD.xsd"/>
                <oracle-xsl-mapper:rootElement name="AutoAsignacionOrden" namespace="http://tempuri.org/"/>
            </oracle-xsl-mapper:target>
        </oracle-xsl-mapper:mapTargets>
        <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [WED NOV 25 17:39:07 CST 2015].-->
    </oracle-xsl-mapper:schema>
    <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
    <xsl:template match="/">
        <tns:AutoAsignacionOrden>
            <tns:request>
                <xsl:if test="/OrdT:autoasignarOrdenRequest/ns0:fechaInicial">
                    <ns1:FechaIni>
                        <xsl:value-of select="/OrdT:autoasignarOrdenRequest/ns0:fechaInicial"/>
                    </ns1:FechaIni>
                </xsl:if>
                <xsl:if test="/OrdT:autoasignarOrdenRequest/ns0:horaVisita">
                    <ns1:HoraVisita>
                        <xsl:value-of select="/OrdT:autoasignarOrdenRequest/ns0:horaVisita"/>
                    </ns1:HoraVisita>
                </xsl:if>
                <xsl:if test="/OrdT:autoasignarOrdenRequest/ns0:idCliente">
                    <ns1:IdCliente>
                        <xsl:value-of select="/OrdT:autoasignarOrdenRequest/ns0:idCliente"/>
                    </ns1:IdCliente>
                </xsl:if>
                <xsl:if test="/OrdT:autoasignarOrdenRequest/ns0:DatosTransaccion/ns0:idTipoOrdenTrabajo">
                    <ns1:IdWorkerformType>
                        <xsl:value-of select="/OrdT:autoasignarOrdenRequest/ns0:DatosTransaccion/ns0:idTipoOrdenTrabajo"/>
                    </ns1:IdWorkerformType>
                </xsl:if>
                <xsl:if test="/OrdT:autoasignarOrdenRequest/ns0:DatosTransaccion/ns0:idOrdenTrabajo">
                    <ns1:IdWorkorder>
                        <xsl:value-of select="/OrdT:autoasignarOrdenRequest/ns0:DatosTransaccion/ns0:idOrdenTrabajo"/>
                    </ns1:IdWorkorder>
                </xsl:if>
                <xsl:if test="/OrdT:autoasignarOrdenRequest/ns0:tipoActividad">
                    <ns1:TipoActividad>
                        <xsl:value-of select="/OrdT:autoasignarOrdenRequest/ns0:tipoActividad"/>
                    </ns1:TipoActividad>
                </xsl:if>
                <!--ns1:UserName>
                    <xsl:value-of select="concat('nmp\',/OrdT:autoasignarOrdenRequest/ns0:DatosTransaccion/ns0:promotorAsignado)"/>
                </ns1:UserName-->
                <ns1:Usuario>
                    <xsl:value-of select="concat('nmp\',/OrdT:autoasignarOrdenRequest/ns0:DatosTransaccion/ns0:promotorAsignado)"/>
                </ns1:Usuario>
            </tns:request>
        </tns:AutoAsignacionOrden>
    </xsl:template>
</xsl:stylesheet>