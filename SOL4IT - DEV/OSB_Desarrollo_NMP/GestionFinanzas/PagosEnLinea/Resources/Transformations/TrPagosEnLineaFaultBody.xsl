<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pagosenlinea="http://www.montepiedad.com.mx/OXXO/WSDLs/PagosEnLinea" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="app"/>
  <xsl:template match="/">
      <xsl:variable name="appCode" select="substring-before(ctx:fault/ctx:errorCode,'-')"/>
        <xsl:variable name="beaCode">
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
        <xsl:when test="($appCode = 'OSB' and $beaCode = 382500) or  ($appCode = 'NMP')">
                  <xsl:choose>
            <xsl:when test="$app =1">
                          <xsl:text>SAP Error:  No se pudo recuperar datos del cliente.</xsl:text>
            </xsl:when>
            <xsl:when test="$app =2">
                          <xsl:text>SAP Error:  No se pudo realizar el pago.</xsl:text>
            </xsl:when>
            <xsl:when test="$app =3">
                          <xsl:text>SAP Error:  No se pudo realizar la cancelacion.</xsl:text>
            </xsl:when>
          </xsl:choose>
              </xsl:when>
        <xsl:otherwise>
                  <xsl:call-template name="faultstring">
            <xsl:with-param name="beaCode" select="$beaCode"/>
          </xsl:call-template>
              </xsl:otherwise>
      </xsl:choose>
	</xsl:variable>
	  
        <xsl:variable name="descripcionError">
              <xsl:choose>
        <xsl:when test="$appCode = 'NMP'">
			<xsl:value-of select="substring(ctx:fault/ctx:reason,0,1500)"/>
                  </xsl:when>
        <xsl:otherwise>
                        <xsl:call-template name="faultstring">
            <xsl:with-param name="beaCode" select="$beaCode"/>
          </xsl:call-template>
                  </xsl:otherwise>
      </xsl:choose>
        </xsl:variable>
		
      <soap:Fault>
      <faultcode>pagosenlinea:Fault</faultcode>
      <faultstring>
        <xsl:value-of select="$faultstring"/>
      </faultstring>
      <detail>
        <ns1:messageError>
          <ns1:codigoError>
            <xsl:call-template name="codigoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </ns1:codigoError>
          <ns1:descripcionError>
            <xsl:value-of select="$descripcionError"/>
          </ns1:descripcionError>
          <ns1:tipoError>
            <xsl:call-template name="tipoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </ns1:tipoError>
          <ns1:severidad>
            <xsl:call-template name="severidad">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </ns1:severidad>
        </ns1:messageError>
      </detail>
    </soap:Fault>
  </xsl:template>
</xsl:stylesheet>