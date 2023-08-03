xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/AppMonte";
(:: import schema at "../Schemas/NMPAppMonteSvcElementosXSD.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/top/AppMonteUsuariosDb";
(:: import schema at "../Schemas/DBAppMonteUsuariosDbXSD.xsd" ::)

declare namespace app = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/AppMonte";

declare variable $registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::) external;

declare function local:func($registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::)) as element() (:: schema-element(ns2:AppRegistroPrimaryKey) ::) {
    <ns2:AppRegistroPrimaryKey>
        <ns2:idCliente>{fn:data($registrarClienteAppRequest/app:idCliente)}</ns2:idCliente>
    </ns2:AppRegistroPrimaryKey>
};

local:func($registrarClienteAppRequest)