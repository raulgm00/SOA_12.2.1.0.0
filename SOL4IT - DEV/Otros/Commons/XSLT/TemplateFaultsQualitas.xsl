<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" version="1.0">
  <xsl:template name="faultstring">
        <xsl:param name="beaCode"/>
    <xsl:choose>
      <xsl:when test="$beaCode=380000">Se ha excedido el tiempo de espera</xsl:when>
      <xsl:when test="$beaCode=380001">Internal Server Error (500)</xsl:when>
      <xsl:when test="$beaCode=380002">Error conectividad 1 - destination unreachable</xsl:when>
      <xsl:when test="$beaCode=382500">SOAP Fault Response. Ha ocurrido un error inesperado</xsl:when>
      <xsl:when test="$beaCode=382501">Unrecognized Response. Se ha recibido un error</xsl:when>
      <xsl:when test="$beaCode=382502">Error conectividad 2 - not found (404)</xsl:when>
      <xsl:when test="$beaCode=382505">Error en los parámetros del mensaje</xsl:when>
      <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">Transport Run-Time Errors</xsl:when>
      <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">Message Flow Run-Time Errors</xsl:when>
      <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">Actions Errors</xsl:when>
      <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">Security Errors</xsl:when>
      <xsl:otherwise>Generic Server Fault</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="codigoError">
        <xsl:param name="beaCode"/>
        <xsl:choose>
      <xsl:when test="$beaCode=380000">QAU-003</xsl:when>
      <xsl:when test="$beaCode=380001">QAU-005</xsl:when>
      <xsl:when test="$beaCode=380002">QAU-001</xsl:when>
      <xsl:when test="$beaCode=382500">QAU-004</xsl:when>
      <xsl:when test="$beaCode=382501">QAU-004</xsl:when>
      <xsl:when test="$beaCode=382502">QAU-002</xsl:when>
      <xsl:when test="$beaCode=382505">QAU-008</xsl:when>
      <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">QAU-006</xsl:when>
      <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">QAU-007</xsl:when>
      <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">QAU-010</xsl:when>
      <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">QAU-009</xsl:when>
      <xsl:otherwise>QAU-011</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="tipoError">
        <xsl:param name="beaCode"/>
        <xsl:choose>
      <xsl:when test="$beaCode=380000">Error de Aplicación</xsl:when>
      <xsl:when test="$beaCode=380001">Error de Aplicación</xsl:when>
      <xsl:when test="$beaCode=380002">Error de Negocio</xsl:when>
      <xsl:when test="$beaCode=382500">Error de Aplicación</xsl:when>
      <xsl:when test="$beaCode=382501">Error de Aplicación</xsl:when>
      <xsl:when test="$beaCode=382502">Error de Aplicación</xsl:when>
      <xsl:when test="$beaCode=382505">Error de Validacion</xsl:when>
      <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">Error de Negocio</xsl:when>
      <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">Error de Negocio</xsl:when>
      <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">Error de Negocio</xsl:when>
      <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">Error de Negocio</xsl:when>
      <xsl:otherwise>Error de Aplicación</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="severidad">
        <xsl:param name="beaCode"/>
        <xsl:choose>
      <xsl:when test="$beaCode=380000">2</xsl:when>
      <xsl:when test="$beaCode=380001">2</xsl:when>
      <xsl:when test="$beaCode=380002">1</xsl:when>
      <xsl:when test="$beaCode=382500">2</xsl:when>
      <xsl:when test="$beaCode=382501">2</xsl:when>
      <xsl:when test="$beaCode=382502">2</xsl:when>
      <xsl:when test="$beaCode=382505">3</xsl:when>
      <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">1</xsl:when>
      <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">1</xsl:when>
      <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">1</xsl:when>
      <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">1</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="descripcionError">
        <xsl:param name="beaCode"/>
        <xsl:param name="fault"/>
        <xsl:choose>
      <xsl:when test="$beaCode=380000">Se ha excedido el tiempo de espera</xsl:when>
      <xsl:when test="$beaCode=380001">Internal Server Error (500)</xsl:when>
      <xsl:when test="$beaCode=380002">Error conectividad 1 - destination unreachable</xsl:when>
      <xsl:when test="$beaCode=382500">
              <xsl:choose>
          <xsl:when test="$fault//con1:ReceivedFaultDetail">
                  <xsl:value-of select="$fault//con1:ReceivedFaultDetail/*:faultstring"/>
                </xsl:when>
          <xsl:otherwise>SOAP Fault Response. Ha ocurrido un error inesperado</xsl:otherwise>
        </xsl:choose>
            </xsl:when>
      <xsl:when test="$beaCode=382501">
              <xsl:choose>
          <xsl:when test="$fault//con1:UnrecognizedResponseDetail">
                  <xsl:value-of select="$fault//con1:UnrecognizedResponseDetail/*:detail"/>
                </xsl:when>
          <xsl:otherwise>Unrecognized Response. Se ha recibido un error</xsl:otherwise>
        </xsl:choose>
            </xsl:when>
      <xsl:when test="$beaCode=382502">
              <xsl:choose>
          <xsl:when test="$fault//con1:ErrorResponseDetail">
                  <xsl:value-of select="$fault//con1:ErrorResponseDetail/*:detail"/>
                </xsl:when>
          <xsl:otherwise>Error conectividad 2 - not fount (404)</xsl:otherwise>
        </xsl:choose>
            </xsl:when>
      <xsl:when test="$beaCode=382505">
              <xsl:value-of select="$fault//con1:ValidationFailureDetail/con1:message"/>
            </xsl:when>
      <xsl:when test="$beaCode > 380000 and $beaCode &lt; 380100">Transport Run-Time Errors</xsl:when>
      <xsl:when test="$beaCode > 381999 and $beaCode &lt; 382500">Message Flow Run-Time Errors</xsl:when>
      <xsl:when test="$beaCode > 382499 and $beaCode &lt; 383000">Actions Errors</xsl:when>
      <xsl:when test="$beaCode > 385999 and $beaCode &lt; 387000">Security Errors</xsl:when>
      <xsl:otherwise>Generic Server Fault</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
</xsl:stylesheet>