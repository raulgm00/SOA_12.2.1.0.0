<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dat="http://nmp.com.mx/ms/pagos/motorformulas/ws/formulas/datatypes/"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:nmp1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPlataformacomercialError"
                 version="2.0">
    <xsl:template match="/">       
        <dat:resolverArticuloAsincronoRequest>
            <dat:articuloQueue>
                <dat:Operacion>Creacion de Articulo</dat:Operacion>
                <dat:ProductName>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionErrorResponse/nmp1:response/nmp1:response/nmp1:articuloErrorQueue/nmp1:ProductName"></xsl:value-of>
                </dat:ProductName>
                <!--Optional:-->
                <dat:ProductCode>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionErrorResponse/nmp1:response/nmp1:response/nmp1:articuloErrorQueue/nmp1:ProductCode"></xsl:value-of>
                </dat:ProductCode>
                <!--Optional:-->
                <dat:status>
                    Failed
                </dat:status>
                <!--Optional:-->
                <dat:error_message>
                    Invalid Product code
                </dat:error_message>
            </dat:articuloQueue>
        </dat:resolverArticuloAsincronoRequest>
    </xsl:template>
</xsl:stylesheet>