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
    <ns3:DbUpdateRegistroRenovacionInput>
        <ns3:ESTATUS_SOA>
        {
                if (compare($headerResponse/ns1:codigoRespuesta/text(),'1001') = 0)
                then fn:data('PROCESADO / NO GENERA OFERTA')
                else if (compare($headerResponse/ns1:codigoRespuesta/text(),'0') = 0)
                then fn:data('PROCESADO / GENERA OFERTA')
                else if (compare($headerResponse/ns1:codigoRespuesta/text(),'0') != 0 and compare($headerResponse/ns1:codigoRespuesta/text(),'1001') != 0)
                then fn:data('ERROR')
                else ()
            }
        </ns3:ESTATUS_SOA>
        <ns3:DESCRIPCION_ERROR>{fn:data($headerResponse/ns1:descripcionRespuesta)}</ns3:DESCRIPCION_ERROR>
        <ns3:MANDT>{fn:data($body/MANDT)}</ns3:MANDT>
        <ns3:SOCIEDAD>{fn:data($body/SOCIEDAD)}</ns3:SOCIEDAD>
        <ns3:CONTRATO>{fn:data($body/CONTRATO)}</ns3:CONTRATO>
    </ns3:DbUpdateRegistroRenovacionInput>
</soap-env:Body>
};

local:func($headerResponse, $body)