<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://schemas.datacontract.org/2004/07/NMP.MRT.BusinessTypes"
    xmlns:tem="http://tempuri.org/"
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza"
    exclude-result-prefixes="ges" version="1.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">        
        <tem:RecepcionOrdenes>           
            <tem:Orden>
                <xsl:if test="ges:revocarGestionRequest/ges:gestion/ges:orden/ges:accion">
                    <nmp:CategoriaInteraccion>
                        <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/ges:orden/ges:accion"/>
                    </nmp:CategoriaInteraccion>
                </xsl:if>
                <xsl:if test="ges:revocarGestionRequest/ges:gestion/ges:orden/ges:comentarios">
                    <nmp:Comentarios>
                        <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/ges:orden/ges:comentarios"/>
                    </nmp:Comentarios>
                </xsl:if>                               
                <nmp:Contrato>
                    <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/ges:cliente/ges:idContrato"/>
                </nmp:Contrato>               
                <!--nmp:Descripcion/-->
                <xsl:if test="ges:revocarGestionRequest/ges:gestion/@fechaGestion">
                    <nmp:FechaGestion>
                        <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/@fechaGestion"/>
                    </nmp:FechaGestion>
                </xsl:if>                               
                <nmp:GestorCobranza>
                    <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/ges:orden/@gestor"/>
                </nmp:GestorCobranza>               
                <nmp:IdActividadProveedor>
                    <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/@idExternal"/>
                </nmp:IdActividadProveedor>
                <!--xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:resultadoGestion/ges:idCampana">
                    <nmp:IdCampaña>
                        <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:resultadoGestion/ges:idCampana"/>
                    </nmp:IdCampaña> 
                </xsl:if-->                               
                <nmp:NoBP>
                    <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/ges:cliente/ges:idCliente"/>
                </nmp:NoBP>                
                <nmp:Producto>
                    <xsl:value-of select="ges:revocarGestionRequest/ges:gestion/@idProducto"/>
                </nmp:Producto>
                <!--xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:resultadoGestion/ges:gestionCobranza">
                    <nmp:ResultadoInteraccion>
                        <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:resultadoGestion/ges:gestionCobranza"/>
                    </nmp:ResultadoInteraccion>
                </xsl:if-->                
            </tem:Orden>
        </tem:RecepcionOrdenes>
    </xsl:template>
</xsl:stylesheet>