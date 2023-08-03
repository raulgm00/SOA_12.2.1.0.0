xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader";
(:: import schema at "../../../../../Common/XSD/NMPStandardHeader.xsd" ::)
declare namespace ns1="http://tempuri.org/";
(:: import schema at "../Schemas/CRMCampaniasClienteElementosXSD.xsd" ::)

declare namespace bus = "http://schemas.datacontract.org/2004/07/BusinessTypes";

declare variable $GetCampaignsClienteResponse as element() (:: schema-element(ns1:GetCampaignsClienteResponse) ::) external;
declare variable $headerMessage as element() (:: schema-element(ns2:headerMessage) ::) external;

declare function local:func($GetCampaignsClienteResponse as element() (:: schema-element(ns1:GetCampaignsClienteResponse) ::), 
                            $headerMessage as element() (:: schema-element(ns2:headerMessage) ::)) 
                            as element() (:: schema-element(ns2:headerMessageResponse) ::) {
    <ns2:headerMessageResponse>
        <ns2:usuario>{fn:data($headerMessage/ns2:usuario)}</ns2:usuario>
        <ns2:idConsumidor>{fn:data($headerMessage/ns2:idConsumidor)}</ns2:idConsumidor>
        <ns2:idDestino>{fn:data($headerMessage/ns2:idDestino)}</ns2:idDestino>
        <ns2:codigoRespuesta>{fn:data($GetCampaignsClienteResponse/ns1:GetCampaignsClienteResult/bus:Codigo)}</ns2:codigoRespuesta>
        <ns2:descripcionRespuesta>{fn:data($GetCampaignsClienteResponse/ns1:GetCampaignsClienteResult/bus:Mensaje)}</ns2:descripcionRespuesta>
    </ns2:headerMessageResponse>
};

local:func($GetCampaignsClienteResponse, $headerMessage)