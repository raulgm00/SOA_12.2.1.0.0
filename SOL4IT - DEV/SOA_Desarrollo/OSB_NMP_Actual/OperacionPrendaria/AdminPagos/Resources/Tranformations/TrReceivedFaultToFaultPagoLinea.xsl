<xsl:stylesheet version="1.0" 
    exclude-result-prefixes="ctx soap con1 urn" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
    xmlns:ctx="http://www.bea.com/wli/sb/context" 
    xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">

  <xsl:output indent="yes"/>
  <xsl:template match="/"> 
        <soap:Fault>
      <xsl:variable name="receivedFault" select="con1:ReceivedFaultDetail"/>
      <faultcode>
          <xsl:value-of select="$receivedFault/con1:faultcode" />
      </faultcode>
      <faultstring>
        <xsl:value-of select="$receivedFault/con1:faultstring" />
      </faultstring>
      <detail>
      <xsl:copy-of select="$receivedFault/con1:detail/*"/>
      </detail>
    </soap:Fault>
   </xsl:template>
</xsl:stylesheet>