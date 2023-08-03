<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:con="http://xmlns.oracle.com/bpmn/bpmnProcess/Concentradora"
    xmlns:bpm="http://xmlns.oracle.com/bpm/bpmobject/Concentradora/ConcentradoraBO"
    xmlns:inic="http://servicios.montedepiedad.com.mx/NMP/Schema/IniciadorProcesosBPM"
    xmlns:det="http://servicios.montedepiedad.com.mx/NMP/Schema/BpmProcess"
    version="1.0" exclude-result-prefixes="inic det">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <con:start >
            <bpm:ConcentradoraBO >
                <bpm:idSolicitud>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:idSolicitud"/>
                </bpm:idSolicitud>
                <bpm:idSucursal>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:idSucursal"/>
                </bpm:idSucursal>
                <bpm:estatusOperacion>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:estatusOperacion"/>
                </bpm:estatusOperacion>
                <bpm:tipoOperacion>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:tipoOperacion"/>
                </bpm:tipoOperacion>
                <bpm:proyecto>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:proyecto"/>
                </bpm:proyecto>
                <bpm:etapa>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:etapa"/>
                </bpm:etapa>
                <bpm:subetapa>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:subetapa"/>
                </bpm:subetapa>
                <bpm:numPartidasExitosas>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:resultado/det:numPartExitosas"/>
                </bpm:numPartidasExitosas>
                <bpm:numPartidasNoExitosas>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:resultado/det:numPartNoExitosas"/>
                </bpm:numPartidasNoExitosas>
                <bpm:totalPartidas>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:resultado/det:totalPartidas"/>
                </bpm:totalPartidas>
                <bpm:mensaje>
                    <xsl:value-of select="inic:start/det:DetalleProcesoBPM/det:resultado/det:mensaje"/>
                </bpm:mensaje>
            </bpm:ConcentradoraBO>
        </con:start>
    </xsl:template>
</xsl:stylesheet>