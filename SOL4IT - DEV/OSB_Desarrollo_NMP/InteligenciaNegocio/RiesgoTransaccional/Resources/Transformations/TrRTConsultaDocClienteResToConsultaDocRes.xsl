<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rt="http://servicios.montepiedad.com.mx/NMP/Schema/commons/RT"
    xmlns:ries="http://servicios.montepiedad.com.mx/NMP/Schema/RiesgoTransaccional"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/top/NmpDocumentosClientesDb"
    exclude-result-prefixes="xs rt ries xsi db"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <ries:consultDocResponse >
            <xsl:for-each select="//db:NmpDocumentosClientes">
        <ries:infoDoc>
            <rt:idCliente><xsl:value-of select="db:idCliente"/></rt:idCliente>
            <rt:loginUsuario><xsl:value-of select="db:autor"/></rt:loginUsuario>
            <rt:fechaCarga><xsl:value-of select="db:fechaCarga"/></rt:fechaCarga>
            <rt:codigoDoc><xsl:value-of select="db:codigoDoc"/></rt:codigoDoc>
            <rt:nombreDoc><xsl:value-of select="db:nombre"/></rt:nombreDoc>
            <rt:urlDoc><xsl:value-of select="db:url"/></rt:urlDoc>
        </ries:infoDoc>
         </xsl:for-each>
        </ries:consultDocResponse>
    </xsl:template>
</xsl:stylesheet>