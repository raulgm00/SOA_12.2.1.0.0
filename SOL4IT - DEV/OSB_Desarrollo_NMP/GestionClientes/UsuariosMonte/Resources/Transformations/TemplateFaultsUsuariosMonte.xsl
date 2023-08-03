<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
       
    <xsl:template name="faultstringNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='100'">Error controlado</xsl:when>            
            <xsl:when test="$errorCode='101'">El cliente ya ha iniciado un registro</xsl:when>
            <xsl:when test="$errorCode='102'">Preregistro pendiente de validación celular</xsl:when>
            <xsl:when test="$errorCode='103'">El cliente está pendiente de validar su correo</xsl:when>
            <xsl:when test="$errorCode='104'">El cliente ya se encuentra registrado</xsl:when>
            <xsl:when test="$errorCode='105'">Porcentaje de coincidencia es menor del 85%</xsl:when>    
            <xsl:when test="$errorCode='106'">Medio de validación incorrecto para validar datos</xsl:when>
            <xsl:when test="$errorCode='107'">No se ha validado la información del cliente</xsl:when>
            <xsl:when test="$errorCode='108'">El medio de validación para el alta de usuario es incorrecta</xsl:when>
            <xsl:when test="$errorCode='109'">No se puede obtener el siguiente estado para el flujo indicado</xsl:when>
            <xsl:when test="$errorCode='110'">Reinicio de contraseña denegado, por incompatibilidad del estado del flujo</xsl:when>
            <xsl:when test="$errorCode='111'">Actualización de datos denegada, por incompatibilidad del estado del flujo</xsl:when>  
            <xsl:when test="$errorCode='112'">Medio de validación incorrecto para actualizar datos</xsl:when>            
            <xsl:when test="$errorCode='113'">Estatus no válido para el reenvío de token</xsl:when>
            <xsl:when test="$errorCode='114'">El cliente ya ha validado información con un correo diferente</xsl:when>
            <xsl:when test="$errorCode='115'">El cliente ya ha validado información con un telefono diferente</xsl:when>
            <xsl:when test="$errorCode='116'">Favor de ingresar la fecha de nacimiento registrada en NMP</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoErrorNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='100'">NMP-2001</xsl:when>
            <xsl:when test="$errorCode='101'">NMP-3001</xsl:when>
            <xsl:when test="$errorCode='102'">NMP-3002</xsl:when>
            <xsl:when test="$errorCode='103'">NMP-3003</xsl:when> 
            <xsl:when test="$errorCode='104'">NMP-3004</xsl:when> 
            <xsl:when test="$errorCode='105'">NMP-3005</xsl:when>
            <xsl:when test="$errorCode='106'">NMP-3006</xsl:when>
            <xsl:when test="$errorCode='107'">NMP-3007</xsl:when>
            <xsl:when test="$errorCode='108'">NMP-3008</xsl:when>
            <xsl:when test="$errorCode='109'">NMP-3009</xsl:when>
            <xsl:when test="$errorCode='110'">NMP-3010</xsl:when>
            <xsl:when test="$errorCode='111'">NMP-3011</xsl:when>
            <xsl:when test="$errorCode='112'">NMP-3012</xsl:when>
            <xsl:when test="$errorCode='113'">NMP-3013</xsl:when>
            <xsl:when test="$errorCode='114'">NMP-3014</xsl:when>
            <xsl:when test="$errorCode='115'">NMP-3014</xsl:when> 
            <xsl:when test="$errorCode='116'">NMP-3014</xsl:when> 
        </xsl:choose>
    </xsl:template>
     <xsl:template name="tipoErrorNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose> 
            <xsl:when test="$errorCode='100'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='101'">Error de Negocio</xsl:when>  
            <xsl:when test="$errorCode='102'">Error de Negocio</xsl:when>    
            <xsl:when test="$errorCode='103'">Error de Negocio</xsl:when>    
            <xsl:when test="$errorCode='104'">Error de Negocio</xsl:when>  
            <xsl:when test="$errorCode='105'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='106'">Error de Negocio</xsl:when> 
            <xsl:when test="$errorCode='107'">Error de Negocio</xsl:when> 
            <xsl:when test="$errorCode='108'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='109'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='110'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='111'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='112'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='113'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='114'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='115'">Error de Negocio</xsl:when>
            <xsl:when test="$errorCode='116'">Error de Negocio</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="severidadNMP">
        <xsl:param name="errorCode"/>
        <xsl:choose>  
            <xsl:when test="$errorCode='100'">2</xsl:when>  
            <xsl:when test="$errorCode='101'">2</xsl:when>  
            <xsl:when test="$errorCode='102'">2</xsl:when> 
            <xsl:when test="$errorCode='103'">2</xsl:when> 
            <xsl:when test="$errorCode='104'">2</xsl:when> 
            <xsl:when test="$errorCode='105'">2</xsl:when>
            <xsl:when test="$errorCode='106'">2</xsl:when>
            <xsl:when test="$errorCode='107'">2</xsl:when>
            <xsl:when test="$errorCode='108'">2</xsl:when>
            <xsl:when test="$errorCode='109'">2</xsl:when>
            <xsl:when test="$errorCode='110'">2</xsl:when>
            <xsl:when test="$errorCode='111'">2</xsl:when>
            <xsl:when test="$errorCode='112'">2</xsl:when>
            <xsl:when test="$errorCode='113'">2</xsl:when>
            <xsl:when test="$errorCode='114'">2</xsl:when>
            <xsl:when test="$errorCode='115'">2</xsl:when>
            <xsl:when test="$errorCode='116'">2</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="codigoErrorClientes">
        <xsl:param name="errorCode"/>
        <xsl:choose>
            <xsl:when test="$errorCode='NMP-004'">NMP-2001</xsl:when>
            <xsl:when test="$errorCode='NMP-011'">NMP-2001</xsl:when>
        </xsl:choose>
    </xsl:template>     
</xsl:stylesheet>