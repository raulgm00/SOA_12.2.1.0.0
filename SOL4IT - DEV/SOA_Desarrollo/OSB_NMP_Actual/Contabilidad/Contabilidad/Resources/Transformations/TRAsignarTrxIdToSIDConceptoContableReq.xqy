xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare namespace cc="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPContabilidad";
(:: import schema at "../Schemas/NMPContabilidadSvcXSD.xsd" ::)

declare variable $messageId as xs:string external;
declare variable $conceptoContableReq as element(cc:registrarConceptoContableRequest) external;

declare function fnc:asignarIdTrxToCptoCont($messageId as xs:string, $conceptoContableReq as element(cc:registrarConceptoContableRequest)) as element(cc:registrarConceptoContableRequest){
    <cc:registrarConceptoContableRequest>
        <cc:idTransaccion>{fn:data($messageId)}</cc:idTransaccion>
        {
            if (fn:exists($conceptoContableReq/cc:idSucursal)) then 
              if (fn:not(fn:empty($conceptoContableReq/cc:idSucursal))) then 
                <cc:idSucursal>{fn:data($conceptoContableReq/cc:idSucursal)}</cc:idSucursal>
              else ()
            else ()
        }
        {
            if (fn:exists($conceptoContableReq/cc:fechaRegistro)) then 
              if (fn:not(fn:empty($conceptoContableReq/cc:fechaRegistro))) then 
                <cc:fechaRegistro>{fn:data($conceptoContableReq/cc:fechaRegistro)}</cc:fechaRegistro>
              else ()
            else ()
        }
        {
            if (fn:exists($conceptoContableReq/cc:idConceptoMIDAS)) then 
              if (fn:not(fn:empty($conceptoContableReq/cc:idConceptoMIDAS))) then 
                <cc:idConceptoMIDAS>{fn:data($conceptoContableReq/cc:idConceptoMIDAS)}</cc:idConceptoMIDAS>
              else ()
            else ()
        }
        {
            if (fn:exists($conceptoContableReq/cc:auxiliarConcepto)) then 
              if (fn:not(fn:empty($conceptoContableReq/cc:auxiliarConcepto))) then
                <cc:auxiliarConcepto>{fn:data($conceptoContableReq/cc:auxiliarConcepto)}</cc:auxiliarConcepto>
              else ()
            else ()
        }
        {
            if (fn:exists($conceptoContableReq/cc:monto)) then 
              if (fn:not(fn:empty($conceptoContableReq/cc:monto))) then
                <cc:monto>{fn:data($conceptoContableReq/cc:monto)}</cc:monto>
              else ()
            else ()
        }
        {
            if (fn:exists($conceptoContableReq/cc:esCancelacion)) then 
              if (fn:not(fn:empty($conceptoContableReq/cc:esCancelacion))) then 
                <cc:esCancelacion>{fn:data($conceptoContableReq/cc:esCancelacion)}</cc:esCancelacion>
              else ()
            else ()
        }
    </cc:registrarConceptoContableRequest>
};

fnc:asignarIdTrxToCptoCont($messageId, $conceptoContableReq)