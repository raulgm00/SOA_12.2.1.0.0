xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace err="http://xmlns.oracle.com/pcbpel/adapter/db/top/BitacoraBatchPrestamoDB";
(:: import schema at "../Schemas/OSBBitacoraBatchPrestamoDbXSD.xsd" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare variable $idMensaje as xs:string external;
declare variable $fechaRegistro as xs:string external;
declare variable $componente as xs:string external;
declare variable $codigoError as xs:string external;
declare variable $detalleError as xs:string external;
declare variable $paylodad as element()* external;

declare function fnc:crearMesajeBitacora($idMensaje as xs:string, 
                                         $fechaRegistro as xs:string, 
                                         $componente as xs:string, 
                                         $codigoError as xs:string, 
                                         $detalleError as xs:string, 
                                         $paylodad as element()*) 
                                         as element() (:: schema-element(err:BitOsbBatchScoreCollection) ::) {
    <err:BitOsbBatchScoreCollection>
        <err:BitOsbBatchScore>
            <err:idMensaje>{fn:data($idMensaje)}</err:idMensaje>
            <err:fecha>{fn:data($fechaRegistro)}</err:fecha>
            <err:componente>{fn:data($componente)}</err:componente>
            <err:codigoError>{fn:data($codigoError)}</err:codigoError>
            <err:detalleError>{fn:data($detalleError)}</err:detalleError>
            {
               if(fn:exists(fn:data($paylodad/*:TaDetalleOperacionCollection))) then
                    <err:payload>{fn-bea:serialize($paylodad)}</err:payload>
                else ()
            }
        </err:BitOsbBatchScore>
    </err:BitOsbBatchScoreCollection>
};

fnc:crearMesajeBitacora($idMensaje, $fechaRegistro, $componente, $codigoError, $detalleError, $paylodad)