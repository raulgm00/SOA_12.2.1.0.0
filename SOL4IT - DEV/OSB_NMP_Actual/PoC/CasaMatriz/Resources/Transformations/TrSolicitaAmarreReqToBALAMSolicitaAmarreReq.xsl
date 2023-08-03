<xsl:stylesheet version="1.0" exclude-result-prefixes="xsl ns0 tns"
    xmlns:tns="http://www.balammotion.com/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns0="http://www.montepiedad.com.mx/Schemas/CasaMatriz/Automatizacion">
    <xsl:template match="/">
        <tns:SolicitudAmarre>
            <tns:Contrato>
                <xsl:value-of select="/ns0:solicitarAmarreRequest/ns0:numeroContrato"/>
            </tns:Contrato>
            <tns:RFID>
                <xsl:value-of select="/ns0:solicitarAmarreRequest/ns0:RFID"/>
            </tns:RFID>
            <tns:IndiceRotacion>
                <xsl:value-of select="/ns0:solicitarAmarreRequest/ns0:indiceRotacion"/>
            </tns:IndiceRotacion>
        </tns:SolicitudAmarre>
    </xsl:template>
</xsl:stylesheet>