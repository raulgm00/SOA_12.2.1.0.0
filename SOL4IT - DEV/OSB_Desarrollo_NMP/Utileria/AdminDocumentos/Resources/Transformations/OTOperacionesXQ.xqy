xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$funcion" type="xs:string" ::)
(:: pragma  parameter="$param1" type="xs:string" ::)

declare namespace nmpOT = "http://servicios.montedepiedad.com.mx/NMP/xQuery/OpenText";

declare function nmpOT:mainOT($funcion as xs:string,$param1 as xs:string) as element(*){

let $result:= if ($funcion='Clientes' or $funcion='NumCliente' or $funcion='ClientesConin') then
               nmpOT:getNumeroCliente($param1)
              else if ($funcion='Creditos' or $funcion='CreditosConin') then
                nmpOT:getNumeroCredito($param1)
              else if ($funcion='NumFolio') then
                nmpOT:getNumeroTicket($param1)  
              else if ($funcion='getFileSize') then
                nmpOT:getFileSize($param1)
              else if ($funcion='creaNombreDocto') then
                nmpOT:creaNombreDocto($param1)
                else
              <Result/>
return $result                   
};

declare function nmpOT:getNumeroCliente($param1 as xs:string) as element(*){
let $countCadena := 10 - fn:string-length($param1)
let $cadenaCliente:='00000000000'
return            
         <Result>{fn:concat(fn:substring($cadenaCliente,1,number($countCadena)),$param1)}</Result>                   
};

declare function nmpOT:getNumeroCredito($param1 as xs:string) as element(*){
let $countCadena := 13 - fn:string-length($param1)
let $cadenaCliente:='00000000000000'
return            
         <Result>{fn:concat('01_',fn:substring($cadenaCliente,1,number($countCadena)),$param1)}</Result>                   
};

declare function nmpOT:getNumeroTicket($param1 as xs:string) as element(*){
let $countCadena := 11 - fn:string-length($param1)
let $cadenaCliente:='000000000000'
return            
         <Result>{fn:concat(fn:substring($cadenaCliente,1,number($countCadena)),$param1)}</Result>                   
};

declare function nmpOT:getFileSize($param1 as xs:string) as element(*){
let $countCadena := fn:string-length(normalize-space($param1))
let $countIgual := fn:count(fn:tokenize($param1, '=')[. = ''])
return            
         <Result>{$countCadena * (3 div 4)- $countIgual }</Result>
         
};

declare function nmpOT:format2digitos($paramInt1 as xs:integer) as element(*){
let $countCadena := 2 - fn:string-length(string($paramInt1))
let $cadenaDigitos:='00'
return            
         <Result>{fn:concat(fn:substring($cadenaDigitos,1,$countCadena),$paramInt1)}</Result> 
         
};


declare function nmpOT:creaNombreDocto($param1 as xs:string) as element(*){
let $mes := nmpOT:format2digitos(fn:month-from-date(fn:current-date()))
let $dia := nmpOT:format2digitos(fn:day-from-date(fn:current-date()))
let $hora := nmpOT:format2digitos(fn:hours-from-time(fn:current-time()))
let $minuto := nmpOT:format2digitos(fn:minutes-from-time(fn:current-time()))
let $prefijoFecha := fn:concat(fn:year-from-date(fn:current-date()),$mes,$dia)
let $prefijoTiempo :=fn:concat($hora,$minuto)
let $extension := fn:substring-after($param1,'.')
let $fileNameOrig := fn:substring-before($param1,'.')
let $fileName := fn:concat($fileNameOrig,'_',$prefijoFecha,'_',$prefijoTiempo,'.',$extension)
return            
         <Result>{$fileName}</Result>
         
};



declare variable $funcion as xs:string external;
declare variable $param1 as xs:string external;

nmpOT:mainOT($funcion,$param1)