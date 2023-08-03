<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"    
    xmlns:cred="http://nmpconsultacreditos.schema.nmp.servicios.montedepiedad.com.mx"
    xmlns:urn="urn:mx.com.nmp.midas" version="2.0">
    <xsl:template name="string-replace-all">
        <xsl:param name="text" />
        <xsl:param name="replace" />
        <xsl:param name="by" />
        <xsl:choose>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text,$replace)" />
                <xsl:value-of select="$by" />
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text"          select="substring-after($text,$replace)" />
                    <xsl:with-param name="replace" select="$replace" />
                    <xsl:with-param name="by" select="$by" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="/">
        <soapenv:Body>
            <nmp:obtenerPartidasClienteResponse>
                <nmp:partidas>
                    <xsl:for-each select="soapenv:Body/urn:obtenerCreditosPorClienteResponse/urn:creditosCliente/cred:DetalleCreditoResponseType">
                        <nmp:partida>
                            <xsl:variable name="diaDP">
                                <xsl:choose>
                                    <xsl:when test="cred:condiciones/cred:parametros/cred:Parametro[./cred:abreviatura='DPD'][1]/cred:valor = 0">
                                        <xsl:value-of select="xp20:format-dateTime(fn:current-dateTime(),'[Y0001]-[M01]-[D01]')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="xp20:subtract-dayTimeDuration-from-dateTime(xp20:current-date(), concat('P',round(cred:condiciones/cred:parametros/cred:Parametro[./cred:abreviatura='DPD'][1]/cred:valor),'D'))"/>
                                    </xsl:otherwise>                                    
                                </xsl:choose>                                
                            </xsl:variable>                            
                            <nmp:prenda>
                                <nmp:folio>
                                    <xsl:value-of select="cred:prenda/cred:folio"/>
                                </nmp:folio>  
                                <nmp:sucursal>
                                    <xsl:value-of select="cred:prenda/cred:sucursal"/>
                                </nmp:sucursal>       
                                <nmp:descripcion>
                                    <!--xsl:value-of select="cred:prenda/cred:descripcion"/-->
                                    <xsl:call-template name="string-replace-all">
                                        <xsl:with-param name="text" select="cred:prenda/cred:descripcion" />
                                        <xsl:with-param name="replace" select="'..'" />
                                        <xsl:with-param name="by" select="' '" />
                                    </xsl:call-template>
                                </nmp:descripcion>
                                <nmp:tipoContrato>
                                    <xsl:value-of select="cred:prenda/cred:tipoContrato"/>
                                </nmp:tipoContrato>
                                <xsl:choose>
                                    <xsl:when test="xp20:format-dateTime(cred:condiciones/cred:fechaIngreso,'[Y0001]-[M01]-[D01]') &lt;= $diaDP">
                                        <nmp:operable>true</nmp:operable>
                                    </xsl:when>                                 
                                    <xsl:otherwise>
                                        <nmp:operable>false</nmp:operable>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </nmp:prenda> 
                            <nmp:condiciones>             
                                <nmp:fechaIngreso>
                                    <xsl:value-of select="cred:condiciones/cred:fechaIngreso"/>
                                </nmp:fechaIngreso>
                                <nmp:fechaLimitePago>
                                    <xsl:value-of select="cred:condiciones/cred:fechaLimitePago"/>
                                </nmp:fechaLimitePago>
                                <nmp:fechaComercializacion>
                                    <xsl:value-of select="cred:condiciones/cred:fechaComercializacion"/>
                                </nmp:fechaComercializacion>
                                <nmp:fechaIngresoDeposito>
                                    <xsl:value-of select="cred:condiciones/cred:fechaIngresoDeposito"/>
                                </nmp:fechaIngresoDeposito>                
                            </nmp:condiciones>  
                            <xsl:if test="cred:saldoPL/*">
                                <nmp:saldoPL>                              
                                    <nmp:saldoInsoluto>
                                        <xsl:value-of select="cred:saldoPL/cred:saldoInsoluto"/>
                                    </nmp:saldoInsoluto>                              
                                    <nmp:abonosCapital>
                                        <xsl:value-of select="cred:saldoPL/cred:abonosCapital"/>
                                    </nmp:abonosCapital>                              
                                    <nmp:interesesPagados>
                                        <xsl:value-of select="cred:saldoPL/cred:interesesPagados"/>
                                    </nmp:interesesPagados>                               
                                    <nmp:interesPendiente>
                                        <xsl:value-of select="cred:saldoPL/cred:interesPendiente"/>
                                    </nmp:interesPendiente>                               
                                    <nmp:fecha>
                                        <xsl:value-of select="cred:saldoPL/cred:fecha"/>
                                    </nmp:fecha>                                
                                    <nmp:ivaSobreInteresPendiente>
                                        <xsl:value-of select="cred:saldoPL/cred:ivaSobreInteresPendiente"/>
                                    </nmp:ivaSobreInteresPendiente>                                
                                    <nmp:comisionPendiente>
                                        <xsl:value-of select="cred:saldoPL/cred:comisionPendiente"/>
                                    </nmp:comisionPendiente>                                
                                    <nmp:ultimoAbono>                                    
                                        <nmp:saldoInsolutoAnterior>
                                            <xsl:value-of select="cred:saldoPL/cred:ultimoAbono/cred:saldoInsolutoAnterior"/>
                                        </nmp:saldoInsolutoAnterior>                                    
                                        <nmp:amortizacionUltimoAbono>
                                            <xsl:value-of select="cred:saldoPL/cred:ultimoAbono/cred:amortizacionUltimoAbono"/>
                                        </nmp:amortizacionUltimoAbono>                                    
                                        <nmp:abonoCancelado>
                                            <xsl:value-of select="cred:saldoPL/cred:ultimoAbono/cred:abonoCancelado"/>
                                        </nmp:abonoCancelado>
                                    </nmp:ultimoAbono>
                                </nmp:saldoPL> 
                            </xsl:if>                            
                        </nmp:partida>
                    </xsl:for-each>
                </nmp:partidas>                
            </nmp:obtenerPartidasClienteResponse>
        </soapenv:Body>
    </xsl:template>
</xsl:stylesheet>