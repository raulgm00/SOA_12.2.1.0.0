<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:nmpr="http://nmprecepcionregla.services.nmp.servicios.montedepiedad.com.mx" xmlns:nmps="http://nmpstandardmessage.schema.nmp.servicios.montedepiedad.com.mx" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:urn="urn:mx.com.nmp.midas">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:template match="/"> 
    <soap:Body>
      <soap:Fault>
        <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
        <faultcode>soap:Server</faultcode>
        <faultstring>
          <xsl:call-template name="faultstring">
            <xsl:with-param name="beaCode" select="$beaCode"/>
          </xsl:call-template>
        </faultstring>
        <detail>
          <urn:ReglaMarcadoFaultMessage>
            <nmpr:faultInfo>
              <nmps:codigoError>
                <xsl:call-template name="codigoError">
                  <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
              </nmps:codigoError>
              <xsl:choose>
                <xsl:when test=" normalize-space(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1])!='' and $beaCode='382505'">
                                    <xsl:choose>
                    <xsl:when test="local-name(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:xmlLocation[1]/*)=''">
                                            <nmps:descripcionError>
                        <xsl:value-of select="ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1]"/>
                      </nmps:descripcionError>
                                        </xsl:when>
                    <xsl:otherwise>
                                            <nmps:descripcionError>
                        <xsl:value-of select=" concat(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1], ' in nodo ', local-name(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:xmlLocation[1]/*))"/>
                      </nmps:descripcionError>
                                        </xsl:otherwise>
                  </xsl:choose>                                    
                                </xsl:when>
                <xsl:otherwise>
                                    <nmps:descripcionError>
                    <xsl:call-template name="faultstring">
                      <xsl:with-param name="beaCode" select="$beaCode"/>
                    </xsl:call-template>
                  </nmps:descripcionError>
                                </xsl:otherwise>
              </xsl:choose>
              <nmps:tipoError>Técnico</nmps:tipoError>
              <nmps:severidad>
                <xsl:call-template name="severidad">
                  <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
              </nmps:severidad>
            </nmpr:faultInfo>
          </urn:ReglaMarcadoFaultMessage>
        </detail>
      </soap:Fault>
    </soap:Body>
    </xsl:template>
</xsl:stylesheet>