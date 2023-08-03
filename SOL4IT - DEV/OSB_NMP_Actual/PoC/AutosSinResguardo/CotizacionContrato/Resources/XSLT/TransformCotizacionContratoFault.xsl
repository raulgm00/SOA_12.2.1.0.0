<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">
    <xsl:include href="TemplateFaultsMontePiedad.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="detailFault"/>
    <xsl:param name="codigoFault"/>
    <xsl:template match="/"> 
        <soap:Fault>
            <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
            <faultcode>
                <xsl:value-of select="$codigoFault"/>
            </faultcode>
            <faultstring>
                <xsl:value-of select="$detailFault"/>
            </faultstring>
            <detail>
                <!--cotizacionContratoFaultMessage xmlns="http://servicios.montedepiedad.com.mx/NMP/Services/AutoSinResguardo"-->
                <MessageError xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
                    <codigoError>
                        <xsl:call-template name="codigoError">
                            <xsl:with-param name="beaCode" select="$beaCode"/>
                        </xsl:call-template>
                    </codigoError>
                    <descripcionError>
                        <xsl:call-template name="faultstring">
                            <xsl:with-param name="beaCode" select="$beaCode"/>
                        </xsl:call-template>
                        .
                    </descripcionError>
                    <tipoError>
                        <xsl:call-template name="tipoError">
                            <xsl:with-param name="beaCode" select="$beaCode"/>
                        </xsl:call-template>
                    </tipoError>
                    <severidad>
                        <xsl:call-template name="severidad">
                            <xsl:with-param name="beaCode" select="$beaCode"/>
                        </xsl:call-template>
                    </severidad>
                </MessageError>
                <!--/cotizacionContratoFaultMessage-->
            </detail>
        </soap:Fault>
   </xsl:template>
</xsl:stylesheet>