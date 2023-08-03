xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSMS";
(:: import schema at "../../../../Utileria/MensajeriaUtil/Resources/Schemas/NMPMensajeriaSmsXSD.xsd" ::)
declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/AppMonte";
(:: import schema at "../Schemas/NMPAppMonteSvcElementosXSD.xsd" ::)

declare namespace app = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/AppMonte";

declare variable $registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::) external;

declare function local:func($registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::)) as element() (:: schema-element(ns2:enviaMensajeSMSrequest) ::) {
    <ns2:enviaMensajeSMSrequest>
        <ns2:telefonoCliente>{fn:data($registrarClienteAppRequest/app:noTelefono)}</ns2:telefonoCliente>
        <ns2:mensajeSMS>{'Bienvenido a la App de Nacional Monte de Piedad, para consultar nuestro aviso de privacidad  ingresa a: https://goo.gl/TAS4hn'}</ns2:mensajeSMS>
    </ns2:enviaMensajeSMSrequest>
};

local:func($registrarClienteAppRequest)