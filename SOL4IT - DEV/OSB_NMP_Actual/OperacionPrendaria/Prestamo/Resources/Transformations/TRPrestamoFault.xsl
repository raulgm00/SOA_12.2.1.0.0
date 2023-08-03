<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Services/NMPPrestamo" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="detailFault"/>
  <xsl:param name="codeFault"/>
  <xsl:template match="/">
    <soap:Fault>
      <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
      <xsl:variable name="fault" select="ctx:fault"/>
      <faultcode>nmp:prestamoFault</faultcode>
      <faultstring>
        <xsl:call-template name="faultstring">
          <xsl:with-param name="beaCode" select="$beaCode"/>
        </xsl:call-template>
      </faultstring>
      <detail>
        <ns1:MessageError>
          <ns1:codigoError>
            <xsl:call-template name="codigoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </ns1:codigoError>
          <ns1:descripcionError>
            <xsl:call-template name="descripcionError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
              <xsl:with-param name="fault" select="$fault"/>
            </xsl:call-template>
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
        </ns1:MessageError>
      </detail>
    </soap:Fault>
  </xsl:template>
</xsl:stylesheet>