<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:of="http://servicios.montedepiedad.com.mx/NMP/Servicios/Utileria/ConversionDivisas">
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
                         <xsl:text>ConversionDivisas Error: obtenerTipoCambioBanxico</xsl:text>
                  </xsl:when>
                  <xsl:when test="$app =2">
                         <xsl:text>ConversionDivisas Error: obtenerListaTipoCambioBanxico</xsl:text>
                  </xsl:when>
                  <xsl:when test="$app =3">
                            <xsl:text>Banxico Error: No se puede realizar la conexion con el servico Banxico</xsl:text>
                  </xsl:when>
                  <xsl:when test="$app =4">
                            <xsl:text>OSB Error: Error inesperado</xsl:text>
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
      
      
      <xsl:variable name="descripcion">
          <xsl:choose>
        <xsl:when test="$appCode = 'NMP'">
		<xsl:value-of select="substring(ctx:fault/ctx:reason,0,1500)"/>
              </xsl:when>
        <xsl:when test="$appCode = 'OSB'">
		       <xsl:call-template name="descripcionError">
            <xsl:with-param name="beaCode" select="$beaCode"/>
            <xsl:with-param name="fault" select="/ctx:fault"/>
          </xsl:call-template>
              </xsl:when>
        <xsl:otherwise>
                      <xsl:call-template name="descripcionError">
            <xsl:with-param name="beaCode" select="$beaCode"/>
            <xsl:with-param name="fault" select="/ctx:fault"/>
          </xsl:call-template>
              </xsl:otherwise>
      </xsl:choose>
     </xsl:variable>
      <soap:Fault>
      <faultcode>of:ConversionDivisasFault</faultcode>
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
            <xsl:value-of select="$descripcion"/>
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