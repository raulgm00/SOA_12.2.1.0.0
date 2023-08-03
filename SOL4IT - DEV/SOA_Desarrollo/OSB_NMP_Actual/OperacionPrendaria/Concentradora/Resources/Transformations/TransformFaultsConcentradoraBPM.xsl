<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 nmpsm" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con="http://xmlns.oracle.com/bpmn/bpmnProcess/Concentradora" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:template match="/"> 
    <soap:Body>
      <soap:Fault>
        <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
        <faultcode>con:fault</faultcode>
        <xsl:choose>
          <xsl:when test="$beaCode='382500'">
                        <faultstring>
              <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring"/>
            </faultstring>
                    </xsl:when>
          <xsl:when test="$beaCode='001'">
                        <faultstring>
              <xsl:value-of select="ctx:fault/ctx:reason"/>
            </faultstring>
                    </xsl:when>
          <xsl:otherwise>
                        <faultstring>
              <xsl:call-template name="faultstring">
                <xsl:with-param name="beaCode" select="$beaCode"/>
              </xsl:call-template>
            </faultstring>
                    </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$beaCode='382500'">
                        <detail>
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
            </detail>
                    </xsl:when>
          <xsl:when test="$beaCode='001'">
                        <detail>
              <nmpsm:messageError>
                <nmpsm:codigoError>NMP-011</nmpsm:codigoError>
                <nmpsm:descripcionError>Operación invalida</nmpsm:descripcionError>
                <nmpsm:tipoError>Técnico</nmpsm:tipoError>
                <nmpsm:severidad>1</nmpsm:severidad>
              </nmpsm:messageError>
            </detail>
                    </xsl:when>
          <xsl:otherwise>
                        <detail>
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
                <nmpsm:tipoError>Técnico</nmpsm:tipoError>
                <nmpsm:severidad>
                  <xsl:call-template name="severidad">
                    <xsl:with-param name="beaCode" select="$beaCode"/>
                  </xsl:call-template>
                </nmpsm:severidad>
              </nmpsm:messageError>
            </detail>
                    </xsl:otherwise>
        </xsl:choose>
      </soap:Fault>
    </soap:Body>
    </xsl:template>
</xsl:stylesheet>