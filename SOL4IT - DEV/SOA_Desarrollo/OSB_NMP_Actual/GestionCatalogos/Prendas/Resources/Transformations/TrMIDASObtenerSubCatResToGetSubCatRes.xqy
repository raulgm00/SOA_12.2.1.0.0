(:: pragma bea:global-element-parameter parameter="$obtenerSubCatalogoBPMResponse1" element="ns3:obtenerSubCatalogoBPMResponse" location="CatalogoBPMWS.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:getSubCatalogoResponse" location="catalogosMidasSvcXSD.xsd" ::)

declare namespace ns2 = "http://nmpcatalogobpm.schema.nmp.servicios.montedepiedad.com.mx";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCatMidasSvc";
declare namespace ns3 = "urn:mx.com.nmp.midas";
declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCatMidas";
declare namespace xf = "http://tempuri.org/Test/TrSubCatalogoMidasToBPM/";

declare function xf:TrSubCatalogoMidasToBPM($obtenerSubCatalogoBPMResponse1 as element(ns3:obtenerSubCatalogoBPMResponse))
    as element(ns1:getSubCatalogoResponse) {
        <ns1:getSubCatalogoResponse>
            {
                let $ValorCatalogoBPM := $obtenerSubCatalogoBPMResponse1/ns3:out/ns2:valorCatalogoBPM/ns2:ValorCatalogoBPM
                return
                	for $ValorCatalogoBPMlist in $ValorCatalogoBPM
                	return
                    <ns1:subCatalogo>
                        
                        <ns0:descripcion>{data($ValorCatalogoBPMlist/ns2:descripcion)}</ns0:descripcion>
                        <ns0:id>{ data($ValorCatalogoBPMlist/ns2:id) }</ns0:id>
                        <ns0:valor>{ data($ValorCatalogoBPMlist/ns2:valor) }</ns0:valor>
                        
                    </ns1:subCatalogo>
            }
        </ns1:getSubCatalogoResponse>
};

declare variable $obtenerSubCatalogoBPMResponse1 as element(ns3:obtenerSubCatalogoBPMResponse) external;

xf:TrSubCatalogoMidasToBPM($obtenerSubCatalogoBPMResponse1)