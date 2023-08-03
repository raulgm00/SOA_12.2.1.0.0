<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" omit-xml-declaration="yes"/>
  <xsl:variable name="inline-array">
    <Item>A</Item>
    <Item>B</Item>
    <Item>C</Item>
  </xsl:variable>
  <xsl:param name="array" select="document('')/*/xsl:variable[@name='inline-array']/*"/>
  <xsl:template match="/">
  <xsl:for-each select="$array/Item">
    <contenido>
    <xsl:value-of select="."/>
    </contenido>
  </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>