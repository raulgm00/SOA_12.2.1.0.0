<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/sp/TxHistoricasCliente"
    xmlns:txh="http://xmlns.oracle.com/pcbpel/adapter/db/TxHistoricasCliente"
    exclude-result-prefixes="db"
    version="1.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <txh:TxHistoricasClienteOutputCollection>
            <xsl:for-each select="//db:DATOS/db:Row">
                <txh:TxHistoricasClienteOutput>
                    <xsl:if test="db:Column/@name='SK_MOVIMIENTO'">
                        <txh:sk_movimiento><xsl:value-of select="db:Column[./@name='SK_MOVIMIENTO']/text()"/></txh:sk_movimiento>
                    </xsl:if>
                    <xsl:if test="db:Column/@name='NUM_FOLIO'">
                        <txh:num_folio><xsl:value-of select="db:Column[./@name='NUM_FOLIO']/text()"/></txh:num_folio>
                    </xsl:if>
                    <xsl:if test="db:Column/@name='DESC_MOVIMIENTO'">
                        <txh:desc_movimiento><xsl:value-of select="db:Column[./@name='DESC_MOVIMIENTO']/text()"/></txh:desc_movimiento>
                    </xsl:if>
                    <xsl:if test="db:Column/@name='DESC_IMPORTE'">
                        <txh:Desc_importe><xsl:value-of select="db:Column[./@name='DESC_IMPORTE']/text()"/></txh:Desc_importe>
                    </xsl:if>
                    <xsl:if test="db:Column/@name='SK_SUCURSALACTUAL'">
                        <txh:sk_sucursalactual><xsl:value-of select="db:Column[./@name='SK_SUCURSALACTUAL']/text()"/></txh:sk_sucursalactual>
                    </xsl:if>
                    <xsl:if test="db:Column/@name='FCH_OPERACION'">
                        <txh:fch_operacion><xsl:value-of select="db:Column[./@name='FCH_OPERACION']/text()"/></txh:fch_operacion>
                    </xsl:if>
                    <xsl:if test="db:Column/@name='IMP_PRESTAMO'">
                        <txh:IMP_PRESTAMO><xsl:value-of select="db:Column[./@name='IMP_PRESTAMO']/text()"/></txh:IMP_PRESTAMO>
                    </xsl:if>
                </txh:TxHistoricasClienteOutput>
            </xsl:for-each>
        </txh:TxHistoricasClienteOutputCollection>
    </xsl:template>
</xsl:stylesheet>