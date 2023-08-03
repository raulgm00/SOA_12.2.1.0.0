<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 nmpsm codigoMidas cdMidasError" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:jca="http://www.bea.com/wli/sb/transports/jca" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:identidad="http://servicios.montedepiedad.com.mx/NMP/Services/NMPIdentidades" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:codigoMidas="urn:mx.com.nmp.midas" xmlns:cdMidasError="http://exception.midas.nmp.com.mx" xmlns:rol="http://xmlns.oracle.com/bpel/services/IdentityService" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
    <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="faultOper"/>
    <xsl:template match="/">
  
    <soap:Body>
            <soap:Fault>
                <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
                <faultcode>
                    <xsl:choose>
                        <xsl:when test="$faultOper = 1">
            identidad:RolesFault
            </xsl:when>
                        <xsl:when test="$faultOper = 2">
            identidad:ObtenerPerfilUsuarioFault
            </xsl:when>
                        <xsl:otherwise>
            soap:Server
            </xsl:otherwise>
                    </xsl:choose>
                </faultcode>
                <faultstring>
                    <xsl:choose>
                        <xsl:when test="$faultOper = 2 and $beaCode= '382500'">
                <xsl:value-of select="concat('MIDAS Error: ',//con1:faultstring)"/>
            </xsl:when>
             <xsl:when test="contains(ctx:fault/ctx:errorCode,'NMP-')">
                <xsl:value-of select="ctx:fault/ctx:reason"/>
            </xsl:when>
                        <xsl:otherwise>
            <xsl:call-template name="faultstring">
                                <xsl:with-param name="beaCode" select="$beaCode"/>
                            </xsl:call-template>
            </xsl:otherwise>
                    </xsl:choose>
                </faultstring>
                <xsl:choose>
                    <xsl:when test="$beaCode='380000' or $beaCode='382040' or contains(ctx:fault/ctx:errorCode,'NMP-')">
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
                    <xsl:when test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/rol:identityNotFoundError ">
            <detail>
                            <nmpsm:messageError>
                                <nmpsm:codigoError>
                                    <xsl:call-template name="codigoError">
                                        <xsl:with-param name="beaCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:codigoError>
                                <nmpsm:descripcionError>
                                <xsl:choose>
                                <xsl:when test="$faultOper = 1">
                                <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/rol:identityNotFoundError/rol:faultInfo"/>
                                </xsl:when>
                                <xsl:when test="$faultOper = 2 ">
                <xsl:value-of select="concat('MIDAS Error: ',//con1:faultstring)"/>
            </xsl:when>
                                </xsl:choose>
                                    
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
                    <!--xsl:when
                        test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail">
                        <detail>
                            <nmpsm:messageError>
                                <xsl:choose>
                                    <xsl:when
                                        test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-code=''">
                                        <nmpsm:codigoError>
                                            <xsl:call-template name="codigoError">
                                                <xsl:with-param name="beaCode" select="$beaCode"/>
                                            </xsl:call-template>
                                        </nmpsm:codigoError>
                                        <nmpsm:descripcionError>
                                            <xsl:value-of
                                                select="substring(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:exception,1,800)"
                                            />
                                        </nmpsm:descripcionError>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <nmpsm:codigoError>
                                            <xsl:value-of
                                                select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-code"
                                            />
                                        </nmpsm:codigoError>
                                        <nmpsm:descripcionError>
                                            <xsl:value-of
                                                select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-message"
                                            />
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
                    </xsl:when-->
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