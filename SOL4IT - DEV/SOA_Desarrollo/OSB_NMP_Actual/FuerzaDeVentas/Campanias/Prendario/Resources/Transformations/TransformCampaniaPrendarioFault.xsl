<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:crmm="http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.DataContract" xmlns:cmpp="http://servicios.montedepiedad.com.mx/NMP/Services/CampaniasPrendario" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">
  <xsl:include href="../../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:template match="/">
      <soap:Fault>
      <xsl:choose>
        <xsl:when test="ctx:fault/ctx:errorCode">
      <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
      <faultcode>cmpp:fault</faultcode>
      <faultstring>
            <xsl:choose>
              <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring/text()">
                  <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring/text()"/>
          </xsl:when>
              <xsl:when test="ctx:fault/ctx:reason">
                  <xsl:value-of select="ctx:fault/ctx:reason/text()"/>
          </xsl:when>
              <xsl:otherwise>
          <xsl:value-of select="'Error de aplicación'"/>
          </xsl:otherwise>
            </xsl:choose>
          </faultstring>
      <detail>
            <messageError xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
              <codigoError>
                <xsl:call-template name="codigoError">
                  <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
              </codigoError>
              <descripcionError>
                <xsl:call-template name="faultstring">
                  <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
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
      </xsl:when>
        <xsl:when test="//crmm:Mensaje">
         <faultcode>
            <xsl:text>soap:Client</xsl:text>
          </faultcode>
        <faultstring>
            <xsl:value-of select="//crmm:Mensaje"/>
          </faultstring>
      <detail>
            <campaniaOperacionFaultMessage xmlns="urn:mx.com.nmp.campaniasPrendario">
              <MessageError xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
                <codigoError>
                  <xsl:text>NMP-6001</xsl:text>
                </codigoError>
                <descripcionError>
                  <xsl:value-of select="//crmm:Mensaje/text()"/>
                </descripcionError>
                <tipoError>
                  <xsl:text>Error de negocio</xsl:text>
                </tipoError>
                <severidad>
                  <xsl:text>1</xsl:text>
                </severidad>
              </MessageError>
            </campaniaOperacionFaultMessage>
          </detail>
      </xsl:when>
      </xsl:choose>
    </soap:Fault>
   </xsl:template>
</xsl:stylesheet>