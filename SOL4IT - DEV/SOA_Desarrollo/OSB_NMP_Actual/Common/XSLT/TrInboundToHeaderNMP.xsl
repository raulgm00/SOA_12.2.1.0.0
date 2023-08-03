<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:nmph="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader"
    xmlns:ctx="http://www.bea.com/wli/sb/context"
    xmlns:tp="http://www.bea.com/wli/sb/transports"
    version="1.0" exclude-result-prefixes="ctx tp xsl">     
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <soap:Header >
            <nmph:headerMessage >
                <xsl:if test="/ctx:endpoint/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='usuario']/@value">
                    <nmph:usuario>
                        <xsl:value-of select="/ctx:endpoint/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='usuario']/@value"/>
                    </nmph:usuario>
                </xsl:if>
                <xsl:if test="/ctx:endpoint/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idConsumidor']/@value">
                    <nmph:idConsumidor>
                        <xsl:value-of select="/ctx:endpoint/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idConsumidor']/@value"/>
                    </nmph:idConsumidor>
                </xsl:if>
                <xsl:if test="/ctx:endpoint/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idDestino']/@value">
                    <nmph:idDestino>
                        <xsl:value-of select="/ctx:endpoint/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idDestino']/@value"/>
                    </nmph:idDestino>
                </xsl:if>                
            </nmph:headerMessage>   
        </soap:Header>
    </xsl:template>
</xsl:stylesheet>