<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns1="urn:mx.com.nmp.midas"
    xmlns:ns2="http://nmpcatalogobpm.schema.nmp.servicios.montedepiedad.com.mx" exclude-result-prefixes="ns1 ns2"
    version="1.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/"> 
        <getSubCatalogoResponse>
            <descripcion>
                <xsl:value-of select="/ns1:obtenerSubCatalogoBPMResponse/ns1:out/ns2:descripcion"/>
            </descripcion>
            <id>
                <xsl:value-of select="/ns1:obtenerSubCatalogoBPMResponse/ns1:out/ns2:id"/>
            </id>
            <idCatalogoPadre>
                <xsl:value-of select="/ns1:obtenerSubCatalogoBPMResponse/ns1:out/ns2:idCatalogoPadre"/>
            </idCatalogoPadre>
            <nombre>
                <xsl:value-of select="/ns1:obtenerSubCatalogoBPMResponse/ns1:out/ns2:nombre"/>
            </nombre>
            <nombreCatalogoPadre>
                <xsl:value-of select="/ns1:obtenerSubCatalogoBPMResponse/ns1:out/ns2:nombreCatalogoPadre"/>
            </nombreCatalogoPadre>
            
            <subCatalogo>
                <xsl:for-each select="/ns1:obtenerSubCatalogoBPMResponse/ns1:out/ns2:valorCatalogoBPM/ns2:ValorCatalogoBPM">
                <elementoCatalogo>
                    <descripcion>
                        <xsl:value-of select="ns2:descripcion"/>                        
                    </descripcion>
                    <id>
                        <xsl:value-of select="ns2:id"/>
                    </id>
                    <valor>
                        <xsl:value-of select="ns2:valor"/>
                    </valor>
                </elementoCatalogo>
                
            </xsl:for-each>
            </subCatalogo>
                
        </getSubCatalogoResponse>
    </xsl:template>
</xsl:stylesheet>