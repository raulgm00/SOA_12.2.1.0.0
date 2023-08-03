xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$funcion" type="xs:string" ::)
(:: pragma  parameter="$param1" type="xs:string" ::)

declare namespace nmpUM = "http://servicios.montedepiedad.com.mx/NMP/xQuery/UsuariosMonte";

declare function nmpUM:mainUM($funcion as xs:string,$param1 as xs:string) as element(*){

let $result:= if ($funcion='numCredencial') then
               nmpUM:getNumeroCliente($param1)              
                else
              <Result/>
return $result                   
};

declare function nmpUM:getNumeroCliente($param1 as xs:string) as element(*){
let $countCadena := 16 - fn:string-length($param1)
let $cadenaCliente:='00000000000000000'
return            
         <Result>{fn:concat(fn:substring($cadenaCliente,1,number($countCadena)),$param1)}</Result>                   
};


declare variable $funcion as xs:string external;
declare variable $param1 as xs:string external;

nmpUM:mainUM($funcion,$param1)