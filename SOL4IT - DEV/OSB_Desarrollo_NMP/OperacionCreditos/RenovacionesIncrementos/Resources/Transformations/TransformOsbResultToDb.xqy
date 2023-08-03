xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader";
(:: import schema at "../../../../Common/XSD/NMPStandardHeader.xsd" ::)
declare namespace ns3="http://xmlns.oracle.com/pcbpel/adapter/db/DbUpdateRegistroRenovacion";
(:: import schema at "../Schemas/DBGOVUpdateRegistroRenovacionXSD.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/xdb/CMSOA";
(:: import schema at "../Schemas/OSBRenovacionTiposXSD.xsd" ::)
declare namespace soap-env="http://schemas.xmlsoap.org/soap/envelope/";

declare variable $headerResponse as element() (:: schema-element(ns1:headerMessageResponse) ::) external;
declare variable $body as element() (:: schema-element(ns2:RENOVACION_MESSAGE_TYPE) ::) external;

declare function local:func($headerResponse as element() (:: schema-element(ns1:headerMessageResponse) ::), 
                            $body as element() (:: schema-element(ns2:RENOVACION_MESSAGE_TYPE) ::)) 
                            as element() (:: schema-element(ns3:DbUpdateRegistroRenovacionInput) ::) {
<soap-env:Body>
    <ns3:BDActualizaRegistrosClientesDBInput>
        <ns3:ESTATUS_SOA>
        {
                if (compare($headerResponse/ns1:codigoRespuesta/text(),'1001') = 0)
                then fn:data('PROCESADO / NO ACTUALIZADO')
                else if (compare($headerResponse/ns1:codigoRespuesta/text(),'0') = 0)
                then fn:data('PROCESADO / ACTUALIZADO')
                else if (compare($headerResponse/ns1:codigoRespuesta/text(),'0') != 0 and compare($headerResponse/ns1:codigoRespuesta/text(),'1001') != 0)
                then fn:data('ERROR')
                else ()
            }
        </ns3:ESTATUS_SOA>
        <ns3:DESCRIPCION_ERROR>{fn:data($headerResponse/ns1:descripcionRespuesta)}</ns3:DESCRIPCION_ERROR>
        <ns3:IDPERSONA>{fn:data($body/IDPERSONA)}</ns3:IDPERSONA>
        <ns3:PERSONAUNICAID>{fn:data($body/PERSONAUNICAID)}</ns3:PERSONAUNICAID>
        <ns3:CONTACTIDORIGEN>{fn:data($body/CONTACTIDORIGEN)}</ns3:CONTACTIDORIGEN>
    </ns3:BDActualizaRegistrosClientesDBInput>
</soap-env:Body>
};

local:func($headerResponse, $body)