xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace src="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST";
(:: import schema at "../Schemas/GestionMovilFormiikRestElementosXSD.xsd" ::)
declare namespace trg="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../../../../GestionClientes/BuroCredito/Resources/Schemas/NMPBuroCreditoSvcXSD.xsd" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare namespace ges = "http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilRESTTipos";

declare variable $consultaBuroRequest as element() (:: schema-element(src:FlexibleUpdateWorkOrderRequest) ::) external;

declare function fnc:consultaBuroReq($consultaBuroRequest as element() (:: schema-element(src:FlexibleUpdateWorkOrderRequest) ::)) as element() (:: schema-element(trg:consultaAutografaBCRequest) ::) {
    <trg:consultaAutografaBCRequest>
        <trg:IdWorkOrderFormType>{fn:data($consultaBuroRequest/ges:IdWorkOrderFormType)}</trg:IdWorkOrderFormType>
        <trg:IdWorkOrder>{fn:data($consultaBuroRequest/ges:IdWorkOrder)}</trg:IdWorkOrder>
        <trg:ExternalId>{fn:data($consultaBuroRequest/ges:ExternalId)}</trg:ExternalId>
        <trg:Action>{fn:data($consultaBuroRequest/ges:Action)}</trg:Action>
        <trg:InputFields>
            <trg:Nombre1>{fn:data($consultaBuroRequest/ges:InputFields/ges:Nombre1)}</trg:Nombre1>
            <trg:Nombre2>{fn:data($consultaBuroRequest/ges:InputFields/ges:Nombre2)}</trg:Nombre2>
            <trg:Apellido_Paterno>{fn:data($consultaBuroRequest/ges:InputFields/ges:Apellido_Paterno)}</trg:Apellido_Paterno>
            <trg:Apellido_Materno>{fn:data($consultaBuroRequest/ges:InputFields/ges:Apellido_Materno)}</trg:Apellido_Materno>
            <trg:CalleCB>{fn:data($consultaBuroRequest/ges:InputFields/ges:CalleCB)}</trg:CalleCB>
            <trg:NoExtCB>{fn:data($consultaBuroRequest/ges:InputFields/ges:NoExtCB)}</trg:NoExtCB>
            <trg:DelegacionCB>{fn:data($consultaBuroRequest/ges:InputFields/ges:DelegacionCB)}</trg:DelegacionCB>
            <trg:EstadoCB>{fn:data($consultaBuroRequest/ges:InputFields/ges:EstadoCB)}</trg:EstadoCB>
            <trg:CPCB>{fn:data($consultaBuroRequest/ges:InputFields/ges:CPCB)}</trg:CPCB>
            <trg:RFCCB>{fn:data($consultaBuroRequest/ges:InputFields/ges:RFCCB)}</trg:RFCCB>
            <trg:FechadeNacimientoCB>{fn:data($consultaBuroRequest/ges:InputFields/ges:FechadeNacimientoCB)}</trg:FechadeNacimientoCB>
            <trg:Num_Cliente>{fn:data($consultaBuroRequest/ges:InputFields/ges:Num_Cliente)}</trg:Num_Cliente>
            <trg:BP_PROBINCUMPL>{
				 if(fn:empty($consultaBuroRequest/ges:InputFields/ges:BP_PROBINCUMPL/text())) then 0
				else fn:data($consultaBuroRequest/ges:InputFields/ges:BP_PROBINCUMPL)
			}</trg:BP_PROBINCUMPL>
            <trg:BP_SIVA>{
				if(fn:empty($consultaBuroRequest/ges:InputFields/ges:BP_SIVA/text())) then 0
				else fn:data($consultaBuroRequest/ges:InputFields/ges:BP_SIVA) 
			}</trg:BP_SIVA>
            <trg:Frecuencia>{fn:data($consultaBuroRequest/ges:InputFields/ges:Frecuencia)}</trg:Frecuencia>
            {
                if ($consultaBuroRequest/ges:InputFields/ges:ExternalType)
                then <trg:ExternalType>{fn:data($consultaBuroRequest/ges:InputFields/ges:ExternalType)}</trg:ExternalType>
                else ()
            }</trg:InputFields>
        <trg:Username>{fn:data($consultaBuroRequest/ges:Username)}</trg:Username>
        <trg:WorkOrderType>{fn:data($consultaBuroRequest/ges:WorkOrderType)}</trg:WorkOrderType>
    </trg:consultaAutografaBCRequest>
};

fnc:consultaBuroReq($consultaBuroRequest)