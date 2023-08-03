xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha";

(: Obtener entero (timestamp) de fecha (formato: YYYY-MM-DDThh:mm:ssZ) :)
declare function utl:obtenerTimestampDeFecha($fechaHora as xs:dateTime) as xs:integer {
    let $diaCero := xs:dateTime('1970-01-01T00:00:00-00:00')
    return xs:integer(($fechaHora - $diaCero) div xs:dayTimeDuration('PT1S'))
};

(: Obtener fecha (formato: YYYY-MM-DDThh:mm:ssZ) de entero (timestamp) :)
declare function utl:obtenerFechaDeTimestamp($timestamp as xs:integer) as xs:dateTime
{
  let $diaCero := xs:dateTime('1970-01-01T00:00:00-00:00')
  return $diaCero + xs:dayTimeDuration(fn:concat("PT", $timestamp, "S"))
};

(: Convertir numero exponecial a entero:)
declare function utl:obtenerIntegerDeNumExp($strNumeroExp as xs:string) as xs:integer
{
    let $numInteger := xs:integer(fn:number($strNumeroExp))
    return $numInteger
};

(: Agregar horas a fecha (formato: YYYY-MM-DDThh:mm:ssZ) :)
declare function utl:agregarHorasEnFechaHora($fechaHora as xs:dateTime, $horasIncrementar as xs:int) as xs:dateTime {
    let $nuevaFechaHora := $fechaHora + xs:dayTimeDuration(fn:concat('PT', $horasIncrementar, 'H'))
    return $nuevaFechaHora
};

(: Restar horas a fecha (formato: YYYY-MM-DDThh:mm:ssZ) :)
declare function utl:restarHorasEnFechaHora($fechaHora as xs:dateTime, $horasDecrementar as xs:int) as xs:dateTime {
    let $nuevaFechaHora := $fechaHora - xs:dayTimeDuration(fn:concat('PT', $horasDecrementar, 'H'))
    return $nuevaFechaHora
};

(: Dar formato ISO-8601 (YYYYMMDDThhmmssZ) a fecha de tipo YYYY-MM-DDThh:mm:ssZ) :)
declare function utl:formatoFechaHoraISO8601($fechaHora as xs:dateTime) as xs:string {
    let $fechaISO8601 := fn:replace(fn:replace(xs:string($fechaHora), '-', ''), ':', '')
    
    let $fechaISO8601 := 
      if(fn:contains($fechaISO8601, '.')) then fn:concat(fn:substring-before($fechaISO8601, '.'), 'Z')
      else $fechaISO8601
    
    return $fechaISO8601
};