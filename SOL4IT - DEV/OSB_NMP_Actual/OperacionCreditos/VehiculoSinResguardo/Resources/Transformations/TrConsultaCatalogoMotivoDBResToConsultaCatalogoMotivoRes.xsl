<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:caFin='http://servicios.montedepiedad.com.mx/NMP/Schema/FlujoVehiculosSinResguardo/Catalogos'>
  <xsl:template match="/">
  <caFin:obtenerMotivosRechazoResponse>
    <xsl:for-each select="/caFin:NmpCatalogosRechazoCollection/caFin:NmpCatalogosRechazo">
      <caFin:motivoRechazo>
        <caFin:id><xsl:value-of select="caFin:id"></xsl:value-of></caFin:id>
        <caFin:descripcion><xsl:value-of select="caFin:descripcion"></xsl:value-of></caFin:descripcion>
         <caFin:etapa><xsl:value-of select="caFin:etapa"></xsl:value-of></caFin:etapa>
         <caFin:rol><xsl:value-of select="caFin:rol"></xsl:value-of></caFin:rol>
      </caFin:motivoRechazo>
    </xsl:for-each>
  </caFin:obtenerMotivosRechazoResponse>
  </xsl:template>
</xsl:stylesheet>