<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sol="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR"
    xmlns:open="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="doctosActualizar"/>  
    <xsl:variable name="Documentos">
        <sol:nmpDocumentosSolicitudInfoCollection>
            <xsl:copy-of select="$doctosActualizar/*"/>
            <xsl:copy-of select="/sol:nmpDocumentosSolicitudInfoCollection/*"/>
        </sol:nmpDocumentosSolicitudInfoCollection>
    </xsl:variable>
    <xsl:template match="/">
        <sol:nmpDocumentosSolicitudInfoCollection>
            <xsl:for-each-group
                select="$Documentos/sol:nmpDocumentosSolicitudInfoCollection/sol:NmpDocumentosSolicitudInfo"
                group-by="open:nombreDocumento">
                <xsl:copy-of select="."/>
            </xsl:for-each-group>
            <!--xsl:copy-of select="$Documentos/sol:nmpDocumentosSolicitudInfoCollection/sol:NmpDocumentosSolicitudInfo"/-->
        </sol:nmpDocumentosSolicitudInfoCollection>
    </xsl:template>
</xsl:stylesheet>