xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare variable $GenerarOfertasRequest as element() (:: schema-element(ns1:GenerarOfertasRequest) ::) external;

declare function local:func($GenerarOfertasRequest as element() (:: schema-element(ns1:GenerarOfertasRequest) ::)) as element() (:: schema-element(ns1:GenerarOfertasResponse) ::) {
    <ns1:GenerarOfertasResponse>
        <ofe:generarOfertasBase>{fn:boolean('true')}</ofe:generarOfertasBase>
    </ns1:GenerarOfertasResponse>
};

local:func($GenerarOfertasRequest)