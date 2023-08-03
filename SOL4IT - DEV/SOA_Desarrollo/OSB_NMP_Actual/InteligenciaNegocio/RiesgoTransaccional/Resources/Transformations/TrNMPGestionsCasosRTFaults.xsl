<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 nmpsm soap " xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:ctx1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:jca="http://www.bea.com/wli/sb/transports/jca" xmlns:cm="http://xmlns.oracle.com/pcbpel/adapter/db/Desarrollo+SOA/NmpCasosAlertas/NmpRiesgoTransaccionalSvc" xmlns:con="http://www.bea.com/wli/sb/context" xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
    
    <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <soap:Fault>
            <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
            <faultcode>cm:messageError</faultcode>            
            <faultstring>
                <xsl:call-template name="faultstring">
                    <xsl:with-param name="beaCode" select="$beaCode"/>
                </xsl:call-template>
            </faultstring>                
            <xsl:choose>
                <xsl:when test="$beaCode='382500'">
                    <detail>
                        <nmpsm:messageError>
                            <nmpsm:codigoError>
                                <xsl:call-template name="codigoError">
                                    <xsl:with-param name="beaCode" select="$beaCode"/>
                                </xsl:call-template>
                            </nmpsm:codigoError>
                            <nmpsm:descripcionError>
                                <xsl:value-of select="con:fault/con:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-message"/>
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
                
                <xsl:when test="($beaCode='380001' or $beaCode='380002') and ctx:fault/ctx:reason!='' ">
                    <detail>
                        <nmpsm:messageError>
                            <nmpsm:codigoError>
                                <xsl:call-template name="codigoError">
                                    <xsl:with-param name="beaCode" select="$beaCode"/>
                                </xsl:call-template>
                            </nmpsm:codigoError>
                            <nmpsm:descripcionError>
                                <xsl:value-of select="con:fault/con:details/con1:ReceivedFaultDetail/con1:faultstring"/>
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
                                                <xsl:value-of select="con:fault/con:details/con1:ReceivedFaultDetail/con1:faultstring"/>
                                            </nmpsm:descripcionError>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <nmpsm:descripcionError>
                                                <xsl:value-of select="con:fault/con:details/con1:ReceivedFaultDetail/con1:faultstring"/>
                                            </nmpsm:descripcionError>
                                        </xsl:otherwise>
                                    </xsl:choose>                                    
                                </xsl:when>
                                <xsl:otherwise>
                                    <nmpsm:descripcionError>
                                        <xsl:value-of select="con:fault/con:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:descripcionError"/>
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