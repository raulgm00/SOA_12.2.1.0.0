<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 nmpsm codigoMidas cdMidasError" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:vsr="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:codigoMidas="urn:mx.com.nmp.midas" xmlns:cdMidasError="http://exception.midas.nmp.com.mx" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:include href="TemplateFaultsVSR.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="AppErrorCode"/>
  <xsl:template match="/">
    <soap:Body>
      <soap:Fault>
        <xsl:variable name="beaCod" select="number(substring-after($AppErrorCode,'OSB-'))"/>
		<xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
        <xsl:variable name="beaCodeNMP" select="number(substring-after(ctx:fault/ctx:errorCode,'NMP-'))"/>
        <soap:Code>
          <soap:Value>soap:Receiver</soap:Value>
          <soap:Subcode>
            <soap:Value>vsr:vehiculoSinResguardoFault</soap:Value>
          </soap:Subcode>
        </soap:Code>        
        <xsl:choose>
		<xsl:when test="$beaCod">
            <soap:Reason>
              <soap:Text xml:lang="es">
                <xsl:call-template name="faultstring">
                  <xsl:with-param name="beaCode" select="$beaCod"/>
                </xsl:call-template>
              </soap:Text>
            </soap:Reason>
            <soap:Detail>
              <nmpsm:messageError>
                <nmpsm:codigoError>
                  <xsl:call-template name="codigoError">
                    <xsl:with-param name="beaCode" select="$beaCod"/>
                  </xsl:call-template>
                </nmpsm:codigoError>
                <nmpsm:descripcionError>
                  <xsl:value-of select="ctx:fault/ctx:reason"/>
                </nmpsm:descripcionError>
                <nmpsm:tipoError>
                  <xsl:call-template name="tipoError">
                    <xsl:with-param name="beaCode" select="$beaCod"/>
                  </xsl:call-template>
                </nmpsm:tipoError>
                <nmpsm:severidad>
                  <xsl:call-template name="severidad">
                    <xsl:with-param name="beaCode" select="$beaCod"/>
                  </xsl:call-template>
                </nmpsm:severidad>
              </nmpsm:messageError>
            </soap:Detail>
          </xsl:when>
          <xsl:when test="$beaCodeNMP">
            <soap:Reason>
              <soap:Text xml:lang="es">
                <xsl:call-template name="faultstringNMP">
                  <xsl:with-param name="beaCodeNMP" select="$beaCodeNMP"/>
                </xsl:call-template>
              </soap:Text>
            </soap:Reason>
            <soap:Detail>
              <nmpsm:messageError>
                <nmpsm:codigoError>
                  <xsl:call-template name="codigoErrorNMP">
                    <xsl:with-param name="beaCodeNMP" select="$beaCodeNMP"/>
                  </xsl:call-template>
                </nmpsm:codigoError>
                <nmpsm:descripcionError>
                  <xsl:value-of select="ctx:fault/ctx:reason"/>
                </nmpsm:descripcionError>
                <nmpsm:tipoError>
                  <xsl:call-template name="tipoErrorNMP">
                    <xsl:with-param name="beaCodeNMP" select="$beaCodeNMP"/>
                  </xsl:call-template>
                </nmpsm:tipoError>
                <nmpsm:severidad>
                  <xsl:call-template name="severidadNMP">
                    <xsl:with-param name="beaCodeNMP" select="$beaCodeNMP"/>
                  </xsl:call-template>
                </nmpsm:severidad>
              </nmpsm:messageError>
            </soap:Detail>
          </xsl:when>
          <xsl:otherwise>
            <soap:Reason>
              <soap:Text xml:lang="es">
                <xsl:call-template name="faultstring">
                  <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
              </soap:Text>
            </soap:Reason>            
            <xsl:choose>
              <xsl:when test="$beaCode='380000' or $beaCode='382040'">
                <soap:Detail>
                  <nmpsm:messageError>
                    <nmpsm:codigoError>
                      <xsl:call-template name="codigoError">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                      </xsl:call-template>
                    </nmpsm:codigoError>
                    <nmpsm:descripcionError>
                      <xsl:value-of select="ctx:fault/ctx:reason"/>
                    </nmpsm:descripcionError>
                    <nmpsm:tipoError>
                      <xsl:call-template name="tipoError">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                      </xsl:call-template>
                    </nmpsm:tipoError>
                    <nmpsm:severidad>
                      <xsl:call-template name="severidad">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                      </xsl:call-template>
                    </nmpsm:severidad>
                  </nmpsm:messageError>
                </soap:Detail>
              </xsl:when>
              <xsl:when test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError">
                <soap:Detail>
                  <nmpsm:messageError>
                    <nmpsm:codigoError>
                      <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:codigoError"/>
                    </nmpsm:codigoError>
                    <nmpsm:descripcionError>
                      <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:descripcionError"/>
                    </nmpsm:descripcionError>
                    <nmpsm:tipoError>
                      <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:tipoError"/>
                    </nmpsm:tipoError>
                    <nmpsm:severidad>
                      <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:severidad"/>
                    </nmpsm:severidad>
                  </nmpsm:messageError>
                </soap:Detail>
              </xsl:when>
              <xsl:otherwise>
                <soap:Detail>
                  <nmpsm:messageError>
                    <nmpsm:codigoError>
                      <xsl:call-template name="codigoError">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                      </xsl:call-template>
                    </nmpsm:codigoError>
                    <xsl:choose>
                      <xsl:when test=" normalize-space(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1])!='' and $beaCode='382505'">
                        <xsl:choose>
                          <xsl:when test="local-name(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:xmlLocation[1]/*)=''">
                            <nmpsm:descripcionError>
                              <xsl:value-of select="ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1]"/>
                            </nmpsm:descripcionError>
                          </xsl:when>
                          <xsl:otherwise>
                            <nmpsm:descripcionError>
                              <xsl:value-of select=" concat(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:message[1], ' in nodo ', local-name(ctx:fault/ctx:details/con1:ValidationFailureDetail[1]/con1:xmlLocation[1]/*))"/>
                            </nmpsm:descripcionError>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                        <nmpsm:descripcionError>
                          <xsl:call-template name="faultstring">
                            <xsl:with-param name="beaCode" select="$beaCode"/>
                          </xsl:call-template>
                        </nmpsm:descripcionError>
                      </xsl:otherwise>
                    </xsl:choose>
                    <nmpsm:tipoError>
                      <xsl:call-template name="tipoError">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                      </xsl:call-template>
                    </nmpsm:tipoError>
                    <nmpsm:severidad>
                      <xsl:call-template name="severidad">
                        <xsl:with-param name="beaCode" select="$beaCode"/>
                      </xsl:call-template>
                    </nmpsm:severidad>
                  </nmpsm:messageError>
                </soap:Detail>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </soap:Fault>
    </soap:Body>
  </xsl:template>
</xsl:stylesheet>