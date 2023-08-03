<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:ns0="http://xmlns.oracle.com/BRMCotizarAuto/BRMCotizarAuto_DecisionService" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:co="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedadV2.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="app"/>
  <xsl:param name="serviceName"/>
  <xsl:param name="soapFault"/>
  <xsl:param name="operacion"/>
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
        <xsl:choose>
        <xsl:when test="($appCode = 'OSB' and ($errorCode = 382500 or $errorCode = 380001 ) ) or  ($appCode = 'NMP')">
          <xsl:choose>
            <xsl:when test="$app =1">
		<xsl:text> Error de SAP</xsl:text>
            </xsl:when>
          </xsl:choose>
              </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="faultstring">
            <xsl:with-param name="errorCode" select="$errorCode"/>
            <xsl:with-param name="serviceName" select="$serviceName"/>
          </xsl:call-template>
	</xsl:otherwise>
      </xsl:choose>
      </xsl:variable>
        <xsl:variable name="codigoError">
           <xsl:choose>
        <xsl:when test="contains($soapFault//faultcode/text(),'operationErroredFault') and contains($soapFault//ns0:errorMessage,'no es candidato')">
             <xsl:text>NMP-COT-001</xsl:text>
        </xsl:when>
        <xsl:when test="contains($soapFault//faultcode/text(),'operationErroredFault')">
             <xsl:text>NMP-COT-002</xsl:text>
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
                     <xsl:when test="contains($soapFault//faultcode/text(),'operationErroredFault')">
                        <xsl:value-of select="$soapFault//ns0:errorMessage"/>
                     </xsl:when>
        <xsl:when test="$appCode = 'NMP'">                                    
		 <xsl:value-of select="substring(ctx:fault/ctx:reason,0,1500)"/>
	 </xsl:when>
        <xsl:when test="$appCode = 'OSB'">
		 <xsl:choose>
            <xsl:when test="contains(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultcode,'operationErroredFault')">
			 <xsl:value-of select="substring(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/ns0:errorInfo/ns0:errorMessage,0,500)"/>
            </xsl:when>
            <xsl:otherwise>		
                <xsl:call-template name="descripcionError">
                <xsl:with-param name="errorCode" select="$errorCode"/>
                <xsl:with-param name="fault" select="/ctx:fault"/>
                <xsl:with-param name="serviceName" select="$serviceName"/>
              </xsl:call-template>
	    </xsl:otherwise>
          </xsl:choose>
	 </xsl:when>
        <xsl:otherwise>
	 <xsl:value-of select="substring(ctx:fault/ctx:details,0,1500)"/>
	 </xsl:otherwise>
      </xsl:choose>
      </xsl:variable>
     <!---Generate Fault -->
    <soap:Fault>
      <faultcode>
       <xsl:value-of select="$operacion"/>
      </faultcode>
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