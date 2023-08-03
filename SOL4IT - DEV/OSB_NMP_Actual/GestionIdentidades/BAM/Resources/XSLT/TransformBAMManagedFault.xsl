<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:nmps="http://spsolutions.com.mx/" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:urn="urn:spsolutions.com.mx">
<xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="operacion"/>
    <xsl:template match="/"> 
      <soap:Fault>
        <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>	
         <soap:Code>
            <soap:Value>soap:Sender</soap:Value>
            <soap:Subcode>
             <soap:Value>nmps:Exception</soap:Value>
            </soap:Subcode>
         </soap:Code>
         <soap:Reason>
            <soap:Text xml:lang="en-US">Processing error</soap:Text>
         </soap:Reason>  
         <soap:Detail>       
		     <Exception xmlns="http://spsolutions.com.mx/">
              <operation><xsl:value-of select="$operacion"/></operation>
              <detail>
			   <xsl:call-template name="faultstring">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                    </xsl:call-template>
			  </detail>
           </Exception>
         </soap:Detail>		 
      </soap:Fault>
    </xsl:template>
</xsl:stylesheet>