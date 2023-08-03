<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ca="http://servicios.montedepiedad.com.mx/NMP/Schema/SendEmail" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedadV2.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:template match="/">
   <soapenv:Body>
     <nmp:Response xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/SendEmail">
     <nmp:code>           
      <xsl:value-of select="ctx:fault//con1:ErrorResponseDetail/*:http-response-code"/>
     </nmp:code>
     <nmp:error>
     <xsl:value-of select="ctx:fault//con1:ErrorResponseDetail/*:detail"/>
     </nmp:error>
     </nmp:Response>
   </soapenv:Body>
	</xsl:template>
</xsl:stylesheet>