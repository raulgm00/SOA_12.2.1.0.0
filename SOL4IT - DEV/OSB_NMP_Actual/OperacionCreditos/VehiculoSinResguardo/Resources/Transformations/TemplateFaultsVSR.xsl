<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" version="1.0">
    <xsl:template name="faultstringNMP">
        <xsl:param name="beaCodeNMP"/>
        <xsl:choose>
            <xsl:when test="$beaCodeNMP=012">Error de Validacion VIN</xsl:when>
			<xsl:when test="$beaCodeNMP=013">Error de Validacion opcion</xsl:when>
            <xsl:otherwise>Generic Server Fault</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoErrorNMP">
        <xsl:param name="beaCodeNMP"/>
        <xsl:choose>
            <xsl:when test="$beaCodeNMP=012">NMP-012</xsl:when>
			<xsl:when test="$beaCodeNMP=013">NMP-013</xsl:when>
            <xsl:otherwise>NMP-011</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
     <xsl:template name="tipoErrorNMP">
        <xsl:param name="beaCodeNMP"/>
        <xsl:choose>
           <xsl:when test="$beaCodeNMP=012">Error de Aplicación</xsl:when>
		   <xsl:when test="$beaCodeNMP=013">Error de Aplicación</xsl:when>
            <xsl:otherwise>Error de Aplicación</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="severidadNMP">
        <xsl:param name="beaCodeNMP"/>
        <xsl:choose>
            <xsl:when test="$beaCodeNMP=012">2</xsl:when>
			<xsl:when test="$beaCodeNMP=013">2</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
</xsl:stylesheet>