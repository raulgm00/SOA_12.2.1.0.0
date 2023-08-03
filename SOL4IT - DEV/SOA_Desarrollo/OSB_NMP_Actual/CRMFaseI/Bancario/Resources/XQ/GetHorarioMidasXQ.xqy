xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$dvm" element="ns0:dvm" location="../XSD/DVMOperacionMidasXSD.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPBancario";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Bancario/Resources/XQ/GetHorarioMidasXQ/";

declare function xf:GetHorarioMidasXQ($dvm as element(ns0:dvm),
    $hora as xs:string)
    as xs:string {
    	if($hora = 'inicio') then
        	data($dvm/ns0:horario/ns0:rows/ns0:row[1]/ns0:cell[2])
        else if($hora = 'fin') then
        	data($dvm/ns0:horario/ns0:rows/ns0:row[1]/ns0:cell[3])
       	else ()
};

declare variable $dvm as element(ns0:dvm) external;
declare variable $hora as xs:string external;

xf:GetHorarioMidasXQ($dvm,
    $hora)