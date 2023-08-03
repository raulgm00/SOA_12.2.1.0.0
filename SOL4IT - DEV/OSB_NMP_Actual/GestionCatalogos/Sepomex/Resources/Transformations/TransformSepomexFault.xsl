<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap  ns3 con1 nmpsm" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:sepomx="http://tempuri.org/" xmlns:ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
    <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <soap:Fault>
            <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
            <faultcode>sepomx:fault</faultcode>            
            <faultstring>
                <!--xsl:value-of select="ctx:Fault/ctx:detail/ctx:Comentario"/-->
                <xsl:call-template name="faultstring">
                    <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
            </faultstring>                
            <xsl:choose>
                <!--xsl:when test="$beaCode='' and ctx:fault/ctx:details">
                    <detail>
                        <nmpsm:messageError>
                            <nmpsm:codigoError>
                                <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/ns2:standardMessageFault/ns3:messageError/ns3:codigoError"/>
                            </nmpsm:codigoError>
                            <nmpsm:descripcionError>
                                <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/ns2:standardMessageFault/ns3:messageError/ns3:descripcionError"/>
                            </nmpsm:descripcionError>
                            <nmpsm:tipoError>
                                <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/ns2:standardMessageFault/ns3:messageError/ns3:tipoError"/>
                            </nmpsm:tipoError>
                            <nmpsm:severidad>
                                <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/ns2:standardMessageFault/ns3:messageError/ns3:severidad"/>
                            </nmpsm:severidad>
                        </nmpsm:messageError>
                    </detail> 
                </xsl:when-->
                
                <xsl:when test="($beaCode='380001' or $beaCode='380002') and ctx:fault/ctx:reason!='' ">
                    <detail>
                        <nmpsm:messageError>
                            <nmpsm:codigoError>
                                <xsl:call-template name="codigoError">
                                    <xsl:with-param name="beaCode" select="$beaCode"/>
                                </xsl:call-template>
                            </nmpsm:codigoError>
                            <nmpsm:descripcionError>
                                <xsl:value-of select="substring(ctx:fault/ctx:reason,1,600)"/>
                            </nmpsm:descripcionError>
                            <nmpsm:tipoError>Técnico</nmpsm:tipoError>
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
                                        <xsl:value-of select="ctx:fault/ctx:reason"/>
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
    </xsl:template>
</xsl:stylesheet>