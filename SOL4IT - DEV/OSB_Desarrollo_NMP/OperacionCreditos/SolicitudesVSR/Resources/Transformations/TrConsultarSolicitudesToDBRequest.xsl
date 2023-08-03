<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:soap="http://www.w3.org/2003/05/soap-envelope"
    xmlns:sol="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR" version="1.0">
    <xsl:template match="/">
        <soap:Body>
            <sol:consultarSolicitudesClienteRequest>
                <sol:numCliente>
                    <xsl:value-of select="soap:Body/sol:consultarSolicitudesClienteRequest/sol:numCliente"/>
                </sol:numCliente>
                <xsl:choose>
                    <xsl:when test="soap:Body/sol:consultarSolicitudesClienteRequest/sol:fechaInicial">
                        <sol:fechaInicial>
                            <xsl:value-of select="soap:Body/sol:consultarSolicitudesClienteRequest/sol:fechaInicial"/>
                        </sol:fechaInicial>
                    </xsl:when>
                    <xsl:otherwise>
                        <sol:fechaInicial/>                       
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="soap:Body/sol:consultarSolicitudesClienteRequest/sol:fechaFinal">
                        <sol:fechaFinal>
                            <xsl:value-of select="soap:Body/sol:consultarSolicitudesClienteRequest/sol:fechaFinal"/>
                        </sol:fechaFinal>
                    </xsl:when>
                    <xsl:otherwise>
                        <sol:fechaFinal/>
                    </xsl:otherwise>
                </xsl:choose>                
            </sol:consultarSolicitudesClienteRequest>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>