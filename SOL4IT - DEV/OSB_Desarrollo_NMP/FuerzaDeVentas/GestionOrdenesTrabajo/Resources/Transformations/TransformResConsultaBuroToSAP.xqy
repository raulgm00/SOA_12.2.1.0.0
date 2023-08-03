xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace trg="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST";
(:: import schema at "../Schemas/GestionMovilFormiikRestElementosXSD.xsd" ::)
declare namespace src="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../../../../GestionClientes/BuroCredito/Resources/Schemas/NMPBuroCreditoSvcXSD.xsd" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare namespace ges = "http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilRESTTipos";

declare variable $consultaBuroResponse as element() (:: schema-element(src:consultaAutografaBCResponse) ::) external;

declare function fnc:consultaBuroRes($consultaBuroResponse as element() (:: schema-element(src:consultaAutografaBCResponse) ::)) as element() (:: schema-element(trg:FlexibleUpdateWorkOrderResponse) ::) {
    <trg:FlexibleUpdateWorkOrderResponse >
        <ges:UpdateFieldsValues>
          <trg:MensajeBuro>{fn:data($consultaBuroResponse/*:UpdateFieldsValues/*:MensajeBuro)}</trg:MensajeBuro>
          <trg:Estatus>{fn:data($consultaBuroResponse/*:UpdateFieldsValues/*:Estatus)}</trg:Estatus>
          <trg:Folio>{fn:data($consultaBuroResponse/*:UpdateFieldsValues/*:Folio)}</trg:Folio>
          <trg:BP>{fn:data($consultaBuroResponse/*:UpdateFieldsValues/*:BP)}</trg:BP>
          <trg:Riesgo>{fn:data($consultaBuroResponse/*:UpdateFieldsValues/*:Riesgo)}</trg:Riesgo>
          {
            for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[1]
            return <trg:Plazo_1>{fn:data($item/*:Plazo)}</trg:Plazo_1>
          }
          {
          for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[1]
            return <trg:Tasa_1>{fn:data($item/*:Tasa)}</trg:Tasa_1>
          }
           {
            for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[2]
            return <trg:Plazo_2>{fn:data($item/*:Plazo)}</trg:Plazo_2>
          }
          {
          for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[2]
            return <trg:Tasa_2>{fn:data($item/*:Tasa)}</trg:Tasa_2>
          }
           {
            for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[3]
            return <trg:Plazo_3>{fn:data($item/*:Plazo)}</trg:Plazo_3>
          }
          {
          for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[3]
            return <trg:Tasa_3>{fn:data($item/*:Tasa)}</trg:Tasa_3>
          }
           {
            for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[4]
            return <trg:Plazo_4>{fn:data($item/*:Plazo)}</trg:Plazo_4>
          }
          {
          for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[4]
            return <trg:Tasa_4>{fn:data($item/*:Tasa)}</trg:Tasa_4>
          }
           {
            for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[5]
            return <trg:Plazo_5>{fn:data($item/*:Plazo)}</trg:Plazo_5>
          }
          {
          for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[5]
            return <trg:Tasa_5>{fn:data($item/*:Tasa)}</trg:Tasa_5>
          }
           {
            for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[6]
            return <trg:Plazo_6>{fn:data($item/*:Plazo)}</trg:Plazo_6>
          }
          {
          for $item in $consultaBuroResponse/*:UpdateFieldsValues/*:ListaTasasInteres/*:TasaInteres[6]
            return <trg:Tasa_6>{fn:data($item/*:Tasa)}</trg:Tasa_6>
          }
        </ges:UpdateFieldsValues>
        <ges:AfectedFields />
    </trg:FlexibleUpdateWorkOrderResponse>
};

fnc:consultaBuroRes($consultaBuroResponse)