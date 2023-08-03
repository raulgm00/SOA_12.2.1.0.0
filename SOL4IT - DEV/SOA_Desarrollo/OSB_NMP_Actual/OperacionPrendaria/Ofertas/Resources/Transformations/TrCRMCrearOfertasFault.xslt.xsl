<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ctx="http://www.bea.com/wli/sb/context"
                xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config"
                xmlns:ns0="http://xmlns.oracle.com/OfertaBase/OfertaBase_DecisionService"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <xsl:template match="/">
   <xsl:variable name="descripcionError">
                       <xsl:choose>
        <xsl:when test="contains(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultcode,'operationErroredFault')">
                  <xsl:value-of select="substring(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/ns0:errorInfo/ns0:errorMessage,0,500)"/>
          </xsl:when>
        <xsl:otherwise>
                   <xsl:value-of select="substring(ctx:fault/ctx:reason,0,500)"/>
              </xsl:otherwise>
      </xsl:choose>
     </xsl:variable>
  
  <soapenv:Body>
      <soapenv:Fault>
        <faultcode>soapenv:Client</faultcode>
        <faultstring>
          <xsl:value-of select="concat(ctx:fault/ctx:errorCode,' :: ',$descripcionError)"/>
        </faultstring>
        <detail/>          
      </soapenv:Fault>
    </soapenv:Body>
  </xsl:template>
</xsl:stylesheet>