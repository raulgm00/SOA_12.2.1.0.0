<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:dat="http://nmp.com.mx/ms/pagos/motorformulas/ws/formulas/datatypes/"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:nmpp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:urn="urn:mx.com.nmp.midas" version="2.0">
    <xsl:param name="dias"/>
    <xsl:param name="operacion"/>
    <xsl:template match="/">       
        <dat:resolverFormula>
            <dat:fechaCalculo>
                <xsl:value-of select="xp20:format-dateTime(fn:current-dateTime(),'[Y0001]-[M01]-[D01]')"/>
            </dat:fechaCalculo>
            <dat:operacion>
                <xsl:value-of select="$operacion"></xsl:value-of>
            </dat:operacion>
            <xsl:for-each select="$dias/urn:obtenerDiasInhabilesSucursal/urn:dateTime">
                <dat:diasInhabiles>
                    <xsl:value-of select="."/>
                </dat:diasInhabiles>
            </xsl:for-each>           
            <dat:condiciones>
                <dat:contrato>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:contrato"></xsl:value-of>
                </dat:contrato>
                <dat:fechaIngreso>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:fechaIngreso"></xsl:value-of>
                </dat:fechaIngreso>
                <dat:fechaLimitePago>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:fechaLimitePago"></xsl:value-of>
                </dat:fechaLimitePago>
                <dat:fechaComercializacion>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:fechaComercializacion"></xsl:value-of>
                </dat:fechaComercializacion>
                <dat:fechaIngresoDeposito>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:fechaIngresoDeposito"></xsl:value-of>
                </dat:fechaIngresoDeposito>
                <dat:numeroMaximoRefrendos>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:numeroMaximoRefrendos"></xsl:value-of>
                </dat:numeroMaximoRefrendos>
                <dat:numeroRefrendosRealizados>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:numeroRefrendosRealizados"></xsl:value-of>
                </dat:numeroRefrendosRealizados>
                <dat:interes>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:interes"></xsl:value-of>
                </dat:interes>
                <dat:tipoSeguro>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:tipoSeguro"></xsl:value-of>
                </dat:tipoSeguro>
                <dat:reposicionBillete>
                    <xsl:value-of select="nmpp:partida/nmpp:condiciones/nmpp:reposicionBillete"></xsl:value-of>
                </dat:reposicionBillete>
                <dat:parametros>
                    <xsl:for-each select="nmpp:partida/nmpp:condiciones/nmpp:parametros/nmpp:Parametro">
                        <dat:parametro>
                            <dat:abreviatura>
                                <xsl:value-of select="nmpp:abreviatura"></xsl:value-of>
                            </dat:abreviatura>
                            <dat:valor>
                                <xsl:value-of select="nmpp:valor"></xsl:value-of>
                            </dat:valor>
                        </dat:parametro>
                    </xsl:for-each>                    
                </dat:parametros>
            </dat:condiciones>
            <xsl:if test="nmpp:partida/nmpp:saldoPL/*">
                <dat:saldoPL>
                    <dat:saldoInsoluto>
                        <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:saldoInsoluto"></xsl:value-of>
                    </dat:saldoInsoluto>
                    <dat:abonosCapital>
                        <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:abonosCapital"></xsl:value-of>
                    </dat:abonosCapital>
                    <dat:interesesPagados>
                        <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:interesesPagados"></xsl:value-of>
                    </dat:interesesPagados>
                    <dat:interesPendiente>
                        <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:interesPendiente"></xsl:value-of>
                    </dat:interesPendiente>
                    <dat:fecha>
                        <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:fecha"></xsl:value-of>
                    </dat:fecha>
                    <dat:ivaSobreInteresPendiente>
                        <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:ivaSobreInteresPendiente"></xsl:value-of>
                    </dat:ivaSobreInteresPendiente>
                    <dat:comisionPendiente>
                        <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:comisionPendiente"></xsl:value-of>
                    </dat:comisionPendiente>
                    <dat:ultimoAbono>
                        <dat:saldoInsoluto>
                            <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:ultimoAbono/nmpp:saldoInsolutoAnterior"></xsl:value-of>
                        </dat:saldoInsoluto>
                        <dat:amortizacion>
                            <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:ultimoAbono/nmpp:amortizacionUltimoAbono"></xsl:value-of>
                        </dat:amortizacion>
                        <dat:cancelado>
                            <xsl:value-of select="nmpp:partida/nmpp:saldoPL/nmpp:ultimoAbono/nmpp:abonoCancelado"></xsl:value-of>
                        </dat:cancelado>
                    </dat:ultimoAbono>
                </dat:saldoPL>
            </xsl:if>  
            <dat:prenda>
                <dat:folio>
                    <xsl:value-of select="nmpp:partida/nmpp:prenda/nmpp:folio"></xsl:value-of>
                </dat:folio>
                <dat:montoAvaluo>
                    <xsl:value-of select="nmpp:partida/nmpp:prenda/nmpp:montoAvaluo"></xsl:value-of>
                </dat:montoAvaluo>
                <dat:montoPrestamo>
                    <xsl:value-of select="nmpp:partida/nmpp:prenda/nmpp:montoPrestamo"></xsl:value-of>
                </dat:montoPrestamo>
            </dat:prenda>
            <xsl:if test="nmpp:partida/nmpp:comercial/*">
                <dat:comercial>
                    <dat:canalIngresoId>
                        <xsl:value-of select="nmpp:partida/nmpp:comercial/nmpp:canalIngresoId"></xsl:value-of>
                    </dat:canalIngresoId>
                    <dat:precioVenta>
                        <xsl:value-of select="nmpp:partida/nmpp:comercial/nmpp:precioVenta"></xsl:value-of>
                    </dat:precioVenta>
                    <dat:utilidad>
                        <xsl:value-of select="nmpp:partida/nmpp:comercial/nmpp:utilidad"></xsl:value-of>
                    </dat:utilidad>
                    <dat:fechaIngresoAlmoneda>
                        <xsl:value-of select="nmpp:partida/nmpp:comercial/nmpp:fechaIngresoAlmoneda"></xsl:value-of>
                    </dat:fechaIngresoAlmoneda>
                </dat:comercial>
            </xsl:if>            
        </dat:resolverFormula>
    </xsl:template>
</xsl:stylesheet>