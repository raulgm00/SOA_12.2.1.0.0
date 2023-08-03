<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsd ns1 xsi xsi schemaLocation oracle-xsl-mapper xsl ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <FormEditResponse>
          <Solicitudes>
            <xsl:for-each select="/ns0:getEstatusSolicitudResponse/ns0:EstatusSolicitudes/ns0:EstatusSolicitudes">
                <Solicitud>
                    <xsl:if test="ns0:nombreCliente">
                        <Id_Cliente>
                            <xsl:value-of select="ns0:nombreCliente"/>
                        </Id_Cliente>
                    </xsl:if>
                    <xsl:if test="ns0:solicitud">
                        <Numero_Solicitud>
                            <xsl:value-of select="ns0:solicitud"/>
                        </Numero_Solicitud>
                    </xsl:if>
                    <xsl:if test="ns0:estatusGestion">
                   <Estatus>
                            <xsl:value-of select="ns0:estatusGestion"/>
                        </Estatus>
                   </xsl:if>
                    <xsl:if test="ns0:estatusSolicitud">
                   <Sub_Estatus>
                            <xsl:value-of select="ns0:estatusSolicitud"/>
                        </Sub_Estatus>
                    </xsl:if>
                    <xsl:if test="ns0:motivoPen">
                   <Motivo_Pendiente>
                            <xsl:value-of select="ns0:motivoPen"/>
                        </Motivo_Pendiente>
                   </xsl:if>
                   
                    <xsl:if test="ns0:fechaFirma">
                   <Fecha_Firma>
                            <xsl:value-of select="ns0:fechaFirma"/>
                        </Fecha_Firma>
                     </xsl:if>
                    <xsl:if test="ns0:montoDesembolso">
                   <Monto_Desembolso>
                            <xsl:value-of select="ns0:montoDesembolso"/>
                        </Monto_Desembolso>
                     </xsl:if>
                    <xsl:if test="ns0:saldoFecha">
                   <Saldo_Fecha>
                            <xsl:value-of select="ns0:saldoFecha"/>
                        </Saldo_Fecha>
                    </xsl:if>
                </Solicitud>
            </xsl:for-each>
            </Solicitudes>
        </FormEditResponse>
    </xsl:template>
</xsl:stylesheet>