xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare variable $BpelGuardarOfertasResponse as element() (:: schema-element(ns1:GuardarOfertasResponse) ::) external;

declare function local:func($BpelGuardarOfertasResponse as element() (:: schema-element(ns1:GuardarOfertasResponse) ::)) as element() (:: schema-element(ns1:GuardarOfertasResponse) ::) {
    <ns1:GuardarOfertasResponse>
        <ofe:codigo>{fn:string('0')}</ofe:codigo>
        <ofe:mensaje>{fn:string('Se ha recibido con exito la solicitud: GuardarOferta')}</ofe:mensaje>
    </ns1:GuardarOfertasResponse>
};

local:func($BpelGuardarOfertasResponse)