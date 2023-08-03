xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/Identidades/Midas/Sucursal";
(:: import schema at "../WSDL/SucursalProxy.wsdl" ::)
declare namespace ns2="http://xmlns.oracle.com/bpel/services/IdentityService";
(:: import schema at "../WSDL/IdentityService.wsdl" ::)

declare variable $ns1:obtenerSucursalUsuarioRequest as element() (:: schema-element(ns1:obtenerSucursalUsuarioRequest) ::) external;

declare function local:obtenerSucursalUsuarioRequest($ns1:obtenerSucursalUsuarioRequest as element() (:: schema-element(ns1:obtenerSucursalUsuarioRequest) ::)) as element() (:: schema-element(ns2:lookupUserRequest) ::) {
    <ns2:lookupUserRequest>
        <ns2:name>{fn:data($ns1:obtenerSucursalUsuarioRequest/ns1:id)}</ns2:name>
        <ns2:realmName>jazn.com</ns2:realmName>
    </ns2:lookupUserRequest>
};

local:obtenerSucursalUsuarioRequest($ns1:obtenerSucursalUsuarioRequest)