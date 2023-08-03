<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdminPagosSvc" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/SendEmail" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:NMPFile="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPFileType" xmlns:NMPOperacionPago="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago" xmlns:NMPPartidaSaldos="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidaSaldos" xmlns:con="http://www.bea.com/wli/sb/context">
  
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="remitente"/>
   <xsl:param name="destinatario"/>
   <xsl:param name="titulo"/>
   <xsl:param name="contenido"/>
   <xsl:template match="/">
      <tns:Email>
         <tns:to>
            <xsl:value-of select="$destinatario"/>
         </tns:to>
         <tns:from>
            <xsl:value-of select="$remitente"/>
         </tns:from>
         <tns:subject>
            <xsl:value-of select="$titulo"/>
         </tns:subject>
         <tns:content>
            <xsl:value-of select="$contenido"/>
         </tns:content>
         <tns:attachments>
            <xsl:for-each select="/ns0:getComprobantesResponse/ns0:comprobantesList/NMPFile:file">
               <tns:attachment>
                  <xsl:choose>
                     <xsl:when test="NMPFile:idOperacion = 148">
                        <tns:filename>ComprobanteDesempenoEnLinea.pdf</tns:filename>
                     </xsl:when>
                      <xsl:when test="NMPFile:idOperacion = 8">
                        <tns:filename>ComprobanteRefrendoEnLinea.pdf</tns:filename>
                     </xsl:when>
                      <xsl:when test="NMPFile:idOperacion = 116">
                        <tns:filename>ComprobanteAbonoEnLinea.pdf</tns:filename>
                     </xsl:when>
                  </xsl:choose>
                  <tns:contents>
                     <xsl:value-of select="NMPFile:archivo"/>
                  </tns:contents>
               </tns:attachment>
            </xsl:for-each>
         </tns:attachments>
      </tns:Email>
   </xsl:template>
</xsl:stylesheet>