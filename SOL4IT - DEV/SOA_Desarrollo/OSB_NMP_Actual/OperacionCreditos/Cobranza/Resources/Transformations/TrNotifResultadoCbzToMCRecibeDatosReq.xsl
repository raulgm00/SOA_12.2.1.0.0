<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tem="http://tempuri.org/"
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza" exclude-result-prefixes="ges"
    version="1.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">        
        <tem:recibe_datos >            
            <tem:CREDITO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:cliente/ges:idContrato"/>
            </tem:CREDITO>
            <tem:LONGITUD_Y_LONGITUD>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:gps"/>
            </tem:LONGITUD_Y_LONGITUD> 
            <!--tem:GESTOR_GESTIONO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:gestorGestiono"/>
            </tem:GESTOR_GESTIONO-->
            <tem:GESTOR_GESTIONO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/@AssignedTo"/>
            </tem:GESTOR_GESTIONO>
            <tem:ACCION>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:accion"/>
            </tem:ACCION>         
            <tem:RESULTADO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:gestionCobranza"/>
            </tem:RESULTADO>         
            <tem:CAUSA_NOPAGO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:causaNoPago"/>
            </tem:CAUSA_NOPAGO>         
            <tem:COMENTARIO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:comentarios"/>
            </tem:COMENTARIO>         
            <tem:MONTO_PROMESA>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:montoPromesaPago"/>
            </tem:MONTO_PROMESA>         
            <tem:FECHA_PROMESA>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:fechaPromesaPago"/>
            </tem:FECHA_PROMESA>         
            <tem:CORREO_ELECTRONICO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:correoElectronico"/>
            </tem:CORREO_ELECTRONICO>         
            <tem:CALLE>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:nombreDelaCalle"/>
            </tem:CALLE>         
            <tem:NUMERO_EXT>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:numeroExterior"/>
            </tem:NUMERO_EXT>         
            <tem:NUMERO_INT>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:numeroInterior"/>
            </tem:NUMERO_INT>         
            <tem:MANZANA>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:manzana"/>
            </tem:MANZANA>         
            <tem:LOTE>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:lote"/>
            </tem:LOTE>         
            <tem:COLONIA>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:colonia"/>
            </tem:COLONIA>         
            <tem:MUNICIPIO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:delegacionMunicipio"/>
            </tem:MUNICIPIO>         
            <tem:ESTADO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:estado"/>
            </tem:ESTADO>         
            <tem:LOCALIDAD>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:localidad"/>
            </tem:LOCALIDAD>         
            <tem:ENTRE_CALLE_1>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:entreCalle1"/>
            </tem:ENTRE_CALLE_1>         
            <tem:ENTRE_CALLE_2>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:entreCalle2"/>
            </tem:ENTRE_CALLE_2>         
            <tem:CP>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:codigoPostal"/>
            </tem:CP>         
            <tem:TIPO_TELEFONO_1>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[1]/ges:tipoTelefono"/>
            </tem:TIPO_TELEFONO_1>         
            <tem:LADA_TELEFONO1>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[1]/ges:codigoArea"/>
            </tem:LADA_TELEFONO1>         
            <tem:TELEFONO1>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[1]/ges:numeroTelefonico"/>
            </tem:TELEFONO1>         
            <tem:TIPO_TELEFONO_2>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[2]/ges:tipoTelefono"/>
            </tem:TIPO_TELEFONO_2>         
            <tem:LADA_TELEFONO2>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[2]/ges:codigoArea"/>
            </tem:LADA_TELEFONO2>         
            <tem:TELEFONO2>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[2]/ges:numeroTelefonico"/>
            </tem:TELEFONO2>         
            <tem:TIPO_TELEFONO_3>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[3]/ges:tipoTelefono"/>
            </tem:TIPO_TELEFONO_3>         
            <tem:LADA_TELEFONO3>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[3]/ges:codigoArea"/>
            </tem:LADA_TELEFONO3>         
            <tem:TELEFONO3>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[3]/ges:numeroTelefonico"/>
            </tem:TELEFONO3>         
            <tem:TIPO_TELEFONO_4>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[4]/ges:tipoTelefono"/>
            </tem:TIPO_TELEFONO_4>         
            <tem:LADA_TELEFONO4>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[4]/ges:codigoArea"/>
            </tem:LADA_TELEFONO4>         
            <tem:TELEFONO4>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:telefonos/ges:telefono[4]/ges:numeroTelefonico"/>
            </tem:TELEFONO4>         
            <tem:TIPO_NEGOCIACION>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:tipoNegociacion"/>
            </tem:TIPO_NEGOCIACION>         
            <tem:PERIODICIDAD>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:periodicidad"/>
            </tem:PERIODICIDAD>         
            <tem:NUM_PAGOS>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:pagos"/>
            </tem:NUM_PAGOS>         
            <tem:DIA_DE_PAGO>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:fechaPago"/>
            </tem:DIA_DE_PAGO>         
            <tem:MONTO_NEGOCIACION>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:montoNegociacion"/>
            </tem:MONTO_NEGOCIACION>
            <tem:TIPO_DIRECCION>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/ges:Cobranza/ges:resultadoGestion/ges:direccion/ges:tipoDomicilio"/>
            </tem:TIPO_DIRECCION>
            <tem:ID_EXTERNAL>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/@ExternalId"/>
            </tem:ID_EXTERNAL>
            <tem:FINAL_DTE>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/@InitialDate"/>
            </tem:FINAL_DTE>
            <tem:EXTERNAL_TYPE>
                <xsl:value-of select="ges:notificaGestionCobranzaRequest/@ExternalType"/>
            </tem:EXTERNAL_TYPE>
            <xsl:choose>
                <xsl:when test="ges:notificaGestionCobranzaRequest/@ExternalType='Recuperacion' or ges:notificaGestionCobranzaRequest/@ExternalType='Negociado'">
                    <tem:COMPANY>3</tem:COMPANY>    
                </xsl:when>
                <xsl:otherwise>
                    <tem:COMPANY>1</tem:COMPANY>
                </xsl:otherwise>
            </xsl:choose>
        </tem:recibe_datos>
    </xsl:template>    
</xsl:stylesheet>