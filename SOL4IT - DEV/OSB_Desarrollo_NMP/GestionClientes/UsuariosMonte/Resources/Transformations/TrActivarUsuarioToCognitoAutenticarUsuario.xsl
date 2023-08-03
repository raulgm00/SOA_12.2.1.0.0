<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades"
    xmlns:usu="http://servicios.montedepiedad.com.mx/NMP/Schema/UsuariosMonte"
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" version="2.0"
    exclude-result-prefixes="soap xsl">   
    <xsl:template match="/">
        <nmp:autenticarUsuarioRequest>
            <nmp:flujoAutenticacion>ADMIN_NO_SRP_AUTH</nmp:flujoAutenticacion>
            <!--Optional:-->
            <nmp:parametrosAutenticacion>
                <!--Zero or more repetitions:-->
                <nmp:parametro>
                    <nmp:nombre>USERNAME</nmp:nombre>
                    <nmp:valor>
                        <xsl:value-of select="soap:Body/usu:solicitarActivacionRequest/usu:usuario/usu:nombreUsuario"></xsl:value-of>
                    </nmp:valor>
                </nmp:parametro>
                <nmp:parametro>
                    <nmp:nombre>PASSWORD</nmp:nombre>
                    <nmp:valor>
                        <xsl:value-of select="soap:Body/usu:solicitarActivacionRequest/usu:usuario/usu:datosValidacion/usu:token"></xsl:value-of>
                    </nmp:valor>
                </nmp:parametro>
            </nmp:parametrosAutenticacion>
        </nmp:autenticarUsuarioRequest>
    </xsl:template>
</xsl:stylesheet>