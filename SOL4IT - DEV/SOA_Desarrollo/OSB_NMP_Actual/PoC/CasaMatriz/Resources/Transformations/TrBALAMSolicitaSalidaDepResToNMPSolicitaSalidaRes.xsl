<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsl ns0 tns"
    xmlns:ns0="http://www.balammotion.com/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tns="http://www.montepiedad.com.mx/Schemas/CasaMatriz/Automatizacion">
    <xsl:template match="/">
        <tns:solicitarSalidaDepositoResponse>
            <tns:result>
                <xsl:value-of select="/ns0:SolicitudSalidaResponse/ns0:SolicitudSalidaResult"/>
            </tns:result>
        </tns:solicitarSalidaDepositoResponse>
    </xsl:template>
</xsl:stylesheet>