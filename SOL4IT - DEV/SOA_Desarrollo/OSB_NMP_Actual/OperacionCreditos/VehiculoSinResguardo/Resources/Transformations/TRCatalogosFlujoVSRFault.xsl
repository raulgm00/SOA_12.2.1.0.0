<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ca="hhttp://servicios.montedepiedad.com.mx/NMP/Services/FlujoVehiculoSinReguardo/Catalogos" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedadV2.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="app"/>
  <xsl:param name="serviceName"/>
  <xsl:param name="soapFault"/>
  <xsl:template match="/">
		<xsl:variable name="appCode" select="substring-before(ctx:fault/ctx:errorCode,'-')"/>
		<xsl:variable name="errorCode">
			<xsl:choose>
        <xsl:when test="$appCode != 'OSB'">
					<xsl:value-of select="substring-after(ctx:fault/ctx:errorCode,'-')"/>
				</xsl:when>
        <xsl:otherwise>
					<xsl:value-of select="number(substring-after(ctx:fault/ctx:errorCode,concat($appCode,'-')))"/>
				</xsl:otherwise>
      </xsl:choose>
		</xsl:variable>
                
		<xsl:variable name="faultstring">
			
					<xsl:call-template name="faultstring">
        <xsl:with-param name="errorCode" select="$errorCode"/>
        <xsl:with-param name="serviceName" select="$serviceName"/>
      </xsl:call-template>			
  		</xsl:variable>
                
                 
    <xsl:variable name="codigoError">
        <xsl:choose>
            <xsl:when test="contains($appCode,'NMP')">
                <xsl:value-of select="ctx:fault/ctx:errorCode"/>
            </xsl:when>
            <xsl:otherwise>
                   <xsl:call-template name="codigoError">
              <xsl:with-param name="errorCode" select="$errorCode"/>
              <xsl:with-param name="serviceName" select="$serviceName"/>
            </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
		<xsl:variable name="descripcionError">
			<xsl:choose>
        <xsl:when test="$appCode = 'NMP'">                                    
					<xsl:value-of select="substring(ctx:fault/ctx:reason,0,1500)"/>
				</xsl:when>
        <xsl:when test="$appCode = 'OSB'">
							<xsl:call-template name="descripcionError">
            <xsl:with-param name="errorCode" select="$errorCode"/>
            <xsl:with-param name="fault" select="/ctx:fault"/>
            <xsl:with-param name="serviceName" select="$serviceName"/>
          </xsl:call-template>
				</xsl:when>
        <xsl:otherwise>
					<xsl:value-of select="substring(ctx:fault/ctx:details,0,1500)"/>
				</xsl:otherwise>
      </xsl:choose>
		</xsl:variable>
                <!---Generate Fault -->
		<soap:Fault>
      <faultcode>ca:catalogoFlujoVSRfault</faultcode>
      <faultstring>
        <xsl:value-of select="$faultstring"/>
      </faultstring>
      <detail>
        <ns1:messageError>
          <ns1:codigoError>
          <xsl:value-of select="$codigoError"/>
          </ns1:codigoError>
          <ns1:descripcionError>
            <xsl:value-of select="$descripcionError"/>
          </ns1:descripcionError>
          <ns1:tipoError>
            <xsl:call-template name="tipoError">
              <xsl:with-param name="errorCode" select="$errorCode"/>
              <xsl:with-param name="serviceName" select="$serviceName"/>
            </xsl:call-template>
          </ns1:tipoError>
          <ns1:severidad>
            <xsl:call-template name="severidad">
              <xsl:with-param name="errorCode" select="$errorCode"/>
              <xsl:with-param name="serviceName" select="$serviceName"/>
            </xsl:call-template>
          </ns1:severidad>
        </ns1:messageError>
      </detail>
    </soap:Fault>
                <!---End Generate Fault -->
	</xsl:template>
</xsl:stylesheet>