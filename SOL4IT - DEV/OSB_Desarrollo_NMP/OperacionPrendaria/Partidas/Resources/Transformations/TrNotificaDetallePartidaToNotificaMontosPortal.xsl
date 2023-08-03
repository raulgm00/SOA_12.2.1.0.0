<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:pm="http://servicios.montedepiedad.com.mx/NMP/SchemaNXSD/NMPPartidasMontos"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:par="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:cred="http://nmpconsultacreditos.schema.nmp.servicios.montedepiedad.com.mx"
    xmlns:urn="urn:mx.com.nmp.midas" version="1.0">
    <xsl:template match="/">
        <pm:notificarMontosCreditosRequest>
        <pm:requestGUID>
                    <xsl:value-of select="/soapenv:Body/par:notificarDetallePartidasRequest/par:trazabilidad/par:GUID"/>
                </pm:requestGUID>
            <pm:partidas>
                
                <xsl:for-each select="soapenv:Body/par:notificarDetallePartidasRequest/par:partidas/par:partida">
                    <pm:partida>
                        <pm:prenda>
                            <pm:folio>
                                <xsl:value-of select="par:prenda/par:folio"/>
                            </pm:folio>
                        </pm:prenda>                    
                        <pm:saldos>
                           <xsl:choose>
                               <xsl:when test="par:operaciones/par:operacion[1]/par:tipoOperacion='6'">
                                   <pm:saldoDesempeno>
                                       <xsl:value-of select="par:operaciones/par:operacion[1]/par:monto"/>
                                   </pm:saldoDesempeno>
                               </xsl:when>
                               <xsl:when test="par:operaciones/par:operacion[1]/par:tipoOperacion='8'">
                                   <pm:saldoRefrendo>
                                       <xsl:value-of select="par:operaciones/par:operacion[1]/par:monto"/>
                                   </pm:saldoRefrendo>
                               </xsl:when>
                           </xsl:choose>
                        </pm:saldos>
                        <pm:trazabilidad>
                            <pm:requestGUID>
                                <xsl:value-of select="/soapenv:Body/par:notificarDetallePartidasRequest/par:trazabilidad/par:GUID"/>
                            </pm:requestGUID>                            
                        </pm:trazabilidad>
                    </pm:partida>
                </xsl:for-each>  
                
            </pm:partidas>
        </pm:notificarMontosCreditosRequest>
    </xsl:template>
</xsl:stylesheet>