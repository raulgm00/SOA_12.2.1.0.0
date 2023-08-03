<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:pil="http://xmlns.oracle.com/bpmn/bpmnProcess/PilotoCanalesVenta"
    xmlns:bpm="http://servicios.montedepiedad.com.mx/NMP/Schema/BpmProcess"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPNotificacionMidasBPM" version="1.0" exclude-result-prefixes="nmp">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <pil:start>
            <bpm:DetalleProcesoBPM>
                <bpm:fechaNotificacion>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:fechaNotificacion[1]"/>
                </bpm:fechaNotificacion>
                <bpm:estatusOperacion>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:estatusOperacion[1]"/>
                </bpm:estatusOperacion>
                <bpm:tipoOperacion>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:tipoOperacion[1]"/>
                </bpm:tipoOperacion>
                <bpm:proyecto>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:proyecto[1]"/>
                </bpm:proyecto>
                <bpm:etapa>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:etapa[1]"/>
                </bpm:etapa>
                <bpm:subetapa>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:subetapa[1]"/>
                </bpm:subetapa>
                <bpm:idSolicitud>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:idSolicitud[1]"/>
                </bpm:idSolicitud>
                <bpm:idSucursal>
                    <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:idSucursal[1]"/>
                </bpm:idSucursal>
                <bpm:resultado>
                    <!--Optional:-->
                    <!--Optional:-->
                    <bpm:numPartExitosas>
                        <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:resultado[1]/nmp:numPartExitosas"/>
                    </bpm:numPartExitosas>
                    <!--Optional:-->
                    <bpm:numPartNoExitosas>
                        <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:resultado[1]/nmp:numPartNoExitosas[1]"/>
                    </bpm:numPartNoExitosas>
                    <!--Optional:-->
                    <bpm:totalPartidas>
                        <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:resultado[1]/nmp:totalPartidas[1]"/>
                    </bpm:totalPartidas>
                    <bpm:mensaje>
                        <xsl:value-of select="nmp:NotificacionMidas[1]/nmp:resultado[1]/nmp:mensaje[1]"/>
                    </bpm:mensaje>
                </bpm:resultado>
            </bpm:DetalleProcesoBPM>
            <mailSucursal>
                <xsl:choose>
                    <xsl:when test="string-length(nmp:NotificacionMidas[1]/nmp:idSucursal[1])=1">
                        <mailSucursal>
                            <xsl:value-of select="concat('suc','0',nmp:NotificacionMidas[1]/nmp:idSucursal[1],'montepiedad.com.mx')"/>
                        </mailSucursal>
                    </xsl:when>
                    <xsl:otherwise>
                        <mailSucursal>
                            <xsl:value-of select="concat('suc',nmp:NotificacionMidas[1]/nmp:idSucursal[1],'montepiedad.com.mx')"/>
                        </mailSucursal>
                    </xsl:otherwise>
                </xsl:choose>
            </mailSucursal>
        </pil:start>
    </xsl:template>
</xsl:stylesheet>