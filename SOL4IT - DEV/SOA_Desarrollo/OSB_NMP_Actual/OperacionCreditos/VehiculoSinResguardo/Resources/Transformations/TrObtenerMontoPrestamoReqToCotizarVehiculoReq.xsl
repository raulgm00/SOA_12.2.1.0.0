<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador"
    xmlns:vsr="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo"
    version="1.0">
    <xsl:param name="montoAvaluo"></xsl:param>
    <xsl:template match="/">
        <cot:cotizarVehiculoRequest >
            <!--Optional:-->
            <xsl:choose>
                <xsl:when test="/vsr:obtenerMontoPrestamoRequest/vsr:cliente">
                    <cot:cliente>
                        <cot:calificacion>
                            <cot:calificacionMidas>
                                <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:cliente/cot:calificacionMidas"/>
                            </cot:calificacionMidas>
                            <cot:sobreAforo>
                                <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:cliente/cot:sobreAforo"/>
                            </cot:sobreAforo>
                        </cot:calificacion>
                    </cot:cliente>
                </xsl:when>
            </xsl:choose>            
            <cot:datosCotizar>
                <cot:tipoVehiculo>
                    <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:cotizar/cot:tipoVehiculo"/>
                </cot:tipoVehiculo>
                <xsl:if test="/vsr:obtenerMontoPrestamoRequest/vsr:cotizar/cot:plazo">
                <cot:plazo>
                    <xsl:value-of select="/vsr:obtenerMontoPrestamoRequest/vsr:cotizar/cot:plazo"/>
                </cot:plazo>
                </xsl:if>
                <cot:montoAvaluo>
                    <xsl:value-of select="$montoAvaluo"/>
                </cot:montoAvaluo>
            </cot:datosCotizar>
        </cot:cotizarVehiculoRequest>
    </xsl:template>
</xsl:stylesheet>