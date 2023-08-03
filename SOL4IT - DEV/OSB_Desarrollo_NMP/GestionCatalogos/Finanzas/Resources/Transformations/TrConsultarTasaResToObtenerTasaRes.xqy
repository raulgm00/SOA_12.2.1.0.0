xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/Catalogos/Finanzas";
(:: import schema at "../Schemas/NMPCatalogosFinanzasXSD.xsd" ::)
declare namespace ns1="urn:sap-com:document:sap:soap:functions:mc-style";
(:: import schema at "../WSDLs/SAPConsultaTasasWSDL.wsdl" ::)

declare variable $consultarTasaRes as element() (:: schema-element(ns1:ZlmfmRfcConsultaTasaResponse) ::) external;

declare function local:func($consultarTasaRes as element() (:: schema-element(ns1:ZlmfmRfcConsultaTasaResponse) ::)) as element() (:: schema-element(ns2:obtenerTasaPlazoResponse) ::) {
    <ns2:obtenerTasaPlazoResponse>
        {
            for $item in $consultarTasaRes/Tasa/item
            return 
            <ns2:tasaPlazo>
                <ns2:producto>{fn:data($item/Producto)}</ns2:producto>
                <ns2:subProducto>{fn:data($item/Subprod)}</ns2:subProducto>
                <ns2:frecuencia>{fn:data($item/Frecuencia)}</ns2:frecuencia>
                <ns2:plazo>{fn:data($item/Plazo)}</ns2:plazo>
                <ns2:calificacionBuroMinimo>{fn:data($item/ScoreMinBc)}</ns2:calificacionBuroMinimo>
                <ns2:calificacionBuroMaximo>{fn:data($item/ScoreMaxBc)}</ns2:calificacionBuroMaximo>
                <ns2:probabilidadIncumplimientoMinimo>{fn:data($item/ScoreMinPi)}</ns2:probabilidadIncumplimientoMinimo>
                <ns2:probabilidadIncumplimientoMaximo>{fn:data($item/ScoreMaxPi)}</ns2:probabilidadIncumplimientoMaximo>
                <ns2:tasa>{fn:data($item/Tasa)}</ns2:tasa>
                <ns2:tasaMinimo>{fn:data($item/TasaMin)}</ns2:tasaMinimo>
                <ns2:tasaMaximo>{fn:data($item/TasaMax)}</ns2:tasaMaximo>
                <ns2:clasificacionRiesgo>{fn:data($item/Etiqueta)}</ns2:clasificacionRiesgo></ns2:tasaPlazo>
        }
    </ns2:obtenerTasaPlazoResponse>
};

local:func($consultarTasaRes)