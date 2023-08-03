<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:vsr="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo"
                xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo"
                xmlns:fluj="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo"
                xmlns:sol="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20">
  <xsl:template match="/">
  <sol:consultarSolicitudesClienteRequest>
      <sol:numCredencial>
        <xsl:value-of select="/vsr:obtenerSolicitudesRequest/fluj:numeroCredencial"/>
      </sol:numCredencial>
      <sol:fechaInicial>
        <xsl:value-of select="/vsr:obtenerSolicitudesRequest/vsr:fechainicio"/>
      </sol:fechaInicial>
      <sol:fechaFinal>
        <xsl:value-of select="/vsr:obtenerSolicitudesRequest/vsr:fechafin"/>
      </sol:fechaFinal>
    </sol:consultarSolicitudesClienteRequest>
  </xsl:template>
</xsl:stylesheet>