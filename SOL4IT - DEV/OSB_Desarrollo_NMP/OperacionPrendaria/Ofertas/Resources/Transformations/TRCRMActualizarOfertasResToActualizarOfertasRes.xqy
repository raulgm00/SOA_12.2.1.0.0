xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)
declare namespace ns1="http://tempuri.org/";
(:: import schema at "../Schemas/CRMActualizarOfertasElementosXSD.xsd" ::)

declare namespace bus = "http://schemas.datacontract.org/2004/07/BusinessTypes";

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare variable $CambiaEstadoResponse as element() (:: schema-element(ns1:CambiaEstadoResponse) ::) external;

declare function local:func($CambiaEstadoResponse as element() (:: schema-element(ns1:CambiaEstadoResponse) ::)) as element() (:: schema-element(ns2:ActualizarOfertasResponse) ::) {
    <ns2:ActualizarOfertasResponse>
        {
            if ($CambiaEstadoResponse/ns1:CambiaEstadoResult/bus:Codigo)
            then <ofe:codigo>{fn:data(fn:string($CambiaEstadoResponse/ns1:CambiaEstadoResult/bus:Codigo))}</ofe:codigo>
            else ()
        }
        {
            if ($CambiaEstadoResponse/ns1:CambiaEstadoResult/bus:Mensaje)
            then <ofe:mensaje>{fn:data($CambiaEstadoResponse/ns1:CambiaEstadoResult/bus:Mensaje)}</ofe:mensaje>
            else ()
        }
    </ns2:ActualizarOfertasResponse>
};

local:func($CambiaEstadoResponse)