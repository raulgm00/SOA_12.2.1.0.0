<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ries="http://servicios.montepiedad.com.mx/NMP/Schema/RiesgoTransaccional"
    xmlns:rt="http://servicios.montepiedad.com.mx/NMP/Schema/commons/RT"
    xmlns:open="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc"
    xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
    exclude-result-prefixes="xs ries rt open oraext"
    version="2.0">
    <xsl:output indent="yes"/>
    <!--<xsl:param name="url" /> -->
    <xsl:template match="/">
        <nmp:NmpDocumentosClientesCollection xmlns:nmp="http://xmlns.oracle.com/pcbpel/adapter/db/top/NmpDocumentosClientesDb">
            <xsl:for-each select="//ries:cargaDoc">
            <!--Zero or more repetitions:-->
            <nmp:NmpDocumentosClientes>
                <nmp:id><xsl:value-of select="oraext:sequence-next-val ('NMP_SEQ_DOC_CLIENTES','jdbc/rtuser')"/></nmp:id>
                <!--Optional:-->
                <nmp:idCliente><xsl:value-of select="rt:idCliente"/></nmp:idCliente>
                <!--Optional:-->
                <nmp:codigoDoc><xsl:value-of select="rt:codigoDoc"/></nmp:codigoDoc>
                <!--Optional:-->
                <nmp:autor><xsl:value-of select="rt:loginUsuario"/></nmp:autor>
                <!--Optional:-->
                <nmp:nombre><xsl:value-of select="rt:nombreDoc"/></nmp:nombre>
                <!--Optional:-->
                <nmp:url><xsl:value-of select="open:documentoURL/text()"/></nmp:url>
                   <!-- <xsl:value-of select="$url"/> -->
                <!--Optional:-->
                <nmp:fechaCarga><xsl:value-of select="rt:fechaCarga"/></nmp:fechaCarga>
            </nmp:NmpDocumentosClientes>
            </xsl:for-each>
        </nmp:NmpDocumentosClientesCollection>
    </xsl:template>
</xsl:stylesheet>