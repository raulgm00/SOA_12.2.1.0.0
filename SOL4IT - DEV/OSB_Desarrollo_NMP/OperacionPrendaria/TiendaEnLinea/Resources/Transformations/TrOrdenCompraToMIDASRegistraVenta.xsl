<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tien="http://servicios.montedepiedad.com.mx/NMP/Schema/TiendaLineaTipos" 
    xmlns:ord="http://servicios.montedepiedad.com.mx/NMP/Schema/OrdenesCompra"
    version="1.2">
    <xsl:output indent="yes"/>
    <xsl:template match="/">     
        <xsl:variable name="IdVerificador"
            select="ord:recibeOrdenRequest/tien:id"/>
        <urn:registrarOperacionVenta xmlns:urn="urn:mx.com.nmp.midas">
            <urn:operacion xmlns:dto="http://dto.model.midas.nmp.com.mx">                
                <dto:digitoVerificador>
                    <xsl:value-of select="substring($IdVerificador,string-length($IdVerificador)-7,8)"/>
                </dto:digitoVerificador>                
                <dto:fecha>
                    <xsl:value-of select="ord:recibeOrdenRequest/tien:fechaActualizacion"/>
                </dto:fecha>               
                <dto:folioVenta>
                    <xsl:value-of select="ord:recibeOrdenRequest/tien:numeroCompra"/>
                </dto:folioVenta>           
                <dto:importeIVA>
                    <xsl:value-of select="ord:recibeOrdenRequest/tien:totalCargos"/>
                </dto:importeIVA>                
                <dto:importeTotal>
                    <xsl:value-of select="ord:recibeOrdenRequest/tien:subtotal"/>
                </dto:importeTotal>                
                <dto:mercancias>
                    <xsl:for-each select="ord:recibeOrdenRequest/tien:detalleOrden/tien:articulo">
                        <dto:DetalleMercancia>                
                            <dto:folio>
                                <xsl:value-of select="tien:sku"/> <!-- SKU -->
                            </dto:folio>         
                            <dto:importeIVA>
                                <xsl:value-of select="sum(tien:cargosLineas/tien:cargoLineas/tien:monto)"/>
                            </dto:importeIVA>
                            <dto:precioVenta>
                                <xsl:value-of select="tien:precio"/>
                            </dto:precioVenta>
                        </dto:DetalleMercancia>
                    </xsl:for-each>                    
                </dto:mercancias>
            </urn:operacion>
        </urn:registrarOperacionVenta>        
    </xsl:template>
</xsl:stylesheet>