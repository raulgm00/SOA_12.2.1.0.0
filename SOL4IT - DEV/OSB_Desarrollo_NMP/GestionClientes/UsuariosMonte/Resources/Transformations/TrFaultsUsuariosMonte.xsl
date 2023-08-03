<xsl:stylesheet version="2.0" exclude-result-prefixes="ctx soap con1 nmpsm" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:jca="http://www.bea.com/wli/sb/transports/jca" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:um="http://servicios.montedepiedad.com.mx/NMP/Service/UsuariosMonte" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedadV2.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="serviceName"/>
  <xsl:param name="soapFault"/>
  <xsl:template match="/">
    <xsl:variable name="appCode" select="substring-before(ctx:fault/ctx:errorCode,'-')"/>
    <xsl:variable name="reason" select="ctx:fault/ctx:reason"/>
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
        <xsl:when test="$errorCode='382500'">
          <xsl:choose>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:descripcionError">
              <xsl:value-of select="/ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:descripcionError"/>
            </xsl:when>
            <xsl:when test="$reason ='Error en el Servicio'">
              <xsl:choose>
                <xsl:when test="$soapFault//*:validarContratoClienteResponse/*:descripcion">
                  <xsl:value-of select="$soapFault//*:validarContratoClienteResponse/*:descripcion"/>
                </xsl:when>
                <xsl:when test="$soapFault//*:generaTokenResult/*:Mensaje">
                  <xsl:value-of select="$soapFault//*:generaTokenResult/*:Mensaje"/>
                </xsl:when>
                <xsl:when test="$soapFault//*:validaTokenResult/*:Mensaje">
                  <xsl:value-of select="$soapFault//*:validaTokenResult/*:Mensaje"/>
                </xsl:when>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring(ctx:fault/ctx:details,0,1500)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$errorCode=382502">
          <xsl:choose>
            <xsl:when test="ctx:fault//con1:ErrorResponseDetail/*:detail">
              <xsl:value-of select="ctx:fault//con1:ErrorResponseDetail/*:detail"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat('Error conectividad – No se encuentra el servicio ',$serviceName)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
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
    <soap:Body>
      <soap:Fault>
        <soap:Code>
          <soap:Value>soap:Receiver</soap:Value>
          <soap:Subcode>
            <soap:Value>um:usuariosMonteFault</soap:Value>
          </soap:Subcode>
        </soap:Code>
        <soap:Reason>
          <soap:Text xml:lang="es">
            <xsl:call-template name="faultstring">
              <xsl:with-param name="errorCode" select="$errorCode"/>
              <xsl:with-param name="serviceName" select="$serviceName"/>
            </xsl:call-template>
          </soap:Text>
        </soap:Reason>
        <soap:Detail>
          <nmpsm:messageError>
            <nmpsm:codigoError>
              <xsl:value-of select="$codigoError"/>
            </nmpsm:codigoError>
            <nmpsm:descripcionError>
              <xsl:value-of select="$descripcionError"/>
            </nmpsm:descripcionError>
            <nmpsm:tipoError>
              <xsl:call-template name="tipoError">
                <xsl:with-param name="errorCode" select="$errorCode"/>
                <xsl:with-param name="serviceName" select="$serviceName"/>
              </xsl:call-template>
            </nmpsm:tipoError>
            <nmpsm:severidad>
              <xsl:call-template name="severidad">
                <xsl:with-param name="errorCode" select="$errorCode"/>
                <xsl:with-param name="serviceName" select="$serviceName"/>
              </xsl:call-template>
            </nmpsm:severidad>
          </nmpsm:messageError>
        </soap:Detail>
      </soap:Fault>
    </soap:Body>
  </xsl:template>
</xsl:stylesheet>