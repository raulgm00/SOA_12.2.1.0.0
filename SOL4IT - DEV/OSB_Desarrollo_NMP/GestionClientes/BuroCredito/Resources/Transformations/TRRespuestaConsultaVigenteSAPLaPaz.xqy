xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)
declare namespace sap="urn:sap-com:document:sap:soap:functions:mc-style";
(:: import schema at "../WSDLs/SAPConsultaVigenteConinWSDL.wsdl" ::)

declare namespace loc="http://www.w3.org/2005/xquery-local-functions";

declare variable $respuesta as element() (:: schema-element(sap:ZlmRfcConsultaVigenteResponse) ::) external;

declare function loc:RespuestaConsultaVigenteSAPConin($respuesta as element() (:: schema-element(sap:ZlmRfcConsultaVigenteResponse) ::)) as element() (:: schema-element(nmp:consultaVigenteBCResponse) ::) {
    <nmp:consultaVigenteBCResponse>
    {
      if($respuesta/Confirmacion = "1") then <nmp:respuesta>No vigente</nmp:respuesta>
      else if($respuesta/Confirmacion = "0") then 
        if(fn:upper-case($respuesta/EstatusKo) = "0") then <nmp:respuesta>Rechazado</nmp:respuesta>
        else if(fn:upper-case($respuesta/EstatusKo) = "1") then <nmp:respuesta>Aprobado</nmp:respuesta>
        else if(fn:upper-case($respuesta/EstatusKo) = "2") then <nmp:respuesta>No aplica</nmp:respuesta>
        else <nmp:respuesta>No vigente</nmp:respuesta>
      else <nmp:respuesta>No vigente</nmp:respuesta>
    }
    <nmp:informeBuro>
        <nmp:calificaciones>
            <nmp:calificacion>
                <nmp:valorScore>{fn:data($respuesta/ScoreBuro)}</nmp:valorScore>
            </nmp:calificacion>
        </nmp:calificaciones>
    </nmp:informeBuro>
    </nmp:consultaVigenteBCResponse>
};

loc:RespuestaConsultaVigenteSAPConin($respuesta)