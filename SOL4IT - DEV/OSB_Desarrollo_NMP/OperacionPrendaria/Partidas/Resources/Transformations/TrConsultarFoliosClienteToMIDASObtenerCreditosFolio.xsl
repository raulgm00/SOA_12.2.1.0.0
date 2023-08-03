<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:urn="urn:mx.com.nmp.midas"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:ccf="http://servicios.montedepiedad.com.mx/NMP/Schema/ConsultaCreditosFiltros"
    xmlns:nmpp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:nmp="http://nmpconsultacreditos.schema.nmp.servicios.montedepiedad.com.mx"
    xmlns:nmp1="http://nmputil.schema.nmp.servicios.montedepiedad.com.mx" version="1.0"
    exclude-result-prefixes="ccf nmpp soapenv">
    <xsl:param name="filtros"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <urn:obtenerCreditosPorFolios>
            <urn:folios>
                <xsl:for-each
                    select="soapenv:Body/nmpp:consultarPartidasFolioRequest/nmpp:folios/nmpp:folio">
                    <urn:string>
                        <xsl:value-of select="."/>
                    </urn:string>
                </xsl:for-each>
            </urn:folios>
            <!--urn:detalles>
                <xsl:for-each select="soapenv:Body/nmpp:consultarPartidasFolioRequest/nmpp:detalles/nmpp:detalle">
                    <urn:string>
                        <xsl:value-of select="."/>
                    </urn:string>
                </xsl:for-each>                
            </urn:detalles-->
            <urn:detalles>
                <xsl:for-each
                    select="$filtros/ccf:NmpConsultasCat/ccf:nmpFiltrosDetalleCollection/ccf:NmpFiltrosDetalle">
                    <urn:string>
                        <xsl:value-of select="ccf:nombreDetalle"/>
                    </urn:string>
                </xsl:for-each>
            </urn:detalles>            
        </urn:obtenerCreditosPorFolios>
    </xsl:template>
</xsl:stylesheet>