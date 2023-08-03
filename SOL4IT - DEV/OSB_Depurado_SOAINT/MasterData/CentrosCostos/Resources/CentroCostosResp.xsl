<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:ns1="http://qualitas.com.mx/comunes/objetosComunes/v1/" 
    xmlns:ns0="http://qualitas.com.mx/Comun/CentroCostos/validarCentrosDeCostos/v1/"
    xmlns:ns2="http://service.centroscosto.qualitas.com.mx/"
    exclude-result-prefixes="ns2">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <validarCentrosDeCostosResponse>
            <xsl:for-each select="//salida">
                <ns0:OperationResponse>
                    <xsl:choose>
                        <xsl:when test="contains(atributos/valor, 'NO EXISTE')">
                            <ns1:codigoRespuesta>1</ns1:codigoRespuesta>
                            <ns1:descripcionRespuesta>NO SE ENCONTRARON CENTROS DE COSTOS</ns1:descripcionRespuesta>
                        </xsl:when>
                        <xsl:otherwise>
                            <ns1:codigoRespuesta>0</ns1:codigoRespuesta>
                            <ns1:descripcionRespuesta>SE ENCONTRARON CENTROS DE COSTOS</ns1:descripcionRespuesta>
                        </xsl:otherwise>
                    </xsl:choose>
                </ns0:OperationResponse>
            </xsl:for-each>
        </validarCentrosDeCostosResponse>
    </xsl:template>
</xsl:stylesheet>