xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$dvm" element="ns0:dvm" location="../XSD/DVMOperacionMidasXSD.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPBancario";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Bancario/Resources/XQ/GetOperacionMidasXQ/";

declare function xf:GetOperacionMidasXQ($dvm as element(ns0:dvm),
    $search as xs:string)
    as xs:string {
        data($dvm/ns0:operaciones/ns0:rows/ns0:row[ns0:cell[1]=$search]/ns0:cell[2])
        
};

declare variable $dvm as element(ns0:dvm) external;
declare variable $search as xs:string external;

xf:GetOperacionMidasXQ($dvm, $search)