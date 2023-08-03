xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)
declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito";
(:: import schema at "../../../../GestionRiesgos/EvaluacionCredito/Resources/Schemas/NMPEvaluacionCreditoXSD.xsd" ::)

declare namespace crd="http://www.w3.org/2005/xquery-local-functions";

declare variable $idCliente as xs:long external;
declare variable $calificacionBuro as xs:string external;
declare variable $folioConsultaBuro as xs:string external;
declare variable $fechaConsultaBuro as xs:date external;
declare variable $origenConsultaBuro as xs:string external;
declare variable $respuestaBRM as element() (:: schema-element(ns1:valorarRiesgoResponse) ::) external;

declare function crd:RespuestaConsultaAutenticaCredito($idCliente as xs:long,
                                                       $calificacionBuro as xs:string, 
                                                       $folioConsultaBuro as xs:string, 
                                                       $fechaConsultaBuro as xs:date, 
                                                       $origenConsultaBuro as xs:string,
                                                       $respuestaBRM as element() (:: schema-element(ns1:valorarRiesgoResponse) ::)) 
                                                       as element() (:: schema-element(nmp:consultaBCResponse) ::) {
    <nmp:consultaBCResponse>
        <nmp:respuesta>
        {
          if($respuestaBRM/ns1:resultado = 'Reprobado') then 'Rechazado'
          else fn:data($respuestaBRM/ns1:resultado)
        }
        </nmp:respuesta>
        <nmp:resumenConsultaBuro>
          <nmp:idCliente>{fn:data($idCliente)}</nmp:idCliente>
          {
            if($respuestaBRM/ns1:resultado = 'Error buro') then ()
            else <nmp:calificacion>{fn:data($calificacionBuro)}</nmp:calificacion>
          }
          {
            if(fn:empty($folioConsultaBuro)) then ()
            else <nmp:folioConsulta>{fn:data($folioConsultaBuro)}</nmp:folioConsulta>
          }
          <nmp:fechaConsulta>{fn:data($fechaConsultaBuro)}</nmp:fechaConsulta>
          {
            if($respuestaBRM/ns1:resultado = 'Error buro') then ()
            else <nmp:origenConsulta>{fn:data($origenConsultaBuro)}</nmp:origenConsulta>
          }
        </nmp:resumenConsultaBuro>
    </nmp:consultaBCResponse>
};

crd:RespuestaConsultaAutenticaCredito($idCliente, $calificacionBuro, $folioConsultaBuro, $fechaConsultaBuro, $origenConsultaBuro, $respuestaBRM)