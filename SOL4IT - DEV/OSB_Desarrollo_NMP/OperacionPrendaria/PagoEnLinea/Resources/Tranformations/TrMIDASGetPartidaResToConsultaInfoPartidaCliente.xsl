<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:nmp1="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos"
    xmlns:nmp2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidaSaldos"
    xmlns:urn = "urn:mx.com.nmp.midas"
    xmlns:cli="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente"
    xmlns:dto = "http://dto.model.midas.nmp.com.mx" exclude-result-prefixes="urn dto">
    <xsl:param name="datosCliente"/>
    <xsl:template match="/">
        <nmp1:consultarInformacionPartidaResponse>
            <nmp1:partidaSaldos>
                <nmp2:folio>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:folio"/>
                </nmp2:folio>
                <nmp2:tipoContrato>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:tipoContrato"/>
                </nmp2:tipoContrato>
                <nmp2:sucursal>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:sucursal"/>
                </nmp2:sucursal>
                <nmp2:transaccion>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:transaccion"/>
                </nmp2:transaccion>
                <nmp2:idCliente>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:idCliente"/>
                </nmp2:idCliente>
                <nmp2:aplicarReempeno>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:aplicaReempenio"/>
                </nmp2:aplicarReempeno>
                <nmp2:prestamoPagado>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:prestamoPagado"/>
                </nmp2:prestamoPagado>
                <nmp2:numRefrendo>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:numeroRefrendo"/>
                </nmp2:numRefrendo>
                <nmp2:fechaComercializacion>
                    <xsl:value-of select="urn:obtenerInformacionPartidaResponse/urn:return/dto:fechaComercializacion"/>
                </nmp2:fechaComercializacion>
                <xsl:for-each select="urn:obtenerInformacionPartidaResponse/urn:return/dto:detalleOperacionOnline">
                    <nmp2:operacionesBancariasDisponibles>
                        <xsl:for-each select="dto:DetalleOperacionOnline">
                            <nmp2:detalleOperacionBancaria>
                                <nmp2:idOperacion>
                                    <xsl:value-of select="dto:idOperacion"/>
                                </nmp2:idOperacion>
                                <nmp2:montoMaximo>
                                    <xsl:value-of select="dto:montoMaximo"/>
                                </nmp2:montoMaximo>
                                <nmp2:montoMinimo>
                                    <xsl:value-of select="dto:montoMinimo"/>
                                </nmp2:montoMinimo>
                                <nmp2:nombreOperacion>
                                    <xsl:value-of select="dto:nombreOperacion"/>
                                </nmp2:nombreOperacion>
                            </nmp2:detalleOperacionBancaria>
                        </xsl:for-each>                    
                    </nmp2:operacionesBancariasDisponibles>
                </xsl:for-each>
            </nmp1:partidaSaldos>
            <nmp1:cliente>
                <nmp1:nombre>
                    <xsl:value-of select="$datosCliente/cli:Cliente/cli:nombre"/>
                </nmp1:nombre>
                <nmp1:apellidoPaterno>
                    <xsl:value-of select="$datosCliente/cli:Cliente/cli:apellidoPaterno"/>
                </nmp1:apellidoPaterno>
                <nmp1:apellidoMaterno>
                    <xsl:value-of select="$datosCliente/cli:Cliente/cli:apellidoMaterno"/>
                </nmp1:apellidoMaterno>
                <xsl:choose>
                    <xsl:when test="$datosCliente/cli:Cliente/cli:CorreosElectronicos/cli:CorreoElectronico[./cli:tipoEmail='RF y DL']">
                        <nmp1:correoElectronico>
                            <xsl:value-of select="$datosCliente/cli:Cliente/cli:CorreosElectronicos/cli:CorreoElectronico[./cli:tipoEmail='RF y DL']/cli:email"/>
                        </nmp1:correoElectronico>
                    </xsl:when>
                    <xsl:otherwise>
                        <nmp1:correoElectronico>
                            <xsl:value-of select="$datosCliente/cli:Cliente/cli:CorreosElectronicos/cli:CorreoElectronico[./cli:tipoEmail='Principal']/cli:email"/>
                        </nmp1:correoElectronico>
                    </xsl:otherwise>
                </xsl:choose>                
            </nmp1:cliente>
        </nmp1:consultarInformacionPartidaResponse>
    </xsl:template>
</xsl:stylesheet>