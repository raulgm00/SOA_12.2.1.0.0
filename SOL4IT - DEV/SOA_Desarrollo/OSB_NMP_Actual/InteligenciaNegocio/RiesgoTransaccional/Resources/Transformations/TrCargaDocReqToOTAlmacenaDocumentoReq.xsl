<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:open="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc"
    xmlns:ries="http://servicios.montepiedad.com.mx/NMP/Schema/RiesgoTransaccional"
    xmlns:rt="http://servicios.montepiedad.com.mx/NMP/Schema/commons/RT"
    exclude-result-prefixes="xs open ries rt"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
    <open:almacenaDocumentoRequest>
        <!--1 or more repetitions:-->
        <xsl:for-each select="//ries:cargaDoc">
        <xsl:variable name="tipoDoc" select="rt:codigoDoc"/>
        <open:documentos>
            <open:proceso>RT</open:proceso>
            <open:documento tipo="{$tipoDoc}">
                <open:nombre><xsl:value-of select="rt:nombreDoc"/></open:nombre>
                <open:contenido><xsl:value-of select="rt:contenidoDoc"/></open:contenido>
                <open:size><xsl:value-of select="rt:tamanoDoc"/></open:size>
            </open:documento>
            <open:BusinessWorkspace parentGroup="Clientes">
                <open:numero><xsl:value-of select="rt:idCliente"/></open:numero>
            </open:BusinessWorkspace>
        </open:documentos>
        </xsl:for-each>
    </open:almacenaDocumentoRequest>
    </xsl:template>
</xsl:stylesheet>