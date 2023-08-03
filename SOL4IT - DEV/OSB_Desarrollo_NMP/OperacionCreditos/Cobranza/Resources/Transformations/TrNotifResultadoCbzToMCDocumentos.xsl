<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tem="http://tempuri.org/"
    xmlns:ot="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc"
    xmlns:open="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc" version="1.0" exclude-result-prefixes="ot open">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <tem:Documentos>
            <tem:COB_FOTO_DOMICILIO1>
                <xsl:value-of select="ot:almacenaDocumentoResponse/open:documentos[./open:tipoDocumento='FTD'][1]/open:documentoURL"/>
            </tem:COB_FOTO_DOMICILIO1>
            <tem:COB_FOTO_DOMICILIO2>
                <xsl:value-of select="ot:almacenaDocumentoResponse/open:documentos[./open:tipoDocumento='FTD'][2]/open:documentoURL"/>
            </tem:COB_FOTO_DOMICILIO2>
            <tem:COB_FOTO_COMPROBANTE1>
                <xsl:value-of select="ot:almacenaDocumentoResponse/open:documentos[./open:tipoDocumento='FCO'][1]/open:documentoURL"/>
            </tem:COB_FOTO_COMPROBANTE1>
            <tem:COB_FOTO_COMPROBANTE2>
                <xsl:value-of select="ot:almacenaDocumentoResponse/open:documentos[./open:tipoDocumento='FCO'][2]/open:documentoURL"/>
            </tem:COB_FOTO_COMPROBANTE2>
        </tem:Documentos>
    </xsl:template>
</xsl:stylesheet>