<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:txh="http://xmlns.oracle.com/pcbpel/adapter/db/TxHistoricasCliente"
    exclude-result-prefixes="txh xsl"
    version="1.0">
    <xsl:output indent="yes"/>
    <xsl:param name="txHist_DP"/>
    <xsl:param name="txHist_VB_VP"/>
    <xsl:template match="/">
        <TxHistoricasClienteOutputCollection 	xmlns="http://xmlns.oracle.com/pcbpel/adapter/db/TxHistoricasCliente" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <xsl:for-each select="//txh:TxHistoricasClienteOutput">
                <TxHistoricasClienteOutput>
                    <xsl:if test="txh:sk_movimiento">
                        <sk_movimiento><xsl:value-of select="txh:sk_movimiento"/></sk_movimiento>
                    </xsl:if>
                    <xsl:if test="txh:num_folio">
                        <num_folio><xsl:value-of select="txh:num_folio"/></num_folio>
                    </xsl:if>
                    <xsl:if test="txh:desc_movimiento">
                        <desc_movimiento><xsl:value-of select="txh:desc_movimiento"/></desc_movimiento>
                    </xsl:if>
                    <xsl:if test="txh:Desc_importe">
                        <Desc_importe><xsl:value-of select="txh:Desc_importe"/></Desc_importe>
                    </xsl:if>
                    <xsl:if test="txh:sk_sucursalactual">
                        <sk_sucursalactual><xsl:value-of select="txh:sk_sucursalactual"/></sk_sucursalactual>
                    </xsl:if>
                    <xsl:if test="txh:fch_operacion">
                        <fch_operacion><xsl:value-of select="txh:fch_operacion"/></fch_operacion>
                    </xsl:if>
                    <xsl:if test="txh:imp_prestamo">
                        <imp_prestamo><xsl:value-of select="txh:imp_prestamo"/></imp_prestamo>
                    </xsl:if>
                </TxHistoricasClienteOutput>
            </xsl:for-each>
            <xsl:for-each select="$txHist_VB_VP/txh:TxHistoricasClienteOutputCollection/txh:TxHistoricasClienteOutput">
                <TxHistoricasClienteOutput>
                    <xsl:if test="txh:sk_movimiento">
                        <sk_movimiento><xsl:value-of select="txh:sk_movimiento"/></sk_movimiento>
                    </xsl:if>
                    <xsl:if test="txh:num_folio">
                        <num_folio><xsl:value-of select="txh:num_folio"/></num_folio>
                    </xsl:if>
                    <xsl:if test="txh:desc_movimiento">
                        <desc_movimiento><xsl:value-of select="txh:desc_movimiento"/></desc_movimiento>
                    </xsl:if>
                    <xsl:if test="txh:Desc_importe">
                        <Desc_importe><xsl:value-of select="txh:Desc_importe"/></Desc_importe>
                    </xsl:if>
                    <xsl:if test="txh:sk_sucursalactual">
                        <sk_sucursalactual><xsl:value-of select="txh:sk_sucursalactual"/></sk_sucursalactual>
                    </xsl:if>
                    <xsl:if test="txh:fch_operacion">
                        <fch_operacion><xsl:value-of select="txh:fch_operacion"/></fch_operacion>
                    </xsl:if>
                    <xsl:if test="txh:imp_prestamo">
                        <imp_prestamo><xsl:value-of select="txh:imp_prestamo"/></imp_prestamo>
                    </xsl:if>
                </TxHistoricasClienteOutput>
              </xsl:for-each>
               <xsl:for-each select="$txHist_DP/txh:TxHistoricasClienteOutputCollection/txh:TxHistoricasClienteOutput">
                <TxHistoricasClienteOutput>
                    <xsl:if test="txh:sk_movimiento">
                        <sk_movimiento><xsl:value-of select="txh:sk_movimiento"/></sk_movimiento>
                    </xsl:if>
                    <xsl:if test="txh:num_folio">
                        <num_folio><xsl:value-of select="txh:num_folio"/></num_folio>
                    </xsl:if>
                    <xsl:if test="txh:desc_movimiento">
                        <desc_movimiento><xsl:value-of select="txh:desc_movimiento"/></desc_movimiento>
                    </xsl:if>
                    <xsl:if test="txh:Desc_importe">
                        <Desc_importe><xsl:value-of select="txh:Desc_importe"/></Desc_importe>
                    </xsl:if>
                    <xsl:if test="txh:sk_sucursalactual">
                        <sk_sucursalactual><xsl:value-of select="txh:sk_sucursalactual"/></sk_sucursalactual>
                    </xsl:if>
                    <xsl:if test="txh:fch_operacion">
                        <fch_operacion><xsl:value-of select="txh:fch_operacion"/></fch_operacion>
                    </xsl:if>
                    <xsl:if test="txh:imp_prestamo">
                        <imp_prestamo><xsl:value-of select="txh:imp_prestamo"/></imp_prestamo>
                    </xsl:if>
                </TxHistoricasClienteOutput>
              </xsl:for-each>
        </TxHistoricasClienteOutputCollection>
    </xsl:template>
</xsl:stylesheet>