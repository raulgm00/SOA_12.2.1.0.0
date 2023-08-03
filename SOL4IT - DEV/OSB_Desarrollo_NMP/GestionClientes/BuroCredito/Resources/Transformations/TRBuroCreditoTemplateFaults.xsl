<?xml version="1.0" encoding="windows-1252" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="codigoErrorSap">
    <xsl:param name="ErrorSap"/>
    <xsl:choose>
      <xsl:when test="$ErrorSap='EXARCHIVO'">NMP-004</xsl:when>
      <xsl:when test="$ErrorSap='EXUPLOAD'">NMP-004</xsl:when>
      <xsl:when test="$ErrorSap='EXNOEXISTEBP'">NMP-019</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEFOLIO'">NMP-047</xsl:when>
      <xsl:when test="$ErrorSap='EXIDCONSULTANOCREADA'">NMP-048</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEIDCONSULTA'">NMP-049</xsl:when>
      <xsl:when test="$ErrorSap='EXNOTFOUND'">NMP-050</xsl:when>
      <xsl:when test="$ErrorSap='EXIDREQUIRED'">NMP-051</xsl:when>
      <xsl:when test="$ErrorSap='EXIDOVERWRITEERROR'">NMP-052</xsl:when>
      <xsl:when test="$ErrorSap='EXTABLANOACTUALIZADA'">NMP-053</xsl:when>
      <xsl:when test="$ErrorSap='EXSEGMENTOVACIO'">NMP-054</xsl:when>
      <xsl:when test="$ErrorSap='EXIDNOTFOUND'">NMP-055</xsl:when>
      <xsl:when test="$ErrorSap='EXCAMPOOBLIGATORIO'">NMP-056</xsl:when>
      <xsl:when test="$ErrorSap='EXOTHERS'">NMP-057</xsl:when>
      <xsl:when test="$ErrorSap='EXCALCULOKO'">NMP-058</xsl:when>
      <xsl:otherwise>NMP-011</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="descripcionErrorSap">
        <xsl:param name="ErrorSap"/>
        <xsl:param name="fault"/>
    <xsl:choose>
      <xsl:when test="$ErrorSap='EXARCHIVO'">
        <xsl:value-of select="$fault//*:ReceivedFaultDetail/*:detail/*:ZlmfmRfcUploadBuro.Exception/*:Text/text()"/>
      </xsl:when>
      <xsl:when test="$ErrorSap='EXUPLOAD'">
        <xsl:value-of select="$fault//*:ReceivedFaultDetail/*:detail/*:ZlmfmRfcUploadBuro.Exception/*:Text/text()"/>
      </xsl:when>
      <xsl:when test="$ErrorSap='EXNOEXISTEBP'">El cliente no existe en SAP</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEFOLIO'">El folio ya existe en el log</xsl:when>
      <xsl:when test="$ErrorSap='EXIDCONSULTANOCREADA'">Error al generar identificador de la consulta en el log</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEIDCONSULTA'">El identificador de consulta ya existe en el log</xsl:when>
      <xsl:when test="$ErrorSap='EXNOTFOUND'">El identificador de la consulta no existe en el log</xsl:when>
      <xsl:when test="$ErrorSap='EXIDREQUIRED'">Se requiere un identificador de consulta</xsl:when>
      <xsl:when test="$ErrorSap='EXIDOVERWRITEERROR'">Identificador ya existente en tabla</xsl:when>
      <xsl:when test="$ErrorSap='EXTABLANOACTUALIZADA'">Error al actualizar tabla</xsl:when>
      <xsl:when test="$ErrorSap='EXSEGMENTOVACIO'">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap='EXIDNOTFOUND'">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap='EXCAMPOOBLIGATORIO'">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap='EXOTHERS'">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:when test="$ErrorSap='EXCALCULOKO'">
        <xsl:value-of select="concat('Resultado de consulta al buró de crédito genero una excepción. ',$fault//*:ReceivedFaultDetail/*:detail/*:ZlmRfcRecibeBuro.Exception/*:Text/text())"/>
      </xsl:when>
      <xsl:otherwise>Generic Server Fault</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="tipoErrorSap">
        <xsl:param name="ErrorSap"/>
        <xsl:choose>
      <xsl:when test="$ErrorSap='EXARCHIVO'">Error de Aplicación</xsl:when>
      <xsl:when test="$ErrorSap='EXUPLOAD'">Error de Aplicación</xsl:when>
      <xsl:when test="$ErrorSap='EXNOEXISTEBP'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEFOLIO'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXIDCONSULTANOCREADA'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEIDCONSULTA'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXNOTFOUND'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXIDREQUIRED'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXIDOVERWRITEERROR'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXTABLANOACTUALIZADA'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXSEGMENTOVACIO'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXIDNOTFOUND'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXCAMPOOBLIGATORIO'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXOTHERS'">Error de Negocio</xsl:when>
      <xsl:when test="$ErrorSap='EXCALCULOKO'">Error de Negocio</xsl:when>
      <xsl:otherwise>Error de Aplicación</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
  <xsl:template name="severidadSap">
        <xsl:param name="ErrorSap"/>
        <xsl:choose>
      <xsl:when test="$ErrorSap='EXARCHIVO'">2</xsl:when>
      <xsl:when test="$ErrorSap='EXUPLOAD'">2</xsl:when>
      <xsl:when test="$ErrorSap='EXNOEXISTEBP'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEFOLIO'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXIDCONSULTANOCREADA'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXEXISTEIDCONSULTA'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXNOTFOUND'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXIDREQUIRED'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXIDOVERWRITEERROR'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXTABLANOACTUALIZADA'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXSEGMENTOVACIO'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXIDNOTFOUND'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXCAMPOOBLIGATORIO'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXOTHERS'">1</xsl:when>
      <xsl:when test="$ErrorSap='EXCALCULOKO'">1</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
    </xsl:template>
</xsl:stylesheet>