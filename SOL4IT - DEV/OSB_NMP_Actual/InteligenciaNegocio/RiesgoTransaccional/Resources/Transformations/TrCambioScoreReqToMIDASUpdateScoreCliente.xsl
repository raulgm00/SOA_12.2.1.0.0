<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal"
    xmlns:can="http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel"
    xmlns:ries="http://servicios.montepiedad.com.mx/NMP/Schema/RiesgoTransaccional"
    xmlns:rt="http://servicios.montepiedad.com.mx/NMP/Schema/commons/RT"
    exclude-result-prefixes="xs rt ries"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <nmp:Scoring>
            <nmp:scoreRequest>
                <xsl:if test="//rt:CalificacionAjustada">
                <can:CalificacionAjustada><xsl:value-of select="//rt:CalificacionAjustada"/></can:CalificacionAjustada>
                </xsl:if>
                <xsl:if test="//rt:CalificacionMidas">
                <can:CalificacionMidas><xsl:value-of select="//rt:CalificacionMidas"/></can:CalificacionMidas>
                </xsl:if>
                <xsl:if test="//rt:CalificacionReal"> 
                <can:CalificacionReal><xsl:value-of select="//rt:CalificacionReal"/></can:CalificacionReal>
                </xsl:if>
                <xsl:if test="//rt:CalificacionSIVA2">
                <can:CalificacionSIVA2><xsl:value-of select="//rt:CalificacionSIVA2" /></can:CalificacionSIVA2>
                </xsl:if>
                <xsl:if test="//rt:CapacidadPago">
                    <can:CapacidadPago><xsl:value-of select="//rt:CapacidadPago"/></can:CapacidadPago>
                </xsl:if>
                <xsl:if test="//rt:FechaIngreso">
                    <can:FechaIngreso><xsl:value-of select="//rt:FechaIngreso"/></can:FechaIngreso>
                </xsl:if>
                <xsl:if test="//rt:GradoConfianza">
                    <can:GradoConfianza><xsl:value-of select="//rt:GradoConfianza"/></can:GradoConfianza>
                </xsl:if>
                <xsl:if test="//rt:IdCliente">
                    <can:IdCliente><xsl:value-of select="//rt:IdCliente"/></can:IdCliente>
                </xsl:if>
                <xsl:if test="//rt:IndiceRecuperacion">
                    <can:IndiceRecuperacion><xsl:value-of select="//rt:IndiceRecuperacion" /></can:IndiceRecuperacion>
                </xsl:if>
                <xsl:if test="//rt:idCaso">
                    <can:NumeroCaso><xsl:value-of select="//rt:idCaso"/></can:NumeroCaso>
                </xsl:if>
                <xsl:if test="//rt:Pagos">
                    <can:Pagos><xsl:value-of select="//rt:Pagos"/></can:Pagos>
                </xsl:if>
                <xsl:if test="//rt:PorcentajeDesempeño">
                    <can:PorcentajeDesempeño><xsl:value-of select="//rt:PorcentajeDesempeño"/></can:PorcentajeDesempeño>
                </xsl:if>
                <xsl:if test="//rt:PorcentajePrestamoValuacion">
                    <can:PorcentajePrestamoValuacion><xsl:value-of select="//rt:PorcentajePrestamoValuacion"/></can:PorcentajePrestamoValuacion>
                </xsl:if>
                <xsl:if test="//rt:PrestamoPromedio">
                    <can:PrestamoPromedio><xsl:value-of select="//rt:PrestamoPromedio" /></can:PrestamoPromedio>
                </xsl:if>
                <xsl:if test="//rt:Prestamos">
                    <can:Prestamos><xsl:value-of select="//rt:Prestamos"/></can:Prestamos>
                </xsl:if>
                <xsl:if test="//rt:ProbabilidadIncumplimiento">
                    <can:ProbabilidadIncumplimiento><xsl:value-of select="//rt:ProbabilidadIncumplimiento"/></can:ProbabilidadIncumplimiento>
                </xsl:if>
                <xsl:if test="//rt:SobreAforo">
                    <can:SobreAforo><xsl:value-of select="//rt:SobreAforo" /></can:SobreAforo>
                </xsl:if>
                <xsl:if test="//rt:SobreAforoAjustado">
                    <can:SobreAforoAjustado><xsl:value-of select="//rt:SobreAforoAjustado"/></can:SobreAforoAjustado>
                </xsl:if>
                <xsl:if test="//rt:SobreAforoSIVA2">
                    <can:SobreAforoSIVA2><xsl:value-of select="//rt:SobreAforoSIVA2" /></can:SobreAforoSIVA2>
                </xsl:if>
            </nmp:scoreRequest>
        </nmp:Scoring>
    </xsl:template>
</xsl:stylesheet>