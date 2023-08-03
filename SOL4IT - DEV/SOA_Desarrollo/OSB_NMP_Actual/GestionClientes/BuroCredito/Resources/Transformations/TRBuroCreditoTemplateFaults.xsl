<?xml version="1.0" encoding="windows-1252" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="codigoErrorSap">
        <xsl:param name="ErrorSap"/>
        <xsl:choose>
      <xsl:when test="$ErrorSap='ExNoExisteBP'">NMP-019</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteFolio'">NMP-047</xsl:when>
      <xsl:when test="$ErrorSap='ExIdConsultaNoCreada'">NMP-048</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteIdConsulta'">NMP-049</xsl:when>
      <xsl:when test="$ErrorSap='ExNotFound'">NMP-050</xsl:when>
      <xsl:when test="$ErrorSap='ExIdRequired'">NMP-051</xsl:when>
      <xsl:when test="$ErrorSap='ExIdOverwriteError'">NMP-052</xsl:when>
      <xsl:when test="$ErrorSap='ExTablaNoActualizada'">NMP-053</xsl:when>
      <xsl:when test="$ErrorSap='ExSegmentoVacio'">NMP-054</xsl:when>
      <xsl:when test="$ErrorSap='ExIdNotFound'">NMP-055</xsl:when>
      <xsl:when test="$ErrorSap='ExCampoObligatorio'">NMP-056</xsl:when>
      <xsl:when test="$ErrorSap='ExOthers'">NMP-057</xsl:when>
      <xsl:when test="$ErrorSap='ExCalculoKo'">NMP-058</xsl:when>
      <xsl:otherwise>NMP-011</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="descripcionErrorSap">
        <xsl:param name="ErrorSap"/>
        <xsl:param name="fault"/>
        <xsl:choose>
      <xsl:when test="$ErrorSap='ExNoExisteBP'">El cliente no existe en SAP</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteFolio'">El folio ya existe en el log</xsl:when>
      <xsl:when test="$ErrorSap='ExIdConsultaNoCreada'">Error al generar identificador de la consulta en el log</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteIdConsulta'">El identificador de consulta ya existe en el log</xsl:when>
      <xsl:when test="$ErrorSap='ExNotFound'">El identificador de la consulta no existe en el log</xsl:when>
      <xsl:when test="$ErrorSap='ExIdRequired'">Se requiere un identificador de consulta</xsl:when>
      <xsl:when test="$ErrorSap='ExIdOverwriteError'">Identificador ya existente en tabla</xsl:when>
      <xsl:when test="$ErrorSap='ExTablaNoActualizada'">Error al actualizar tabla</xsl:when>
      <xsl:when test="$ErrorSap='ExSegmentoVacio'">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap=ExIdNotFound">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap=ExCampoObligatorio">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap=ExOthers">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap=ExCalculoKo">
      <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:otherwise>Generic Server Fault</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="tipoErrorSap">
        <xsl:param name="ErrorSap"/>
        <xsl:choose>
      <xsl:when test="$ErrorSap='ExNoExisteBP'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteFolio'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExIdConsultaNoCreada'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteIdConsulta'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExNotFound'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExIdRequired'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExIdOverwriteError'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExTablaNoActualizada'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExSegmentoVacio'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExIdNotFound'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExCampoObligatorio'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExOthers'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='ExCalculoKo'">Error de Negocio</xsl:when>
      <xsl:otherwise>Error de Aplicación</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="severidadSap">
        <xsl:param name="ErrorSap"/>
        <xsl:choose>
      <xsl:when test="$ErrorSap='ExNoExisteBP'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteFolio'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExIdConsultaNoCreada'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExExisteIdConsulta'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExNotFound'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExIdRequired'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExIdOverwriteError'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExTablaNoActualizada'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExSegmentoVacio'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExIdNotFound'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExCampoObligatorio'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExOthers'">1</xsl:when>
      <xsl:when test="$ErrorSap='ExCalculoKo'">1</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
</xsl:stylesheet>