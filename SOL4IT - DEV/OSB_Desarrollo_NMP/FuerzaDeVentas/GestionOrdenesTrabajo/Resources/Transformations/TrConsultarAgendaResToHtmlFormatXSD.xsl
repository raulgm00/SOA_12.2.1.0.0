<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsd xsi xsl ns0 GestionT"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                 xmlns:OrdT="http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/OrdenesTrabajo"
                xmlns:OrdE="http://servicios.montedepiedad.com.mx/NMP/Schema/Elementos/OrdenesTrabajo">
  <xsl:template match="/">
    <FormEditResponse>
      <xsl:for-each select="/OrdE:consultarAgendaPromotorResponse/OrdT:Ordenes/OrdT:Orden">
        <Agenda>
          <Citas>
            <xsl:if test="OrdT:Cliente/OrdT:idCliente">
              <Numero_Cliente>
                <xsl:value-of select="OrdT:Cliente/OrdT:idCliente"/>
              </Numero_Cliente>
            </xsl:if>
            <xsl:if test="OrdT:Cliente/OrdT:nombreCliente">
              <Nombre_Cliente>
                <xsl:value-of select="OrdT:Cliente/OrdT:nombreCliente"/>
              </Nombre_Cliente>
            </xsl:if>
            <xsl:if test="OrdT:fechaInicio">
              <FechaInicio>
                <xsl:value-of select="OrdT:fechaInicio"/>
              </FechaInicio>
            </xsl:if>
            <xsl:if test="OrdT:fechaFin">
              <FechFin>
                <xsl:value-of select="OrdT:fechaFin"/>
              </FechFin>
            </xsl:if>
          </Citas>
        </Agenda>
      </xsl:for-each>
    </FormEditResponse>
  </xsl:template>
</xsl:stylesheet>