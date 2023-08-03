<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:min="http://servicios.montedepiedad.com.mx/NMP/Schema/AE/Ministracion"
    xmlns:ae="http://servicios.montedepiedad.com.mx/NMP/Schema/commons/AE"
    xmlns:min2="http://xmlns.oracle.com/bpmn/bpmnProcess/MinistracionesGestionSolicitudProcess"
    exclude-result-prefixes="min ae"
    version="1.0">   
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <min2:iniciarSolicitudMinistracion>
            <idSolicitud>
                <xsl:value-of select="min:inicioGestionSolMinRequest/min:solicMinistracion/ae:idSolicitud/ae:idSolicitud"/>
            </idSolicitud>
            <loginUsuario>
                <xsl:value-of select="min:inicioGestionSolMinRequest/min:solicMinistracion/ae:idUsuario"/>
            </loginUsuario>
            <codigoSucursal>
                <xsl:value-of select="min:inicioGestionSolMinRequest/min:solicMinistracion/ae:idSucursal"/>
            </codigoSucursal>
            <idSucursal>
                <xsl:value-of select="min:inicioGestionSolMinRequest/min:solicMinistracion/ae:idSucursal"/>
            </idSucursal>
            <monto>
                <xsl:value-of select="min:inicioGestionSolMinRequest/min:solicMinistracion/ae:montoSol"/>
            </monto>
        </min2:iniciarSolicitudMinistracion>
       
    </xsl:template>
</xsl:stylesheet>