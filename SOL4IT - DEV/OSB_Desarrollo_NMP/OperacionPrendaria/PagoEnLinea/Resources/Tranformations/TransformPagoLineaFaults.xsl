<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 midas midasE nmpsm" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:pl="http://servicios.montedepiedad.com.mx/NMP/Services/NMPDSRFPagoLineaSvc" xmlns:midas="urn:mx.com.nmp.midas" xmlns:midasE="http://exception.midas.nmp.com.mx" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">
    <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
    <xsl:include href="TemplateMIDASFaultsAdminPagos.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="operacion"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <soap:Body>
            <soap:Fault>
                <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
                <xsl:variable name="MidasCode" select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/midas:ServiceException/midasE:codigoError"/>
                <xsl:variable name="osbCode" select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:codigoError"/>
                <faultcode>
                    <xsl:value-of select="concat('pl:',$operacion,'Fault')"/>
                </faultcode>
                <xsl:choose>
                    <xsl:when test="$MidasCode!='' or starts-with(ctx:fault/ctx:errorCode,'NMP')">
                        <xsl:choose>
                            <xsl:when test="$MidasCode!=''">
                                <faultstring>MIDAS SOAP Fault Response</faultstring>
                            </xsl:when>
                            <xsl:otherwise>
                                <faultstring>NMP SOAP Fault Response</faultstring>
                            </xsl:otherwise>
                        </xsl:choose>
                        <detail>
                            <xsl:choose>
                                <xsl:when test="$MidasCode!=''">
                                    <nmpsm:messageError>
                                        <nmpsm:codigoError>
                                            <xsl:call-template name="codigoErrorAP">
                                                <xsl:with-param name="errorCode" select="$MidasCode"/>
                                            </xsl:call-template>
                                        </nmpsm:codigoError>
                                        <nmpsm:descripcionError>
                                            <xsl:call-template name="faultstringAP">
                                                <xsl:with-param name="errorCode" select="$MidasCode"/>
                                            </xsl:call-template>
                                        </nmpsm:descripcionError>
                                        <nmpsm:tipoError>
                                            <xsl:call-template name="tipoErrorAP">
                                                <xsl:with-param name="errorCode" select="$MidasCode"/>
                                            </xsl:call-template>
                                        </nmpsm:tipoError>
                                        <nmpsm:severidad>
                                            <xsl:call-template name="severidadAP">
                                                <xsl:with-param name="errorCode" select="$MidasCode"/>
                                            </xsl:call-template>
                                        </nmpsm:severidad>
                                    </nmpsm:messageError>
                                </xsl:when>
                                <xsl:otherwise>
                                    <nmpsm:messageError>
                                        <nmpsm:codigoError>
                                            <xsl:call-template name="codigoErrorAP">
                                                <xsl:with-param name="errorCode" select="ctx:fault/ctx:errorCode"/>
                                            </xsl:call-template>
                                        </nmpsm:codigoError>
                                        <nmpsm:descripcionError>
                                            <xsl:call-template name="faultstringAP">
                                                <xsl:with-param name="errorCode" select="ctx:fault/ctx:errorCode"/>
                                            </xsl:call-template>
                                        </nmpsm:descripcionError>
                                        <nmpsm:tipoError>
                                            <xsl:call-template name="tipoErrorAP">
                                                <xsl:with-param name="errorCode" select="ctx:fault/ctx:errorCode"/>
                                            </xsl:call-template>
                                        </nmpsm:tipoError>
                                        <nmpsm:severidad>
                                            <xsl:call-template name="severidadAP">
                                                <xsl:with-param name="errorCode" select="ctx:fault/ctx:errorCode"/>
                                            </xsl:call-template>
                                        </nmpsm:severidad>
                                    </nmpsm:messageError>
                                </xsl:otherwise>
                            </xsl:choose>
                        </detail>
                    </xsl:when>
                    <xsl:when test="$osbCode!=''">
                        <faultstring>
                            <xsl:value-of select="ctx:fault/ctx:reason"/>
                        </faultstring>
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
                    <xsl:otherwise>
                        <faultstring>
                            <xsl:call-template name="faultstring">
                                <xsl:with-param name="beaCode" select="$beaCode"/>
                            </xsl:call-template>
                        </faultstring>
                        <xsl:choose>
                            <xsl:when test="$beaCode='380000'">
                                <detail>
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
                    </xsl:otherwise>
                </xsl:choose>
            </soap:Fault>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>