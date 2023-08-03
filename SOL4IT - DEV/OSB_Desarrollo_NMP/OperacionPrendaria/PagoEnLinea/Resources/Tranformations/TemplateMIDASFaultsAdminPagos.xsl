<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
       
    <xsl:template name="faultstringAP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='WS001'">La partida especificada no tiene operaciones disponibles.</xsl:when> 
            <xsl:when test="$errorCode='WS002'">El identificador de la transacción no es válido.</xsl:when>
            <xsl:when test="$errorCode='WS003'">El importe especificado no es válido o no corresponde al esperado para la operación solicitada.</xsl:when>
            <xsl:when test="$errorCode='WS004'">La operación solicitada no es válida para la partida.</xsl:when>
            <xsl:when test="$errorCode='WS005'">Servicio fuera de horario.</xsl:when>
            <xsl:when test="$errorCode='WS006'">Partida no válida.</xsl:when>
            <xsl:when test="$errorCode='WS007'">Parámetro no válido. No existe la transaccion</xsl:when>
            <xsl:when test="$errorCode='WS008'">No fue posible generar el comprobante.</xsl:when>
            <xsl:when test="$errorCode='WS010'">Desempeño no válido.</xsl:when>
            <xsl:when test="$errorCode='NMP-005bis'">El cliente no existe en CRM</xsl:when>
            <xsl:when test="$errorCode='NMP-083'">Midas contesto con estatus no exitoso.</xsl:when>
            <xsl:when test="$errorCode='NMP-084'">La partida no devolvio un idCliente válido.</xsl:when>
            <xsl:when test="$errorCode='NMP-085'">Midas contesto con estatus no exitoso al almacenar la operación.</xsl:when>
            <xsl:when test="$errorCode='NMP-086'">Ya existe un preregistro con la transaccion bancaria enviada.</xsl:when>
            <xsl:when test="$errorCode='NMP-087'">Transaccion ya fue aprobada en el banco.</xsl:when>
            <xsl:when test="$errorCode='NMP-088'">Transaccion rechazada.</xsl:when>
            <xsl:when test="$errorCode='NMP-089'">Transaccion supero el numero maximo de reintentos.</xsl:when>
            <xsl:when test="$errorCode='NMP-090'">Se obtuvo un error al momento de consultar la transaccion bancaria.</xsl:when>   
            <xsl:when test="$errorCode='NMP-091'">Transacion Bancaria no registrada.</xsl:when>
            <xsl:when test="$errorCode='NMP-092'">El folio ya cuenta con una transacción pendiente de pago</xsl:when>
            <xsl:when test="$errorCode='NMP-093'">No existe un pre registro del pago</xsl:when>
            <xsl:otherwise>Generic Server Fault</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoErrorAP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='WS001'">NMP-201</xsl:when> 
            <xsl:when test="$errorCode='WS002'">NMP-202</xsl:when>
            <xsl:when test="$errorCode='WS003'">NMP-203</xsl:when>
            <xsl:when test="$errorCode='WS004'">NMP-204</xsl:when>
            <xsl:when test="$errorCode='WS005'">NMP-205</xsl:when>
            <xsl:when test="$errorCode='WS006'">NMP-206</xsl:when>
            <xsl:when test="$errorCode='WS007'">NMP-207</xsl:when>
            <xsl:when test="$errorCode='WS008'">NMP-208</xsl:when>
            <xsl:when test="$errorCode='WS010'">NMP-209</xsl:when>
            <xsl:when test="$errorCode='NMP-005bis'">NMP-210</xsl:when>    
            <xsl:when test="$errorCode='NMP-083'">NMP-211</xsl:when>  
            <xsl:when test="$errorCode='NMP-084'">NMP-212</xsl:when> 
            <xsl:when test="$errorCode='NMP-085'">NMP-213</xsl:when>
            <xsl:when test="$errorCode='NMP-086'">NMP-214</xsl:when>
            <xsl:when test="$errorCode='NMP-087'">NMP-215</xsl:when>
            <xsl:when test="$errorCode='NMP-088'">NMP-216</xsl:when>
            <xsl:when test="$errorCode='NMP-089'">NMP-217</xsl:when>
            <xsl:when test="$errorCode='NMP-090'">NMP-218</xsl:when>
            <xsl:when test="$errorCode='NMP-091'">NMP-219</xsl:when>
            <xsl:when test="$errorCode='NMP-092'">NMP-220</xsl:when>
            <xsl:when test="$errorCode='NMP-093'">NMP-221</xsl:when>
            <xsl:otherwise>NMP-010</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
     <xsl:template name="tipoErrorAP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='WS001'">Error de Negocio</xsl:when> 
            <xsl:when test="$errorCode='WS002'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='WS003'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='WS004'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='WS005'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='WS006'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='WS007'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='WS008'">Error de Aplicación</xsl:when>
            <xsl:when test="$errorCode='WS010'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='NMP-005bis'">Error de Negocio</xsl:when>
             <xsl:when test="$errorCode='NMP-083'">Error de Aplicación</xsl:when>  
            <xsl:when test="$errorCode='NMP-084'">Error de Aplicación</xsl:when> 
            <xsl:when test="$errorCode='NMP-085'">Error de Aplicación</xsl:when> 
            <xsl:when test="$errorCode='NMP-086'">Error de Negocio</xsl:when> 
            <xsl:when test="$errorCode='NMP-087'">Error de Negocio</xsl:when> 
            <xsl:when test="$errorCode='NMP-088'">Error de Negocio</xsl:when> 
            <xsl:when test="$errorCode='NMP-089'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='NMP-090'">Error de Aplicación</xsl:when> 
            <xsl:when test="$errorCode='NMP-091'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='NMP-092'">Error de Negocio</xsl:when>
             <xsl:when test="$errorCode='NMP-093'">Error de Negocio</xsl:when>
            <xsl:otherwise>Error de Aplicación</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="severidadAP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='WS001'">2</xsl:when> 
            <xsl:when test="$errorCode='WS002'">2</xsl:when>
            <xsl:when test="$errorCode='WS003'">2</xsl:when>
            <xsl:when test="$errorCode='WS004'">2</xsl:when>
            <xsl:when test="$errorCode='WS005'">2</xsl:when>
            <xsl:when test="$errorCode='WS006'">2</xsl:when>
            <xsl:when test="$errorCode='WS007'">2</xsl:when>
            <xsl:when test="$errorCode='WS008'">2</xsl:when>
            <xsl:when test="$errorCode='WS010'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-005bis'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-083'">2</xsl:when>  
            <xsl:when test="$errorCode='NMP-084'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-085'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-086'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-087'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-088'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-089'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-090'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-091'">2</xsl:when>
            <xsl:when test="$errorCode='NMP-092'">2</xsl:when>
             <xsl:when test="$errorCode='NMP-093'">2</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
    </xsl:template>    
</xsl:stylesheet>