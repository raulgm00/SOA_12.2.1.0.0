<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://nmpcatalogobpm.schema.nmp.servicios.montedepiedad.com.mx"
    xmlns:urn="urn:mx.com.nmp.midas"
    version="1.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">

        <urn:obtenerSubCatalogoBPM>
            <urn:in0>
                <nmp:idProyecto>
                    <xsl:value-of select="getSubCatalogoRequest/idProyecto"/>
                </nmp:idProyecto>
                <nmp:idValorCatalogoPadre>
                    <xsl:value-of select="getSubCatalogoRequest/idCatalogoPadre"/>
                </nmp:idValorCatalogoPadre>
                <nmp:subCatalogo>
                    <xsl:value-of select="getSubCatalogoRequest/nombre"/>
                </nmp:subCatalogo>
            </urn:in0>
        </urn:obtenerSubCatalogoBPM>
        
        
        
    </xsl:template>
        
</xsl:stylesheet>