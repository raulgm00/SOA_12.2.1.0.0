<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:vsr="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo"
                xmlns:veh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo"
                xmlns:aval="http://servicios.montedepiedad.com.mx/NMP/Schema/Avaluo" version="2.0">
  <xsl:template match="/">
        <aval:obtenerAvaluoAuto>
      <veh:marca>
        <veh:idMarca>
          <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:vehiculo/veh:marca/veh:idMarca"></xsl:value-of>
        </veh:idMarca>
      </veh:marca>
      <veh:submarca>
        <veh:idSubMarca>
          <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:vehiculo/veh:submarca/veh:idSubMarca"></xsl:value-of>
        </veh:idSubMarca>
      </veh:submarca>
      <veh:modelo>
        <veh:idModelo>
          <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:vehiculo/veh:modelo/veh:idModelo"></xsl:value-of>
        </veh:idModelo>
      </veh:modelo>
      <veh:version>
        <veh:idVersion>
          <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:vehiculo/veh:version/veh:idVersion"></xsl:value-of>
        </veh:idVersion>
      </veh:version>
      <veh:kilometraje>
        <veh:idKilometraje>
          <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:vehiculo/veh:kilometraje/veh:idKilometraje"></xsl:value-of>
        </veh:idKilometraje>
      </veh:kilometraje>
      <veh:complementos>
        <xsl:for-each select="/vsr:obtenerMontoPrestamoRequest/vsr:vehiculo/veh:complementos/veh:complemento">
                    <veh:complemento>
            <veh:idComplemento>
              <xsl:value-of select="veh:idComplemento"></xsl:value-of>
            </veh:idComplemento>
          </veh:complemento>
                </xsl:for-each>
      </veh:complementos>
      <!--aval:equipoAdicional>
                <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:vehiculo/veh:equipoAdicional"></xsl:value-of>
            </aval:equipoAdicional-->
    </aval:obtenerAvaluoAuto>
    </xsl:template>
</xsl:stylesheet>