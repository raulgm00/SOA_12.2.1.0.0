<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dat="http://nmp.com.mx/ms/pagos/motorformulas/ws/formulas/datatypes/"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:nmp1="http://xmlns.oracle.com/PlataformaComercial_3/OperacionPrendaria/OSBArticulosAgilirionConcrete2"
                 version="2.0">
    <xsl:template match="/">       
        <dat:doc>      
                <dat:Monto_Avaluo>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/AVALUO_TECNICO"></xsl:value-of>
                </dat:Monto_Avaluo>
                <!--Optional:-->
                <dat:Valor_Comercial>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/AVALUO_TECNICO"></xsl:value-of>
                </dat:Valor_Comercial>
                <!--Optional:-->
                <dat:Kilataje>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/KILATAJE"></xsl:value-of>
                </dat:Kilataje>
                <!--Optional:-->
                <dat:Monto_Prestamo>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/PRESTAMO"></xsl:value-of>
                </dat:Monto_Prestamo>
                <!--Optional:-->
                <dat:Gramaje>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/GRAMAJE"></xsl:value-of>
                </dat:Gramaje>
                <!--Optional:-->
                <dat:Precio_Metal>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/COSTO_METAL"></xsl:value-of>
                </dat:Precio_Metal>
                <!--Optional:-->
                <dat:Numero_Sucursal>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/SUCURSAL"></xsl:value-of>
                </dat:Numero_Sucursal>
                <!--Optional:-->
                <dat:Valor_Monte>
                    <xsl:value-of select="nmp1:NMP_AJUSTE_PRECIOS_TYPE/VALOR_MONTE"></xsl:value-of>
                </dat:Valor_Monte>
                <!--Optional:-->
            
        </dat:doc>
    </xsl:template>
</xsl:stylesheet>