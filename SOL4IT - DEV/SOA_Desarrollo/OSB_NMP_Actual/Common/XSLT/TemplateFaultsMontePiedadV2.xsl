<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" version="1.0">
    <xsl:output encoding="UTF-8"/>
    <xsl:template name="faultstring">
        <xsl:param name="errorCode"/>
        <xsl:param name="serviceName"/>
        <xsl:choose>
            <xsl:when test="$errorCode=380000">
                <xsl:value-of
                    select="concat('Se ha excedido el tiempo de espera del servicio ',$serviceName)"
                />
            </xsl:when>
            <xsl:when test="$errorCode=380001">Error interno del servidor</xsl:when>
            <xsl:when test="$errorCode=380002">
                <xsl:value-of
                    select="concat('Error conectividad – El destino: ',$serviceName,' es inalcanzable ')"
                />
            </xsl:when>
            <xsl:when test="$errorCode=382500">
                <xsl:value-of select="concat('Se ha recibido un error del servicio ',$serviceName)"
                />
            </xsl:when>
            <xsl:when test="$errorCode=382501">
                <xsl:value-of
                    select="concat('Se ha recibido un error no reconocido del servicio ',$serviceName)"
                />
            </xsl:when>
            <xsl:when test="$errorCode=382502">
                <xsl:value-of
                    select="concat('Error conectividad – No se encuentra el servicio ',$serviceName)"
                />
            </xsl:when>
            <xsl:when test="$errorCode=382505">Error en los parámetros del mensaje</xsl:when>
            <xsl:when test="$errorCode > 380000 and $errorCode &lt; 380100">Error en tiempo de
                ejecución en el transporte o proxy</xsl:when>
            <xsl:when test="$errorCode > 381999 and $errorCode &lt; 382500">Error en tiempo de
                ejecución en el flujo de mensajes</xsl:when>
            <xsl:when test="$errorCode > 382499 and $errorCode &lt; 383000">Error en tiempo de
                ejecución en las acciones del flujo de mensajes</xsl:when>
            <xsl:when test="$errorCode > 385999 and $errorCode &lt; 387000">Error de
                seguridad</xsl:when>
            <xsl:when test="$errorCode > 394499 and $errorCode &lt; 395000">Error en el sub sistema
                UDDI</xsl:when>
            <xsl:otherwise>Falló generico en el servidor</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoError">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode=380000">NMP-1001</xsl:when>
            <xsl:when test="$errorCode=380001">NMP-1002</xsl:when>
            <xsl:when test="$errorCode=380002">NMP-1003</xsl:when>
            <xsl:when test="$errorCode=382500">NMP-2001</xsl:when>
            <xsl:when test="$errorCode=382501">NMP-2002</xsl:when>
            <xsl:when test="$errorCode=382502">NMP-2003</xsl:when>
            <xsl:when test="$errorCode=382505">NMP-2004</xsl:when>
            <xsl:when test="$errorCode > 380000 and $errorCode &lt; 380100">NMP-1000</xsl:when>
            <xsl:when test="$errorCode > 381999 and $errorCode &lt; 382500">NMP-2000</xsl:when>
            <xsl:when test="$errorCode > 382499 and $errorCode &lt; 383000">NMP-2500</xsl:when>
            <xsl:when test="$errorCode > 385999 and $errorCode &lt; 387000">NMP-5000</xsl:when>
            <xsl:when test="$errorCode > 394499 and $errorCode &lt; 395000">NMP-9000</xsl:when>
            <xsl:otherwise>NMP-0000</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tipoError">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode=382505">Error de validación parámetros</xsl:when>
            <xsl:when test="$errorCode=382500 or $errorCode=380001">Error de Negocio</xsl:when>
            <xsl:otherwise>Error de Aplicación</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="severidad">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode=380000">2</xsl:when>
            <xsl:when test="$errorCode=380001">2</xsl:when>
            <xsl:when test="$errorCode=380002">1</xsl:when>
            <xsl:when test="$errorCode=382500">2</xsl:when>
            <xsl:when test="$errorCode=382501">1</xsl:when>
            <xsl:when test="$errorCode=382502">1</xsl:when>
            <xsl:when test="$errorCode=382505">2</xsl:when>
            <xsl:when test="$errorCode > 380000 and $errorCode &lt; 380100">1</xsl:when>
            <xsl:when test="$errorCode > 381999 and $errorCode &lt; 382500">1</xsl:when>
            <xsl:when test="$errorCode > 382499 and $errorCode &lt; 383000">1</xsl:when>
            <xsl:when test="$errorCode > 385999 and $errorCode &lt; 387000">1</xsl:when>
            <xsl:when test="$errorCode > 394499 and $errorCode &lt; 395000">1</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="descripcionError">
        <xsl:param name="errorCode"/>
        <xsl:param name="serviceName"/>
        <xsl:param name="fault"/>
        <xsl:choose>
            <xsl:when test="$errorCode=380000">
                <xsl:value-of
                    select="concat('Se ha excedido el tiempo de espera del servicio ',$serviceName)"
                />
            </xsl:when>
            <xsl:when test="$errorCode=380001">Error interno del servidor</xsl:when>
            <xsl:when test="$errorCode=380002">
                <xsl:value-of
                    select="concat('Error conectividad – El destino: ',$serviceName,' es inalcanzable ')"
                />
            </xsl:when>
            <xsl:when test="$errorCode=382500">
                <xsl:choose>
                    <xsl:when test="$fault//con1:ReceivedFaultDetail">
                        <xsl:value-of select="$fault//con1:ReceivedFaultDetail/*:faultstring"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                            select="concat('Se ha recibido un error del servicio ',$serviceName)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$errorCode=382501">
                <xsl:choose>
                    <xsl:when test="$fault//con1:UnrecognizedResponseDetail">
                        <xsl:value-of select="$fault//con1:UnrecognizedResponseDetail/*:detail"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                            select="concat('Se ha recibido un error no reconocido del servicio ',$serviceName)"
                        />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$errorCode=382502">
                <xsl:choose>
                    <xsl:when test="$fault//con1:ErrorResponseDetail">
                        <xsl:value-of select="$fault//con1:ErrorResponseDetail/*:detail"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                            select="concat('Error conectividad – No se encuentra el servicio ',$serviceName)"
                        />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$errorCode=382505">
                <xsl:value-of select="$fault//con1:ValidationFailureDetail/con1:message"/>
            </xsl:when>
            <xsl:when test="$errorCode > 380000 and $errorCode &lt; 380100">Error en tiempo de
                ejecución en el transporte o proxy</xsl:when>
            <xsl:when test="$errorCode > 381999 and $errorCode &lt; 382500">Error en tiempo de
                ejecución en el flujo de mensajes</xsl:when>
            <xsl:when test="$errorCode > 382499 and $errorCode &lt; 383000">Error en tiempo de
                ejecución en las acciones del flujo de mensajes</xsl:when>
            <xsl:when test="$errorCode > 385999 and $errorCode &lt; 387000">Error de
                seguridad</xsl:when>
            <xsl:when test="$errorCode > 394499 and $errorCode &lt; 395000">Error en el sub sistema
                UDDI</xsl:when>
            <xsl:otherwise>Falló generico en el servidor</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>