<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/OrdenesTrabajo" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST" xmlns:GestionT="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilRESTTipos" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Persona" xmlns:OrdT="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/OrdenesTrabajo" xmlns:ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun" xmlns:ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Cliente">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/GestionMovilFormiikRestElementosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="FlexibleUpdateWorkOrderRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPSvcOrdenesTrabajoElementosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="autoasignarOrdenRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/OrdenesTrabajo"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [SUN JUL 31 14:02:42 CDT 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:autoasignarOrdenRequest>
         <OrdT:fechaInicial>
              <xsl:value-of select="concat(substring(/ns0:FlexibleUpdateWorkOrderRequest/GestionT:InputFields/GestionT:fecha_ini,7,4), '-', substring(/ns0:FlexibleUpdateWorkOrderRequest/GestionT:InputFields/GestionT:fecha_ini,4,2), '-',substring(/ns0:FlexibleUpdateWorkOrderRequest/GestionT:InputFields/GestionT:fecha_ini,1,2))"/>            
         </OrdT:fechaInicial>
         <OrdT:horaVisita>
            <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:InputFields/GestionT:horarioVisita"/>
         </OrdT:horaVisita>
         <OrdT:idCliente>
            <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:InputFields/GestionT:Num_Cliente"/>
         </OrdT:idCliente>
         <OrdT:tipoActividad>
            <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:InputFields/GestionT:tipoActividad"/>
         </OrdT:tipoActividad>
         <OrdT:DatosTransaccion>
            <OrdT:idExterno>
               <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:ExternalId"/>
            </OrdT:idExterno>
            <OrdT:tipoOrdenTrabajo>
               <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:Action"/>
            </OrdT:tipoOrdenTrabajo>
            <OrdT:tipoSubOrdenTrabajo>
               <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:WorkOrderType"/>
            </OrdT:tipoSubOrdenTrabajo>
            <OrdT:idOrdenTrabajo>
               <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:IdWorkOrder"/>
            </OrdT:idOrdenTrabajo>
            <OrdT:idTipoOrdenTrabajo>
               <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:IdWorkOrderFormType"/>
            </OrdT:idTipoOrdenTrabajo>
            <OrdT:promotorAsignado>
               <xsl:value-of select="/ns0:FlexibleUpdateWorkOrderRequest/GestionT:Username"/>
            </OrdT:promotorAsignado>
         </OrdT:DatosTransaccion>
      </tns:autoasignarOrdenRequest>
   </xsl:template>
</xsl:stylesheet>