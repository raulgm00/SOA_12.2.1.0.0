<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:Cbz="http://servicios.montedepiedad.com.mx/NMP/Services/Cobranza" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/> 
  <xsl:param name="app"/>
  <xsl:template match="/"> 
    <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
     <xsl:variable name="descError">
      <xsl:choose>
        <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring">            
          <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring"/>              
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="faultstring">
            <xsl:with-param name="beaCode" select="$beaCode"/>        
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>  
    <xsl:variable name="faultString">
      <xsl:choose>
        <xsl:when test="$app = 1">            
          <xsl:value-of select="concat('SAP Error: ',$descError)"/>              
        </xsl:when>  
        <xsl:otherwise>
          <xsl:value-of select="concat('OSB Error: ',$descError)"/>       
          </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
   
     <!--Create Fault -->
       <soap:Fault>
      <faultcode>Cbz:consultarCobranzaFault</faultcode>
      <faultstring>
        <xsl:value-of select="$faultString"/>
      </faultstring>
      <detail>
        <messageError xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
          <codigoError>
            <xsl:call-template name="codigoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </codigoError>
          <descripcionError>
            <xsl:value-of select="$descError"/>
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
        </messageError>
      </detail>
    </soap:Fault>
   </xsl:template>
</xsl:stylesheet>