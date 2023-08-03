<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza" version="2.0"
    exclude-result-prefixes="ges xp20">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <Coleccion>
            <xsl:for-each select="ges:revocarGestionRequest/ges:gestion/ges:orden">
                <CancelOrder>
                    <xsl:attribute name="id">
                        <xsl:value-of select="ges:idExternal"/>
                    </xsl:attribute>
                    <xsl:attribute name="userName">
                        <xsl:value-of select="ges:gestor"/>
                    </xsl:attribute>
                </CancelOrder>
            </xsl:for-each>            
        </Coleccion>
    </xsl:template>
</xsl:stylesheet>