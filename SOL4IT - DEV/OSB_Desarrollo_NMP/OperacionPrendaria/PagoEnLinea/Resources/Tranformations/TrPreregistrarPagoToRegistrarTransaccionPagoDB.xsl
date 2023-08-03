<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:util="http://servicios.montedepiedad.com.mx/NMP/Schema/UtileriaAdminPagos"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
    xmlns:pl="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPDSRFPagoLineaSvc"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:op="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOperacionPago" version="2.0"
    exclude-result-prefixes="pl op soapenv">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <util:registrarTransaccionPagoBitRequest>
            <xsl:for-each
                select="soapenv:Body/pl:preregistarPagoRequest/op:transaccionPago/op:partidas/op:partida">
                <util:NmpTransaccionPago>
                    <util:transaccionBancaria>
                        <xsl:value-of select="/soapenv:Body/pl:preregistarPagoRequest/op:transaccionPago/op:banco/op:transaccionBancaria"/>
                    </util:transaccionBancaria>
                    <util:operacionServicio>Pago</util:operacionServicio>
                    <util:numTransaccion>
                        <xsl:value-of select="op:numeroTransaccion"></xsl:value-of>
                    </util:numTransaccion>
                    <util:importe>
                        <xsl:value-of select="op:monto"/>
                    </util:importe>
                    <util:numAutorizacion>
                        <xsl:value-of select="op:autorizacion"></xsl:value-of>
                    </util:numAutorizacion>                   
                    <util:operacionAutorizada/>
                     <util:origen>
                        <xsl:value-of select="op:origen"></xsl:value-of>
                    </util:origen>
                    <util:numTarjeta/>
                    <util:folioPartida>
                        <xsl:value-of select="op:folio"/>
                    </util:folioPartida>
                    <util:idOperacion>
                        <xsl:value-of select="op:idOperacion"/>
                    </util:idOperacion>
                    <util:estadoTransaccion>1</util:estadoTransaccion>
                    <util:numReintentos>0</util:numReintentos>
                    <util:correoElectronico>
                        <xsl:value-of  select="/soapenv:Body/pl:preregistarPagoRequest/op:transaccionPago/op:cliente/op:correoElectronico"/>
                    </util:correoElectronico>
                    <util:procesado>0</util:procesado>
                    <util:creadoPor>101</util:creadoPor>
                    <util:fechaCreacion>
                        <xsl:value-of select="xp20:format-dateTime(fn:current-dateTime(),'[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]')"/>
                    </util:fechaCreacion>
                    <util:actualizadoPor>101</util:actualizadoPor>
                    <util:fechaActualizacion>
                        <xsl:value-of select="xp20:format-dateTime(fn:current-dateTime(),'[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]')"/>
                    </util:fechaActualizacion>
                </util:NmpTransaccionPago>
                <util:preregistro>1</util:preregistro>
            </xsl:for-each>
        </util:registrarTransaccionPagoBitRequest>
    </xsl:template>
    
</xsl:stylesheet>