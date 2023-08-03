<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dat="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPActualizacionEKL"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:nmp1="http://xmlns.oracle.com/xdb/CMPLATAFORMACOMERCIAL"
                 version="2.0">
    <xsl:template match="/">       
        <dat:doc>      
                <dat:doc>
                <dat:folio>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/FOLIO"></xsl:value-of>
                </dat:folio>
                <!--Optional:-->
                <dat:precio_venta>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/PRECIO_VENTA"></xsl:value-of>
                </dat:precio_venta>
                <!--Optional:-->
               </dat:doc>
        </dat:doc>
    </xsl:template>
</xsl:stylesheet>