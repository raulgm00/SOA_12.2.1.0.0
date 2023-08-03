<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="urn:sap-com:document:sap:soap:functions:mc-style" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizacion" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy" xmlns:n1="urn:sap-com:document:sap:rfc:functions" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:NPMsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/commons/AutoSinResguardo" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:Asrcon="http://servicios.montedepiedad.com.mx/NMP/Schema/Contrato" xmlns:NMPAsr="http://servicios.montedepiedad.com.mx/NMP/Services/AutoSinResguardo">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDL/ZLM_WS_COTIZACION.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ZlmRfcCotizacionResponse" namespace="urn:sap-com:document:sap:soap:functions:mc-style"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDL/GetCotizacionContratoWSDL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CotizacionResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizacion"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [WED JUL 13 13:10:06 CDT 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:CotizacionResponse>
         <tns:Cotizacion>
            <tns:Sociedad>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/Sociedad"/>
            </tns:Sociedad>
            <tns:Producto>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/Producto"/>
            </tns:Producto>
            <tns:MontoSolicitado>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/MontoSolicitado"/>
            </tns:MontoSolicitado>
            <tns:Frecuencia>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/Frecuencia"/>
            </tns:Frecuencia>
            <tns:Plazo>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/Plazo"/>
            </tns:Plazo>
            <tns:TasaInteres>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/TasaInteres"/>
            </tns:TasaInteres>
            <tns:FechaDesembolso>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/FechaDesembolso"/>
            </tns:FechaDesembolso>
            <tns:FechaPrimerCobro>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/FechaPrimerCobro"/>
            </tns:FechaPrimerCobro>
            <tns:MultMoratorio>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/MultMoratorio"/>
            </tns:MultMoratorio>
            <tns:Origen>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/Origen"/>
            </tns:Origen>
            <tns:Destino>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/Destino"/>
            </tns:Destino>
            <tns:TipoDePago>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/TipoDePago"/>
            </tns:TipoDePago>
             <tns:DiasGracia>
               <xsl:value-of select="/ns0:ZlmRfcCotizacionResponse/DatosContrato/DiasGracia"/>
            </tns:DiasGracia>
         </tns:Cotizacion>
         <tns:TablaAmort>
         <xsl:for-each select="/ns0:ZlmRfcCotizacionResponse/TablaAmort/item">
            <tns:tabla>
               <tns:Nopago>
                     <xsl:value-of select="Nopago"/>
                  </tns:Nopago>
               <tns:Fecha>
                     <xsl:value-of select="Fecha"/>
                  </tns:Fecha>
               <tns:Capitalinit>
                     <xsl:value-of select="Capitalinit"/>
                  </tns:Capitalinit>
               <tns:Interes>
                     <xsl:value-of select="Interes"/>
                  </tns:Interes>
               <tns:Iva>
                     <xsl:value-of select="Iva"/>
                  </tns:Iva>
               <tns:Abonocapital>
                     <xsl:value-of select="Abonocapital"/>
                  </tns:Abonocapital>
               <tns:Abonototal>
                     <xsl:value-of select="Abonototal"/>
                  </tns:Abonototal>
               <tns:Capitalfinal>
                     <xsl:value-of select="Capitalfinal"/>
                  </tns:Capitalfinal>
               <tns:Saldopagare>
                     <xsl:value-of select="Saldopagare"/>
                  </tns:Saldopagare>
            </tns:tabla>
            </xsl:for-each>
         </tns:TablaAmort>
      </tns:CotizacionResponse>
   </xsl:template>
</xsl:stylesheet>