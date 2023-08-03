<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:nmps="http://spsolutions.com.mx/" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:urn="urn:spsolutions.com.mx">
<xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="operacion"/>
	<xsl:param name="fault"/>
    <xsl:template match="/"> 
    <soap:Body>	
        <soap:Fault>
                <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>				
                <faultcode>
				 <xsl:call-template name="codigoError">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                    </xsl:call-template>
				</faultcode>
                <faultstring>
                    <xsl:call-template name="faultstring">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                    </xsl:call-template>
                </faultstring>
				  <detail>
            <Exception xmlns="http://spsolutions.com.mx/">
              <operation><xsl:value-of select="$operacion"/></operation>
              <detail><xsl:value-of select="$fault"/></detail>
           </Exception>
         </detail>
            </soap:Fault>
            </soap:Body>
    </xsl:template>
</xsl:stylesheet>