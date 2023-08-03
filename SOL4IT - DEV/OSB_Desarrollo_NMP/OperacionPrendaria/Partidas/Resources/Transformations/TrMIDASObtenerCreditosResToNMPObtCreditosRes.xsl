<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:cred="http://nmpconsultacreditos.schema.nmp.servicios.montedepiedad.com.mx"
    xmlns:urn="urn:mx.com.nmp.midas" version="1.0">
    <xsl:template match="/">
        <soapenv:Body>
            <nmp:obtenerPartidasClienteResponse>
                <nmp:partidas>
                    <xsl:for-each select="soapenv:Body/urn:obtenerCreditosPorClienteResponse/urn:creditosCliente/cred:DetalleCreditoResponseType">
                        <nmp:partida>
                            <xsl:copy-of select="cred:prenda"/>
                            <!--xsl:copy-of select="cred:avaluoAlhajas"/-->
                            <!--xsl:copy-of select="cred:ubicacionDeposito"/-->
                            <!--xsl:copy-of select="cred:ubicacionAlmoneda"/-->
                            <xsl:copy-of select="cred:condiciones"/>
                            <xsl:copy-of select="cred:movimientos"/>
                            <xsl:copy-of select="cred:saldoPL"/>
                            <!--xsl:copy-of select="cred:comercial"/-->
                            <!--nmp:operaciones>
                                <nmp:operacion>
                                    <nmp:tipoOperacion>Refrendo</nmp:tipoOperacion>
                                    <nmp:monto>100.5</nmp:monto>
                                </nmp:operacion>
                                <nmp:operacion>
                                    <nmp:tipoOperacion>Desempeño</nmp:tipoOperacion>
                                    <nmp:monto>100.5</nmp:monto>
                                </nmp:operacion>
                            </nmp:operaciones-->
                        </nmp:partida>
                    </xsl:for-each>
                </nmp:partidas>
                
            </nmp:obtenerPartidasClienteResponse>
        </soapenv:Body>
    </xsl:template>
</xsl:stylesheet>