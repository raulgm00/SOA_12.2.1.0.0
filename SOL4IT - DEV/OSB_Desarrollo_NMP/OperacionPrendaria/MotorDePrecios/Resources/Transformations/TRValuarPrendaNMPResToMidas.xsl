<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/MotordePrecios/Elementos" xmlns:ns0="http://nmp.com.mx/ms/sivad/valuacion/ws/diamantes/datatypes/" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://nmp.com.mx/ms/sivad/valuacion/ws/diamantes/" xmlns:t="http://servicios.montedepiedad.com.mx/NMP/Schema/MotordePrecios/Tipos">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/SIVAValuadorDiamantesServiceWSDL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="valuarPrendaNMPResponse" namespace="http://nmp.com.mx/ms/sivad/valuacion/ws/diamantes/datatypes/"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NMPMotordePreciosElementosXSD.xsd"/>
            <oracle-xsl-mapper:rootElement name="valuarPrendaNMPResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/MotordePrecios/Elementos"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [FRI JAN 20 17:03:45 EST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:valuarPrendaNMPResponse>
         <tns:prendaValuada>
            <t:id>
               <xsl:if test="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:id/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:id/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:id"/>
            </t:id>
            <t:ramo>
               <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:ramo"/>
            </t:ramo>
            <t:subramo>
               <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:subramo"/>
            </t:subramo>
            <t:tipo>
               <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:tipo"/>
            </t:tipo>
            <t:avaluo>
               <xsl:if test="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:avaluo/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:avaluo/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <t:valorMinimo>
                  <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:avaluo/ns0:valorMinimo"/>
               </t:valorMinimo>
               <t:valorPromedio>
                  <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:avaluo/ns0:valorPromedio"/>
               </t:valorPromedio>
               <t:valorMaximo>
                  <xsl:value-of select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:avaluo/ns0:valorMaximo"/>
               </t:valorMaximo>
            </t:avaluo>
            <xsl:for-each select="/ns0:valuarPrendaNMPResponse/ns0:prendaValuada/ns0:pieza">
               <t:pieza>
                  <t:id>
                     <xsl:value-of select="ns0:id"/>
                  </t:id>
                  <t:cantidad>
                     <xsl:value-of select="ns0:cantidad"/>
                  </t:cantidad>
                  <t:avaluo>
                     <t:valorMinimo>
                        <xsl:value-of select="ns0:avaluo/ns0:valorMinimo"/>
                     </t:valorMinimo>
                     <t:valorPromedio>
                        <xsl:value-of select="ns0:avaluo/ns0:valorPromedio"/>
                     </t:valorPromedio>
                     <t:valorMaximo>
                        <xsl:value-of select="ns0:avaluo/ns0:valorMaximo"/>
                     </t:valorMaximo>
                  </t:avaluo>
                  <xsl:if test="ns0:diamante">
                     <t:diamante>
                        <t:corte>
                           <xsl:value-of select="ns0:diamante/ns0:corte"/>
                        </t:corte>
                        <t:forma>
                           <xsl:value-of select="ns0:diamante/ns0:forma"/>
                        </t:forma>
                        <t:color>
                           <xsl:value-of select="ns0:diamante/ns0:color"/>
                        </t:color>
                        <t:claridad>
                           <xsl:value-of select="ns0:diamante/ns0:claridad"/>
                        </t:claridad>
                        <t:quilataje>
                           <xsl:value-of select="ns0:diamante/ns0:quilataje"/>
                        </t:quilataje>
                        <t:certificado>
                           <xsl:if test="ns0:diamante/ns0:certificado/@xsi:nil">
                              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                 <xsl:value-of select="ns0:diamante/ns0:certificado/@xsi:nil"/>
                              </xsl:attribute>
                           </xsl:if>
                           <xsl:value-of select="ns0:diamante/ns0:certificado"/>
                        </t:certificado>
                        <t:valorExperto>
                           <xsl:if test="ns0:diamante/ns0:valorExperto/ns0:unitario">
                              <t:unitario>
                                 <xsl:value-of select="ns0:diamante/ns0:valorExperto/ns0:unitario"/>
                              </t:unitario>
                           </xsl:if>
                           <xsl:if test="ns0:diamante/ns0:valorExperto/ns0:total">
                              <t:total>
                                 <xsl:value-of select="ns0:diamante/ns0:valorExperto/ns0:total"/>
                              </t:total>
                           </xsl:if>
                        </t:valorExperto>
                     </t:diamante>
                  </xsl:if>
                  <xsl:if test="ns0:alhaja">
                     <t:alhaja>
                        <t:tipo>
                           <xsl:value-of select="ns0:alhaja/ns0:tipo"/>
                        </t:tipo>
                        <t:forma>
                           <xsl:value-of select="ns0:alhaja/ns0:forma"/>
                        </t:forma>
                        <t:metal>
                           <xsl:value-of select="ns0:alhaja/ns0:metal"/>
                        </t:metal>
                        <t:color>
                           <xsl:if test="ns0:alhaja/ns0:color/@xsi:nil">
                              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                 <xsl:value-of select="ns0:alhaja/ns0:color/@xsi:nil"/>
                              </xsl:attribute>
                           </xsl:if>
                           <xsl:value-of select="ns0:alhaja/ns0:color"/>
                        </t:color>
                        <t:rango>
                           <xsl:if test="ns0:alhaja/ns0:rango/@xsi:nil">
                              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                 <xsl:value-of select="ns0:alhaja/ns0:rango/@xsi:nil"/>
                              </xsl:attribute>
                           </xsl:if>
                           <xsl:value-of select="ns0:alhaja/ns0:rango"/>
                        </t:rango>
                        <t:calidad>
                           <xsl:if test="ns0:alhaja/ns0:calidad/@xsi:nil">
                              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                 <xsl:value-of select="ns0:alhaja/ns0:calidad/@xsi:nil"/>
                              </xsl:attribute>
                           </xsl:if>
                           <xsl:value-of select="ns0:alhaja/ns0:calidad"/>
                        </t:calidad>
                        <t:peso>
                           <xsl:value-of select="ns0:alhaja/ns0:peso"/>
                        </t:peso>
                        <t:condicion>
                           <xsl:value-of select="ns0:alhaja/ns0:condicion"/>
                        </t:condicion>
                        <t:valorExperto>
                           <xsl:if test="ns0:alhaja/ns0:valorExperto/ns0:unitario">
                              <t:unitario>
                                 <xsl:value-of select="ns0:alhaja/ns0:valorExperto/ns0:unitario"/>
                              </t:unitario>
                           </xsl:if>
                           <xsl:if test="ns0:alhaja/ns0:valorExperto/ns0:total">
                              <t:total>
                                 <xsl:value-of select="ns0:alhaja/ns0:valorExperto/ns0:total"/>
                              </t:total>
                           </xsl:if>
                        </t:valorExperto>
                        <t:incremento>
                           <xsl:value-of select="ns0:alhaja/ns0:incremento"/>
                        </t:incremento>
                        <t:desplazamiento>
                           <xsl:value-of select="ns0:alhaja/ns0:desplazamiento"/>
                        </t:desplazamiento>
                     </t:alhaja>
                  </xsl:if>
                  <xsl:if test="ns0:complemento">
                     <t:complemento>
                        <t:tipo>
                           <xsl:value-of select="ns0:complemento/ns0:tipo"/>
                        </t:tipo>
                        <t:peso>
                           <xsl:value-of select="ns0:complemento/ns0:peso"/>
                        </t:peso>
                        <t:valorExperto>
                           <xsl:if test="ns0:complemento/ns0:valorExperto/ns0:unitario">
                              <t:unitario>
                                 <xsl:value-of select="ns0:complemento/ns0:valorExperto/ns0:unitario"/>
                              </t:unitario>
                           </xsl:if>
                           <xsl:if test="ns0:complemento/ns0:valorExperto/ns0:total">
                              <t:total>
                                 <xsl:value-of select="ns0:complemento/ns0:valorExperto/ns0:total"/>
                              </t:total>
                           </xsl:if>
                        </t:valorExperto>
                     </t:complemento>
                  </xsl:if>
               </t:pieza>
            </xsl:for-each>
         </tns:prendaValuada>
      </tns:valuarPrendaNMPResponse>
   </xsl:template>
</xsl:stylesheet>