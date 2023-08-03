<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dat="http://nmp.com.mx/ms/pagos/motorformulas/ws/formulas/datatypes/"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:nmp1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPlataformacomercial"
                 version="2.0">
    <xsl:template match="/">       
        <dat:resolverArticuloAsincronoRequest>
            <dat:articuloQueue>
                
                
                <dat:ProductName>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductName"></xsl:value-of>
                </dat:ProductName>
                <!--Optional:-->
                <dat:ProductCode>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductCode"></xsl:value-of>
                </dat:ProductCode>
                <!--Optional:-->
                <dat:Barcode>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Barcode"></xsl:value-of>
                </dat:Barcode>
                <!--Optional:-->
                <dat:ProductCategory>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductCategory"></xsl:value-of>
                </dat:ProductCategory>
                <!--Optional:-->
                <dat:PreferredVendor>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:PreferredVendor"></xsl:value-of>
                </dat:PreferredVendor>
                <!--Optional:-->
                <dat:Manufacturer>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Manufacturer"></xsl:value-of>
                </dat:Manufacturer>
                <!--Optional:-->
                <dat:ProductImages>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductImages"></xsl:value-of>
                </dat:ProductImages>
                <!--Optional:-->
                <dat:SeoTitle>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SeoTitle"></xsl:value-of>
                </dat:SeoTitle>
                <!--Optional:-->
                <dat:SeoDescription>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SeoDescription"></xsl:value-of>
                </dat:SeoDescription>
                <!--Optional:-->
                <dat:SeoKeywords>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SeoKeywords"></xsl:value-of>
                </dat:SeoKeywords>
                <!--Optional:-->
                <dat:Description>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Description"></xsl:value-of>
                </dat:Description>
                <!--Optional:-->
                <dat:Discontinued>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Discontinued"></xsl:value-of>
                </dat:Discontinued>
                <!--Optional:-->
                <dat:Website>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Website"></xsl:value-of>
                </dat:Website>
                <!--Optional:-->
                <dat:ProductStockManager>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductStockManager"></xsl:value-of>
                </dat:ProductStockManager>
                <!--Optional:-->
                <dat:SendStockNotification>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SendStockNotification"></xsl:value-of>
                </dat:SendStockNotification>
                <!--Optional:-->
                <dat:AutoCreatePOAtReorderLevel>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:AutoCreatePOAtReorderLevel"></xsl:value-of>
                </dat:AutoCreatePOAtReorderLevel>
                <!--Optional:-->
                <dat:Volume>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Volume"></xsl:value-of>
                </dat:Volume>
                <!--Optional:-->
                <dat:Length>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Length"></xsl:value-of>
                </dat:Length>
                <!--Optional:-->
                <dat:Width>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Width"></xsl:value-of>
                </dat:Width>
                <!--Optional:-->
                <dat:Height>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Height"></xsl:value-of>
                </dat:Height>
                <!--Optional:-->
                <dat:WeightMajor>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProduWeightMajorctName"></xsl:value-of>
                </dat:WeightMajor>
                <!--Optional:-->
                <dat:WeightMinor>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:WeightMinor"></xsl:value-of>
                </dat:WeightMinor>
                <!--Optional:-->
                <dat:Irregular>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Irregular"></xsl:value-of>
                </dat:Irregular>
                <!--Optional:-->
                <dat:ShippingCost>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ShippingCost"></xsl:value-of>
                </dat:ShippingCost>
                <!--Optional:-->
                <dat:IncomeAccount>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:IncomeAccount"></xsl:value-of>
                </dat:IncomeAccount>
                <!--Optional:-->
                <dat:CogsAccount>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:CogsAccount"></xsl:value-of>
                </dat:CogsAccount>
                <!--Optional:-->
                <dat:AssetAccount>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:AssetAccount"></xsl:value-of>
                </dat:AssetAccount>
                <!--Optional:-->
                <dat:TaxCategory>
                    <xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:TaxCategory"></xsl:value-of>
                </dat:TaxCategory>
            </dat:articuloQueue>
        </dat:resolverArticuloAsincronoRequest>
    </xsl:template>
</xsl:stylesheet>