<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:open="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc"
    xmlns:nmph="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza" version="1.0"
    exclude-result-prefixes="ges nmph soapenv">
    <xsl:output indent="yes"/>
    <xsl:param name="header"/>
    <xsl:template match="/">        
        <open:almacenaDocumentoRequest>
            <xsl:for-each select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:documentos/ges:documento">
                <open:documentos>
                    <xsl:choose>
                        <xsl:when test="$header/nmph:headerMessage/nmph:idDestino=9">
                            <open:proceso>Cobranza</open:proceso>
                        </xsl:when>
                        <xsl:otherwise>
                            <open:proceso>CobranzaConin</open:proceso>
                        </xsl:otherwise>
                    </xsl:choose>                    
                    <open:documento>
                        <xsl:attribute name="tipo">
                            <xsl:value-of select="ges:tipo"/>
                        </xsl:attribute>
                        <open:nombre>
                            <xsl:value-of select="normalize-space(ges:nombre)"/>
                        </open:nombre>
                        <open:contenido>
                            <xsl:value-of select="normalize-space(ges:contenido)"/>
                        </open:contenido>
                        <open:size></open:size>
                    </open:documento>
                    <open:BusinessWorkspace>
                        <xsl:choose>
                            <xsl:when test="$header/nmph:headerMessage/nmph:idDestino=9">
                                <xsl:attribute name="parentGroup">CreditosConin</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="parentGroup">Creditos</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>                        
                        <open:numero>
                            <xsl:value-of select="/ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:cliente/ges:idContrato"/>
                        </open:numero>
                    </open:BusinessWorkspace>
                </open:documentos>
            </xsl:for-each>            
        </open:almacenaDocumentoRequest>
    </xsl:template>
</xsl:stylesheet>