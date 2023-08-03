xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/AppMonte";
(:: import schema at "../Schemas/NMPAppMonteSvcElementosXSD.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/top/AppMonteUsuariosDb";
(:: import schema at "../Schemas/DBAppMonteUsuariosDbXSD.xsd" ::)

declare namespace app = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/AppMonte";

declare variable $registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::) external;

declare function local:func($registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::)) as element() (:: schema-element(ns2:AppRegistroCollection) ::) {
    <ns2:AppRegistroCollection>
        <ns2:AppRegistro>
            <ns2:idReg>0</ns2:idReg>
            <ns2:idCliente>{fn:data($registrarClienteAppRequest/app:idCliente)}</ns2:idCliente>
            <ns2:noCredencial>{fn:data($registrarClienteAppRequest/app:noCredencial)}</ns2:noCredencial>
            {
                if ($registrarClienteAppRequest/app:email)
                then <ns2:email>{fn:data($registrarClienteAppRequest/app:email)}</ns2:email>
                else ()
            }
            <ns2:tipoCliente>{fn:data($registrarClienteAppRequest/app:tipoCliente)}</ns2:tipoCliente>
            <ns2:sucursal>{fn:data($registrarClienteAppRequest/app:sucursal)}</ns2:sucursal>
            <ns2:fechaRegistro>{fn:current-dateTime()}</ns2:fechaRegistro>
            <ns2:noCelular>{fn:data($registrarClienteAppRequest/app:noTelefono)}</ns2:noCelular>
        </ns2:AppRegistro>
    </ns2:AppRegistroCollection>
};

local:func($registrarClienteAppRequest)