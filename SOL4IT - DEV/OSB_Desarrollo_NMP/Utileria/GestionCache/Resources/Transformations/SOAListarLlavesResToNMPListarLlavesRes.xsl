<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gc="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCache"
    xmlns:soap="http://www.w3.org/2003/05/soap-envelope" version="1.0">
    <xsl:template match="/">
        <soap:Body>
            <gc:listarLlavesResponse>
                <gc:llaves>
                    <xsl:for-each select="gc:listarLlavesResponse/gc:llavesXML">
                        <xsl:copy-of select="./*"/>
                    </xsl:for-each>
                </gc:llaves>
            </gc:listarLlavesResponse>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>