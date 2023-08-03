<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:cred="http://nmpconsultacreditos.schema.nmp.servicios.montedepiedad.com.mx"
    xmlns:urn="urn:mx.com.nmp.midas" version="1.0">
    <xsl:template match="/">
        <soapenv:Body>
            <nmp:consultarPartidasFolioResponse>
                <nmp:partidas>
                    <xsl:for-each select="urn:obtenerCreditosPorFoliosResponse/urn:creditosFolios/cred:DetalleCreditoResponseType">
                        <nmp:partida>
                            <xsl:copy-of select="cred:prenda"/>
                            <!--xsl:copy-of select="cred:avaluoAlhajas"/-->
                            <!--xsl:copy-of select="cred:ubicacionDeposito"/-->
                            <!--xsl:copy-of select="cred:ubicacionAlmoneda"/-->
                            <xsl:copy-of select="cred:condiciones"/>
                            <xsl:copy-of select="cred:movimientos"/>
                            <xsl:copy-of select="cred:saldoPL"/>
                            <xsl:copy-of select="cred:comercial"/>
                            <xsl:choose>
                                <xsl:when test="cred:condiciones/cred:numeroMaximoRefrendos - cred:condiciones/cred:numeroRefrendosRealizados &gt; 0">
                                    <nmp:operaciones>
                                        <nmp:operacion>
                                            <nmp:tipoOperacion>6</nmp:tipoOperacion>
                                            <nmp:monto></nmp:monto>
                                        </nmp:operacion>
                                        <nmp:operacion>
                                            <nmp:tipoOperacion>8</nmp:tipoOperacion>
                                            <nmp:monto></nmp:monto>
                                        </nmp:operacion>
                                    </nmp:operaciones>
                                </xsl:when>
                                <xsl:otherwise>
                                    <nmp:operaciones>
                                        <nmp:operacion>
                                            <nmp:tipoOperacion>6</nmp:tipoOperacion>
                                            <nmp:monto></nmp:monto>
                                        </nmp:operacion>                                       
                                    </nmp:operaciones>
                                </xsl:otherwise>
                            </xsl:choose>                            
                        </nmp:partida>
                    </xsl:for-each>
                </nmp:partidas>                
            </nmp:consultarPartidasFolioResponse>
        </soapenv:Body>
    </xsl:template>
</xsl:stylesheet>