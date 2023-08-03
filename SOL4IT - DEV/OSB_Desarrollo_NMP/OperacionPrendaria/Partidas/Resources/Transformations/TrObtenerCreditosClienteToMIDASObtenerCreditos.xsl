<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:urn="urn:mx.com.nmp.midas"
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"  
    xmlns:ccf="http://servicios.montedepiedad.com.mx/NMP/Schema/ConsultaCreditosFiltros"
    xmlns:nmpp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:nmp="http://nmpconsultacreditos.schema.nmp.servicios.montedepiedad.com.mx"
    xmlns:nmp1="http://nmputil.schema.nmp.servicios.montedepiedad.com.mx" version="1.0"
    exclude-result-prefixes="ccf nmpp soap nmp1 urn xsl">
    <xsl:output indent="yes"/>
    <xsl:param name="filtros"/>
    <xsl:template match="/">
        <soap:Body>
            <urn:obtenerCreditosPorCliente>
                <urn:criterios>
                    <nmp:criterios>
                        <nmp:campoOrdenamiento>
                            <xsl:value-of
                                select="$filtros/ccf:NmpConsultasCat/ccf:campoOrdenamiento"/>
                        </nmp:campoOrdenamiento>
                        <nmp:detalles>
                            <xsl:for-each
                                select="$filtros/ccf:NmpConsultasCat/ccf:nmpFiltrosDetalleCollection/ccf:NmpFiltrosDetalle">
                                <urn:string>
                                    <xsl:value-of select="ccf:nombreDetalle"/>
                                </urn:string>
                            </xsl:for-each>
                        </nmp:detalles>
                        <nmp:estados>
                            <xsl:for-each
                                select="$filtros/ccf:NmpConsultasCat/ccf:nmpFiltrosEstadosCreditoCollection/ccf:NmpFiltrosEstadosCredito">
                                <nmp:EstadosCredito>
                                    <nmp:estadoCaja>
                                        <xsl:value-of select="ccf:idEstadoCaja"/>
                                    </nmp:estadoCaja>
                                    <nmp:estadoPrenda>
                                        <xsl:value-of select="ccf:idEstadoPrenda"/>
                                    </nmp:estadoPrenda>
                                </nmp:EstadosCredito>
                            </xsl:for-each>
                        </nmp:estados>
                        <nmp:numeroMaximoResultados>
                            <xsl:value-of select="$filtros/ccf:NmpConsultasCat/ccf:numMaxResultados"/>
                        </nmp:numeroMaximoResultados>
                        <nmp:rangosFecha>
                            <xsl:choose>
                                <xsl:when test="$filtros/ccf:NmpConsultasCat/ccf:numRangoFechaPost > 0  or $filtros/ccf:NmpConsultasCat/ccf:numRangoFechaPre > 0 ">
                                    <nmp1:TipoRangoFecha>                                        
                                        <nmp1:rangoFecha>                                            
                                            <xsl:choose>
                                                <xsl:when test="$filtros/ccf:NmpConsultasCat/ccf:numRangoFechaPost &gt; 0">                                                    
                                                    <nmp1:fechaFin>
                                                        <xsl:value-of select="xp20:add-dayTimeDuration-to-dateTime(xp20:current-dateTime(), concat('P',$filtros/ccf:NmpConsultasCat/ccf:numRangoFechaPost/text(),'D'))"/>
                                                    </nmp1:fechaFin>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <nmp1:fechaFin>
                                                        <xsl:value-of select="xp20:current-dateTime()"/>
                                                    </nmp1:fechaFin>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="$filtros/ccf:NmpConsultasCat/ccf:numRangoFechaPre &gt; 0">
                                                    <nmp1:fechaInicio>
                                                        <xsl:value-of select="xp20:subtract-dayTimeDuration-from-dateTime(xp20:current-date(), concat('P',$filtros/ccf:NmpConsultasCat/ccf:numRangoFechaPre,'D'))"/>
                                                    </nmp1:fechaInicio>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <nmp1:fechaInicio>
                                                        <xsl:value-of select="xp20:current-dateTime()"/>
                                                    </nmp1:fechaInicio>
                                                </xsl:otherwise>
                                            </xsl:choose>                                            
                                        </nmp1:rangoFecha>
                                        <nmp1:tipoFecha>
                                            <xsl:value-of select="$filtros/ccf:NmpConsultasCat/ccf:tipoFecha"/>
                                        </nmp1:tipoFecha>
                                    </nmp1:TipoRangoFecha>
                                </xsl:when>
                            </xsl:choose>
                        </nmp:rangosFecha>
                        <nmp:rangosSucursal>
                            <xsl:for-each select="$filtros/ccf:NmpConsultasCat/ccf:nmpSucursalesFiltrosCatCollection/ccf:NmpSucursalesFiltrosCat">
                                <nmp:RangoSucursal>
                                    <!--Optional:-->
                                    <nmp:sucursalFinal>
                                        <xsl:value-of select="ccf:sucursalFinal"/>
                                    </nmp:sucursalFinal>
                                    <!--Optional:-->
                                    <nmp:sucursalInicial>
                                        <xsl:value-of select="ccf:sucursalInicial"/>
                                    </nmp:sucursalInicial>
                                </nmp:RangoSucursal>
                            </xsl:for-each>                           
                        </nmp:rangosSucursal>
                        <nmp:tipoOrdenamiento>
                            <xsl:value-of select="$filtros/ccf:NmpConsultasCat/ccf:tipoOrdenamiento"/>
                        </nmp:tipoOrdenamiento>
                    </nmp:criterios>
                    <nmp:idCliente>
                        <xsl:value-of select="soap:Body/nmpp:obtenerPartidasClienteRequest/nmpp:idCliente"/>
                    </nmp:idCliente>
                </urn:criterios>
            </urn:obtenerCreditosPorCliente>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>