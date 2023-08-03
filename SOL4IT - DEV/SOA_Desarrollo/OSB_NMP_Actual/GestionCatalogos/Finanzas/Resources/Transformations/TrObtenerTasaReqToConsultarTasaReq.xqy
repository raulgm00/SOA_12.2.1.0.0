xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/Catalogos/Finanzas";
(:: import schema at "../Schemas/NMPCatalogosFinanzasXSD.xsd" ::)
declare namespace ns2="urn:sap-com:document:sap:soap:functions:mc-style";
(:: import schema at "../WSDLs/SAPConsultaTasasWSDL.wsdl" ::)

declare variable $obtenerTasaReq as element() (:: schema-element(ns1:obtenerTasaPlazoRequest) ::) external;

declare function local:func($obtenerTasaReq as element() (:: schema-element(ns1:obtenerTasaPlazoRequest) ::)) as element() (:: schema-element(ns2:ZlmfmRfcConsultaTasa) ::) {
    <ns2:ZlmfmRfcConsultaTasa>
        {if($obtenerTasaReq/ns1:calificacionBuro)
        then <Bc>{fn:data($obtenerTasaReq/ns1:calificacionBuro)}</Bc>
        else ()
        }
        {if($obtenerTasaReq/ns1:frecuencia)
        then  <Frecuencia>{fn:data($obtenerTasaReq/ns1:frecuencia)}</Frecuencia>
        else()
        }
        {if($obtenerTasaReq/ns1:probabilidadIncumplimiento)
        then <Pi>{fn:data($obtenerTasaReq/ns1:probabilidadIncumplimiento)}</Pi>
        else()}
        {if($obtenerTasaReq/ns1:plazo)
        then  <Plazo>{fn:data($obtenerTasaReq/ns1:plazo)}</Plazo>
        else()
        }  
       {if($obtenerTasaReq/ns1:producto)
       then  <Producto>{fn:data($obtenerTasaReq/ns1:producto)}</Producto>
       else()
       }
       {if($obtenerTasaReq/ns1:subProducto)
       then  <Subproducto>{fn:data($obtenerTasaReq/ns1:subProducto)}</Subproducto>
       else()}
      </ns2:ZlmfmRfcConsultaTasa>
       
};

local:func($obtenerTasaReq)