<xsl:stylesheet version="2.0" exclude-result-prefixes="soap xsl cliente" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:usu="http://servicios.montedepiedad.com.mx/NMP/Schema/UsuariosMonte" xmlns:cliente="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente" xmlns:soap="http://www.w3.org/2003/05/soap-envelope">    
    <xsl:include href="TemplateFaultsUsuariosMonte.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:param name="codigoRespuesta"/>
    <xsl:param name="infoCliente"/>
    <xsl:template match="/">
        <soap:Body>
            <usu:validarDatosResponse>
                <usu:cliente>
                    <usu:estadoRegistro>Preregistro</usu:estadoRegistro>
                    <usu:idCliente>
                        <xsl:value-of select="$infoCliente/cliente:Cliente/cliente:idCliente"/>
                    </usu:idCliente>
                </usu:cliente>
                <usu:respuesta>
                    <usu:codigo>
                        <xsl:call-template name="codigoErrorNMP">
                            <xsl:with-param name="errorCode" select="$codigoRespuesta"/>
                        </xsl:call-template>
                    </usu:codigo>
                    <usu:mensaje>
                        <xsl:call-template name="faultstringNMP">
                            <xsl:with-param name="errorCode" select="$codigoRespuesta"/>
                        </xsl:call-template>
                    </usu:mensaje>
                </usu:respuesta>
            </usu:validarDatosResponse>
        </soap:Body>
    </xsl:template>
</xsl:stylesheet>