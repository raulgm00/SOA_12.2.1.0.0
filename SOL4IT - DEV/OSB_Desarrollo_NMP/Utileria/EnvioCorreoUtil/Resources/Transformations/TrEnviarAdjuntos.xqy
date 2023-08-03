xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/EnvioCorreoUtil";
(:: import schema at "../Schemas/NMPEnvioCorreoUtilXSD.xsd" ::)

declare namespace loc="http://www.w3.org/2005/xquery-local-functions";

declare variable $envioCorreoReq as element() (:: schema-element(ns1:envioCorreoRequest) ::) external;

declare function loc:adjuntos($envioCorreoReq as element() (:: schema-element(ns1:envioCorreoRequest) ::)) as element() (:: element(*, ns1:adjuntosType) ::) {
    <ns1:adjuntosType>
        {
            for $adjunto in $envioCorreoReq/ns1:adjuntos/ns1:adjunto
            return 
            <ns1:adjunto>
                <ns1:nombreArchivo>{fn:concat('"',fn:data($adjunto/ns1:nombreArchivo),'" : "',fn:data($adjunto/ns1:contenido),'"')}</ns1:nombreArchivo>                
            </ns1:adjunto>
        }
    </ns1:adjuntosType>
};

loc:adjuntos($envioCorreoReq)