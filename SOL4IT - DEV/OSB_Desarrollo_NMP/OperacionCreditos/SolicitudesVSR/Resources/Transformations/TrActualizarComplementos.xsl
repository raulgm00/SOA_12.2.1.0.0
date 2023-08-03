<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    
    xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="datosActualizar"/>    
    <xsl:variable name="datos">
        <veh:nmpGrupoComplementosCollection>
            <xsl:copy-of select="$datosActualizar/*"/>
            <xsl:copy-of select="/veh:nmpGrupoComplementosCollection/*"/>
        </veh:nmpGrupoComplementosCollection>
    </xsl:variable>
    <xsl:template match="/">
        <veh:nmpGrupoComplementosCollection>
            <xsl:for-each-group
                select="$datos/veh:nmpGrupoComplementosCollection/veh:NmpGrupoComplementos"
                group-by="veh:idComplemento">
                <xsl:copy-of select="."/>
            </xsl:for-each-group>            
        </veh:nmpGrupoComplementosCollection>
    </xsl:template>
</xsl:stylesheet>