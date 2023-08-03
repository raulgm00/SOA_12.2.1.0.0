xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/Identidades/Midas/Sucursal";
(:: import schema at "../WSDL/SucursalProxy.wsdl" ::)
declare namespace ns1="http://xmlns.oracle.com/bpel/services/IdentityService";
(:: import schema at "../WSDL/IdentityService.wsdl" ::)

declare variable $ns1:userObject as element() (:: schema-element(ns1:userObject) ::) external;

declare function local:obtenerSucursalUsuarioResponse($ns1:userObject as element() (:: schema-element(ns1:userObject) ::)) as element() (:: schema-element(ns2:obtenerSucursalUsuarioResponse) ::) {
<ns2:obtenerSucursalUsuarioResponse>
{
 if (fn:string-length($ns1:userObject//*:id/text())>0) then
  if (fn:matches(fn:upper-case($ns1:userObject//*:id/text()),'[A-Z]')) then
   <ns2:sucursal>-1</ns2:sucursal>
  else if (fn:string-length($ns1:userObject//*:id/text())=1) then
   <ns2:sucursal>{fn:concat('0',$ns1:userObject//*:id)}</ns2:sucursal>
   else
    <ns2:sucursal>{$ns1:userObject//*:id/text()}</ns2:sucursal>
 else
  <ns2:sucursal>-1</ns2:sucursal>	
}
</ns2:obtenerSucursalUsuarioResponse>
};

local:obtenerSucursalUsuarioResponse($ns1:userObject)