<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ap="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos"
    xmlns:op="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago"
    xmlns:util="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos"
    xmlns:nmph="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader"
    xmlns:urn = "urn:mx.com.nmp.midas"
    xmlns:dto = "http://dto.model.midas.nmp.com.mx"
    exclude-result-prefixes="xsl urn dto">    
    <xsl:param name="header"></xsl:param>
    <xsl:param name="operacionAutorizada"></xsl:param>
    <xsl:template match="/">
        <util:registrarTransaccionPagoRequest >
            <util:NmpTransaccionPago>
                <util:transaccionBancaria>
                    <xsl:value-of select="/ap:registrarOperacionPagoRequest/ap:operacion/op:transaccionBancaria"></xsl:value-of>
                </util:transaccionBancaria>
                <util:folio_partida>
                    <xsl:value-of select="/ap:registrarOperacionPagoRequest/ap:operacion/op:folio"></xsl:value-of>
                </util:folio_partida>
                <util:operacionServicio>registrarTransaccionPago</util:operacionServicio>
                <util:numTransaccion>
                    <xsl:value-of select="/ap:registrarOperacionPagoRequest/ap:operacion/op:transaccion"></xsl:value-of>
                </util:numTransaccion>
                <util:importeTotal>
                    <xsl:value-of select="/ap:registrarOperacionPagoRequest/ap:operacion/op:importe"></xsl:value-of>
                </util:importeTotal>                
                <util:numAutorizacion>
                    <xsl:value-of select="/ap:registrarOperacionPagoRequest/ap:operacion/op:autorizacion"></xsl:value-of>
                </util:numAutorizacion>
                <xsl:choose>
                    <xsl:when test="$operacionAutorizada/ap:code='0'">
                        <util:operacionAutorizada>Si</util:operacionAutorizada>
                    </xsl:when>
                    <xsl:otherwise>
                        <util:operacionAutorizada>No</util:operacionAutorizada>
                    </xsl:otherwise>
                </xsl:choose>                
                <util:numTarjeta></util:numTarjeta>
                <util:estadoTransaccion>0</util:estadoTransaccion>
                <util:numReintentos>0</util:numReintentos>
                <util:correoElectronico>
                    <xsl:value-of select="/ap:registrarOperacionPagoRequest/ap:operacion/op:correoElectronico"></xsl:value-of>
                </util:correoElectronico>
                <util:creadoPor>
                    <xsl:value-of select="$header/nmph:headerMessage/nmph:idConsumidor"></xsl:value-of>
                </util:creadoPor>
                <util:fechaCreacion>
                    <xsl:value-of select="current-dateTime()"></xsl:value-of>
                </util:fechaCreacion>
                <util:actualizadoPor>
                    <xsl:value-of select="$header/nmph:headerMessage/nmph:idConsumidor"></xsl:value-of>
                </util:actualizadoPor>
                <util:fechaActualizacion>
                    <xsl:value-of select="current-dateTime()"></xsl:value-of>
                </util:fechaActualizacion>
            </util:NmpTransaccionPago>
        </util:registrarTransaccionPagoRequest>
    </xsl:template>
</xsl:stylesheet>