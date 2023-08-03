<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="*">
        <xsl:copy><xsl:apply-templates/></xsl:copy>
    </xsl:template>    
    <xsl:template match="*[local-name()='NmpVehiculoInfo']//*">
        <xsl:element name="veh:{local-name()}" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*[local-name()='NmpDocumentosSolicitudInfo']/*">
        <xsl:element name="open:{local-name()}" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*[local-name()='NmpFormasPago']/*">
        <xsl:element name="cot:{local-name()}" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>