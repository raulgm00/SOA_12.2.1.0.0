<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="faultstring">
        <xsl:param name="beaCode"/>
        <xsl:choose>
            <xsl:when test="$beaCode=382505">Error en los parámetros del mensaje</xsl:when> 
            <xsl:when test="$beaCode=380000">Se ha excedido el tiempo de espera</xsl:when>
            <xsl:when test="$beaCode=380001">Internal Server Error (500)</xsl:when>
            <xsl:when test="$beaCode=380002">Error conectividad 1 -destination unreachable</xsl:when>
            <xsl:when test="$beaCode=382500">SOAP Fault Response. Ha ocurrido un error inesperado</xsl:when>
            <xsl:when test="$beaCode=382502">Error conectividad 2 -not fount (404)</xsl:when>
            <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">Transport Run-Time Errors</xsl:when>
            <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">Message Flow Run-Time Errors</xsl:when>
            <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">Actions Errors</xsl:when>
            <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">Security Errors</xsl:when>
            <xsl:otherwise>Generic Server Fault</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoError">
        <xsl:param name="beaCode"/>
        <xsl:choose>
            <xsl:when test="$beaCode=382505">NMP-008</xsl:when> 
            <xsl:when test="$beaCode=380000">NMP-003</xsl:when>
            <xsl:when test="$beaCode=380001">NMP-005</xsl:when>
            <xsl:when test="$beaCode=380002">NMP-001</xsl:when>
            <xsl:when test="$beaCode=382500">NMP-005</xsl:when>
            <xsl:when test="$beaCode=382502">NMP-002</xsl:when>
            <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">NMP-006</xsl:when>
            <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">NMP-007</xsl:when>
            <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">NMP-008</xsl:when>
            <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">NMP-009</xsl:when>
            <xsl:otherwise>NMP-010</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
     <xsl:template name="tipoError">
        <xsl:param name="beaCode"/>
        <xsl:choose>
           <xsl:when test="$beaCode=382505">Error de Aplicación</xsl:when> 
            <xsl:when test="$beaCode=380000">Error de Aplicación</xsl:when>
            <xsl:when test="$beaCode=380001">Error de Aplicación</xsl:when>
            <xsl:when test="$beaCode=380002">Error de Negocio</xsl:when>
            <xsl:when test="$beaCode=382500">Error de Aplicación</xsl:when>
            <xsl:when test="$beaCode=382502">Error de Aplicación</xsl:when>
            <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">Error de Negocio</xsl:when>
            <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">Error de Negocio</xsl:when>
            <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">Error de Negocio</xsl:when>
            <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">Error de Negocio</xsl:when>
            <xsl:otherwise>Error de Negocio</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="severidad">
        <xsl:param name="beaCode"/>
        <xsl:choose>
            <xsl:when test="$beaCode=382505">2</xsl:when> 
            <xsl:when test="$beaCode=380000">2</xsl:when>
            <xsl:when test="$beaCode=380001">2</xsl:when>
            <xsl:when test="$beaCode=380002">1</xsl:when>
            <xsl:when test="$beaCode=382500">2</xsl:when>
            <xsl:when test="$beaCode=382502">2</xsl:when>
            <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">1</xsl:when>
            <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">1</xsl:when>
            <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">1</xsl:when>
            <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">1</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
    </xsl:template>    
</xsl:stylesheet>