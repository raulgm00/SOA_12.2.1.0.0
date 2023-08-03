<!--Maneja los errores ocurridos en el proxy NMPUsuariosMonte--><xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 nmpsm codigoMidas cdMidasError" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:jca="http://www.bea.com/wli/sb/transports/jca" xmlns:um="http://servicios.montedepiedad.com.mx/NMP/Service/UsuariosMonte" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:codigoMidas="urn:mx.com.nmp.midas" xmlns:cdMidasError="http://exception.midas.nmp.com.mx" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
    <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedadV2.xsl"/>
    <xsl:include href="TemplateFaultsUsuariosMonte.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="serviceName"/>    
    <xsl:template match="/">
        <soap:Body>
            <soap:Fault>
                <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
                <xsl:variable name="NMPCode" select="number(substring-after(ctx:fault/ctx:errorCode,'NMP-'))"/>
                <soap:Code>
                    <soap:Value>soap:Receiver</soap:Value>
                    <soap:Subcode>
                        <soap:Value>um:usuariosMonteFault</soap:Value>
                    </soap:Subcode>
                </soap:Code>    
                <soap:Reason>
                    <xsl:choose>
                        <xsl:when test="$NMPCode = 100">
                            <soap:Text xml:lang="es">
                                <xsl:call-template name="faultstring">
                                    <xsl:with-param name="errorCode" select="382500"/>
                                    <xsl:with-param name="serviceName" select="substring-before($serviceName,'-')"/>
                                </xsl:call-template>
                            </soap:Text>
                        </xsl:when>
                        <xsl:when test="$NMPCode > 100">
                            <soap:Text xml:lang="es">Se ha generado un fallo a partir una regla de negocio</soap:Text>
                        </xsl:when>
                        <xsl:otherwise>
                            <soap:Text xml:lang="es">
                                <xsl:call-template name="faultstring">
                                    <xsl:with-param name="errorCode" select="$beaCode"/>
                                    <xsl:with-param name="serviceName" select="$serviceName"/>
                                </xsl:call-template>
                            </soap:Text>
                        </xsl:otherwise>
                    </xsl:choose>                   
                </soap:Reason>
                <xsl:choose>
                    <xsl:when test="$NMPCode >= 100">
                        <soap:Detail>
                            <nmpsm:messageError>
                                <nmpsm:codigoError>
                                    <xsl:call-template name="codigoErrorNMP">
                                        <xsl:with-param name="errorCode" select="$NMPCode"/>
                                    </xsl:call-template>
                                </nmpsm:codigoError>
                                <xsl:choose>
                                    <xsl:when test="$NMPCode = 100">
                                        <nmpsm:descripcionError>
                                            <xsl:value-of select="substring-after($serviceName,'-')"/>
                                        </nmpsm:descripcionError>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <nmpsm:descripcionError>
                                            <xsl:call-template name="faultstringNMP">
                                                <xsl:with-param name="errorCode" select="$NMPCode"/>
                                            </xsl:call-template>
                                        </nmpsm:descripcionError>
                                    </xsl:otherwise>
                                </xsl:choose>                                
                                <nmpsm:tipoError>
                                    <xsl:call-template name="tipoErrorNMP">
                                        <xsl:with-param name="errorCode" select="$NMPCode"/>
                                    </xsl:call-template>
                                </nmpsm:tipoError>
                                <nmpsm:severidad>
                                    <xsl:call-template name="severidadNMP">
                                        <xsl:with-param name="errorCode" select="$NMPCode"/>
                                    </xsl:call-template>
                                </nmpsm:severidad>
                            </nmpsm:messageError>
                        </soap:Detail>
                    </xsl:when>              
                    <xsl:when test="$beaCode='380000' or $beaCode='382040'">
                        <soap:Detail>
                            <nmpsm:messageError>
                                <nmpsm:codigoError>
                                    <xsl:call-template name="codigoError">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:codigoError>
                                <nmpsm:descripcionError>
                                    <xsl:value-of select="ctx:fault/ctx:reason"/>
                                </nmpsm:descripcionError>
                                <nmpsm:tipoError>
                                    <xsl:call-template name="tipoError">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:tipoError>
                                <nmpsm:severidad>
                                    <xsl:call-template name="severidad">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:severidad>
                            </nmpsm:messageError>
                        </soap:Detail>
                    </xsl:when>
                    <xsl:when test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError">
                        <soap:Detail>
                            <nmpsm:messageError>
                                <xsl:choose>
                                    <xsl:when test="$serviceName='obtenerClientePorNumCredencial(CRM)' or $serviceName='ActualizaCliente(CRM)'">
                                        <xsl:variable name="codigoError">
                                            <xsl:call-template name="codigoErrorClientes">
                                                <xsl:with-param name="errorCode" select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:codigoError"/>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$codigoError != ''">
                                                <nmpsm:codigoError>
                                                    <xsl:value-of select="$codigoError"/>
                                                </nmpsm:codigoError>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <nmpsm:codigoError>
                                                    <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:codigoError"/>
                                                </nmpsm:codigoError>
                                            </xsl:otherwise>
                                        </xsl:choose>                                           
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <nmpsm:codigoError>
                                            <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError/nmpsm:codigoError"/>
                                        </nmpsm:codigoError>
                                    </xsl:otherwise>
                                </xsl:choose>                                
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
                    <!--xsl:when
                        test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail">
                        <soap:Detail>
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
                        </soap:Detail>
                    </xsl:when-->
                    <xsl:otherwise>
                        <soap:Detail>
                            <nmpsm:messageError>
                                <nmpsm:codigoError>
                                    <xsl:call-template name="codigoError">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
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
                                                <xsl:with-param name="errorCode" select="$beaCode"/>
                                                <xsl:with-param name="serviceName" select="$serviceName"/>
                                            </xsl:call-template>
                                        </nmpsm:descripcionError>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <nmpsm:tipoError>
                                    <xsl:call-template name="tipoError">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:tipoError>
                                <nmpsm:severidad>
                                    <xsl:call-template name="severidad">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:severidad>
                            </nmpsm:messageError>
                        </soap:Detail>
                    </xsl:otherwise>
                </xsl:choose>
            </soap:Fault>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>