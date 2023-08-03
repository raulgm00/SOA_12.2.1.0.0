<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza" version="1.0"
    exclude-result-prefixes="ges">
    <xsl:output indent="yes" method="xml" />
    <xsl:template match="/">
        <table border="1">
            <tr>
                <td>documento</td>
                <td>link</td>
            </tr>
            <xsl:for-each select="ges:fotos/ges:foto">
                <tr>
                    <td>

                        <xsl:value-of select="ges:nombre"/>
                    </td>
                    <td>
                        <a><xsl:attribute name="href">
                                <xsl:value-of select="ges:url/text()"/>
                            </xsl:attribute><xsl:value-of select="ges:nombre"/></a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>