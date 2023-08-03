<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" version="1.0">
  <xsl:template name="CodigoMidas">
        <xsl:param name="beaCode"/>
        <xsl:choose>
      <xsl:when test="$beaCode=380000">NMP-003</xsl:when>
      <xsl:when test="$beaCode=380001">NMP-005</xsl:when>
      <xsl:when test="$beaCode=380002">NMP-001</xsl:when>
      <xsl:when test="$beaCode=382500">NMP-004</xsl:when>
      <xsl:when test="$beaCode=382501">NMP-004</xsl:when>
      <xsl:when test="$beaCode=382502">NMP-002</xsl:when>
      <xsl:when test="$beaCode=382505">NMP-008</xsl:when>
      <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">NMP-006</xsl:when>
      <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">NMP-007</xsl:when>
      <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">NMP-010</xsl:when>
      <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">NMP-009</xsl:when>
      <xsl:otherwise>NMP-011</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
</xsl:stylesheet>