<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:soap-env="http://schemas.xmlsoap.org/soap/envelope/"
 xmlns:dbup="http://xmlns.oracle.com/pcbpel/adapter/db/DbUpdateRegistroRenovacion"
 xmlns:eval="http://servicios.montedepiedad.com.mx/NMP/Services/Osb/EvaluacionCredito">
  <xsl:output indent="yes" exclude-result-prefixes="xsl"/>
  <xsl:template match="/">
  <soap-env:Body>
	<dbup:DbUpdateRegistroRenovacionInput>
	<dbup:ESTATUS_SOA>PROCESADO</dbup:ESTATUS_SOA>
	<dbup:DESCRIPCION_ERROR>SUCCESS</dbup:DESCRIPCION_ERROR>
	<dbup:MANDT>',$body_tmp//MANDT/text(),'</dbup:MANDT>
        <dbup:SOCIEDAD>',$body_tmp//SOCIEDAD/text(),'</dbup:SOCIEDAD>
        <dbup:CONTRATO>',$body_tmp//CONTRATO/text(),'</dbup:CONTRATO>
	</dbup:DbUpdateRegistroRenovacionInput>
	</soap-env:Body>
  </xsl:template>
</xsl:stylesheet>