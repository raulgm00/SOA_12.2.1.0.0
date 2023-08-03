<?xml version="1.0" encoding="windows-1252" ?>
<xsl:stylesheet version="2.0" exclude-result-prefixes="nmp1"
 xmlns:nmp1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPlataformacomercial"

xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/"><articulos>
        <articulo>
            <!--Optional:-->
            <articuloQueue>
                <!--Optional:-->
                <ProductName><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductName"></xsl:value-of></ProductName>
                <!--Optional:-->
                <ProductCode><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductCode"></xsl:value-of></ProductCode>
                <!--Optional:-->
                 <Barcode><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Barcode"></xsl:value-of></Barcode>

                <!--Optional:-->
                <ProductCategory><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductCategory"></xsl:value-of></ProductCategory>
                <!--Optional:-->
                <PreferredVendor><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:PreferredVendor"></xsl:value-of></PreferredVendor>
                <!--Optional:-->
                <Manufacturer><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Manufacturer"></xsl:value-of></Manufacturer>
                <!--Optional:-->
                <ProductImages><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductImages"></xsl:value-of></ProductImages>
                <!--Optional:-->
                <SeoTitle><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SeoTitle"></xsl:value-of></SeoTitle>
                <!--Optional:-->
                <SeoDescription><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SeoDescription"></xsl:value-of></SeoDescription>
                <!--Optional:-->
                <SeoKeywords><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SeoKeywords"></xsl:value-of></SeoKeywords>
                <!--Optional:-->
                <Description><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Description"></xsl:value-of></Description>
                <!--Optional:-->
                <Discontinued><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Discontinued"></xsl:value-of></Discontinued>
                <!--Optional:-->
                <Website><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Website"></xsl:value-of></Website>
                <!--Optional:-->
                <ProductStockManager><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProductStockManager"></xsl:value-of></ProductStockManager>
                <!--Optional:-->
                <SendStockNotification><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:SendStockNotification"></xsl:value-of></SendStockNotification>
                <!--Optional:-->
                <AutoCreatePOAtReorderLevel><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:AutoCreatePOAtReorderLevel"></xsl:value-of></AutoCreatePOAtReorderLevel>
                <!--Optional:-->
                <Volume><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Volume"></xsl:value-of></Volume>
                <!--Optional:-->
                <Length><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Length"></xsl:value-of></Length>
                <!--Optional:-->
                <Width><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Width"></xsl:value-of></Width>
                <!--Optional:-->
                <Height><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Height"></xsl:value-of></Height>
                <!--Optional:-->
                <WeightMajor><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ProduWeightMajorctName"></xsl:value-of></WeightMajor>
                <!--Optional:-->
                <WeightMinor><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:WeightMinor"></xsl:value-of></WeightMinor>
                <!--Optional:-->
                <Irregular><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:Irregular"></xsl:value-of></Irregular>
                <!--Optional:-->
                <ShippingCost><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:ShippingCost"></xsl:value-of></ShippingCost>
                <!--Optional:-->
                <IncomeAccount><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:IncomeAccount"></xsl:value-of></IncomeAccount>
                <!--Optional:-->
                <CogsAccount><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:CogsAccount"></xsl:value-of></CogsAccount>
                <!--Optional:-->
                <AssetAccount><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:AssetAccount"></xsl:value-of></AssetAccount>
                <!--Optional:-->
                <TaxCategory><xsl:value-of select="nmp1:obteneArticuloAgilirionResponse/nmp1:articulos/nmp1:articulo/nmp1:articuloQueue/nmp1:TaxCategory"></xsl:value-of></TaxCategory>
            </articuloQueue>
        </articulo>
    </articulos></xsl:template>
</xsl:stylesheet>