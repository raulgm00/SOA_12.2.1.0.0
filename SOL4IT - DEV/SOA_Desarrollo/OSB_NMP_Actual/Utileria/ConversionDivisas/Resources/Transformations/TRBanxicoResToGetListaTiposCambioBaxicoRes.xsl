<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:div="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Divisas"
  xmlns:bm="http://www.banxico.org.mx/structure/key_families/dgie/sie/series/compact"
  xmlns:cd="http://www.SDMX.org/resources/SDMXML/schemas/v1_0/message"
  xmlns:ser="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Divisas">
  <xsl:template match="/"><!-- Root template -->
    <div:ObtenerListaTiposCambioBanxicoResponse>
        <ser:serieLista>
            <xsl:for-each select="cd:CompactData/bm:DataSet/bm:Series">
                  <ser:serie>
                          <ser:tipoCambio>
                              <xsl:value-of select="@TITULO"/>
                          </ser:tipoCambio>
                          <ser:idSerie>
                              <xsl:value-of select="@IDSERIE"/>
                          </ser:idSerie>
                          <ser:frecuencia>
                              <xsl:value-of select="@BANXICO_FREQ"/>
                          </ser:frecuencia>
                          <ser:unidad>
                              <xsl:value-of select="@BANXICO_UNIT_TYPE"/>
                          </ser:unidad>
                          <ser:fecha>
                              <xsl:value-of select="bm:Obs/@TIME_PERIOD"/>
                          </ser:fecha>
                          <ser:valorFix>
                              <xsl:value-of select="bm:Obs/@OBS_VALUE"/>
                          </ser:valorFix>
                    </ser:serie>
            </xsl:for-each>
      </ser:serieLista>
    </div:ObtenerListaTiposCambioBanxicoResponse>
  </xsl:template>
</xsl:stylesheet>