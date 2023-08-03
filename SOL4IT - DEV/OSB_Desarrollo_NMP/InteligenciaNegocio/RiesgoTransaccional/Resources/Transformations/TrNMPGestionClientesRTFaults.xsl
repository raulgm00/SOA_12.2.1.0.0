<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap ns2 ns3 con1 nmpsm" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:jca="http://www.bea.com/wli/sb/transports/jca" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:rtc="http://servicios.montedepiedad.com.mx/NMP/Service/RTClientesDbPXY" xmlns:ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/RTTransaccionesDbXSD" xmlns:ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
    <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <soap:Body>
        <soap:Fault>
            <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
            <faultcode>rtc:fault</faultcode>
            <faultstring>
                <xsl:call-template name="faultstring">
                    <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
            </faultstring>
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
                <xsl:when test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail">
                    <detail>
                        <nmpsm:messageError>
                            <xsl:choose>
                                <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-code=''">
                                    <nmpsm:codigoError>
                                        <xsl:call-template name="codigoError">
                                            <xsl:with-param name="beaCode" select="$beaCode"/>
                                        </xsl:call-template>
                                    </nmpsm:codigoError>
                                    <nmpsm:descripcionError>
                                        <xsl:value-of select="substring(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:exception,1,800)"/>
                                    </nmpsm:descripcionError>
                                </xsl:when>
                                <xsl:otherwise>
                                    <nmpsm:codigoError>
                                        <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-code"/>
                                    </nmpsm:codigoError>
                                    <nmpsm:descripcionError>
                                        <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-message"/>
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
                </xsl:otherwise>
            </xsl:choose>
        </soap:Fault>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>