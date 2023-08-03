<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="ges">
  <xsl:param name="error"/>
  <xsl:output indent="yes" method="xml" cdata-section-elements="td"/>
  <xsl:template match="/">
        <RESULTADO>
      <PETICION>
        <xsl:copy-of select="."/>
      </PETICION>
      <ERROR>
        <xsl:copy-of select="$error"/>
      </ERROR>
    </RESULTADO>
    </xsl:template>
</xsl:stylesheet>