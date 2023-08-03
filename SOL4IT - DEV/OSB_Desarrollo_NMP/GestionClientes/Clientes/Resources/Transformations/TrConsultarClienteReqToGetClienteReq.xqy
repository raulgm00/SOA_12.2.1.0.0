xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader";
(:: import schema at "../../../../Common/XSD/NMPStandardHeader.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schemas/Cliente/Credito";
(:: import schema at "../Schemas/NMPClienteCreditoSvcXSD.xsd" ::)
declare namespace ns3="http://tempuri.org/";
(:: import schema at "../Schemas/CRMClienteCreditoSvcXSD.xsd" ::)

declare namespace cli = "http://servicios.montedepiedad.com.mx/NMP/Schema/Entidad/Cliente";

declare variable $body as element() (:: schema-element(ns2:consultarClienteRequest) ::) external;
declare variable $header as element() (:: schema-element(ns1:headerMessage) ::) external;

declare function local:convert($body as element() (:: schema-element(ns2:consultarClienteRequest) ::), 
                               $header as element() (:: schema-element(ns1:headerMessage) ::)) 
                               as element() (:: schema-element(ns3:GetCliente) ::) {
    <ns3:GetCliente>
        {if (fn:data($body/cli:idCliente)) then
          (<ns3:id>{fn:data($body/cli:idCliente)}</ns3:id>)
        else
          ()}
        {if (fn:data($body/cli:numeroCredencial)) then
          (<ns3:NoCredencial>{fn:data($body/cli:numeroCredencial)}</ns3:NoCredencial>)
        else
          ()}
            
        <ns3:FuenteDato>{fn:data($header/ns1:idConsumidor)}</ns3:FuenteDato>
    </ns3:GetCliente>
};

local:convert($body, $header)