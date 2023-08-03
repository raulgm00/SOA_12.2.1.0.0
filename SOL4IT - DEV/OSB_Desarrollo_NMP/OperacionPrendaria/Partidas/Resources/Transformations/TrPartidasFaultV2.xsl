<!--Maneja los errores ocurridos en el proxy NMPUsuariosMonte--><xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 nmpsm codigoMidas cdMidasError" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:jca="http://www.bea.com/wli/sb/transports/jca" xmlns:par="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:urn="urn:mx.com.nmp.midas" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:codigoMidas="urn:mx.com.nmp.midas" xmlns:cdMidasError="http://exception.midas.nmp.com.mx" xmlns:nmpsm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
    <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedadV2.xsl"/>
    <xsl:include href="TemplateFaultsServicioPartidas.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="serviceName"/>    
    <xsl:template match="/">
        <soap:Body>
            <soap:Fault>
                <xsl:variable name="beaCode" select="number(substring-after(ctx:fault/ctx:errorCode,'OSB-'))"/>
                <xsl:variable name="NMPCode" select="number(substring-after(ctx:fault/ctx:errorCode,'NMP-'))"/>
                <faultcode>par:PartidasFault</faultcode>
                <faultstring>
                    <xsl:choose>
                        <xsl:when test="$NMPCode = 100">                       
                                <xsl:call-template name="faultstring">
                                    <xsl:with-param name="errorCode" select="382500"/>
                                    <xsl:with-param name="serviceName" select="substring-before($serviceName,'-')"/>
                                </xsl:call-template>                            
                        </xsl:when>
                        <xsl:when test="$NMPCode > 100">Se ha generado un fallo a partir una regla de negocio</xsl:when>
                        <xsl:otherwise>                         
                                <xsl:call-template name="faultstring">
                                    <xsl:with-param name="errorCode" select="$beaCode"/>
                                    <xsl:with-param name="serviceName" select="$serviceName"/>
                                </xsl:call-template>                            
                        </xsl:otherwise>
                    </xsl:choose>                   
                </faultstring>
                <xsl:choose>
                    <xsl:when test="$NMPCode >= 100">
                        <detail>
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
                        </detail>
                    </xsl:when>              
                    <xsl:when test="$beaCode='380000' or $beaCode='382040' or $beaCode='382000'">
                        <detail>
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
                        </detail>
                    </xsl:when>
                    <xsl:when test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/nmpsm:messageError">
                        <detail>
                            <nmpsm:messageError>
                                <xsl:choose>
                                    <xsl:when test="$serviceName='obtenerClientePorNumCredencial(CRM)' or $serviceName='ActualizaCliente(CRM)' or $serviceName='ObtenerClientePorUsuario(CRM)'">
                                        <xsl:variable name="codigoError">
                                            <xsl:call-template name="codigoErrorAnterior">
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
                        </detail>
                    </xsl:when>
                    <xsl:when test="$beaCode='382500' and (ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring)">
                        <detail>
                            <nmpsm:messageError>                               
                                <nmpsm:codigoError> 
                                    <xsl:call-template name="codigoError">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:codigoError>
                                <nmpsm:descripcionError>
                                    <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring"/>
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
                        </detail>
                    </xsl:when>
                    <xsl:when test="$beaCode='382500' and ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail">
                        <detail>
                            <nmpsm:messageError>
                                <xsl:choose>
                                    <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/jca:jca-runtime-fault-detail/jca:eis-error-code=''">
                                        <nmpsm:codigoError>
                                            <xsl:call-template name="codigoError">
                                                <xsl:with-param name="errorCode" select="$beaCode"/>
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
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
                                    </xsl:call-template>
                                </nmpsm:tipoError>
                                <nmpsm:severidad>
                                    <xsl:call-template name="severidad">
                                        <xsl:with-param name="errorCode" select="$beaCode"/>
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
                        </detail>
                    </xsl:otherwise>
                </xsl:choose>
            </soap:Fault>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>