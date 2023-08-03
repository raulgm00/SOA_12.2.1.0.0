xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$o" element="o" location="../xsd/wsReporteVentasDiarias.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetDailySalesReportResponseIM" location="../xsd/Messages.xsd" ::)

declare namespace ns0 = "http://nmp.com/CommonDataModel/1.0/Common";
declare namespace xf = "http://tempuri.org/cenmp/resources/xq/x/";

declare function xf:x($o as element(o))
    as element(ns0:GetDailySalesReportResponseIM) {
        <ns0:GetDailySalesReportResponseIM>
            <ns0:ResultNotification>
                <ns0:Code>
                    {
                        if (fn:boolean(data($o/estatus))) then
                            ('OK')
                        else 
                            'ERROR'
                    }
</ns0:Code>
                <ns0:Description>{ data($o/mensaje) }</ns0:Description>
            </ns0:ResultNotification>
            <ns0:ListOfSales>
                {
                    for $e in $o/datos/e
                    return
                        <ns0:Sale>
                            <ns0:Center>
                                <ns0:ID>{ data($e/centro_id) }</ns0:ID>
                                <ns0:Name>{ data($e/centro) }</ns0:Name>
                            </ns0:Center>
                            <ns0:Product>
                                 <ns0:ID>{ data($e/producto_id) }</ns0:ID>
                                <ns0:Name>{ data($e/producto) }</ns0:Name>
                                <ns0:Category>{ data($e/categoria_producto) }</ns0:Category>
                                <ns0:PriceList>{ data($e/precio_lista) }</ns0:PriceList>
                            </ns0:Product>
                            <ns0:FolioClient>{ data($e/folio_socio) }</ns0:FolioClient>
                            <ns0:FolioSale>{ data($e/folio_venta) }</ns0:FolioSale>
                            <ns0:Type>{ data($e/tipo_orden) }</ns0:Type>
                            <ns0:Client>{ data($e/socio) }</ns0:Client>
                            <ns0:Date>{ data($e/fecha) }</ns0:Date>
                            <ns0:Time>{ data($e/hora) }</ns0:Time>
                            <ns0:TotalAmount>{ data($e/total) }</ns0:TotalAmount>
                            <ns0:Quantity>{ data($e/cantidad) }</ns0:Quantity>
                            <ns0:Discount>{ data($e/descuento) }</ns0:Discount>
                            <ns0:Promotion>{ data($e/cupon) }</ns0:Promotion>
                        </ns0:Sale>
                }
            </ns0:ListOfSales>
        </ns0:GetDailySalesReportResponseIM>
};

declare variable $o as element(o) external;

xf:x($o)