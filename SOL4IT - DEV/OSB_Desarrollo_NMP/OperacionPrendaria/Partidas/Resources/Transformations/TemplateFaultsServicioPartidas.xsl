<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
       
    <xsl:template name="faultstringNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='100'">Error controlado</xsl:when>            
            <xsl:when test="$errorCode='101'">No hay filtros definidos para el consumidor indicado</xsl:when>
            <xsl:when test="$errorCode='102'">No existen creditos activos para el cliente</xsl:when>
            <xsl:when test="$errorCode='103'">No existen creditos proximos a vencer para el cliente</xsl:when>
            <xsl:when test="$errorCode='104'">No existen creditos vencidos para el cliente</xsl:when>
            <xsl:when test="$errorCode='105'">No existe el folio</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoErrorNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='100'">NMP-2001</xsl:when>
            <xsl:when test="$errorCode='101'">NMP-2001</xsl:when>  
            <xsl:when test="$errorCode='102'">NMP-2001</xsl:when>  
            <xsl:when test="$errorCode='103'">NMP-2001</xsl:when>
            <xsl:when test="$errorCode='104'">NMP-2001</xsl:when>  
            <xsl:when test="$errorCode='105'">NMP-2001</xsl:when> 
        </xsl:choose>
    </xsl:template>
     <xsl:template name="tipoErrorNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose> 
            <xsl:when test="$errorCode='100'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='101'">Error de Negocio</xsl:when> 
            <xsl:when test="$errorCode='102'">Error de Negocio</xsl:when>   
            <xsl:when test="$errorCode='103'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='104'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='105'">Error de Negocio</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="severidadNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose>  
            <xsl:when test="$errorCode='100'">2</xsl:when>  
            <xsl:when test="$errorCode='101'">2</xsl:when> 
            <xsl:when test="$errorCode='102'">2</xsl:when> 
            <xsl:when test="$errorCode='103'">2</xsl:when> 
            <xsl:when test="$errorCode='104'">2</xsl:when> 
            <xsl:when test="$errorCode='105'">2</xsl:when> 
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoErrorAnterior">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='NMP-104'">NMP-2001</xsl:when>
            <xsl:when test="$errorCode='NMP-103'">NMP-2001</xsl:when>
        </xsl:choose>
    </xsl:template>     
</xsl:stylesheet>