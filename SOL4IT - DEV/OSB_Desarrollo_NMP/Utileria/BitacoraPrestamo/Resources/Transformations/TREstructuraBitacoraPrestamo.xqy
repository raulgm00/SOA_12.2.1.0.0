xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace trg="http://xmlns.oracle.com/pcbpel/adapter/db/top/BitacoraPrestamoDB";
(:: import schema at "../Schemas/OSBBitacoraPrestamoSvcXSD.xsd" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare variable $payload as element()* external;
declare variable $messageId as xs:string external;

declare function fnc:TrEstructuraBitacora($messageId as xs:string, $payload as element()*) as element() (:: schema-element(trg:BitOsbPrestamoCollection) ::) {
    <trg:BitOsbPrestamoCollection>
        <trg:BitOsbPrestamo>
            <trg:messageId>{fn:data($messageId)}</trg:messageId>
            <trg:sucursal>{fn:data($payload/*:idSucursal)}</trg:sucursal>
            <trg:fecha>{fn:data($payload/*:fechaOperacion)}</trg:fecha>
            <trg:partidas>
            {
              for $Operacion in $payload/*:ListaOperaciones/*:Operacion
              return fn:concat(fn:data($Operacion/*:Prestamo/*:folioPartida), ',')
            }
            </trg:partidas>
            <trg:contenido>{fn-bea:serialize($payload)}</trg:contenido>
        </trg:BitOsbPrestamo>
    </trg:BitOsbPrestamoCollection>
};

fnc:TrEstructuraBitacora($messageId, $payload)