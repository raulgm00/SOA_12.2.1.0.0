<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nmp="http://schemas.datacontract.org/2004/07/NMP.MRT.BusinessTypes"
    xmlns:ns4="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:tem="http://tempuri.org/" version="1.0" exclude-result-prefixes="ns4 soapenv">
    <xsl:output indent="yes"/>
    <xsl:param name="fuenteDato"/>
    <xsl:template match="/">
    <soapenv:Body>        
        <tem:RecepcionOrdenes>           
            <tem:Orden>
                <xsl:if test="tem:RecepcionOrdenes/tem:Orden/nmp:CategoriaInteraccion">
                    <nmp:CategoriaInteraccion>
                        <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:CategoriaInteraccion"/>
                    </nmp:CategoriaInteraccion>
                </xsl:if>
                <xsl:if test="tem:RecepcionOrdenes/tem:Orden/nmp:Comentarios">
                    <nmp:Comentarios>
                        <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:Comentarios"/>
                    </nmp:Comentarios>
                </xsl:if>                               
                <nmp:Contrato>
                    <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:Contrato"/>
                </nmp:Contrato>
                <xsl:if test="tem:RecepcionOrdenes/tem:Orden/nmp:FechaGestion">
                    <nmp:FechaGestion>
                        <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:FechaGestion"/>
                    </nmp:FechaGestion>
                </xsl:if>                
                <xsl:if test="tem:RecepcionOrdenes/tem:Orden/nmp:FechaGestion">
                    <nmp:FechaGestion>
                        <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:FechaGestion"/>
                    </nmp:FechaGestion>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="$fuenteDato!=''">
                        <nmp:FuenteDato>
                            <xsl:value-of select="$fuenteDato"/>
                        </nmp:FuenteDato>
                    </xsl:when>                   
                </xsl:choose>                
                <nmp:GestorCobranza>
                    <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:GestorCobranza"/>
                </nmp:GestorCobranza>               
                <nmp:IdActividadProveedor>
                    <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:IdActividadProveedor"/>
                </nmp:IdActividadProveedor>
                <xsl:if test="tem:RecepcionOrdenes/tem:Orden/nmp:IdCampaña">
                    <nmp:IdCampaña>
                        <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:IdCampaña"/>
                    </nmp:IdCampaña> 
                </xsl:if>                               
                <nmp:NoBP>
                    <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:NoBP"/>
                </nmp:NoBP>                
                <nmp:Producto>
                    <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:Producto"/>
                </nmp:Producto>
                <xsl:if test="tem:RecepcionOrdenes/tem:Orden/nmp:ResultadoInteraccion">
                    <nmp:ResultadoInteraccion>
                        <xsl:value-of select="tem:RecepcionOrdenes/tem:Orden/nmp:ResultadoInteraccion"/>
                    </nmp:ResultadoInteraccion>
                </xsl:if>                
            </tem:Orden>
        </tem:RecepcionOrdenes>
    </soapenv:Body>    
    </xsl:template>
</xsl:stylesheet>