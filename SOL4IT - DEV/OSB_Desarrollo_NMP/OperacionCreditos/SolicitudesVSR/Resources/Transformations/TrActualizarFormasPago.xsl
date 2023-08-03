<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sol="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR"
    xmlns:cot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="datosActualizar"/>    
    <xsl:variable name="datos">
        <sol:nmpFormasPagoCollection>
            <xsl:copy-of select="$datosActualizar/*"/>
            <xsl:copy-of select="/sol:nmpFormasPagoCollection/*"/>
        </sol:nmpFormasPagoCollection>
    </xsl:variable>
    <xsl:template match="/">
        <sol:nmpFormasPagoCollection>
            <xsl:for-each-group
                select="$datos/sol:nmpFormasPagoCollection/sol:NmpFormasPago"
                group-by="cot:idFormaPago">
                <xsl:copy-of select="."/>
            </xsl:for-each-group>            
        </sol:nmpFormasPagoCollection>
    </xsl:template>
</xsl:stylesheet>