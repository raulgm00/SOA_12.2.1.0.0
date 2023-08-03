xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito";
(:: import schema at "../../../../OperacionCreditos/Creditos/Resources/Schemas/NMPCreditoSvcElementosXSD.xsd" ::)

declare variable $estatusSolicitudes as element() (:: schema-element(ns1:getEstatusSolicitudResponse) ::) external;

declare function local:func($estatusSolicitudes as element() (:: schema-element(ns1:getEstatusSolicitudResponse) ::)) as xs:string {
   let $solicitudes := $estatusSolicitudes/ns1:EstatusSolicitudes
  return
 <FormEditResponse>
          <Solicitudes>
{
   for $solicitud in $solicitudes/ns1:EstatusSolicitudes       
     return fn:concat("<Solicitudes><Solicitud><Id_Cliente>",$solicitud/ns1:nombreCliente,"</Id_Cliente>",
          "<Numero_Solicitud>",$solicitud/ns1:solicitud,"</Numero_Solicitud>",
          "<Estatus>",$solicitud/ns1:estatusGestion,"</Estatus>",
          "<Sub_Estatus>",$solicitud/ns1:estatusSolicitud,"</Sub_Estatus>",
          "<Motivo_Pendiente>",$solicitud/ns1:motivoPen,"</Motivo_Pendiente>",
          "<Fecha_Firma>",$solicitud/ns1:fechaFirma,"</Fecha_Firma>",
          "<Monto_Desembolso>",$solicitud/ns1:montoDesembolso,"</Monto_Desembolso>",
          "<Saldo_Fecha>",$solicitud/ns1:saldoFecha,"</Saldo_Fecha></Solicitud></Solicitudes>")
 }  
 </Solicitudes>
 </FormEditResponse>
          
};

declare function local:func2($estatusSolicitudes as element() (:: schema-element(ns1:getEstatusSolicitudResponse) ::)) as xs:string {
    fn:concat(" <FormEditResponse>",
        local:func($estatusSolicitudes),"</FormEditResponse>")
};

local:func2($estatusSolicitudes)