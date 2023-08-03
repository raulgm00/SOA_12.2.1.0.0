<?xml version="1.0" encoding="UTF-8"?>
<!--Template donde se enlistan los errores que devuelve Midas y su correspondiente codigo estandar del Bus-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">    
    <xsl:template name="CodigoMidas">
        <xsl:param name="beaCode"/>
        <xsl:choose>
            <xsl:when test="$beaCode='WS006'">NMP-011</xsl:when> 
            <xsl:when test="$beaCode='WS011'">NMP-003</xsl:when>
            <xsl:when test="$beaCode='WS012'">NMP-015</xsl:when>
            <xsl:when test="$beaCode='WS007'">NMP-005</xsl:when>
            <xsl:when test="$beaCode='WS004'">NMP-001</xsl:when>
            <xsl:when test="$beaCode='EM006'">NMP-005</xsl:when>
            <xsl:otherwise>NMP-010</xsl:otherwise>
        </xsl:choose>
    </xsl:template>   
</xsl:stylesheet>