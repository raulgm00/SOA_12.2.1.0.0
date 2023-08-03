xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace app="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/AppMonte";
(:: import schema at "../Schemas/NMPAppMonteSvcElementosXSD.xsd" ::)

declare namespace app1 = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/AppMonte";

declare variable $registrarClienteAppRequest as element() (:: schema-element(app:registrarClienteAppRequest) ::) external;

declare function local:func($registrarClienteAppRequest as element() (:: schema-element(app:registrarClienteAppRequest) ::)) as element() (:: schema-element(app:registrarClienteAppResponse) ::) {
    <app:registrarClienteAppResponse>
        <app1:respuesta>{fn:concat('Cliente registrado con éxito No Credencial: ',$registrarClienteAppRequest/app1:noCredencial)}</app1:respuesta>
    </app:registrarClienteAppResponse>
};

local:func($registrarClienteAppRequest)