<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"   
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"  
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:dat="http://nmp.com.mx/ms/pagos/motorformulas/ws/formulas/datatypes/">
    <xsl:output indent="yes"></xsl:output>
    <xsl:param name="operacionesMontos"></xsl:param>
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
            <nmp:consultarPartidasFolioResponse>
                <nmp:partidas>
                    <xsl:for-each select="soapenv:Body/nmp:consultarPartidasFolioResponse/nmp:partidas/nmp:partida">
                        <nmp:partida>
                            <xsl:variable name="diaDP">
                                <xsl:choose>
                                    <xsl:when test="nmp:condiciones/nmp:parametros/nmp:Parametro[./nmp:abreviatura='DPD']/nmp:valor = 0">
                                        <xsl:value-of select="xp20:format-dateTime(fn:current-dateTime(),'[Y0001]-[M01]-[D01]')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="xp20:subtract-dayTimeDuration-from-dateTime(xp20:current-date(), concat('P',round(nmp:condiciones/nmp:parametros/nmp:Parametro[./nmp:abreviatura='DPD'][1]/nmp:valor),'D'))"/>
                                    </xsl:otherwise>                                    
                                </xsl:choose>                                
                            </xsl:variable>                                          
                            <nmp:prenda>
                                <nmp:folio>
                                    <xsl:value-of select="nmp:prenda/nmp:folio"/>
                                </nmp:folio> 
                                <nmp:sucursal>
                                    <xsl:value-of select="nmp:prenda/nmp:sucursal"/>
                                </nmp:sucursal>   
                                <nmp:descripcion>
                                    <!--xsl:value-of select="nmp:prenda/nmp:descripcion"/-->
                                    <xsl:call-template name="string-replace-all">
                                        <xsl:with-param name="text" select="nmp:prenda/nmp:descripcion" />
                                        <xsl:with-param name="replace" select="'..'" />
                                        <xsl:with-param name="by" select="' '" />
                                    </xsl:call-template>
                                </nmp:descripcion>
                                <nmp:tipoContrato>
                                    <xsl:value-of select="nmp:prenda/nmp:tipoContrato"/>
                                </nmp:tipoContrato>
                                <xsl:choose>
                                    <xsl:when test="xp20:format-dateTime(nmp:condiciones/nmp:fechaIngreso,'[Y0001]-[M01]-[D01]') &lt;= $diaDP">
                                        <nmp:operable>true</nmp:operable>
                                    </xsl:when>                                   
                                    <xsl:otherwise>
                                        <nmp:operable>false</nmp:operable>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </nmp:prenda> 
                            <!--xsl:copy-of select="cred:avaluoAlhajas"/-->
                            <!--xsl:copy-of select="cred:ubicacionDeposito"/-->
                            <!--xsl:copy-of select="cred:ubicacionAlmoneda"/-->
                            <!--xsl:copy-of select="nmp:condiciones"/-->
                            <nmp:condiciones>             
                                <nmp:fechaIngreso>
                                    <xsl:value-of select="nmp:condiciones/nmp:fechaIngreso"/>
                                </nmp:fechaIngreso>
                                <nmp:fechaLimitePago>
                                    <xsl:value-of select="nmp:condiciones/nmp:fechaLimitePago"/>
                                </nmp:fechaLimitePago>
                                <nmp:fechaComercializacion>
                                    <xsl:value-of select="nmp:condiciones/nmp:fechaComercializacion"/>
                                </nmp:fechaComercializacion>
                                <nmp:fechaIngresoDeposito>
                                    <xsl:value-of select="nmp:condiciones/nmp:fechaIngresoDeposito"/>
                                </nmp:fechaIngresoDeposito>                
                            </nmp:condiciones>  
                            <!--xsl:copy-of select="nmp:movimientos"/-->
                            <!--xsl:copy-of select="nmp:saldoPL"/-->
                            <xsl:if test="nmp:saldoPL/*">
                                <nmp:saldoPL>                              
                                    <nmp:saldoInsoluto>
                                        <xsl:value-of select="nmp:saldoPL/nmp:saldoInsoluto"/>
                                    </nmp:saldoInsoluto>                              
                                    <nmp:abonosCapital>
                                        <xsl:value-of select="nmp:saldoPL/nmp:abonosCapital"/>
                                    </nmp:abonosCapital>                              
                                    <nmp:interesesPagados>
                                        <xsl:value-of select="nmp:saldoPL/nmp:interesesPagados"/>
                                    </nmp:interesesPagados>                               
                                    <nmp:interesPendiente>
                                        <xsl:value-of select="nmp:saldoPL/nmp:interesPendiente"/>
                                    </nmp:interesPendiente>                               
                                    <nmp:fecha>
                                        <xsl:value-of select="nmp:saldoPL/nmp:fecha"/>
                                    </nmp:fecha>                                
                                    <nmp:ivaSobreInteresPendiente>
                                        <xsl:value-of select="nmp:saldoPL/nmp:ivaSobreInteresPendiente"/>
                                    </nmp:ivaSobreInteresPendiente>                                
                                    <nmp:comisionPendiente>
                                        <xsl:value-of select="nmp:saldoPL/nmp:comisionPendiente"/>
                                    </nmp:comisionPendiente>                                
                                    <nmp:ultimoAbono>                                    
                                        <nmp:saldoInsolutoAnterior>
                                            <xsl:value-of select="nmp:saldoPL/nmp:ultimoAbono/nmp:saldoInsolutoAnterior"/>
                                        </nmp:saldoInsolutoAnterior>                                    
                                        <nmp:amortizacionUltimoAbono>
                                            <xsl:value-of select="nmp:saldoPL/nmp:ultimoAbono/nmp:amortizacionUltimoAbono"/>
                                        </nmp:amortizacionUltimoAbono>                                    
                                        <nmp:abonoCancelado>
                                            <xsl:value-of select="nmp:saldoPL/nmp:ultimoAbono/nmp:abonoCancelado"/>
                                        </nmp:abonoCancelado>
                                    </nmp:ultimoAbono>
                                </nmp:saldoPL> 
                            </xsl:if>                            
                            <!--xsl:copy-of select="nmp:comercial"/-->
                            <nmp:operaciones>
                                <xsl:for-each select="$operacionesMontos/dat:resolverFormulaResponse">
                                    <nmp:operacion>
                                        <nmp:tipoOperacion>
                                            <xsl:choose>
                                                <xsl:when test="dat:operacion='6'">Desempeño</xsl:when>
                                                <xsl:when test="dat:operacion='8'">Refrendo</xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="dat:operacion"/>
                                                </xsl:otherwise>
                                            </xsl:choose>                                            
                                        </nmp:tipoOperacion>
                                        <nmp:monto>
                                            <xsl:value-of select="dat:total"/>
                                        </nmp:monto>
                                    </nmp:operacion>
                                </xsl:for-each>
                            </nmp:operaciones>
                        </nmp:partida>
                    </xsl:for-each>
                </nmp:partidas>                
            </nmp:consultarPartidasFolioResponse>
        </soapenv:Body>
    </xsl:template>
</xsl:stylesheet>