xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace trg="http://xmlns.oracle.com/pcbpel/adapter/db/top/BitacoraContabilidadDB";
(:: import schema at "../Schemas/OSBBitacoraContabilidadDbXSD.xsd" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare variable $messageId as xs:string external;
declare variable $transaccionId as xs:string external;
declare variable $fecha as xs:string external;
declare variable $servicio as xs:string external;
declare variable $operacion as xs:string external;
declare variable $payload as element()* external;

declare function fnc:crearBitacoraContabilidadReq($messageId as xs:string, $transaccionId as xs:string, $fecha as xs:string, $servicio as xs:string, $operacion as xs:string, $payload as element()*) as element() (:: schema-element(trg:BitOsbContabilidadCollection) ::) {
        <trg:BitOsbContabilidadCollection>
          <trg:BitOsbContabilidad>
            <trg:messageId>{fn:data($messageId)}</trg:messageId>
            <trg:transaccionId>{fn:data($transaccionId)}</trg:transaccionId>
            <trg:fecha>{fn:data($fecha)}</trg:fecha>
            <trg:servicio>{fn:data($servicio)}</trg:servicio>
            <trg:operacion>{fn:data($operacion)}</trg:operacion>
            <trg:contenido>{fn-bea:serialize($payload)}</trg:contenido>
          </trg:BitOsbContabilidad>
        </trg:BitOsbContabilidadCollection>
};

fnc:crearBitacoraContabilidadReq($messageId, $transaccionId, $fecha, $servicio, $operacion, $payload)