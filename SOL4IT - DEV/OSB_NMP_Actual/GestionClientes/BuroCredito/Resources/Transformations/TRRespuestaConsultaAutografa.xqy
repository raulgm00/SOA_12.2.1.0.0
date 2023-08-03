xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace trg="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)
declare namespace src="urn:sap-com:document:sap:rfc:functions";
(:: import schema at "../WSDLs/SAPConsultaBuroCreditoMovilWSDL.wsdl" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare variable $src:consultaBuroResponse as element() (:: schema-element(src:ZLM_RFC_CONSULTABUROResponse) ::) external;
declare variable $idCliente as xs:string external;

declare function fnc:TransformarConsultaAutografaResXQ($idCliente as xs:string, $src:consultaBuroResponse as element() (:: schema-element(src:ZLM_RFC_CONSULTABUROResponse) ::)) as element() (:: schema-element(trg:consultaAutografaBCResponse) ::) {
    <trg:consultaAutografaBCResponse>
        <trg:UpdateFieldsValues>
            <trg:MensajeBuro>
            {
              if($src:consultaBuroResponse/E_STATUS_KO = "1") then "SI"
              else 
                if($src:consultaBuroResponse/E_STATUS_KO = "0") then "NO"
                else ()
            }
            </trg:MensajeBuro>
            <trg:Estatus>
            {
              if($src:consultaBuroResponse/E_STATUS_KO = "1") then "Aceptado" 
              else 
                if($src:consultaBuroResponse/E_STATUS_KO = "0") then "Rechazado" 
                else ()
            }
            </trg:Estatus>
            <trg:Folio>{fn:data($src:consultaBuroResponse/E_FOLIO)}</trg:Folio>
            <trg:BP>{fn:data($idCliente)}</trg:BP>
            <trg:Riesgo>{fn:data($src:consultaBuroResponse/E_COMENTARIO)}</trg:Riesgo> 
            <trg:ListaTasasInteres>
            {
                for $item in $src:consultaBuroResponse/ET_TASAS/item
                return <TasaInteres>
                        <trg:Tasa>{fn:data($item/TASA)}</trg:Tasa>
                        <trg:Plazo>{fn:data($item/PLAZO)}</trg:Plazo>
                       </TasaInteres>
            }
            </trg:ListaTasasInteres>
        </trg:UpdateFieldsValues>
        <trg:AfectedFields />
    </trg:consultaAutografaBCResponse>
};

fnc:TransformarConsultaAutografaResXQ($idCliente, $src:consultaBuroResponse)