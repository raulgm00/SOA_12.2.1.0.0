<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades"
    xmlns:usu="http://servicios.montedepiedad.com.mx/NMP/Schema/UsuariosMonte"
    xmlns:soap="http://www.w3.org/2003/05/soap-envelope" version="2.0"
    exclude-result-prefixes="soap xsl">  
    <xsl:param name="operacion"></xsl:param>
    <xsl:param name="updated_at"></xsl:param>
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$operacion='solicitarAlta'">
                <nmp:crearUsuarioRequest>
                    <!--Optional:-->
                    <!--nmp:modoNotificacion>               
                <nmp:medio>string</nmp:medio>
            </nmp:modoNotificacion-->
                    <nmp:forzarCreacionAlias>true</nmp:forzarCreacionAlias>
                    <nmp:accionNotificacion>SUPPRESS</nmp:accionNotificacion>
                    <!--Optional:-->
                    <nmp:contrasenaTemporal>
                        <xsl:value-of select="concat('Nmp$0',soap:Body/usu:solicitarAltaRequest/usu:usuario/usu:datosValidacion/usu:token)"/>
                    </nmp:contrasenaTemporal>
                    <!--Optional:-->
                    <nmp:atributosUsuario>
                        <!--Zero or more repetitions:-->
                        <nmp:atributo>
                            <nmp:nombre>email_verified</nmp:nombre>
                            <nmp:valor>true</nmp:valor>
                        </nmp:atributo>
                        <nmp:atributo>
                            <nmp:nombre>email</nmp:nombre>
                            <nmp:valor>
                                <xsl:value-of select="soap:Body/usu:solicitarAltaRequest/usu:usuario/usu:nombreUsuario"></xsl:value-of>
                            </nmp:valor>
                        </nmp:atributo>
                        <nmp:atributo>
                            <nmp:nombre>updated_at</nmp:nombre>
                            <nmp:valor>
                                <!--xsl:value-of select="1495474693"></xsl:value-of-->
                                <xsl:value-of select="$updated_at"/>
                            </nmp:valor>
                        </nmp:atributo>
                    </nmp:atributosUsuario>
                    <nmp:usuario>
                        <xsl:value-of select="soap:Body/usu:solicitarAltaRequest/usu:usuario/usu:nombreUsuario"></xsl:value-of>
                    </nmp:usuario>            
                    <!--nmp:DatosValidacion>               
                <nmp:validar>
                    <nmp:nombre>string</nmp:nombre>
                    <nmp:valor>string</nmp:valor>
                </nmp:validar>
            </nmp:DatosValidacion-->
                </nmp:crearUsuarioRequest>
            </xsl:when>
            <xsl:when test="$operacion='registrarContrasena'">
                <nmp:crearUsuarioRequest>
                  
                    <nmp:forzarCreacionAlias>true</nmp:forzarCreacionAlias>
                    <nmp:accionNotificacion>SUPPRESS</nmp:accionNotificacion>                  
                    <nmp:contrasenaTemporal>
                        <xsl:value-of select="concat('Nmp$0',soap:Body/usu:registrarContrasenaRequest/usu:usuario/usu:datosValidacion/usu:token)"/>
                    </nmp:contrasenaTemporal>                  
                    <nmp:atributosUsuario>                     
                        <nmp:atributo>
                            <nmp:nombre>email_verified</nmp:nombre>
                            <nmp:valor>true</nmp:valor>
                        </nmp:atributo>
                        <nmp:atributo>
                            <nmp:nombre>email</nmp:nombre>
                            <nmp:valor>
                                <xsl:value-of select="soap:Body/usu:registrarContrasenaRequest/usu:usuario/usu:nombreUsuario"></xsl:value-of>
                            </nmp:valor>
                        </nmp:atributo>
                        <nmp:atributo>
                            <nmp:nombre>updated_at</nmp:nombre>
                            <nmp:valor>                                
                                <xsl:value-of select="$updated_at"/>
                            </nmp:valor>
                        </nmp:atributo>
                    </nmp:atributosUsuario>
                    <nmp:usuario>
                        <xsl:value-of select="soap:Body/usu:registrarContrasenaRequest/usu:usuario/usu:nombreUsuario"></xsl:value-of>
                    </nmp:usuario>
                </nmp:crearUsuarioRequest>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
</xsl:stylesheet>