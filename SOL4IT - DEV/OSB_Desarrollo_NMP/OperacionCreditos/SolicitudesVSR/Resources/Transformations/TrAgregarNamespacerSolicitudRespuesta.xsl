<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="*">
        <xsl:copy><xsl:apply-templates/></xsl:copy>
    </xsl:template>    
    <xsl:template match="*[local-name()='NmpVehiculoInfo']//*">
        <xsl:element name="veh:{local-name()}" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo">
            <xsl:choose>
            <xsl:when test="local-name() = 'fechaEmisionFactura'">
              <xsl:value-of select="substring(.,1,10)"/>
            </xsl:when>
            <xsl:otherwise>
            <xsl:apply-templates/>
            </xsl:otherwise>
            </xsl:choose>
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