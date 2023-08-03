<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:uap="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPago"
    xmlns:urn = "urn:mx.com.nmp.midas"
    xmlns:dto = "http://dto.model.midas.nmp.com.mx"
    exclude-result-prefixes="xsl urn dto">    
    <xsl:template match="/">
        <uap:NmpAdminPagosBitTCollection>  
            <xsl:for-each select="urn:obtenerInformacionPartidaResponse/urn:return/dto:detalleOperacionOnline/dto:DetalleOperacionOnline">
                <uap:NmpAdminPagosBitT>
                    <uap:numContrato>
                        <xsl:value-of select="/urn:obtenerInformacionPartidaResponse/urn:return/dto:folio"/>
                    </uap:numContrato>
                    <uap:hrConsultaContrato>
                        <xsl:value-of select="current-dateTime()"/></uap:hrConsultaContrato>
                    <uap:tipoOperacion>
                        <xsl:value-of select="dto:idOperacion"></xsl:value-of>
                    </uap:tipoOperacion>
                    <uap:importe>
                        <xsl:value-of select="dto:montoMaximo"></xsl:value-of>
                    </uap:importe>
                    <uap:numTransaccion>
                        <xsl:value-of select="/urn:obtenerInformacionPartidaResponse/urn:return/dto:transaccion"></xsl:value-of>
                    </uap:numTransaccion>
                    <uap:operacion>getPartidaCliente</uap:operacion>
                </uap:NmpAdminPagosBitT>
            </xsl:for-each>            
        </uap:NmpAdminPagosBitTCollection>
    </xsl:template>
</xsl:stylesheet>