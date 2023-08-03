<xsl:stylesheet version="1.0" exclude-result-prefixes="xsl ns0 tns NMPFile"  
   xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos"
   xmlns:tns="http://servicios.montedepiedad.com.mx/NMP/Schema/SendEmail"  
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:NMPFile="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPFileType">
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
            <xsl:for-each select="/ns0:obtenerComprobantesResponse/ns0:comprobantesList/NMPFile:file">
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