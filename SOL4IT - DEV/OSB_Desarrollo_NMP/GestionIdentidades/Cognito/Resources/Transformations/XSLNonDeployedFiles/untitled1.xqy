xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha";

declare variable $fechaHora as xs:dateTime external;

declare function utl:formatoFechaHoraISO8601($fechaHora as xs:dateTime) as xs:string {
    let $fechaISO8601 := fn:replace(fn:replace(xs:string($fechaHora), '-', ''), ':', '')
    
    let $fechaISO8601 := 
      if(fn:contains($fechaISO8601, '.')) then fn:concat(fn:substring-before($fechaISO8601, '.'), 'Z')
      else $fechaISO8601
    
    return $fechaISO8601
};

utl:formatoFechaHoraISO8601($fechaHora)