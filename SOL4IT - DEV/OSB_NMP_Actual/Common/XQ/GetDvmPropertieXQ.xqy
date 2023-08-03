declare namespace dvm="http://www.w3.org/2005/xquery-local-functions";

declare variable $dvm as element()* external;
declare variable $indexUseToSearch as xs:int external;
declare variable $valueUseToSearch as xs:string external;
declare variable $propertieIndexReturn as xs:int external;

(:
  XQuery para obtener los valores de un DVM especificado:
  Donde:
        $dvm - Contiene el DVM a leer.
        $indexKeySearch - Índice del la propiedad conocida por la cual se va a realizar la búsqueda de otra propiedad del item.
        $valueKeySearch - Valor conocido por el cual se va a realizar la búsqueda de otra propiedad del item.
        $indexPropertie - Índice de la propiedad del item que se quiere obtener.
:)
declare function dvm:getDvmPropertieXQ($indexUseToSearch as xs:int, 
                                       $valueUseToSearch as xs:string,
                                       $dvm as element()*,
                                       $propertieIndexReturn as xs:int) 
                                       as xs:string {
                                          fn:string($dvm/*:rows/*:row[*:cell[$indexUseToSearch]=$valueUseToSearch]/*:cell[position()=$propertieIndexReturn])
                                       };

dvm:getDvmPropertieXQ($indexUseToSearch, $valueUseToSearch, $dvm, $propertieIndexReturn)