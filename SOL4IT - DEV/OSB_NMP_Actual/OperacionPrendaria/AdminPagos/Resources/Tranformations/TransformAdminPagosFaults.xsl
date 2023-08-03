<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:include href="TemplateMIDASFaultsAdminPagos.xsl"/>

  <xsl:output indent="yes"/>
  <xsl:param name="detailFault"/>
  <xsl:param name="codigoFault"/>
  <xsl:template match="/"> 
        <soap:Fault>
      <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
      <xsl:variable name="errorCode" select="$codigoFault"/>
      <xsl:choose>
      <xsl:when test="$codigoFault = 'WS001' or $codigoFault = 'WS002' or $codigoFault = 'WS003' or $codigoFault = 'WS004' or $codigoFault = 'WS005' or $codigoFault = 'WS006' or $codigoFault = 'WS007' or $codigoFault = 'WS008'  or $codigoFault = 'WS010'  or $codigoFault = 'NMP-005bis'">
      <faultcode>
          <xsl:call-template name="codigoErrorAP">
            <xsl:with-param name="errorCode" select="$codigoFault"/>
          </xsl:call-template>
      </faultcode>
      <faultstring>
        <xsl:call-template name="faultstringAP">
            <xsl:with-param name="errorCode" select="$codigoFault"/>
        </xsl:call-template>
      </faultstring>
      <detail>
        <adminPagosFault xmlns="http://servicios.montedepiedad.com.mx/NMP/Services/NMPAdminPagosSvc">
          <MessageError xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
             
            <codigoError>
              <xsl:call-template name="codigoErrorAP">
                <xsl:with-param name="errorCode" select="$codigoFault"/>
              </xsl:call-template>
            </codigoError>
            <descripcionError>
              <xsl:call-template name="faultstringAP">
                <xsl:with-param name="errorCode" select="$codigoFault"/>
              </xsl:call-template>                                 
            </descripcionError>
            <tipoError>
              <xsl:call-template name="tipoErrorAP">
                <xsl:with-param name="errorCode" select="$codigoFault"/>
              </xsl:call-template>
            </tipoError>
            <severidad>
              <xsl:call-template name="severidadAP">
                <xsl:with-param name="errorCode" select="$codigoFault"/>
              </xsl:call-template>
            </severidad>            
          </MessageError>
        </adminPagosFault>
      </detail>
       </xsl:when>
       <xsl:otherwise>
       <!--faultcode><xsl:value-of select="$codigoFault"/></faultcode>
       <faultstring><xsl:value-of select="$detailFault"/> </faultstring-->
      <faultcode>
          <xsl:call-template name="codigoError">
            <xsl:with-param name="beaCode" select="$beaCode"/>
          </xsl:call-template>
      </faultcode>
      <faultstring>
        <xsl:call-template name="faultstring">
            <xsl:with-param name="beaCode" select="$beaCode"/>
        </xsl:call-template>
      </faultstring>
       <detail>
        <adminPagosFault xmlns="http://servicios.montedepiedad.com.mx/NMP/Services/NMPAdminPagosSvc">
          <MessageError xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
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
             </MessageError>
        </adminPagosFault>
      </detail>
       </xsl:otherwise>
       </xsl:choose>
    </soap:Fault>
   </xsl:template>
</xsl:stylesheet>