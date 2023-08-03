<xsl:stylesheet version="1.0" exclude-result-prefixes="xsl ns0 tns"
    xmlns:tns="http://www.balammotion.com/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns0="http://www.montepiedad.com.mx/Schemas/CasaMatriz/Automatizacion">
    <xsl:template match="/">
        <tns:SolicitudSalida>
            <tns:Contrato>
                <xsl:value-of select="/ns0:solicitarSalidaDepositoRequest/ns0:numeroContrato"/>
            </tns:Contrato>
            <tns:numEntregaConsolidada>
                <xsl:value-of select="/ns0:solicitarSalidaDepositoRequest/ns0:entregaConsolidada"/>
            </tns:numEntregaConsolidada>
        </tns:SolicitudSalida>
    </xsl:template>
</xsl:stylesheet>