xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)

declare namespace loc="http://www.w3.org/2005/xquery-local-functions";

declare variable $respuestaEvluacion as xs:string external;
declare variable $idCliente as xs:long external;
declare variable $calificacion as xs:string external;
declare variable $folioConsulta as xs:string external;
declare variable $fechaConsulta as xs:date external;
declare variable $origenConsulta as xs:string external;

declare function loc:respuestaConsultaAutenticaLaPaz($respuestaEvluacion as xs:string, 
                                                     $idCliente as xs:long, 
                                                     $calificacion as xs:string, 
                                                     $fechaConsulta as xs:date, 
                                                     $origenConsulta as xs:string) 
                                                     as element() (:: schema-element(nmp:consultaBCResponse) ::) {
    <nmp:consultaBCResponse>
        <nmp:respuesta>{fn:data($respuestaEvluacion)}</nmp:respuesta>
        <nmp:resumenConsultaBuro>
            <nmp:idCliente>{fn:data($idCliente)}</nmp:idCliente>
            <nmp:calificacion>{fn:data($calificacion)}</nmp:calificacion>
            <nmp:fechaConsulta>{fn:data($fechaConsulta)}</nmp:fechaConsulta>
            <nmp:origenConsulta>{fn:data($origenConsulta)}</nmp:origenConsulta>
            <nmp:generarPdf></nmp:generarPdf>
        </nmp:resumenConsultaBuro>
    </nmp:consultaBCResponse>
};

loc:respuestaConsultaAutenticaLaPaz($respuestaEvluacion, $idCliente, $calificacion, $fechaConsulta, $origenConsulta)