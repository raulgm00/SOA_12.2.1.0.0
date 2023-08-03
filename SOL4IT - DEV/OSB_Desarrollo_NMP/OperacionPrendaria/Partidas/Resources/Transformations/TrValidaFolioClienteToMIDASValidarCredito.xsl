<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:urn="urn:mx.com.nmp.midas"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:ccf="http://servicios.montedepiedad.com.mx/NMP/Schema/ConsultaCreditosFiltros"
    xmlns:nmpp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPartidas"
    xmlns:nmp="http://nmpconsultacreditos.schema.nmp.servicios.montedepiedad.com.mx" version="1.0" exclude-result-prefixes="ccf nmpp soapenv">
    <xsl:output indent="yes"/>
    <xsl:param name="filtros"/>
    <xsl:template match="/">
        <urn:validarClientePorCredito>
            <urn:cliente>
                <nmp:estados>
                    <xsl:for-each select="$filtros/ccf:NmpConsultasCat/ccf:nmpFiltrosEstadosCreditoCollection/ccf:NmpFiltrosEstadosCredito">
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
                <nmp:folio>
                    <xsl:value-of select="soapenv:Body/nmpp:validarContratoClienteRequest/nmpp:folio"/>
                </nmp:folio>
                <nmp:idCliente>
                    <xsl:value-of
                        select="soapenv:Body/nmpp:validarContratoClienteRequest/nmpp:idCliente"/>
                </nmp:idCliente>
            </urn:cliente>
        </urn:validarClientePorCredito>
    </xsl:template>
</xsl:stylesheet>